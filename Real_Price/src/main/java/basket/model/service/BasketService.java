package basket.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import basket.model.dao.BasketDAO;
import basket.model.vo.Basket;
import basket.model.vo.BasketDetail;

public class BasketService {
	private BasketDAO basketDao = null;
	private Connection conn = null;
	
	public BasketService() {
		init();
	}
	
	public void init() {
		if(conn != null) {
			close(conn);
		}
		conn = getConnection();
		basketDao = new BasketDAO(conn);
	}
	
	@Override
	protected void finalize() throws Throwable {
		close(conn);
	}
	
	public List<Basket> basketSelectAll() {
		List<Basket> list = basketDao.basketSelectAll();
		return list;
	}
	
	public Basket findBasketByMemberId(String memberId) {
		Basket basket = basketDao.findBasketByMemberId(memberId);
		return basket;
	}
	
	public int createBasket(Basket basket) {
		int result = basketDao.createBasket(basket);
		return result;
	}
	
	public int deleteBasket(String eachBasketIndex) {
		int result = basketDao.deleteBasket(eachBasketIndex);
		return result;
	}

	public int updateBasketPrice(Basket basket) {
		int result = basketDao.updateBasketPrice(basket);
		return result;
	}
	
	public List<BasketDetail> getBasketDetailByNo(String mainBasketIndex) {
		List<BasketDetail> list = basketDao.getBasketDetailByNo(mainBasketIndex);
		return list;
	}
	
	public int insertBasketDetail(BasketDetail bDetail) {
		int result = basketDao.insertBasketDetail(bDetail);
		return result;
	}
	
	public int deleteBasketDetail(String bdIndex) {
		int result = basketDao.deleteBasketDetail(bdIndex);
		return result;
	}
	
	public int updateQuantity(int quantity, BasketDetail bDetail) {
		int result = basketDao.updateQuantity(quantity, bDetail);
		return result;
	}
	

	public int getBasketDetailCount(String basketIndex) {
		int result = basketDao.getBasketDetailCount(basketIndex);
		return result;
	}
	
	public int getBasketDetailPrice(String bdIndex) {
		int result = basketDao.getBasketDetailPrice(bdIndex);
		return result;
	}
	
	public int getBasketTotalPrice(String memberId) {
		int price = 0;
		Basket basket = basketDao.findBasketByMemberId(memberId);
		
		List<BasketDetail> list = basketDao.getBasketDetailByNo(basket.getBasketIndex());
		
		for(int i = 0; i < list.size(); i++) {
			price += (list.get(i).getGoodPrice() * list.get(i).getQuantity());
		}
		
		return price;
	}
}
