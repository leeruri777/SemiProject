package member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import util.paging.Pagination;

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
		// 전체 회원목록 가져오기(검색)
		List<MemberVO> getMemberList(Pagination pg) throws SQLException;
		// 전체 회원목록 갯수(검색)
		int getTotalCnt(Pagination pg) throws SQLException;
	
		/*
		 * 배송지 관련 메소드
		 */
		// 배송지 등록하기
		int registerAddress(AddressVO addressVo) throws SQLException;
		// 배송지 목록 가져오기
		List<AddressVO> getAddressList(String userid) throws SQLException;
		// 선택한 배송지 외 모든 배송지 목록들 기본 배송지(default_yn) n으로 바꾸기
		int changeAddressDefaultN(AddressVO addressVo) throws SQLException;
		// 등록된 배송지 개수 가져오기
		int getAddressCnt(String userid) throws SQLException;
		// 등록된 배송지 삭제하기
		int deleteAddress(Long ano, String userid) throws SQLException;
		// 배송지 정보 가져오기
		AddressVO getAddress(Long ano, String userid) throws SQLException;
		// 배송지 정보 수정하기
		int updateAddress(AddressVO addressVo) throws SQLException;
}

