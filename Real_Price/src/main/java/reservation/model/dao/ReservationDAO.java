package reservation.model.dao;
/*
 * --예약 테이블
CREATE TABLE RESERV (
    RESERV_INDEX VARCHAR2(20) PRIMARY KEY,
    BASKET_INDEX VARCHAR2(20),
    MEMBER_ID VARCHAR2(10),
    RESERV_DATE DATE DEFAULT SYSDATE
);
 */

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import common.JDBCTemplate;
import reservation.model.vo.Reservation;


public class ReservationDAO {
	private Connection conn = null;
	private Properties prop = null;

	{
		prop = JDBCTemplate.getProperties();
	}

	public ReservationDAO (Connection conn) {
		this.conn = conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	// 멤버 아이디에 따라서 예약내역 출력
	public List<Reservation> findReservationByMemberId(String id) {
		List<Reservation> list = new ArrayList<Reservation>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("RESERV_FINDBY_MEMBERID");
			// SELECT * FROM RESERV WHERE MEMBER_ID=?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while(rs.next() == true) {
				String reservIndex = rs.getString("RESERV_INDEX");
				String basketIndex = rs.getString("BASKET_INDEX");
				String memberId = rs.getString("MEMBER_ID"); 
				Date reservDate = rs.getDate("RESERV_DATE");
				
				Reservation r = new Reservation(reservIndex, basketIndex, memberId, reservDate);
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// basket status = n -> insert reservation
	public int insertReservation(Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = prop.getProperty("RESERV_INSERT");
			// INSERT INTO RESERV VALUES(?,?,?,DEFAULT);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getReservIndex());
			pstmt.setString(2, r.getBasketIndex());
			pstmt.setString(3, r.getMemberId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}				
		return result;		
	}

}
