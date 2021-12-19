package basket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basket.model.service.BasketService;

@WebServlet("/cartView")
public class BasketViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private BasketService service = new BasketService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
}
