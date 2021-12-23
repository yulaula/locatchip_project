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
import basket.model.vo.Basket;

@WebServlet("/basketUpdatePrice")
public class BasketUpdatePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Basket basket = new Basket();
	BasketService service = new BasketService();
	int result = 0;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String basketIndex = req.getParameter("basketIndex");
			List<BasketDetail> list = new ArrayList<BasketDetail>();
			list.add((BasketDetail) service.getBasketDetailByNo(basketIndex)); // 장바구니 메인 인덱스에 따른 상세 상품들을 리스트에 넣음
			
			for(int i = 0; i < list.size(); i++) {
				result += (list.get(i).getGoodPrice() * list.get(i).getQuantity());
			}
			basket.setTotalPrice(result);
			
			int totalPrice = service.updateBasketPrice(basket);
			
			System.out.println(totalPrice);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}