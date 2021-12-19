package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet(name="enroll" ,urlPatterns = "/member/enroll")
public class UserEnrollServlet extends HttpServlet {
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
			member.setMemberId(req.getParameter("MEMBER_ID"));
			member.setPassword(req.getParameter("PASSWORD"));
			member.setMemberName(req.getParameter("NAME"));
	    	member.setPhone(req.getParameter("PHONE"));
	    	member.setAddress(req.getParameter("ADDRESS"));
	    	member.setEmail(req.getParameter("EMAIL"));
	    	
			System.out.println(member.toString());
			
		} catch (Exception e) {
			req.setAttribute("msg", "회원가입 실패!");
			req.setAttribute("location", "/member/enroll");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
    		return;
		}
		
		int result = service.insertUser(member);
		
		if(result > 0) {
			req.setAttribute("msg", "회원가입 성공!");
			req.setAttribute("location", "/");
		}else {
			req.setAttribute("msg", "회원가입 실패!");
			req.setAttribute("location", "/member/enroll");
		}
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
}
