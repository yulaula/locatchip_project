package shop.model.vo;

public class Shop {
	String entpId;
	String entpName;
	String entpTypeCode;
	String entpAreaCode;
	String areaDetailCode;
	String entpTelno;
	String postNo;
	String plmkAddrBasic;
	String plmkAddrDetail;
	String roadAddrBasic;
	String roadAddrDetail;
	String xMapCoord;
	String yMapCoord;
	public Shop() {
		super();
	}
	public Shop(String entpId, String entpName, String entpTypeCode, String entpAreaCode, String areaDetailCode,
			String entpTelno, String postNo, String plmkAddrBasic, String plmkAddrDetail, String roadAddrBasic,
			String roadAddrDetail, String xMapCoord, String yMapCoord) {
		super();
		this.entpId = entpId;
		this.entpName = entpName;
		this.entpTypeCode = entpTypeCode;
		this.entpAreaCode = entpAreaCode;
		this.areaDetailCode = areaDetailCode;
		this.entpTelno = entpTelno;
		this.postNo = postNo;
		this.plmkAddrBasic = plmkAddrBasic;
		this.plmkAddrDetail = plmkAddrDetail;
		this.roadAddrBasic = roadAddrBasic;
		this.roadAddrDetail = roadAddrDetail;
		this.xMapCoord = xMapCoord;
		this.yMapCoord = yMapCoord;
	}
	public String getEntpId() {
		return entpId;
	}
	public void setEntpId(String entpId) {
		this.entpId = entpId;
	}
	public String getEntpName() {
		return entpName;
	}
	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}
	public String getEntpTypeCode() {
		return entpTypeCode;
	}
	public void setEntpTypeCode(String entpTypeCode) {
		this.entpTypeCode = entpTypeCode;
	}
	public String getEntpAreaCode() {
		return entpAreaCode;
	}
	public void setEntpAreaCode(String entpAreaCode) {
		this.entpAreaCode = entpAreaCode;
	}
	public String getAreaDetailCode() {
		return areaDetailCode;
	}
	public void setAreaDetailCode(String areaDetailCode) {
		this.areaDetailCode = areaDetailCode;
	}
	public String getEntpTelno() {
		return entpTelno;
	}
	public void setEntpTelno(String entpTelno) {
		this.entpTelno = entpTelno;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getPlmkAddrBasic() {
		return plmkAddrBasic;
	}
	public void setPlmkAddrBasic(String plmkAddrBasic) {
		this.plmkAddrBasic = plmkAddrBasic;
	}
	public String getPlmkAddrDetail() {
		return plmkAddrDetail;
	}
	public void setPlmkAddrDetail(String plmkAddrDetail) {
		this.plmkAddrDetail = plmkAddrDetail;
	}
	public String getRoadAddrBasic() {
		return roadAddrBasic;
	}
	public void setRoadAddrBasic(String roadAddrBasic) {
		this.roadAddrBasic = roadAddrBasic;
	}
	public String getRoadAddrDetail() {
		return roadAddrDetail;
	}
	public void setRoadAddrDetail(String roadAddrDetail) {
		this.roadAddrDetail = roadAddrDetail;
	}
	public String getxMapCoord() {
		return xMapCoord;
	}
	public void setxMapCoord(String xMapCoord) {
		this.xMapCoord = xMapCoord;
	}
	public String getyMapCoord() {
		return yMapCoord;
	}
	public void setyMapCoord(String yMapCoord) {
		this.yMapCoord = yMapCoord;
	}
	@Override
	public String toString() {
		return "Shop [entpId=" + entpId + ", entpName=" + entpName + ", entpTypeCode=" + entpTypeCode
				+ ", entpAreaCode=" + entpAreaCode + ", areaDetailCode=" + areaDetailCode + ", entpTelno=" + entpTelno
				+ ", postNo=" + postNo + ", plmkAddrBasic=" + plmkAddrBasic + ", plmkAddrDetail=" + plmkAddrDetail
				+ ", roadAddrBasic=" + roadAddrBasic + ", roadAddrDetail=" + roadAddrDetail + ", xMapCoord=" + xMapCoord
				+ ", yMapCoord=" + yMapCoord + "]";
	}
	
	
	
}
