package api.transition.create;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import common.JDBCTemplate;
import price.model.vo.Price;



public class TransitionApi {



	//특정 판매점의 특정 물품 또는 특정 판매점의 모든 물품 가격 불러옴. goodId 항목이 null이면 모든 물품
	public void priceInform(String entpId, String goodId) throws IOException, ClassNotFoundException, SQLException {

		//goodInspectDay는 매주 금요일, 가장 가까운 금요일의 데이터는 올라오지 않았을 수 있음

		TransitionUpdateDB transitiondao = new TransitionUpdateDB(JDBCTemplate.getConnection());
		List<Price> pricelist = new ArrayList<Price>();
		
		// 오늘을 기준으로 이번달 첫번째 금요일부터 6개월 단위로 이전의 금요일에 해당하는 가격을 불러옵니다.
		List<String> gid = InspectDay.getFriday();


		for(String Day : gid) {
			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getProductPriceInfoSvc.do"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
			+ "=Y7ueDZ39NLBs1KC8LG7vU9vMskkOUSItpwwzFtQfoyGAuic4UtAJaqvaEQq00KgNNaIbzamWrkdY6XkoKDJ2jw%3D%3D"); 
			urlBuilder.append("&" + URLEncoder.encode("goodInspectDay","UTF-8") + "=" + URLEncoder.encode(Day, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("entpId","UTF-8") + "=" + URLEncoder.encode(entpId, "UTF-8")); /*업체_아이디*/
			urlBuilder.append("&" + URLEncoder.encode("goodId","UTF-8") + "=" + URLEncoder.encode(goodId, "UTF-8")); /*상품_아이디*/




			URL url = new URL(urlBuilder.toString());

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

				System.out.println(sb.length());

				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document document = db.parse(url.toString());

				document.getDocumentElement().normalize();
				System.out.println("Root Element :" + document.getDocumentElement().getNodeName());
				NodeList nList = document.getElementsByTagName("iros.openapi.service.vo.goodPriceVO");
				System.out.println("파싱할 price 수 : " + nList.getLength());

				System.out.println("----------------------------");
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);

					System.out.println("\nCurrent Element :" + nNode.getNodeName());
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) nNode;
						System.out.println(eElement.toString());
						

						//System.out.println("가격 인덱스 : PRICE" + ((int)temp + 1));
						System.out.println("상품 조사일 : " + nullCheck(eElement, "goodInspectDay"));
						System.out.println("상품 가격 : " + eElement.getElementsByTagName("goodPrice").item(0).getTextContent());
						System.out.println("원 플러스 원 여부 : " + nullCheck(eElement, "pluconeYn"));
						System.out.println("상품 할인 여부 : " + nullCheck(eElement, "goodDcYn"));
						System.out.println("상품 아이디 : " + nullCheck(eElement, "goodId"));
						System.out.println("업체 아이디 : " + nullCheck(eElement, "entpId"));


						Price price = new Price(nullCheck(eElement, "goodInspectDay"), Integer.parseInt(eElement.getElementsByTagName("goodPrice").item(0).getTextContent()),
								nullCheck(eElement, "pluseoneYn"), nullCheck(eElement, "goodDcYn"),
								nullCheck(eElement, "goodId"), nullCheck(eElement, "entpId"));

						
						
						pricelist.add(price);

					}
				}


			} catch (Exception e) {

				e.printStackTrace();
			}
		}



		transitiondao.allPrice(pricelist);
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
	//		new PriceApi().priceInform("20211119");
	//	}
}
