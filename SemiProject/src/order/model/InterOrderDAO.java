package order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
}
