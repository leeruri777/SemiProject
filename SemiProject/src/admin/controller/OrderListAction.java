package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(checkLogin(request)) {
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			int grade = loginuser.getGrade();
			if(grade == 1) {
				
				String userid= request.getParameter("userid");
				// 주문목록 가져오는 로직 실행하기
				super.setViewPage("/WEB-INF/views/admin/member/orderList.jsp");
			} else {		
				request.setAttribute("message", "관리자 전용 페이지입니다.");
				request.setAttribute("loc", "/");				
				setViewPage("/WEB-INF/msg.jsp");
				return;
			}
			
		} else {
			
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "/");
			setViewPage("/WEB-INF/msg.jsp");
			return;
		}
	}

}
