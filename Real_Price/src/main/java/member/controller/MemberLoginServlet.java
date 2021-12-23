package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet(name="login", urlPatterns = "/login")
public class MemberLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		String memberPwd = req.getParameter("memberPwd");
		String saveID = req.getParameter("saveId");
	
		System.out.println(memberId + ", " + memberPwd + ", " + saveID);
		
		Member loginMember = service.login(memberId, memberPwd);
		
		if(saveID != null) { // 아이디 저장
			Cookie cookie = new Cookie("saveId", memberId);
    		cookie.setMaxAge(60*60);
    		resp.addCookie(cookie); 
    		System.out.println("아이디 저장함");
		}else { // 아이디 저장 안함
			Cookie cookie = new Cookie("saveId", "");
    		cookie.setMaxAge(0);
    		resp.addCookie(cookie); 
    		System.out.println("아이디 저장안함");
		}
		
		// 로그인 기능
		if(loginMember != null ) { // 로그인 성공
			HttpSession session =  req.getSession();
			session.setAttribute("loginMember", loginMember);

			resp.sendRedirect(req.getContextPath()+"/"); // 메인페이지??
		}else { // 로그인 실패
			req.setAttribute("msg", "사용자 아이디 또는 비밀번호가 일치하지 않습니다.");
			req.setAttribute("location", "/");
			
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		}
	}
}






