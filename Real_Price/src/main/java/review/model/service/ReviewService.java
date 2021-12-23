package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import review.model.dao.ReviewDAO;
import review.model.vo.Review;

public class ReviewService {
	private ReviewDAO reviewDao = null;
	private Connection conn = null;
	
	public ReviewService() {
		init();
	}
	
	public void init() {
		if(conn != null) {
			close(conn);
		}
		conn = getConnection();
		reviewDao = new ReviewDAO(conn);
	}
	
	@Override
	protected void finalize() throws Throwable {
		close(conn);
	}
	
	public int insertReview(Review review) {
		int result = reviewDao.insertReview(review);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public List<Review> reviewSelectbyGoodId(String goodId) {
		List<Review> list = reviewDao.reviewSelectbyGoodId(goodId);

		if(list != null) {
			return list;
		}else {
			return null;
		}
	}
	
	public List<Review> reviewSelectbyMemberId(String memberId) {
		List<Review> list = reviewDao.reviewSelectbyMemberId(memberId);

		if(list != null) {
			return list;
		}else {
			return null;
		}
	}
}
