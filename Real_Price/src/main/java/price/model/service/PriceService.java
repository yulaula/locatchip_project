package price.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import price.model.dao.PriceDAO;
import price.model.vo.Price;


public class PriceService {

	private PriceDAO priceDao = null;
	private Connection conn = null;

	public PriceService() {
		init();
	}

	public void init() {
		if(conn != null) {
			close(conn);
		}
		conn = getConnection();
		priceDao = new PriceDAO(conn);
	}

	@Override
	protected void finalize() throws Throwable { // 객체 종료시 호출되는 메소드
		close(conn);
	}

	public List<Price> MainPage(String good_Id) {  //메인 페이지에 넘어갈 해당 물품의 최저가 리스트 발송
		List<Price> list = priceDao.mainPrice(good_Id);
		return list;

	}

	public List<Price> CategorySearch(String goodSmlclsCode) { // 카테고리별 가격리스트 출력
		List<Price> list = priceDao.CategorySearch(goodSmlclsCode);
		return list;
	}

	public List<Price> GoodNameSearch(String goodName) { // 검색키워드를 포함하는 상품이 있는 경우 리스트 출력
		List<Price> list = priceDao.sortByLowestPriceProduct(goodName);
		return list;
	}
	

	public List<Price> lowestGoodNameSearch(String goodName) { // 검색키워드 포함하는 상품 리스트 받아온 후 set으로 중복 제거, 다시 list화
		List<String> list = priceDao.goodIdList(goodName);
		List<Price> list2 = new ArrayList<Price>();
		for(String goodId : list) {
			if(priceDao.mainPriceEach(goodId).getGoodPrice()==0) {
				continue;
			}
			list2.add(priceDao.mainPriceEach(goodId));
		}
		return list2;
		
	}

	public List<Price> ShopNameSearch(String shopName) {// 검색키워드를 포함하는 점포가 있는 경우 리스트 출력
		List<Price> list = priceDao.sortByLowestPriceShop(shopName);
		return list;
	}

	public List<Price> LowToHighPrice(String goodId) { // 물품아이디로 검색시 최저가-최고가순 정렬
		List<Price> list = priceDao.sortByLowestPrice(goodId);
		return list;
	}

	public String SearchCategoryName(String goodId) { // 물품아이디로 검색시 속해있는 카테고리 이름 리턴
		String category = priceDao.informationOfProductCategory(goodId);
		return category;

	}

	public String SearchInspectDay(String goodId, String entpId) { // 물품아이디, 점포아이디 검색시 가격 조사일 리턴
		String inspectDay = priceDao.informationOfInspectDay(goodId, entpId);
		return inspectDay;
	}

	public List<Price> RecommandProduct(String goodId) { // 물품 추천 메소드. 다만 검색한 물품과 중복되는 내용 있어 실행시 중복 제거 알고리즘 필요
		
		List<Price> list = new ArrayList<Price>();
		
		String categoryCode = priceDao.informationOfProductCategoryCode(goodId); // 특정 물품이 포함되는 카테고리 코드 받아옴
		Set<String> goodIdSet = priceDao.CategoryProductSearch(categoryCode); // 받아온 카테고리 코드 삽입해서 해당하는 다른 물품들 Id 모두 받아옴
		Iterator<String> iter = goodIdSet.iterator();
		while(iter.hasNext()) { // set에 담겨있는 물품들 아이디를 돌아가며 최저가를 찾아서 하나씩 리스트에 넣음
			String recmGoodID = iter.next();
			Price recommandProduct = priceDao.mainPriceEach(recmGoodID);
			list.add(recommandProduct);
		}
		return list;
		// 카테고리에 해당하는 물품들 중 가장 최저가를 찾아서 리스트에 담아 출력함
	}

	public List<Price> Transition() { // 가격 추이 출력
		List<Price> list = priceDao.TransitionSearch();
		return list;
	}
	
	public String productName(String goodId) {//물품명 출력
		String productName = priceDao.productName(goodId);
		return productName;
		
	}
	
	public List<Price> category(String categoryCode) { // 카테고리 검색 결과화면 - 해당 카테고리의 물품들 중 최저가만 추려서 출력 
		
		List<Price> list = new ArrayList<Price>();
		
		Set<String> goodIdSet = priceDao.CategoryProductSearch(categoryCode); // 받아온 카테고리 코드 삽입해서 해당하는 다른 물품들 Id 모두 받아옴
		Iterator<String> iter = goodIdSet.iterator();
		while(iter.hasNext()) { // set에 담겨있는 물품들 아이디를 돌아가며 최저가를 찾아서 하나씩 리스트에 넣음
			String recmGoodID = iter.next();
			Price recommandProduct = priceDao.mainPriceEach(recmGoodID);
			list.add(recommandProduct);
		}
		return list;
		// 카테고리에 해당하는 물품들 중 가장 최저가를 찾아서 리스트에 담아 출력함
	}

	
//	public static void main(String[] args) {
//		List<Price> list2 = new PriceService().GoodNameSearch("롯데");
//		System.out.println(list2);
//		System.out.println("==");
//		List<Price> list = new PriceService().lowestGoodNameSearch(list2);
//		System.out.println(list);
//	}
}