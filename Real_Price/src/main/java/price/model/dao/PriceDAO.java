package price.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import common.JDBCTemplate;
import price.model.vo.Price;
import product.model.vo.Product;


public class PriceDAO {
	private Connection conn = null;
	private Properties prop = null;


	{
		prop = JDBCTemplate.getProperties();
	}

	public PriceDAO (Connection conn){
		this.conn = conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	// 물품키워드 포함하는 이름을 가진 물품의 good_id를 중복없이 추출
	public List<String> goodIdList(String goodName) {

		List<String> list = new ArrayList<String>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("GOOD_ID_LIST");
			// SELECT GOOD_ID FROM PRODUCTS_INFO WHERE GOOD_NAME LIKE '%'||?||'%'

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodName);


			rs = pstmt.executeQuery(); // 쿼리 실행문

			while(rs.next() == true) {

				String goodId = rs.getString("GOOD_ID");


				list.add(goodId);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// 각 물픔마다 낮은 가격 상위 5개씩을 뽑아옴
	public List<Price> mainPrice(String good_Id) {
		List<Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("MAIN_PRICE");
			// SELECT * FROM (SELECT * FROM COST_INFO WHERE GOOD_ID = ? ORDER BY GOOD_PRICE ASC) WHERE ROWNUM <= 5

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); 

			rs = pstmt.executeQuery(); 

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// 물품아이디 검색시 물품명 리턴
	public String productName(String good_Id) {

		String goodName = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = prop.getProperty("PRODUCT_NAME");
			// SELECT GOOD_NAME FROM PRODUCTS_INFO WHERE GOOD_ID = ?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); 

			rs = pstmt.executeQuery(); 

			if(rs.next()) {
				goodName = rs.getString("GOOD_NAME");
			};

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return goodName; 
	}


	// 각 물픔마다 낮은 가격 상위 1개 리턴
	public Price mainPriceEach(String good_Id) {
		Price price = new Price();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {


			String sql = prop.getProperty("MAIN_PRICE_EACH");
			// SELECT * FROM (SELECT * FROM COST_INFO WHERE GOOD_ID = ? ORDER BY GOOD_PRICE ASC) WHERE ROWNUM <= 1

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); 

			rs = pstmt.executeQuery(); 

			if(rs.next()) {
				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);
			}



			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return price; 
	}


	// goodId로 검색시 낮은 가격별 정렬
	public List<Price> sortByLowestPrice(String good_Id) {
		List <Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_SORT_BY_LOWEST");
			// SELECT * FROM COST_INFO WHERE good_id = ? ORDER BY good_price ASC

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); // 전달받은 goodId로 쿼리문 완성

			rs = pstmt.executeQuery(); // 쿼리 실행문

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// goodId로 검색시 물품정보 출력
	public Product informationOfProduct(String good_Id) {

		Product product = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_INFORMATION_OF_PRODUCT");
			// SELECT * FROM PRODUCTS_INFO WHERE GOOD_ID = ?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); // 전달받은 goodId로 쿼리문 완성

			rs = pstmt.executeQuery(); // 쿼리 실행문
			rs.next();

			String goodId = rs.getString("GOOD_ID");
			String goodName = rs.getString("GOOD_NAME");
			String productEntpCode = rs.getString("PRODUCT_ENTP_CODE");
			String goodUnitDivCode = rs.getString("GOOD_UNIT_DIV_CODE");
			String goodBaseCnt = rs.getString("GOOD_BASE_CNT");
			String detailMean = rs.getString("GOOD_SMLCLS_CODE");
			String goodTotalCnt = rs.getString("DETAIL_MEAN");
			String goodTotalDivCode = rs.getString("GOOD_TOTAL_CNT");
			String goodSmlclsCode = rs.getString("GOOD_TOTAL_DIV_CODE");

			product = new Product(goodId, goodName, productEntpCode, goodUnitDivCode, goodBaseCnt, detailMean, goodTotalCnt, goodTotalDivCode, goodSmlclsCode);

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return product; 
	}

	// goodId로 검색시 카테고리 출력
	public String informationOfProductCategory(String good_Id) {

		String category = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_INFORMATION_OF_PRODUCT_CATEGORY");
			// SELECT * FROM CATEGORY JOIN PRODUCTS_INFO ON products_info.good_smlcls_code = category.good_smlcls_code WHERE GOOD_ID = ?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); // 전달받은 goodId로 쿼리문 완성

			rs = pstmt.executeQuery(); // 쿼리 실행문
			rs.next();

			category = rs.getString("CATEGORY_NAME");



			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return category; 
	}

	// goodId로 검색시 카테고리 코드 출력
	public String informationOfProductCategoryCode(String good_Id) {

		String category = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_INFORMATION_OF_PRODUCT_CATEGORY");
			// SELECT * FROM CATEGORY JOIN PRODUCTS_INFO ON products_info.good_smlcls_code = category.good_smlcls_code WHERE GOOD_ID = ?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); // 전달받은 goodId로 쿼리문 완성

			rs = pstmt.executeQuery(); // 쿼리 실행문
			rs.next();

			category = rs.getString("GOOD_SMLCLS_CODE");



			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return category; 
	}

	// goodId와 entpId로 검색시 최근 조사일 출력
	public String informationOfInspectDay(String good_Id, String entp_Id) {

		String InspectDay = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_INFORMATION_OF_INSPECTDAY");
			// SELECT GOOD_INSPECT_DAY FROM COST_INFO WHERE GOOD_ID = ? AND ENTP_ID = ?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); 
			pstmt.setString(1, entp_Id); 

			rs = pstmt.executeQuery(); // 쿼리 실행문
			rs.next();

			InspectDay = rs.getString("GOOD_INSPECT_DAY");



			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return InspectDay; 
	}

	// 전달받은 goodId로 검색하여 해당 물품의 평균값 출력, 소수점 아래 둘째자리까지 자름
	public int averagePrice(String good_Id) {
		int avgPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_AVG");
			// SELECT ROUND(AVG(GOOD_PRICE),2) FROM cost_info WHERE good_id = ?;

			pstmt = conn.prepareStatement(sql); 

			pstmt.setString(1, good_Id); 

			rs = pstmt.executeQuery();
			rs.next();

			avgPrice = rs.getInt("ROUND(AVG(GOOD_PRICE),2)");


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return avgPrice;

	}

	// 상품명 포함시 상품 출력
	public List<Price> sortByLowestPriceProduct(String productName) {
		List <Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_SORT_BY_LOWEST_PRODUCT");
			// SELECT * FROM COST_INFO JOIN PRODUCTS_INFO ON PRODUCTS_INFO.GOOD_ID = COST_INFO.GOOD_ID WHERE GOOD_NAME LIKE '%?%' ORDER BY GOOD_PRICE ASC

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName); 


			rs = pstmt.executeQuery(); // 쿼리 실행문

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// 물품명으로 검색시 상품코드 리턴

	public String goodIdFromProduct(String productName) {
		String goodId = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("GOOD_ID_FROM_PRODUCT");
			// SELECT GOOD_ID FROM PRODUCTS_INFO WHERE GOOD_NAME = '?'

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName); 


			rs = pstmt.executeQuery(); // 쿼리 실행문



			goodId = rs.getString("GOOD_ID");


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return goodId; 
	}

