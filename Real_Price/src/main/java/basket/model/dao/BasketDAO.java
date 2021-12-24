package basket.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import basket.model.vo.*;
import common.JDBCTemplate;

public class BasketDAO {
	private Connection conn = null;
	private Properties prop = null;


	{
		prop = JDBCTemplate.getProperties();
	}

	public BasketDAO (Connection conn) {
		this.conn = conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	
	// memberId로 장바구니 get
	public Basket findBasketByMemberId(String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Basket basket = null;
		try {
			String sql = prop.getProperty("BASKET_FINDBY_MEMBERID");
			//SELECT B.BASKET_INDEX, B.TOTAL_PRICE, B.MEMBER_ID, B.PICKUP_COMMENT, B.STATUS
			//FROM BASKET B WHERE B.MEMBER_ID=? AND STATUS='Y';

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs= pstmt.executeQuery();

			if(rs.next() == true) {
				basket = new Basket();
				basket.setBasketIndex(rs.getString("BASKET_INDEX"));
				basket.setTotalPrice(rs.getInt("TOTAL_PRICE"));
				basket.setMemberId(rs.getString("MEMBER_ID"));
				basket.setComment(rs.getString("PICKUP_COMMENT"));
				basket.setStatus(rs.getString("STATUS"));
				basket.setGoodList(getBasketDetailByNo(basket.getBasketIndex()));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return basket;
	}	

	// basketIndex로 장바구니 get
	public Basket findBasketByNo(String basketIndex) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Basket basket = null;
		try {
			String sql = prop.getProperty("BASKET_FINDBY_INDEX");
			//SELECT * FROM BAKSET WHERE BAKET_INDEX=?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, basketIndex);
			rs= pstmt.executeQuery();

			if(rs.next() == true) {
				basket = new Basket();
				basket.setBasketIndex(rs.getString("BASKET_INDEX"));
				basket.setTotalPrice(rs.getInt("TOTAL_PRICE"));
				basket.setMemberId(rs.getString("MEMBER_ID"));
				basket.setComment(rs.getString("PICKUP_COMMENT"));
				basket.setStatus(rs.getString("STATUS"));
				basket.setGoodList(getBasketDetailByNo(basket.getBasketIndex()));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return basket;
	}	

	// 1. 회원가입 후 2. 결제완료 후 -> 생성되는 new 장바구니
	public int createBasket(Basket basket) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = prop.getProperty("BASKET_INSERT");
			// INSERT INTO BASKET VALUES(?,DEFAULT,?,DEFAULT,DEFAULT);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, basket.getBasketIndex());
			pstmt.setString(2, basket.getMemberId());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}


	// 결제완료 후 장바구니 삭제
	public int deleteBasket(String eachBasketIndex) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		try {
			query = prop.getProperty("BASKET_DELETE");
			// DELETE FROM BASKET WHERE BASKET_INDEX=?
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, eachBasketIndex);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}

	// 총액 변경
	public int updateBasketPrice(Basket basket) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql =  prop.getProperty("BASKET_UPDATE_PRICE");
			// UPDATE BASKET SET TOTAL_PRICE=?
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, basket.getTotalPrice());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 장바구니 상세(상품id, 상품가격, 판매id, 수량) 리턴
	public List<BasketDetail> getBasketDetailByNo(String mainBasketIndex) {
		List<BasketDetail> list = new ArrayList<BasketDetail>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = prop.getProperty("BASKETDETAIL_SELECTALL");
			// SELECT * FROM BASKET_DETAIL WHERE BASKEK_INDEX=?

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mainBasketIndex);

			rs = pstmt.executeQuery();

			while(rs.next() == true) {
				BasketDetail bDetail = new BasketDetail();
				bDetail.setBasketIndex(rs.getString("bdIndex"));
				bDetail.setGoodId(rs.getString("GOOD_ID"));
				bDetail.setEntpId(rs.getString("ENTP_ID"));
				bDetail.setGoodPrice(rs.getInt("GOOD_PRICE"));
				bDetail.setQuantity(rs.getInt("QUANTITY"));
				bDetail.setBasketIndex(rs.getString("BAKSET_INDEX"));

				list.add(bDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 장바구니에 상품 넣기
	public int insertBasketDetail(BasketDetail bDetail) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = prop.getProperty("BASKETDETAIL_INSERT");
			// INSERT INTO BASKET_DETAIL VALUES(?,?,?,?,DEFAULT,?);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bDetail.getBdIndex());
			pstmt.setString(2, bDetail.getGoodId());
			pstmt.setString(3, bDetail.getEntpId());
			pstmt.setInt(4, bDetail.getGoodPrice());
			pstmt.setString(5, bDetail.getBasketIndex());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;
	}

	public int getBasketDetailPrice(String bdIndex) {
		int price = 0; 
		PreparedStatement pstmt = null;
		String query = null;
		try {
			query = prop.getProperty("BASKETDETAIL_GET_PRICE");
			// SELECT GOOD_PRICE FROM BASKET_DETAIL WHERE BD_INDEX=?
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bdIndex);
			price = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return price;	
	}

	// 장바구니 내에서 상품 삭제
	public int deleteBasketDetail(String bdIndex) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = null;
		try {
			query = prop.getProperty("BASKET_DELETE");
			// DELETE FROM BASKET_DETAIL WHERE BD_INDEX=?
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bdIndex);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}

	// 각 상품마다 수량 변경
	public int updateQuantity(int quantity, BasketDetail bDetail) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql =  prop.getProperty("BASKETDETAIL_UPDATE_QUANTITY");
			// UPDATE BASKET_DETAIL SET QUANTITY=? WHERE BD_INDEX=?
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, quantity);
			pstmt.setString(1, bDetail.getBdIndex());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 장바구니(STATUS: Y) -> 예약(STATUS: N)
	public int updateStatus(String basketIndex) {
		int result = 0;
		PreparedStatement pstmt = null;

		try {
			String sql =  prop.getProperty("BASKET_UPDATE_STATUS");
			// UPDATE BASKET SET STATUS='N' WHERE BASKET_INDEX=?
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, basketIndex);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 장바구니 내에 상품 갯수 가져옴
	public int getBasketDetailCount(String basketIndex) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			sql = prop.getProperty("BASKETDETAIL_COUNT");
			// SELECT COUNT(*) FROM BASKET_DETAIL WHERE BASKET_INDEX=?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, basketIndex);
			result = pstmt.executeUpdate();

			if(rs.next() ==  true) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}

	//	public static void main(String[] args) {
	//
	//	}
}
