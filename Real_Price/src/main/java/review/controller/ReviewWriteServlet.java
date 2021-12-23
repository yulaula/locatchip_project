package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;

@WebServlet("/reviewWrite")
public class ReviewWriteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	private ReviewService service = new ReviewService();
	private int reviewCount = 1;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(false);
			Member member = (Member) session.getAttribute("loginMember");
			if(member != null) {
				req.getRequestDispatcher("/views/reviewWrite.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {}
		
		req.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
		req.setAttribute("location", "/");
 		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
			String writer = req.getParameter("writer");
			String password = req.getParameter("password");
			String star = req.getParameter("star");
			String content = req.getParameter("reviewContent");
			
			HttpSession session = req.getSession(false);
			Member member = (Member) session.getAttribute("loginMember");
			
			if(member.getMemberId().equals(writer) == false) { // 세션으로 다시 사용자 확인
				sendErrorPage(req, resp);
				return;
			}
			
			System.out.println(member);
			
			Review review = new Review();
			review.setReviewNo(createReviewNo());
			review.setTitle(title);
			review.setMemberId(writer);
			review.setReviewPw(password);
			review.setStarScore(star);
			review.setContent(content);
			
			System.out.println(review);
			
			int result = service.insertReview(review);
			
			if(result <= 0) {
				sendErrorPage(req, resp);
				return;
			}
			req.setAttribute("msg", "후기가 등록 되었습니다.");
			req.setAttribute("location", "/reviewList");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			sendErrorPage(req, resp);
		}
	}
	
	private void sendErrorPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", "후기 등록에 실패 했습니다.");
		req.setAttribute("location", "/reviewList");
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
	
	private String createReviewNo() {
		String reviewNo = "REVIEW" + Integer.toString(reviewCount);
		reviewCount++;
		
		return reviewNo; 
	}
}