	// 카테고리별 검색
	public List<Price> CategorySearch(String goodSmlclsCode) {
		List <Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_CATEGORY_SEARCH");
			/*
			 * SELECT * FROM COST_INFO
				JOIN products_info ON products_info.good_id = COST_INFO.good_id
				JOIN CATEGORY ON category.good_smlcls_code = products_info.good_smlcls_code
				WHERE products_info.GOOD_SMLCLS_CODE = ? ORDER BY GOOD_PRICE ASC
			 */

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodSmlclsCode);


			rs = pstmt.executeQuery();

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// 카테고리 코드 검색시 카테고리에 해당하는 물품 id 셋 리턴
	public Set <String> CategoryProductSearch(String goodSmlclsCode) {
		Set <String> set = new HashSet<String>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_CATEGORY_SEARCH");
			/*
			 * SELECT * FROM COST_INFO
				JOIN products_info ON products_info.good_id = COST_INFO.good_id
				JOIN CATEGORY ON category.good_smlcls_code = products_info.good_smlcls_code
				WHERE products_info.GOOD_SMLCLS_CODE = ? ORDER BY GOOD_PRICE ASC
			 */

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodSmlclsCode);


			rs = pstmt.executeQuery();

			while(rs.next() == true) {

				String goodId = rs.getString("GOOD_ID");


				set.add(goodId);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return set; 
	}

