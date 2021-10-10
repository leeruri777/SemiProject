package product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ProductBasketAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if("POST".equalsIgnoreCase(request.getMethod())) {
			
			if(super.checkLogin(request)) {
				
				String prod_code = request.getParameter("prod_code");
			//	System.out.println(prod_code);
				
				String[] arrProd_code = prod_code.split(",");
				
				String amount = request.getParameter("amount");
			//	System.out.println(amount);
				
				String[] arrAmount = amount.split(",");
				
				System.out.println(arrProd_code[0] + arrAmount[0]);
				
				// 장바구니 테이블 만들어지면 배열에 길이만큼 insert 진행
				
				
				////////////////////////////////////////////
				
				
				request.setAttribute("message", "장바구니에 추가되었습니다");
				request.setAttribute("loc", "/mypage/basket.go");
				setViewPage("/WEB-INF/msg.jsp");
				
			}
			
			else {
				request.setAttribute("message", "로그인이 필요합니다");
				request.setAttribute("loc", "/member/login.go");
				setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
		
		else {
			
			request.setAttribute("message", "비정상적인 접근 경로입니다");
			request.setAttribute("loc", "javascript:history.back()");
			setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		
		
	}

}
