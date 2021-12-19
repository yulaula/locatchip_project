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
		String USERID = req.getParameter("USERID");
		String PASSWORD = req.getParameter("PASSWORD");
		String saveID = req.getParameter("saveId");
	
		System.out.println(USERID + ", "+PASSWORD+", " + saveID);
		
		Member loginMember = service.login(USERID, PASSWORD);
		
		if(saveID != null) {
			Cookie cookie = new Cookie("saveId", USERID);
    		cookie.setMaxAge(60*60);
    		resp.addCookie(cookie); 
		}else {
			Cookie cookie = new Cookie("saveId", "");
    		cookie.setMaxAge(0);
    		resp.addCookie(cookie); 
		}
		
		if(loginMember != null ) {
			HttpSession session =  req.getSession();
			session.setAttribute("loginMember", loginMember);

			resp.sendRedirect(req.getContextPath()+"/");
		}else {
			req.setAttribute("msg", "사용자 아이디나 비밀번호가 맞지 않습니다!");
			req.setAttribute("location", "/");
			
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		}
	}
}






