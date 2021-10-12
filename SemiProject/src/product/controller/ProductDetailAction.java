package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class ProductDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prod_code = request.getParameter("prod_code");
		
		InterProductDAO_KJH pdao = new ProductDAO_KJH();
		
		Map<String,Object> prodMap = pdao.getProdDetail(prod_code);
		
		if(prodMap.size() != 0) {
			
			request.setAttribute("prodMap", prodMap);
			
			List<ReviewVO> reviewList = pdao.getThieReview(prod_code);
						
			if(reviewList.size() != 0) {
				
				request.setAttribute("reviewList", reviewList);
				
				String avg_score = pdao.getAvgScore(prod_code);
				
				request.setAttribute("avg_score", avg_score);
				
				List<Map<String, String>> scoreCntList = pdao.getScoreCnt(prod_code);
				
				request.setAttribute("scoreCntList", scoreCntList);
			
			}
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/product/prodDetail.jsp");
			
		}
		
		else {
			
			String message = "존재하지 않는 상품입니다.";
	        String loc = "javascript:history.back()";
	         
	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	         
	        super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		
	}

}
