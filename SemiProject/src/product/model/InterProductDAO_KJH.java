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

}
