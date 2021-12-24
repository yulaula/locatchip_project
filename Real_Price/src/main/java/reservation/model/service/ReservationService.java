package reservation.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import basket.model.vo.BasketDetail;
import reservation.model.dao.ReservationDAO;
import reservation.model.vo.Reservation;

public class ReservationService {
	private ReservationDAO dao = null;
	private Connection conn = null;
	
	public ReservationService() {
		init();
	}
	
	public void init() {
		if(conn != null) {
			close(conn);
		}
		conn = getConnection();
		dao = new ReservationDAO(conn);
	}
	
	@Override
	protected void finalize() throws Throwable {
		close(conn);
	}
	
	public List<Reservation> findReservationByMemberId(String id) {
		List<Reservation> list = dao.findReservationByMemberId(id);
		return list;
	}
	
	public int insertReservation(Reservation r) {
		int result = dao.insertReservation(r);
		return result;
	}
}
