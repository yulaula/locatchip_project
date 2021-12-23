package shop.model.vo;

public class ShopDistance implements Comparable<ShopDistance>{
	private String entpId;
	private Double distance;
	public ShopDistance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShopDistance(String entpId, Double distance) {
		super();
		this.entpId = entpId;
		this.distance = distance;
	}
	public String getEntpId() {
		return entpId;
	}
	public void setEntpId(String entpId) {
		this.entpId = entpId;
	}
	public Double getDistance() {
		return distance;
	}
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	
	@Override
	public String toString() {
		return "ShopDistance [entpId=" + entpId + ", distance=" + distance + "]";
	}
	
	@Override
	public int compareTo(ShopDistance sd) {
		if(sd.distance < this.distance) {
			return 1;
		} else if(sd.distance > this.distance) {
			return -1;
		}
		return 0;
	}
	
	
}
