package order.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;
import order.model.*;

public class OrderSetleController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		String method = request.getMethod();
		
		if(super.checkLogin(request)) {
		
		if("POST".equalsIgnoreCase(method)) {
		
			//input태그의 name들을 가져온다.
			 String order_no = request.getParameter("order_no"); 
	         String fk_user_id = request.getParameter("fk_user_id"); 
	         String user_name = request.getParameter("user_name"); 
	         String fk_prod_code = request.getParameter("fk_prod_code"); 
	         String prod_name = request.getParameter("prod_name"); 
	         String prod_price = request.getParameter("prod_price"); 
	         String goods_qy = request.getParameter("goods_qy"); 
	         String dscnt_amount = request.getParameter("dscnt_amount");
	         String tot_amount = request.getParameter("tot_amount"); 
	         String order_dt = request.getParameter("order_dt"); 
	         String user_req = request.getParameter("user_req"); 
	         String payment_type = request.getParameter("payment_type"); 
	        
	       
	         
	         OrderSetleVO ovo = new OrderSetleVO();
	         ovo.setOrder_no(order_no);
	         ovo.setFk_user_id(fk_user_id);
	         ovo.setUser_name(user_name);
	         ovo.setFk_prod_code(fk_prod_code);
	         ovo.setProd_name(prod_name);
	         ovo.setProd_price(Integer.parseInt(prod_price));
	         ovo.setGoods_qy(Integer.parseInt(goods_qy));
	         ovo.setDscnt_amount(Integer.parseInt(dscnt_amount));
	         ovo.setTot_amount(Integer.parseInt(tot_amount));
	         ovo.setOrder_dt(order_dt);
	         ovo.setUser_req(user_req);
	         ovo.setPayment_type(payment_type);
	         
	         
	         InterOrderDAO odao = new OrderDAO(); 
	         int n = odao.insertOrderSetle(ovo); //결제내역 ORDER_SETLE테이블에 insert하기
		         
		     
	        ////////////////////////////////////////////////////////////////////
	        
	 		String totalPoint = request.getParameter("totalPoint");
	 		
	 		Map<String, String> paraMap = new HashMap<>(); 
	 		paraMap.put("fk_user_id", fk_user_id); 
	 		paraMap.put("totalPoint", totalPoint);
	 		
	 		
	 		int result = odao.pointUpdate(paraMap); //결제 후 TBL_MEMBER 회원 테이블에 적립금 update하기
	 		
	 		
		
		    if(n==1 && result==1) { // 결제내역 테이블 insert와 적립금 업데이트가 성공하면 주문내역페이지로 이동할 것이다.
   			   request.setAttribute("message", "결제가 성공되었습니다.");
               request.setAttribute("loc", "/mypage/orderlist.go");
               
               
	   		}
		    
	   		else { //실패하면 이전페이지로 이동
	                request.setAttribute("message", "결제가 실패되었습니다.");
	                request.setAttribute("loc", "javascript:history.back()"); 
	             }
	   		 
	   		//  super.setRedirect(false);   
	   			super.setViewPage("/WEB-INF/msg.jsp");
	   			
		}
		
		else {
    		
    		// GET 방식이라면 
              String message = "비정상적인 경로로 들어왔습니다";
              String loc = "javascript:history.back()";
               
              request.setAttribute("message", message);
              request.setAttribute("loc", loc);
              
           //  super.setRedirect(false);   
              super.setViewPage("/WEB-INF/msg.jsp");
    		
    		
    	}
		
		
		
		
		
		
		}  else {
			
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "/member/login.go");
			setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		
		
		
	}

}
