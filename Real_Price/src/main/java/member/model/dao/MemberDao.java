package member.model.dao;


import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDao {
	private Connection conn = null;
	private Properties prop = null;

	{
		prop = JDBCTemplate.getProperties();
	}

	public MemberDao(Connection conn) {
		this.conn = conn;		
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public List<Member> selectAll() throws SQLException {
		List<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("selectAll");
			// SELECT * FROM MEMBER
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next() == true) {
				String memberId = rs.getString("MEMBER_ID");
				String password = rs.getString("PASSWORD");
				String userName = rs.getString("NAME");
				String email = rs.getString("EMAIL");
				String phone = rs.getString("PHONE");
				String address = rs.getString("ADDRESS");
				Member m = new Member(memberId, password, userName, email, phone, address);
				list.add(m);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Member selectOne(String id) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("selcetOne");
			// SELECT * FROM MEMBER WHERE MEMBER_ID = ? ORDER BY DESC
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			String memberId = rs.getString("MEMBER_ID");
			String password = rs.getString("PASSWORD");
			String userName = rs.getString("NAME");
			String email = rs.getString("EMAIL");
			String phone = rs.getString("PHONE");
			String address = rs.getString("ADDRESS");

			member = new Member(memberId, password, userName, email, phone, address);

			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public int insertMember(Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = prop.getProperty("insertMember");
			// INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?)
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getEmail());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteUser(String id) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = prop.getProperty("deleteMember");
			// DELETE FROM MEMBER WHERE MEMBER_ID = ?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int updateMember(Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = prop.getProperty("updateMember");
			// UPDATE USER SET MEMBER_ID = ?, PASSWORD = ?, NAME = ?, PHONE = ?, ADDRESS = ?, EMAIL = ?

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getEmail());

			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return result;
	}

	public Member findMemberById(String id) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = prop.getProperty("findMemberById");
			// SELECT * FROM MEMBER WHERE MEMBER_ID=?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			String memberId = rs.getString("MEMBER_ID");
			String password = rs.getString("PASSWORD");
			String userName = rs.getString("NAME");
			String phone = rs.getString("PHONE");
			String address = rs.getString("ADDRESS");
			String email = rs.getString("EMAIL");
			
			member = new Member(memberId, password, userName, phone, address, email);

			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return member;
	}

	/*
	public List<User> selectByName(String searchName) {
		List<User> list = new ArrayList<User>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("selectUser");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchName + "%");
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				String userId = rs.getString("USERID");
				String password = rs.getString("PASSWORD");
				String userName = rs.getString("NAME");
				String age = rs.getString("AGE");
				String email = rs.getString("EMAIL");
				String phone = rs.getString("PHONE_NUMBER");
				String address = rs.getString("ADDRESS");
				String nickname = rs.getString("NICKNAME");
				Date enrollDate = rs.getDate("ENROLL_DATE");
				User user = new User(userId, password, userName, age, email, phone, address, nickname, enrollDate);
				list.add(user);
			}

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}
	 */
}