package price.model.vo;

import java.io.Serializable;

public class Price implements Serializable{

	private static final long serialVersionUID = 1L;
	String goodInspectDay;
	int goodPrice;
	String plusoneYn;
	String goodDcYn;
	String goodId;
	String entpId;
	public Price() {
		super();
	}
	public Price(String goodInspectDay, int goodPrice, String plusoneYn, String goodDcYn,
			String goodId, String entpId) {
		super();
		this.goodInspectDay = goodInspectDay;
		this.goodPrice = goodPrice;
		this.plusoneYn = plusoneYn;
		this.goodDcYn = goodDcYn;
		this.goodId = goodId;
		this.entpId = entpId;
	}

	public String getGoodInspectDay() {
		return goodInspectDay;
	}
	public void setGoodInspectDay(String goodInspectDay) {
		this.goodInspectDay = goodInspectDay;
	}
	public int getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(int goodPrice) {
		this.goodPrice = goodPrice;
	}
	public String getPlusoneYn() {
		return plusoneYn;
	}
	public void setPlusoneYn(String plusoneYn) {
		this.plusoneYn = plusoneYn;
	}
	public String getGoodDcYn() {
		return goodDcYn;
	}
	public void setGoodDcYn(String goodDcYn) {
		this.goodDcYn = goodDcYn;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getEntpId() {
		return entpId;
	}
	public void setEntpId(String entpId) {
		this.entpId = entpId;
	}
	@Override
	public String toString() {
		return "Price [goodInspectDay=" + goodInspectDay + ", goodPrice=" + goodPrice
				+ ", plusoneYn=" + plusoneYn + ", goodDcYn=" + goodDcYn + ", goodId=" + goodId + ", entpId=" + entpId
				+ "]";
	}
	

}
