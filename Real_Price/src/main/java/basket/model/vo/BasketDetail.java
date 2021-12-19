package basket.model.vo;

public class BasketDetail {
	private String bdIndex;
	private String basketIndex;
	private String goodId;
	private String entpId;
	private int goodPrice;
	private int quantity;
	public BasketDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BasketDetail(String bdIndex, String basketIndex, String goodId, String entpId, int goodPrice, int quantity) {
		super();
		this.bdIndex = bdIndex;
		this.basketIndex = basketIndex;
		this.goodId = goodId;
		this.entpId = entpId;
		this.goodPrice = goodPrice;
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "BasketDetail [bdIndex=" + bdIndex + ", basketIndex=" + basketIndex + ", goodId=" + goodId + ", entpId="
				+ entpId + ", goodPrice=" + goodPrice + ", quantity=" + quantity + "]";
	}



	public String getBdIndex() {
		return bdIndex;
	}



	public void setBdIndex(String bdIndex) {
		this.bdIndex = bdIndex;
	}



	public String getBasketIndex() {
		return basketIndex;
	}



	public void setBasketIndex(String basketIndex) {
		this.basketIndex = basketIndex;
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



	public int getGoodPrice() {
		return goodPrice;
	}



	public void setGoodPrice(int goodPrice) {
		this.goodPrice = goodPrice;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
}
