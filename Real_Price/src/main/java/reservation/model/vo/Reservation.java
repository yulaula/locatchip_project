package reservation.model.vo;

import java.sql.Date;

public class Reservation {
	String reservIndex;
	String basketIndex;
	String memberId;
	Date reservDate;
	public Reservation() {
		super();
	}
	public Reservation(String reservIndex, String basketIndex, String memberId, Date reservDate) {
		super();
		this.reservIndex = reservIndex;
		this.basketIndex = basketIndex;
		this.memberId = memberId;
		this.reservDate = reservDate;
	}
	@Override
	public String toString() {
		return "Reservation [reservIndex=" + reservIndex + ", basketIndex=" + basketIndex + ", memberId=" + memberId
				+ ", reservDate=" + reservDate + "]";
	}
	public String getReservIndex() {
		return reservIndex;
	}
	public void setReservIndex(String reservIndex) {
		this.reservIndex = reservIndex;
	}
	public String getBasketIndex() {
		return basketIndex;
	}
	public void setBasketIndex(String basketIndex) {
		this.basketIndex = basketIndex;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getReservDate() {
		return reservDate;
	}
	public void setReservDate(Date reservDate) {
		this.reservDate = reservDate;
	}
}
