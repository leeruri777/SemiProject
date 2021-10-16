package order.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterOrderDAO {

	//주문목록 테이블에 insert하는 메소드
	int insertOrderSetle(OrderSetleVO ovo) throws SQLException;
	
	//결제 후 TBL_MEMBER 회원 테이블에 적립금 update하기
	int pointUpdate(Map<String, String> paraMap) throws SQLException;

}
