package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class RegisterReviewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) { // 로그인 되어 있을 경우
			
			// 로그인 되어 있어도 구매목록에 해당 상품이 없으면 안됨!!!!! 구매목록 테이블에서 확인하는 작업 필요
		//	System.out.println(request.getParameter("prod_code"));
			// 해당 상품 구매 기록이 있으면 리뷰등록 페이지로 보내준다.
			
		}
		
		else { // 로그인 안 되어 있을 경우 --> 로그인 먼저
			
		}
		
	}

}
