package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class PurchaseEndController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 아임포트 결제창을 사용하기 위한 전제조건은 먼저 로그인을 해야 하는 것이다.
		if( super.checkLogin(request) ) {
			// 로그인을 했으면
			
			String userid = request.getParameter("userid"); //결제할 유저의 아이디 알아오기
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			if( loginuser.getUserid().equals(userid) ) {
				// 로그인한 사용자가 자신의 코인을 결제하는 경우
				
				String coinmoney = request.getParameter("totalAmount"); //결제할 금액 알아오기
				
				request.setAttribute("totalAmount", totalAmount); //span태그의 총결제금액
				request.setAttribute("email", loginuser.getEmail()); // MemberDAO의 메소드에서 얻어옴. return memeber인 것. loginuser.getEmail() 복호화되어진 로그인한 유저의 이메일 얻어오기
				request.setAttribute("name", loginuser.getName());
				request.setAttribute("mobile", loginuser.getMobile());
				request.setAttribute("userid", userid);
				
				//원래 여기에 제품명도 셋어트리뷰트해서 뷰단에 보내야 한다.
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/member/paymentGateway.jsp"); 
				//paymentGateway.jsp"뷰단으로 포워드. 정보 보낸다. 뷰단은 아임포트사에서 준 것이다.
				
			}
			else {
				// 로그인한 사용자가 다른 사용자의 코인을 충전하려고 시도하는 경우 
	            String message = "다른 사용자의 결제 시도는 불가합니다.";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	       //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
	            return;
			}
			
			
		}
		else {
			// 로그인을 안 했으면
	         String message = "결제를 하기 위해서는 먼저 로그인을 하세요.";
	         String loc = "javascript:history.back()";
	         
	         request.setAttribute("message", message);
	         request.setAttribute("loc", loc);
	         
	    //   super.setRedirect(false);
	         super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
