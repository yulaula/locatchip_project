package api.category.create;

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

public class CategoryApi {

	public List<Category> CategoryInform() throws IOException, ClassNotFoundException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getStandardInfoSvc.do"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("classCode", "UTF-8")	+ "=AL"); 
		urlBuilder.append("&" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=Y7ueDZ39NLBs1KC8LG7vU9vMskkOUSItpwwzFtQfoyGAuic4UtAJaqvaEQq00KgNNaIbzamWrkdY6XkoKDJ2jw%3D%3D"); 
		
		
		

		List<Category> categorylist = new ArrayList<Category>();
		CategoryUpdateDB catedao = new CategoryUpdateDB(JDBCTemplate.getConnection());

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
			

			System.out.println(sb.toString());

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document document = db.parse(url.toString());

			document.getDocumentElement().normalize();
			System.out.println("Root Element :" + document.getDocumentElement().getNodeName());
			NodeList nList = document.getElementsByTagName("iros.openapi.service.vo.stdInfoVO");
			System.out.println("파싱할 item 수 : " + nList.getLength());

			System.out.println("----------------------------");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				// nNode가 null
				System.out.println("\nCurrent Element :" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					System.out.println(eElement.toString());
					

					System.out.println("상품소분류 코드 : " + nullCheck(eElement, "code"));
					System.out.println("분류명 : " + nullCheck(eElement, "codeName"));


					Category category = new Category(nullCheck(eElement, "code"), nullCheck(eElement, "codeName"));

					categorylist.add(category);

				}
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		catedao.allCategory(categorylist);
		return categorylist;
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
