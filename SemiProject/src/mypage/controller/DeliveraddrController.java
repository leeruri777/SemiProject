package mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.AddressVO;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class DeliveraddrController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		if(loginuser != null) {		
			
			String userid = loginuser.getUserid();
			
			List<AddressVO> addrList = new ArrayList<>();	
			InterMemberDAO mdao = new MemberDAO();
			
			addrList = mdao.getAddressList(userid);
			int addressCnt = mdao.getAddressCnt(userid);
			
			request.setAttribute("addrList", addrList);
			request.setAttribute("addressCnt", addressCnt);
			
			super.setViewPage("/WEB-INF/views/mypage/deliveraddr.jsp");
		} else {		
			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("loc", "/member/login.go");
			super.setViewPage("/WEB-INF/msg.jsp");
			return;
		}	
	}

}
