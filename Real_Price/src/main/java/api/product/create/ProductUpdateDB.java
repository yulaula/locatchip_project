package api.product.create;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Properties;

import product.model.vo.Product;



public class ProductUpdateDB {
	private Connection conn = null;
	private Properties prop = null;

	public ProductUpdateDB (Connection conn){
		this.conn = conn;
		prop = new Properties();
		FileReader fr;
		try {
			fr = new FileReader("resources/query.properties");
			prop.load(fr);
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public void allProduct(List<Product> list) {
		PreparedStatement pstmt = null;
		System.out.println("Size : " + list.size());

		try {
			for(Product item : list) {
				String sql = prop.getProperty("ProductDao_AllProduct");
				//  INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?)
				
				pstmt = conn.prepareStatement(sql); // 객체 생성

				pstmt.setString(1, item.getGoodId()); // GOOD_ID VARCHAR2(20) PRIMARY KEY,
				pstmt.setString(2, item.getGoodName()); // GOOD_NAME VARCHAR2(70) NOT NULL,
				pstmt.setString(3, item.getProductEntpCode()); //  PRODUCT_ENTP_CODE VARCHAR2(70),
				pstmt.setString(4, item.getGoodUnitDivCode()); // GOOD_UNIT_DIV_CODE VARCHAR2(10),
				pstmt.setString(5, item.getGoodBaseCnt()); // GOOD_BASE_CNT VARCHAR2(5),
				pstmt.setString(6, item.getGoodSmlclsCode()); //  GOOD_SMLCLS_CODE VARCHAR2(10) NOT NULL,
				pstmt.setString(7, item.getDetailMean()); //  DETAIL_MEAN VARCHAR2(200),
				pstmt.setString(8, item.getGoodTotalCnt()); //  GOOD_TOTAL_CNT VARCHAR2(15),
				pstmt.setString(9, item.getGoodUnitDivCode()); //  GOOD_TOTAL_DIV_CODE VARCHAR2(10) NOT NULL

				System.out.println(item); 
				pstmt.executeQuery();
				conn.commit();
			}
			

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("입력이 완료되었습니다.");

	}
	
	

}
