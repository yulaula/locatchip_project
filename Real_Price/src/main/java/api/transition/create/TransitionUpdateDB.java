package api.transition.create;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import price.model.vo.Price;


public class TransitionUpdateDB {
	
	private Connection conn = null;
	private Properties prop = null;

	public TransitionUpdateDB(Connection conn) {
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
	
	public void delete() throws SQLException {
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("Delete_Transition");
		//DELETE FROM TRANSITION
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeQuery();
		pstmt.close();
		conn.commit();
	}
	

	public void allPrice(List<Price> list) throws ClassNotFoundException, IOException, SQLException {
		
		delete();
		
		
		
		
		
		try {
			
			
			for(Price price : list) {
				PreparedStatement pstmt = null;
				
				String sql = prop.getProperty("TransitionDao_AllPRICE");
				// INSERT INTO COST_INFO(?,?,?,?,?,?,?)
				
				pstmt = conn.prepareStatement(sql); // 객체 생성

				//pstmt.setString(1, "PRICE" + SEQ_BOARD_NO.NEXTVAL); // GOOD_ID VARCHAR2(20) PRIMARY KEY,
				pstmt.setString(1, price.getGoodInspectDay()); // GOOD_NAME VARCHAR2(70) NOT NULL,
				pstmt.setInt(2, price.getGoodPrice()); //  PRODUCT_ENTP_CODE VARCHAR2(70),
				pstmt.setString(3, price.getPlusoneYn()); // GOOD_UNIT_DIV_CODE VARCHAR2(10),
				pstmt.setString(4, price.getGoodDcYn()); // GOOD_BASE_CNT VARCHAR2(5),
				pstmt.setString(5, price.getGoodId()); //  GOOD_SMLCLS_CODE VARCHAR2(10) NOT NULL,
				pstmt.setString(6, price.getEntpId()); //  DETAIL_MEAN VARCHAR2(200),


				System.out.println(price); 
				pstmt.executeQuery();
				pstmt.close();
				conn.commit();
			}
			

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("입력이 완료되었습니다.");
		
	}

}
