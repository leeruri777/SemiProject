package order.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.paging.Pagination;

public interface InterOrderDAO {

	// 장바구니 담기
	int insertBasket(Map<String, Object> paraMap) throws SQLException;
	// 장바구니 목록 가져오기
	List<Map<String, Object>> getBasketList(String userid) throws SQLException;
	// 제품의 재고 가져오기
	int getProdStock(String prod_code) throws SQLException;
	// 장바구니 삭제
	int deleteBasket(int basket_no) throws SQLException;
	// 장바구니 수정하기
	int updateBasket(Map<String, Object> paraMap) throws SQLException;
	// 장바구니 번호로 리스트 가져오기
	List<Map<String, Object>> getBasketByBno(String[] basket_no_arr, String userid) throws SQLException;
	// 제품번호로 제품정보로 가져오기
	List<Map<String, Object>> getProdInfoByPno(String[] arrProd_code, String[] goods_qyAmount) throws SQLException;
	// 장바구니 수정하기(상품번호로)
	int updateBasketByProdCode(Map<String, Object> paraMap) throws SQLException;
	
	
	/*
	 * 회원 주문내역 
	 * */
	// 주문내역 가져오기
	List<Map<String, Object>> getOrderSetleList(Pagination pg) throws SQLException;
	// 주문내역 카운트
	int getOrderSetleListCount(Pagination pg) throws SQLException;
	//주문목록 테이블에 insert하는 메소드
	int insertOrderSetle(OrderSetleVO ovo) throws SQLException;
	
	// 현재 배송비 가져오기
	Map<String, Object> getDeliverFee() throws SQLException;
	// 배송비 변경하기
	int updateDeliverFee(int fee, int freeline) throws SQLException;
	
	
	
	
	//결제 후 실행되는 메소드
	// ===== Transaction 처리하기 ===== // 
	int orderSetleAdd(HashMap<String, Object> paraMap) throws SQLException;
	
	
	
	
	
}
