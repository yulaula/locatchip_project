package basket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basket.model.service.BasketService;
import basket.model.vo.Basket;

@WebServlet("/basketView")
public class BasketViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/payment/shop-cart.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Basket> list = null;
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			BasketService bs = new BasketService();
			list = bs.basketSelectAll();
			
			if(list.isEmpty()) {
				sendCommonPage("장바구니가 비어있습니다.", "/views/payment/shop-cart.jsp", req, resp);
				return;
			}
		}catch (Exception e) {
			sendCommonPage("잘못된 접근입니다.", "/views/index.jsp", req, resp);
		}
		req.setAttribute("basketList", list); 
		req.getRequestDispatcher("/views/payment/shop-cart.jsp").forward(req, resp);
		
	}
	public void sendCommonPage(String msg, String path, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.setAttribute("script", "self.close()");
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
}