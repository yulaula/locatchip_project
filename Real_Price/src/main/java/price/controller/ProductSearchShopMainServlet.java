package price.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import price.model.service.PriceService;
import price.model.vo.Price;
import shop.model.vo.ShopDistance;

@WebServlet("/searchByMap")
public class ProductSearchShopMainServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ShopDistance> list = null;
		List<ShopDistance> tmpList = null;
		String latitude = null;
		String longitude = null;
		
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			latitude = req.getParameter("latitude"); // 위도
			longitude = req.getParameter("longitude");; // 경도
			
			System.out.println("latitude : " + latitude);
			System.out.println("longitude : " + longitude);
			
			ShopService ss = new ShopService();
			// ss.selectAll.get(0). getEntpId, get경도, get 위도 // 120~~(경도) 30~~(위도)
			// get경도, get위도 -> double 형
			double latitudeD = Double.parseDouble(latitude); //위도
			double longitudeD = Double.parseDouble(longitude); //위도			
			// double tmp = Math.pow(get경도-param경도,2) + Math.pow(get위도-param위도, 2)
			// double result = Math.sqrt(tmp)
			// for(ss.selectAll.tmpList.size) {tmpList.add( new ShopDistance(list(i).getEntp_id, result));
			// tmpList sort (result가 작은 순으로)
			// list <- tmpList 상위 10개 넣기
			
			if(list.isEmpty()) { // 비어있을리는 없지만 일단..
				sendCommonPage("가까운 점포가 없습니다.", "/views/product/product_by_map.jsp", req, resp);
				return;
			}

			
		} catch (Exception e) {
			sendCommonPage("잘못된 접근입니다.", "/views/product/product_by_map.jsp", req, resp);
		}
		
		req.setAttribute("list", list); 
		req.getRequestDispatcher("views/product/search_product_by_distance.jsp").forward(req, resp);

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
