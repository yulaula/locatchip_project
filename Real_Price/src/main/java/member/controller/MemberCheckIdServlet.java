package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;


@WebServlet("/checkId")
public class MemberCheckIdServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	MemberService service = new MemberService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		System.out.println("memberId : " + memberId);
		
		boolean isDupl  = service.isDuplicated(memberId);
		
		
		req.setAttribute("duplicated", isDupl);
		req.getRequestDispatcher("/views/member/checkId.jsp").forward(req, resp);
	}
	
}
