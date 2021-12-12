package run;

import java.io.IOException;
import java.sql.SQLException;

import api.category.create.CategoryApi;
import api.price.create.PriceApi;
import api.price.create.PriceUpdateDB;
import api.product.create.ProductApi;
import api.shop.create.ShopApi;
import api.transition.create.TransitionApi;
import common.JDBCTemplate;

public class run {

	public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {
		new ProductApi().productInform();
		new ShopApi().ShopInform();
		new PriceApi().priceInform("20211119");
		new CategoryApi().CategoryInform();
//		new PriceUpdateDB(JDBCTemplate.getConnection()).allPrice("63"); // 파일저장방향시 사용
		new TransitionApi().priceInform("1800", "63");
		
	}
	

}
