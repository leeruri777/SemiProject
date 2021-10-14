package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO_KJH;
import product.model.ProductDAO_KJH;

public class InsertReviewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String orderno = request.getParameter("orderno");
		String prod_code = request.getParameter("prod_code");
		String userid = request.getParameter("userid");
		String content = request.getParameter("content").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		String review_img = request.getParameter("review_img");
		String score = request.getParameter("score");
		
	//	if(review_img == "") System.out.println("확인하려고");
	//	System.out.println(orderno + " , " + prod_code + " , " + userid + " , " + content + " , " + review_img + " , " + score);
		
		Map<String,String> paraMap = new HashMap<>();
		
		paraMap.put("orderno", orderno);
		paraMap.put("prod_code", prod_code);
		paraMap.put("userid", userid);
		paraMap.put("content", content);
		paraMap.put("review_img", review_img);
		paraMap.put("score", score);
		
		InterProductDAO_KJH pdao = new ProductDAO_KJH();
		
		int result = pdao.insertReview(paraMap);
		
		if(result != 0) {
			request.setAttribute("message", "리뷰 작성이 완료되었습니다");
	        request.setAttribute("loc", "/product/prodDetail.go?prod_code=" + prod_code);
	        
	        super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		else {
			request.setAttribute("message", "리뷰 작성이 실패하였습니다");
			request.setAttribute("loc", "/product/prodDetail.go?prod_code=" + prod_code);
	        
	        super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
