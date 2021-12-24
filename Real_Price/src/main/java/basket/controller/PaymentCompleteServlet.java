package basket.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basket.model.service.BasketService;
import basket.model.vo.Basket;
import reservation.model.service.ReservationService;

@WebServlet("/paymentComplete")
public class PaymentCompleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private BasketService bs = new BasketService();
	private ReservationService rs = new ReservationService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			String basketIndex = req.getParameter("basketIndex");
			System.out.println(basketIndex);

			int result = bs.updateStatus(basketIndex);
			
			// String reservIndex = create
			// getBasket .getId
			// 
			
			/*
			 * String reservIndex;
	String basketIndex;
	String memberId;
	Date reservDate;
			 */
			
			if(result > 0) {
				
			}
			
		} catch (Exception e) {
			sendCommonPage("잘못된 접근입니다.", "/views/product/shop-cart.jsp", req, resp);
		}
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
