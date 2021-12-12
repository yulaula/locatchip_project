package board.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.PageInfo;

@WebServlet("/board/nanum-list")
public class ShareBoardListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ShareBoardService service = new ShareBoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<ShareBoard> list = null;
		
		// get 방식으로 부터 page 번호를 가져온다.
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}
		
		listCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list = service.getBoardList(pageInfo);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/board/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
