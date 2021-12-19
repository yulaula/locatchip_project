package price.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import price.model.vo.Price;
import price.model.service.PriceService;

@WebServlet("/searchByCategory")
public class ProductSearchCategoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Price> list = null;

		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");

			String categoryCode =  req.getParameter("categoryCode");
			System.out.println(categoryCode);

			PriceService ps = new PriceService();
			list = ps.category(categoryCode);

		
			System.out.println("list 크기 : " + list.size());


			if(list.isEmpty()) {
				sendCommonPage("해당하는 물품이 없습니다", "/views/product/total_product.jsp", req, resp);
				return;
			}

		} catch (Exception e) {
			sendCommonPage("잘못된 접근입니다.", "/views/product/total_product.jsp", req, resp);
		}

		req.setAttribute("list", list); 
		req.getRequestDispatcher("views/product/search_product_by_category.jsp").forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	public void sendCommonPage(String msg, String path, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.setAttribute("script", "self.close()");
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
}
