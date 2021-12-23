package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet(name="enroll" ,urlPatterns = "/enroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberService service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/views/member/enroll.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = new Member();
	
		try { 
			member.setMemberId(req.getParameter("memberId"));
			member.setPassword(req.getParameter("memberPwd"));
			member.setMemberName(req.getParameter("memberName"));
	    	member.setPhone(req.getParameter("phone"));
	    	member.setAddress(req.getParameter("address"));
	    	member.setEmail(req.getParameter("email"));
	    	
			System.out.println(member.toString());
			
		} catch (Exception e) {
			req.setAttribute("msg", "회원가입 실패하셨습니다.");
			req.setAttribute("location", "/enroll");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
    		return;
		}
		
		int result = service.insertUser(member);
		
		if(result > 0) {
			req.setAttribute("msg", "회원가입 되었습니다. 로그인 해주세요.");
			req.setAttribute("location", "/"); // index로 돌아가는 방법.. 어떻게?
		}else {
			req.setAttribute("msg", "회원가입 실패하셨습니다.");
			req.setAttribute("location", "/enroll");
		}
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
}
