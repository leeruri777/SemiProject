package member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterMemberDAO {
	
	    /*
	     * 회원가입에 필요한 메소드
	     */
		// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를 리턴한다) 
		boolean idDuplicateCheck(String userid) throws SQLException;
		// 회원가입
		int registerMember(MemberVO member) throws SQLException;
		// email 중복검사
		boolean emailDuplicateCheck(String email) throws SQLException;
		// 회원정보 수정
		int updateMember(MemberVO member) throws SQLException;
		
		// 회원 한 명의 정보 가져오기
		MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;
		// 전체 회원목록 가져오기
		List<MemberVO> getMemberList() throws SQLException;
		
}

