package review.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import common.JDBCTemplate;
import review.model.vo.Review;

public class ReviewDAO {
	private Connection conn = null;
	private Properties prop = null;


	{
		prop = JDBCTemplate.getProperties();
	}

	public ReviewDAO (Connection conn){
		this.conn = conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	/*
	 * private String reviewNo;
	private String reviewPw;
	private String title;
	private String content;
	private Date postDate;
	private String starScore;
	private String memberId;
	private String goodId;
	 */
	
	
	// 리뷰 작성시 insert
	public int insertReview(Review review) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		try {
			String sql = prop.getProperty("REVIEW_INSERT");
			// INSERT INTO REVIEW VALUES(?,?,?,?,DEFAULT,?,?,?);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, review.getReviewNo());
			pstmt.setString(2, review.getReviewPw());
			pstmt.setString(3, review.getTitle());
			pstmt.setString(4, review.getContent());
			pstmt.setString(5, review.getStarScore());
			pstmt.setString(6, review.getMemberId());
			pstmt.setString(7, review.getGoodId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	// 후기 작성한거 볼 수 있게 (상품에 따라)
	public List<Review> reviewSelectbyGoodId(String goodId) {
		List<Review> list = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("REVIEW_SELECTBY_GOODID");
			// SELECT POST_NUM, TITLE, POST, POST_DATE, STAR_SCORE, MEMBER_ID FROM REVIEW WHERE GOOD_ID=?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goodId);

			rs = pstmt.executeQuery();

			while(rs.next() == true) {
				Review review = new Review();
				review.setReviewNo(rs.getString("POST_NUM"));
				review.setReviewPw(rs.getString("POST_PW"));
				review.setTitle(rs.getString("TITLE"));
				review.setContent(rs.getString("POST"));
				review.setPostDate(rs.getDate("POST_DATE"));
				review.setStarScore(rs.getString("STAR_SCORE"));
				review.setMemberId(rs.getString("MEMBER_ID"));
				review.setGoodId(rs.getString("GOOD_ID"));
				
				list.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;		
	}
	
	// 후기 작성한거 볼 수 있게 (유저에 따라) -- 안쓸수도..
		public List<Review> reviewSelectbyMemberId(String memberId) {
			List<Review> list = new ArrayList<Review>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = prop.getProperty("REVIEW_SELECTBY_MEMBERID");
				// SELECT POST_NUM, TITLE, POST, POST_DATE, STAR_SCORE, MEMBER_ID FROM REVIEW WHERE MEMBER_ID=?

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);

				rs = pstmt.executeQuery();

				while(rs.next() == true) {
					Review review = new Review();
					review.setReviewNo(rs.getString("POST_NUM"));
					review.setReviewPw(rs.getString("POST_PW"));
					review.setTitle(rs.getString("TITLE"));
					review.setContent(rs.getString("POST"));
					review.setPostDate(rs.getDate("POST_DATE"));
					review.setStarScore(rs.getString("STAR_SCORE"));
					review.setMemberId(rs.getString("MEMBER_ID"));
					review.setGoodId(rs.getString("GOOD_ID"));
					
					list.add(review);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;		
		}
	
	
}
