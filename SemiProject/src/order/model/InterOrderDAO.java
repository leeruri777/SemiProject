package order.model;

import java.sql.SQLException;

public interface InterOrderDAO {

	//주문목록 테이블에 insert하는 메소드
	int insertOrderSetle(OrderSetleVO ovo) throws SQLException;

}
