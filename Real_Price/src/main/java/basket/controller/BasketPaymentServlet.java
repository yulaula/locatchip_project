package basket.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basket.model.service.BasketService;
import basket.model.vo.BasketDetail;



@WebServlet("/paymentView")
public class BasketPaymentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private BasketService bs = new BasketService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BasketDetail> basketList = new ArrayList<BasketDetail>();
		
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");

			String basketIndex = req.getParameter("basketIndex");
			System.out.println(basketIndex);

			basketList = bs.getBasketDetailByNo(basketIndex);
		
			System.out.println("list 크기 : " + basketList.size());


			if(basketList.isEmpty()) {
				sendCommonPage("결제할 상품이 없습니다.", "/views/product/shop-cart.jsp", req, resp);
				return;
			}

		} catch (Exception e) {
			sendCommonPage("잘못된 접근입니다.", "/views/product/shop-cart.jsp", req, resp);
		}

		req.setAttribute("list", basketList); 
		req.getRequestDispatcher("views/product/card.jsp").forward(req, resp);

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
