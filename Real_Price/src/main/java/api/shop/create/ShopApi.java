package api.shop.create;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import common.JDBCTemplate;
import shop.model.vo.Shop;

public class ShopApi {


	public void ShopInform() throws IOException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getStoreInfoSvc.do"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=Y7ueDZ39NLBs1KC8LG7vU9vMskkOUSItpwwzFtQfoyGAuic4UtAJaqvaEQq00KgNNaIbzamWrkdY6XkoKDJ2jw%3D%3D"); /*
												
																													 * Service
																													 * Key
																													 */
		// urlBuilder.append("&" + URLEncoder.encode("goodId","UTF-8") + "=" +
		// URLEncoder.encode("335", "UTF-8")); /*상품 한 건 조회시 사용 (전체 조회 시 미사용)*/
		List<Shop> shoplist = new ArrayList<Shop>();

		System.out.println(urlBuilder.toString());
		ShopUpdateDB shopdao = new ShopUpdateDB(JDBCTemplate.getConnection());

		URL url = new URL(urlBuilder.toString());

		try {
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");

//			System.out.println("Response code: " + conn.getResponseCode());

			BufferedReader rd;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			StringBuilder sb = new StringBuilder();
			String line;

			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			
			rd.close();
			conn.disconnect();

			System.out.println(sb.length());

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse(url.toString());

			document.getDocumentElement().normalize();
			System.out.println("Root Element :" + document.getDocumentElement().getNodeName());
			NodeList nList = document.getElementsByTagName("iros.openapi.service.vo.entpInfoVO");
			System.out.println("파싱할 shop 수 : " + nList.getLength());

			System.out.println("----------------------------");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				
				System.out.println("\nCurrent Element :" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					System.out.println(eElement.toString());
					

					System.out.println("업체 아이디 : " + nullCheck(eElement, "entpId"));
					System.out.println("업체명 : " + nullCheck(eElement, "entpName"));
					System.out.println("업체 업태 코드 : " + nullCheck(eElement, "entpTypeCode"));
					System.out.println("업체 지역 코드 : " + nullCheck(eElement, "entpAreaCode"));
					System.out.println("지역 상세 코드 : " + nullCheck(eElement, "areaDetailCode"));
					System.out.println("전화번호 : " + nullCheck(eElement, "entpTelno"));
					System.out.println("우편번호 : " + nullCheck(eElement, "postNo"));
					System.out.println("지번 기본주소명 : " + nullCheck(eElement, "plmkAddrBasic"));
					System.out.println("지번 상세주소명 : " + nullCheck(eElement, "plmkAddrDetail"));
					System.out.println("도로 기본주소명 : " + nullCheck(eElement, "roadAddrBasic"));
					System.out.println("도로 상세주소명 : " + nullCheck(eElement, "roadAddrDetail"));
					System.out.println("X 지도좌표 : " + nullCheck(eElement, "xMapCoord"));
					System.out.println("Y 지도좌표 : " + nullCheck(eElement, "yMapCoord"));

					Shop shop = new Shop(nullCheck(eElement, "entpId"), nullCheck(eElement, "entpName"), nullCheck(eElement, "entpTypeCode"), nullCheck(eElement, "entpAreaCode"), nullCheck(eElement, "areaDetailCode"), nullCheck(eElement, "entpTelno"), nullCheck(eElement, "postNo"), nullCheck(eElement, "plmkAddrBasic"), nullCheck(eElement, "plmkAddrDetail"), nullCheck(eElement, "roadAddrBasic"), nullCheck(eElement, "roadAddrDetail"), nullCheck(eElement, "xMapCoord"), nullCheck(eElement, "yMapCoord"));
							

					shoplist.add(shop);

				}
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		shopdao.allShop(shoplist);
	}

	public String nullCheck(Element eElement, String tagName) {
		try {
			if (eElement.getTagName().contains(tagName) == false) {
				return eElement.getElementsByTagName(tagName).item(0).getTextContent();
			}
		} catch (Exception e) {
//			e.printStackTrace();
		}
		return "-";
	}
	
	
//	public static void main(String[] args) throws IOException {
//		new ShopApi().ShopInform();
//	}
}
