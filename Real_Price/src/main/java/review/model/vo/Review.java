package review.model.vo;

import java.sql.Date;

/*
-- 후기 테이블
CREATE TABLE REVIEW (
    POST_NUM VARCHAR2(20) PRIMARY KEY,
    POST_PW VARCHAR2(10) NOT NULL,
    TITLE VARCHAR2(50) NOT NULL,
    POST VARCHAR2(300) NOT NULL,
    POST_DATE DATE NOT NULL,
    STAR_SCORE VARCHAR2(20),
    MEMBER_ID VARCHAR2(10) NOT NULL,
    GOOD_ID VARCHAR2(20) NOT NULL
);
*/

public class Review {
	private String reviewNo;
	private String reviewPw;
	private String title;
	private String content;
	private Date postDate;
	private String starScore;
	private String memberId;
	private String goodId;
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(String reviewNo, String reviewPw, String title, String content, Date postDate, String starScore,
			String memberId, String goodId) {
		super();
		this.reviewNo = reviewNo;
		this.reviewPw = reviewPw;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.starScore = starScore;
		this.memberId = memberId;
		this.goodId = goodId;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewPw() {
		return reviewPw;
	}

	public void setReviewPw(String reviewPw) {
		this.reviewPw = reviewPw;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getStarScore() {
		return starScore;
	}

	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getGoodId() {
		return goodId;
	}

	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewPw=" + reviewPw + ", title=" + title + ", content=" + content
				+ ", postDate=" + postDate + ", starScore=" + starScore + ", memberId=" + memberId + ", goodId="
				+ goodId + "]";
	}
	
}