	// 지역별 검색시 물품 최저가 정렬
	public List<Price> sortByLowestPriceLocation(String good_Id, String entpAreaCode) {
		List <Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_SORT_BY_LOWEST_LOCATION");
			// SELECT * FROM COST_INFO JOIN STORE_INFO ON STORE_INFO.ENTP_ID = COST_INFO.ENTP_ID WHERE good_id = ? AND ENTP_AREA_CODE = ? ORDER BY good_price ASC

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, good_Id); 
			pstmt.setString(2, entpAreaCode); 

			rs = pstmt.executeQuery(); // 쿼리 실행문

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// goodId, entpAreaCode로 검색하여 해당 물품의 평균값 출력, 소수점 아래 둘째자리까지 자름
	public int averagePriceLocation(String good_Id, String entpAreaCode) {
		int avgPrice = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_AVG_LOCATION");
			// SELECT ROUND(AVG(GOOD_PRICE),2) FROM COST_INFO JOIN STORE_INFO ON STORE_INFO.ENTP_ID = COST_INFO.ENTP_ID WHERE good_id = ? AND ENTP_AREA_CODE = ? ORDER BY good_price ASC;

			pstmt = conn.prepareStatement(sql); 

			pstmt.setString(1, good_Id); 
			pstmt.setString(2, entpAreaCode); 


			rs = pstmt.executeQuery();
			rs.next();

			avgPrice = rs.getInt("ROUND(AVG(GOOD_PRICE),2)");


			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return avgPrice;

	}

	// 점포명 포함시 점포판매물품 출력
	public List<Price> sortByLowestPriceShop(String shopName) {
		List <Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_SORT_BY_LOWEST_SHOP");
			// SELECT * FROM COST_INFO JOIN STORE_INFO ON STORE_INFO.ENTP_ID = COST_INFO.ENTP_ID WHERE ENTP_NAME LIKE '%?%'

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, shopName); 


			rs = pstmt.executeQuery(); // 쿼리 실행문

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	// ENTPID 삽입시 점포정보 출력


	// 가격 추이 - 이미 api 불러오는 단계에서 조사일, 물품아이디, 점포아이디를 요구한 후 해당 데이터를 업로드하게 되어있어 테이블만 불러오면 됨
	public List<Price> TransitionSearch() {
		List <Price> list = new ArrayList<Price>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("PRICE_TRANSITION");
			/*
			 * SELECT * FROM TRANSITION
			 */

			pstmt = conn.prepareStatement(sql);


			rs = pstmt.executeQuery();

			while(rs.next() == true) {

				String goodInspectDay = rs.getString("GOOD_INSPECT_DAY");
				int goodPrice = rs.getInt("GOOD_PRICE");
				String plusoneYn = rs.getString("PLUSONE_YN");
				String goodDcYn = rs.getString("GOOD_DC_YN");
				String goodId = rs.getString("GOOD_ID");
				String entpId = rs.getString("ENTP_ID");


				Price price = new Price(goodInspectDay, goodPrice, plusoneYn,goodDcYn, goodId, entpId);

				list.add(price);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

	//	public static void main(String[] args) {
	//
	//		Price price = new PriceDAO(getConnection()).mainPriceEach("168");
	//		System.out.println(price.toString());
	//	}


}
