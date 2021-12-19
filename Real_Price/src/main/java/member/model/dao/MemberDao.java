package member.model.dao;


import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
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
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next() == true) {
				String memberId = rs.getString("MEMBER_ID");
				String password = rs.getString("PASSWORD");
				String userName = rs.getString("NAME");
				String email = rs.getString("EMAIL");
				String phone = rs.getString("PHONE_NUMBER");
				String address = rs.getString("ADDRESS");
				Member m = new Member(memberId, password, userName, email, phone, address);
				list.add(m);
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
		return list;
	}

	public Member selectOne(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("selcetOne");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			String memberId = rs.getString("MEMBER_ID");
			String password = rs.getString("PASSWORD");
			String userName = rs.getString("NAME");
			String email = rs.getString("EMAIL");
			String phone = rs.getString("PHONE_NUMBER");
			String address = rs.getString("ADDRESS");
			Member user = new Member(memberId, password, userName, email, phone, address);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				rs.close();
				pstmt.close();
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}

	public int insertMember(Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = prop.getProperty("insertUser");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());

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
			String sql = prop.getProperty("deleteUser");
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
			String sql = prop.getProperty("updateUser");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());

			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return result;
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