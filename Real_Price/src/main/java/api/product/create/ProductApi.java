package api.product.create;

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
import product.model.vo.Product;

public class ProductApi {

	public List<Product> productInform() throws IOException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getProductInfoSvc.do"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=Y7ueDZ39NLBs1KC8LG7vU9vMskkOUSItpwwzFtQfoyGAuic4UtAJaqvaEQq00KgNNaIbzamWrkdY6XkoKDJ2jw%3D%3D"); /*
																													 * Service
						
																													 * Key
																													 */
		// urlBuilder.append("&" + URLEncoder.encode("goodId","UTF-8") + "=" +
		// URLEncoder.encode("335", "UTF-8")); /*상품 한 건 조회시 사용 (전체 조회 시 미사용)*/
		List<Product> prodlist = new ArrayList<Product>();
		ProductUpdateDB pudao = new ProductUpdateDB(JDBCTemplate.getConnection());

		URL url = new URL(urlBuilder.toString());
		
		System.out.println(urlBuilder);
		try {
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");

			System.out.println("Response code: " + conn.getResponseCode());

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
			//에러난것같아요 ㄴㄴ 흐름 막았어요아하...

			System.out.println(sb.toString());

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse(url.toString());

			document.getDocumentElement().normalize();
			System.out.println("Root Element :" + document.getDocumentElement().getNodeName());
			NodeList nList = document.getElementsByTagName("item");
			System.out.println("파싱할 item 수 : " + nList.getLength());

			System.out.println("----------------------------");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				// nNode가 null
				System.out.println("\nCurrent Element :" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					System.out.println(eElement.toString());
					// eElement에 item이 들어가지 않음ㅠ nNode가 비어있음

					System.out.println("상품아이디 : " + nullCheck(eElement, "goodId"));
					System.out.println("상품명 : " + nullCheck(eElement, "goodName"));
					System.out.println("제조업체코드 : " + nullCheck(eElement, "productEntpCode"));
					System.out.println("상품단위 구분코드 : " + nullCheck(eElement, "goodUnitDivCode"));
					System.out.println("상품 단위량 : " + nullCheck(eElement, "goodBaseCnt"));
					System.out.println("상품 설명 상세 : " + nullCheck(eElement, "detailMean"));
					System.out.println("상품 용량 : " + nullCheck(eElement, "goodTotalCnt"));
					System.out.println("상품 용량 구분 코드 : " + nullCheck(eElement, "goodTotalDivCode"));
					System.out.println("상품 소분류 코드 : " + nullCheck(eElement, "goodSmlclsCode"));

					Product product = new Product(nullCheck(eElement, "goodId"), nullCheck(eElement, "goodName"),
							nullCheck(eElement, "productEntpCode"), nullCheck(eElement, "goodUnitDivCode"),
							nullCheck(eElement, "goodBaseCnt"), nullCheck(eElement, "detailMean"),
							nullCheck(eElement, "goodTotalCnt"), nullCheck(eElement, "goodTotalDivCode"),
							nullCheck(eElement, "goodSmlclsCode"));

					prodlist.add(product);

				}
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		pudao.allProduct(prodlist);
		return prodlist;
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
}

//java.io.IOException: stream is closed
