package basket.model.vo;

import java.util.List;

public class Basket {
	private String basketIndex; 
	private int totalPrice; 	
	private String memberId;
	private String comment;
	private List<BasketDetail> goodList;
	private String status;
	
	public Basket() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Basket(String basketIndex, int totalPrice, String memberId, String comment, List<BasketDetail> goodList) {
		super();
		this.basketIndex = basketIndex;
		this.totalPrice = totalPrice;
		this.memberId = memberId;
		this.comment = comment;
		this.goodList = goodList;
	}

	@Override
	public String toString() {
		return "Basket [basketIndex=" + basketIndex + ", totalPrice=" + totalPrice + ", memberId=" + memberId
				+ ", comment=" + comment + ", goodList=" + goodList + ", status=" + status + "]";
	}

	public String getBasketIndex() {
		return basketIndex;
	}

	public void setBasketIndex(String basketIndex) {
		this.basketIndex = basketIndex;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public List<BasketDetail> getGoodList() {
		return goodList;
	}

	public void setGoodList(List<BasketDetail> goodList) {
		this.goodList = goodList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
		
	
}
