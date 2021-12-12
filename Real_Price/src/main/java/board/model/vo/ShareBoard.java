package board.model.vo;

import java.sql.Date;

public class ShareBoard {
		
	private String postNo;
	private String postPassword;
	private String title;
	private int readCount;
	private String content;
	private String location;
	private Date postDate;
	private String writerId;
	private String shopId;
	private String productId;
	
	public ShareBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShareBoard(String postNo, String postPassword, String title, int readCount, String content, String location,
			Date postDate, String writerId, String shopId, String productId) {
		super();
		this.postNo = postNo;
		this.postPassword = postPassword;
		this.title = title;
		this.readCount = readCount;
		this.content = content;
		this.location = location;
		this.postDate = postDate;
		this.writerId = writerId;
		this.shopId = shopId;
		this.productId = productId;
	}

	public String getPostNum() {
		return postNo;
	}

	public void setPostNum(String postNum) {
		this.postNo = postNum;
	}

	public String getPostPassword() {
		return postPassword;
	}

	public void setPostPassword(String postPassword) {
		this.postPassword = postPassword;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "ShareBoard [postNo=" + postNo + ", postPassword=" + postPassword + ", title=" + title + ", readCount="
				+ readCount + ", content=" + content + ", location=" + location + ", postDate=" + postDate
				+ ", writerId=" + writerId + ", shopId=" + shopId + ", productId=" + productId + "]";
	}
	
	
	
}
