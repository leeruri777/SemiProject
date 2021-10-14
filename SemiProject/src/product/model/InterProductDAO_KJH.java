package product.model;

import java.sql.SQLException;
import java.util.*;

public interface InterProductDAO_KJH {

	// 모든 카테고리 불러오기
	List<SortVO> AllSort() throws SQLException;

	// 모든 상품 불러오기
	List<ProductVO> AllProduct() throws SQLException;

	// 상품등록하기
	int insertProd(Map<String, Object> paraMap) throws SQLException;
	
	// 상품 리스트
	List<HashMap<String, Object>> productList(String sort_code) throws SQLException;
   
	// 광고(배너) 이미지(상품 top_image)
	String adimg(String sort_code) throws SQLException;
   
	// 카테고리 이름(중간 카테고리 이름설정)
	String categoryName(String sort_code) throws SQLException;

	// 상품 상세페이지 내용 select
	Map<String, Object> getProdDetail(String prod_code) throws SQLException;

	// 카테고리와 배너 받아오기
	List<Map<String, Object>> allBanner() throws SQLException;

	// 신규배너등록하기
	int insertBanner(Map<String, String> paraMap) throws SQLException;

	// 배너삭제하기
	int deleteBanner(String this_sort_code) throws SQLException;

	// 배너수정하기
	int updateBanner(String this_sort_code, String ad_img_url_pick) throws SQLException;

	// 리뷰를 작성할 주문건 가져오기
	String getOrdernoforReview(String prod_code) throws SQLException;

	// 리뷰테이블 insert
	int insertReview(Map<String, String> paraMap) throws SQLException;
	
	// 상품 리뷰 select	
	List<ReviewVO> getReviewList(String prod_code, String currentShowPageNo) throws SQLException;

	// 상품 평점 select
	String getAvgScore(String prod_code) throws SQLException;

	// 상품 평점별 갯수 select
	List<Map<String, String>> getScoreCnt(String prod_code) throws SQLException;

	// 리뷰 페이징 처리를 위한 페이지바 만들기 & 리뷰 총 개수
	Map<String, String> getReviewTotal(String prod_code) throws SQLException;

	// 장바구니 테이블  insert
	int insertBasket(Map<String, Object> paraMap) throws SQLException;

	

}
