package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import order.model.InterOrderDAO;
import order.model.OrderDAO;

public class ProductBasketAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if("POST".equalsIgnoreCase(request.getMethod())) {
			
			if(super.checkLogin(request)) {
				
				String real_prod_code = request.getParameter("real_prod_code");
				
				String prod_code = request.getParameter("prod_code");			
				String[] arrProd_code = prod_code.split(",");
				
				String goods_qy = request.getParameter("goods_qy");				
				String[] goods_qyAmount = goods_qy.split(",");
				
				String update_prod_code = request.getParameter("update_prod_code");
				String[] update_prod_code_code = update_prod_code.split(",");
				
				String update_goods_qy = request.getParameter("update_goods_qy");
				String[] update_goods_qy_arr = update_goods_qy.split(",");
				
				HttpSession session = request.getSession();			
				MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");						
				Map<String, Object> paraMap = new HashMap<>();
				
				paraMap.put("userid", loginuser.getUserid());
				paraMap.put("arrProd_code", arrProd_code);
				paraMap.put("goods_qyAmount", goods_qyAmount);
				
				InterOrderDAO odao = new OrderDAO();
				
				int updateResult = 0;
				if(update_prod_code != null || update_prod_code != "") {
					
					Map<String, Object> updateBasket = new HashMap<>();
					updateBasket.put("userid", loginuser.getUserid());
					updateBasket.put("prod_code_arr", update_prod_code_code);
					updateBasket.put("goods_qy_arr", update_goods_qy_arr);
					
					updateResult = odao.updateBasketByProdCode(updateBasket);
					
				}
							
				// 장바구니 테이블  insert				
			
				int result = odao.insertBasket(paraMap);
								
				if(result != 0 || updateResult != 0) {					
					request.setAttribute("message", "장바구니에 추가되었습니다");
					
					List<Map<String, Object>> basketList = odao.getBasketList(loginuser.getUserid());
					session.setAttribute("basketList", basketList);
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
