package api.category.create;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;


public class CategoryUpdateDB {
	
	private Connection conn = null;
	private Properties prop = null;

	public CategoryUpdateDB(Connection conn) {
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
		
		String sql = prop.getProperty("Delete_Category");
		//DELETE FROM CATEGORY
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeQuery();
		conn.commit();
	}
	

	public void allCategory(List<Category> list) throws ClassNotFoundException, IOException {
		
		try {
			delete();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		try {
			
			
			for(Category category : list) {
				
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("CategoryDao_AllCATEGORY");
				// INSERT INTO CATEGORY VALUES(?,?)
				
				pstmt = conn.prepareStatement(sql); // 객체 생성


				pstmt.setString(1, category.getGoodSmlclsCode()); // GOOD_NAME VARCHAR2(70) NOT NULL,
				pstmt.setString(2, category.getCategoryName()); //  PRODUCT_ENTP_CODE VARCHAR2(70),



				System.out.println(category.toString()); 
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
