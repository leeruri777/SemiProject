package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import product.model.InterProductDAO_KJH;
import product.model.ProductDAO_KJH;

public class ProductBasketAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if("POST".equalsIgnoreCase(request.getMethod())) {
			
			if(super.checkLogin(request)) {
				
				String real_prod_code = request.getParameter("real_prod_code");
				
				String prod_code = request.getParameter("prod_code");
			//	System.out.println(prod_code);
				
				String[] arrProd_code = prod_code.split(",");
				
				String goods_qy = request.getParameter("goods_qy");
			//	System.out.println(goods_qy);
				
				String[] arrgoods_qy = goods_qy.split(",");
				
				HttpSession session = request.getSession();
				
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
							
				Map<String, Object> paraMap = new HashMap<>();
				
				paraMap.put("userid", loginuser.getUserid());
				paraMap.put("arrProd_code", arrProd_code);
				paraMap.put("arrgoods_qy", arrgoods_qy);
				
				// 장바구니 테이블  insert				
				InterProductDAO_KJH pdao = new ProductDAO_KJH();
				
				int result = pdao.insertBasket(paraMap);
				
				if(result != 0) {					
					request.setAttribute("message", "장바구니에 추가되었습니다");
				}
				
				else {
					request.setAttribute("message", "장바구니 추가에 실패하였습니다. 다시 진행해 주세요");
				}
				
				request.setAttribute("loc", "/product/prodDetail.go?prod_code=" + real_prod_code + "&cart=y");
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
