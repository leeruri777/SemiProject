package display.model;

import java.sql.SQLException;
import java.util.List;

public interface InterDisplayDAO {

	// 메인로고 리스트 가져오기
	List<MainLogoVO> getLogoList() throws SQLException;
}
