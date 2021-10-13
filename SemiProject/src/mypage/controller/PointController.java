package mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.*;

public class PointController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null) {		
		
			String userid = loginuser.getUserid();
			InterMemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.memberTotalPoint(userid); // userid 값을 입력받아서 회원1명에 대한 총적립금 알아오기(select)
			
			
			request.setAttribute("mvo", mvo);
			
			
		// super.setRedirect(false);
		super.setViewPage("/WEB-INF/views/mypage/point.jsp");
		
		
		
		} else {		
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "/member/login.go");
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}	
		
	}

}
