package common.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.*;

public class MainController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO_KJH pdao = new ProductDAO_KJH();
		
		// 배너리스트 파일명 select
		List<Map<String, String>> bannerList = pdao.getBannerList();
		
		request.setAttribute("bannerList", bannerList);
		
		// NEW 상품 4개 select
		List<ProductVO_KJH> newList = pdao.getNewList();
		
		request.setAttribute("newList", newList);
		
		// HIT 상품 4개 select
		List<ProductVO_KJH> hitList = pdao.getHitList();
		
		request.setAttribute("hitList", hitList);
		
		// BEST 상품 4개 select
		List<ProductVO_KJH> bestList = pdao.getBestList();
		
		request.setAttribute("bestList", bestList);
		
		super.setViewPage("/WEB-INF/views/main.jsp");
	}

}
