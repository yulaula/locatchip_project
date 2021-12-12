package api.shop.create;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Properties;

import shop.model.vo.Shop;

public class ShopUpdateDB {
	private Connection conn = null;
	private Properties prop = null;

	public ShopUpdateDB (Connection conn){
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

	public void allShop(List<Shop> list) {
		PreparedStatement pstmt = null;
		System.out.println("Size : " + list.size());

		try {
			for(Shop shop : list) {
				String sql = prop.getProperty("ShopDao_AllShop");
				//  INSERT INTO STORE_INFO VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)
				
				pstmt = conn.prepareStatement(sql); // 객체 생성

				pstmt.setString(1, shop.getEntpId()); // GOOD_ID VARCHAR2(20) PRIMARY KEY,
				pstmt.setString(2, shop.getEntpName()); // GOOD_NAME VARCHAR2(70) NOT NULL,
				pstmt.setString(3, shop.getEntpTypeCode()); //  PRODUCT_ENTP_CODE VARCHAR2(70),
				pstmt.setString(4, shop.getEntpAreaCode()); // GOOD_UNIT_DIV_CODE VARCHAR2(10),
				pstmt.setString(5, shop.getAreaDetailCode()); // GOOD_BASE_CNT VARCHAR2(5),
				pstmt.setString(6, shop.getEntpTelno()); //  GOOD_SMLCLS_CODE VARCHAR2(10) NOT NULL,
				pstmt.setString(7, shop.getPostNo()); //  DETAIL_MEAN VARCHAR2(200),
				pstmt.setString(8, shop.getPlmkAddrBasic()); //  GOOD_TOTAL_CNT VARCHAR2(15),
				pstmt.setString(9, shop.getPlmkAddrDetail()); //  GOOD_TOTAL_DIV_CODE VARCHAR2(10) NOT NULL
				pstmt.setString(10, shop.getRoadAddrBasic()); //  GOOD_TOTAL_DIV_CODE VARCHAR2(10) NOT NULL
				pstmt.setString(11, shop.getRoadAddrDetail()); //  GOOD_TOTAL_DIV_CODE VARCHAR2(10) NOT NULL
				pstmt.setString(12, shop.getxMapCoord()); //  GOOD_TOTAL_DIV_CODE VARCHAR2(10) NOT NULL
				pstmt.setString(13, shop.getyMapCoord()); //  GOOD_TOTAL_DIV_CODE VARCHAR2(10) NOT NULL

				System.out.println(shop); 
				pstmt.executeQuery();
				conn.commit();
			}
			

		} catch (Exception e) {
			e.printStackTrace();

		}

		System.out.println("입력이 완료되었습니다.");

	}
	
	

}
