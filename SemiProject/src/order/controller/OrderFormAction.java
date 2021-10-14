package order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.AddressVO;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class OrderFormAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(super.checkLogin(request)) {
			
			InterMemberDAO mdao = new MemberDAO();
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			String userid = loginuser.getUserid();
			
			AddressVO defaultAddr = mdao.getAddressL(userid);
			session.setAttribute("defaultAddr", defaultAddr);
			
			super.setViewPage("/WEB-INF/views/order/orderForm.jsp");
					
		} else {
			
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "/member/login.go");
			
			super.setViewPage("/WEB-INF/msg.jsp");
		}
	}

}
