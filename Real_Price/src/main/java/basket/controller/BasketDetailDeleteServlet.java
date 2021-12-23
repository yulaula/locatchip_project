package basket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basket.model.service.BasketService;
import basket.model.vo.BasketDetail;

@WebServlet("/basketdetailDelete")
public class BasketDetailDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BasketService service = new BasketService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bdIndex = req.getParameter("bdIndex");
			List<BasketDetail> bd = service.getBasketDetailByNo(bdIndex);
			int result = service.deleteBasketDetail(bdIndex);
			
			if(result > 0) {
//				delete(bd);
			}else {
				req.setAttribute("msg", "장바구니 삭제 실패");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "장바구니 삭제 실패");
		}
		req.setAttribute("location", "/cartview");
		req.getRequestDispatcher("/views/payment/shop-cart.jsp").forward(req, resp);
	
	}
}
//	private void delete(List<BasketDetail> bd) {
//		// TODO Auto-generated method stub
//		
//	}