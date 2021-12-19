package board.model.vo;

import java.sql.Date;
import java.util.List;

public class ShareBoard {
		
	private String postNo;
	private String postPassword;
	private String title;
	private int readCount;
	private String status;
	private String content;
	private String location;
	private Date postDate;
	private String writerId;
	private String shopId;
	private String productId;
	private List<ShareReply> replies;
	
	public ShareBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShareBoard(String postNo, String postPassword, String title, int readCount, String status, String content,
			String location, Date postDate, String writerId, String shopId, String productId, List<ShareReply> replies) {
		super();
		this.postNo = postNo;
		this.postPassword = postPassword;
		this.title = title;
		this.readCount = readCount;
		this.status = status;
		this.content = content;
		this.location = location;
		this.postDate = postDate;
		this.writerId = writerId;
		this.shopId = shopId;
		this.productId = productId;
		this.replies = replies;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public List<ShareReply> getReplies() {
		return replies;
	}
	public void setReplies(List<ShareReply> replies) {
		this.replies = replies;
	}
	
	@Override
	public String toString() {
		return "ShareBoard [postNo=" + postNo + ", postPassword=" + postPassword + ", title=" + title + ", readCount="
				+ readCount + ", status=" + status + ", content=" + content + ", location=" + location + ", postDate="
				+ postDate + ", writerId=" + writerId + ", shopId=" + shopId + ", productId=" + productId + ", replies=" + replies + "]";
	}
}
