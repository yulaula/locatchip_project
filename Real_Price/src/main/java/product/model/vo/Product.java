package product.model.vo;

public class Product {
	
	String goodId;
	String goodName;
	String productEntpCode;
	String goodUnitDivCode;
	String goodBaseCnt;
	String detailMean;
	String goodTotalCnt;
	String goodTotalDivCode;
	String goodSmlclsCode;
	String entpId;
	
	public Product() {
		super();
	}
	public Product(String goodId, String goodName, String productEntpCode, String goodUnitDivCode, String goodBaseCnt,
			String detailMean, String goodTotalCnt, String goodTotalDivCode, String goodSmlclsCode) {
		super();
		this.goodId = goodId;
		this.goodName = goodName;
		this.productEntpCode = productEntpCode;
		this.goodUnitDivCode = goodUnitDivCode;
		this.goodBaseCnt = goodBaseCnt;
		this.detailMean = detailMean;
		this.goodTotalCnt = goodTotalCnt;
		this.goodTotalDivCode = goodTotalDivCode;
		this.goodSmlclsCode = goodSmlclsCode;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getProductEntpCode() {
		return productEntpCode;
	}
	public void setProductEntpCode(String productEntpCode) {
		this.productEntpCode = productEntpCode;
	}
	public String getGoodUnitDivCode() {
		return goodUnitDivCode;
	}
	public void setGoodUnitDivCode(String goodUnitDivCode) {
		this.goodUnitDivCode = goodUnitDivCode;
	}
	public String getGoodBaseCnt() {
		return goodBaseCnt;
	}
	public void setGoodBaseCnt(String goodBaseCnt) {
		this.goodBaseCnt = goodBaseCnt;
	}
	public String getDetailMean() {
		return detailMean;
	}
	public void setDetailMean(String detailMean) {
		this.detailMean = detailMean;
	}
	public String getGoodTotalCnt() {
		return goodTotalCnt;
	}
	public void setGoodTotalCnt(String goodTotalCnt) {
		this.goodTotalCnt = goodTotalCnt;
	}
	public String getGoodTotalDivCode() {
		return goodTotalDivCode;
	}
	public void setGoodTotalDivCode(String goodTotalDivCode) {
		this.goodTotalDivCode = goodTotalDivCode;
	}
	public String getGoodSmlclsCode() {
		return goodSmlclsCode;
	}
	public void setGoodSmlclsCode(String goodSmlclsCode) {
		this.goodSmlclsCode = goodSmlclsCode;
	}
	@Override
	public String toString() {
		return "Product [goodId=" + goodId + ", goodName=" + goodName + ", productEntpCode=" + productEntpCode
				+ ", goodUnitDivCode=" + goodUnitDivCode + ", goodBaseCnt=" + goodBaseCnt + ", detailMean=" + detailMean
				+ ", goodTotalCnt=" + goodTotalCnt + ", goodTotalDivCode=" + goodTotalDivCode + ", goodSmlclsCode="
				+ goodSmlclsCode  + "]";
	}
	
	

}
