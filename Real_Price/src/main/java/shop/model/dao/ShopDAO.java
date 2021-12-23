package shop.model.dao;

import java.sql.Connection;
import java.util.Properties;
import java.util.Scanner;

import common.JDBCTemplate;

public class ShopDAO {
	private Connection conn = null;
	private Properties prop = null;
	{
		prop = JDBCTemplate.getProperties();
	}

	public ShopDAO (Connection conn){
		this.conn = conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	public selectMart (){
		prop = new Properties();
		
		Scanner sc=new Scanner(System.in);
		System.out.print("해당 마트의 id를 입력하세요");
		String mart=sc.next();
	
		ArrayList<String>list =new ArrayList<String>();
		
		try {
		
			stmt=conn.createStatement();
			String sql = "select products_info.good_id\r\n"
					+ "from products_info inner join cost_info on products_info.good_id=cost_info.good_id\r\n"
					+ "where  cost_info.entp_id like "+"'"+mart+"'";
			
			rs=stmt.executeQuery(sql);
		
			while(rs.next()){
				
				String name=rs.getString("good_id");
			}
			for(String n:list) {
				System.out.print(n);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print("종료");
	}
}
