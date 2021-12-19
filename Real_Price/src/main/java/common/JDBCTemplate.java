package common;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {
	
	public static final int ERROR_CODE_USER_DUPLE = 100;
	public static final int ERROR_CODE_SCHEDULE_DUPLE = -200;
	
	// 무조건 쓰는 구간
	public static String driverClass 	= null;
	public static String url 			= null;
	public static String user 			= null;
	public static String password 		= null;

	static {
		Properties prop = new Properties();
				
		String path = JDBCTemplate.class.getResource("./driver.properties").getPath();
		System.out.println(path);
		path = path.replace("%20", " ");
		try {
			File file = new File(path);
			System.out.println("file.exists() : "+file.exists());
			System.out.println("ile.canRead() : " + file.canRead());
			System.out.println(file.getAbsoluteFile());
			FileReader fr = new FileReader(file.getAbsoluteFile());
			prop.load(fr);
			fr.close();
			
			driverClass = prop.getProperty("db.driver");
			url = prop.getProperty("db.url");
			user  = prop.getProperty("db.username");
			password = prop.getProperty("db.password");
			// System.out.println(driverClass);
			
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return conn;
	}
	//
	
	public static void close(Connection conn) {
		try {
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection conn) {
		try {
			if(conn != null)
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection conn) {
		try {
			if(conn != null)
				conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Properties getProperties() {
		FileReader fr;
		FileReader fr2;
		
		
		String path1 = JDBCTemplate.class.getResource("./driver.properties").getPath();
		String path2 = JDBCTemplate.class.getResource("./query.properties").getPath();
		path1 = path1.replace("%20", " ");
		path2 = path2.replace("%20", " ");
		Properties prop = new Properties();
		
		try {
			fr = new FileReader(path1);
			fr2 = new FileReader(path2);
			prop.load(fr);
			prop.load(fr2);
			fr.close();
			fr2.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return prop;
	}

	
}
