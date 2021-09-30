package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class UpdateMemberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		String userid = request.getParameter("userid");
		
		if(method.equalsIgnoreCase("GET")) {
			
			if(super.checkLogin(request)) {
				
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				
				if(userid.equalsIgnoreCase(loginuser.getUserid())) {
					
					super.setViewPage("/common/checkPw.go");
					
				} else {
					
					request.setAttribute("message","다른 사용자의 정보변경은 불가합니다.");
					request.setAttribute("loc", "/");			
					super.setViewPage("/WEB-INF/msg.jsp");
				}

			} else {
				request.setAttribute("message", "로그인이 필요합니다.");
				request.setAttribute("loc", "/member/login.go");
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			super.setViewPage("/WEB-INF/views/member/updateMemberForm.jsp");
			
		} else {
			
//			InterMemberDAO mdao = new MemberDAO();
//			
//			String name = request.getParameter("name"); 
//	        String userid = request.getParameter("userid"); 
//	         String pwd = request.getParameter("pwd"); 
//	         String email = request.getParameter("email"); 
//	         String hp1 = request.getParameter("hp1"); 
//	         String hp2 = request.getParameter("hp2"); 
//	         String hp3 = request.getParameter("hp3");
//	         String mobile = hp1+hp2+hp3;
//	         String postcode = request.getParameter("postcode");
//	         String address = request.getParameter("address"); 
//	         String detailAddress = request.getParameter("detailAddress"); 
//	         String extraAddress = request.getParameter("extraAddress"); 
//	         
//	         MemberVO member = new MemberVO(userid, pwd, name, email, mobile, postcode, address, detailAddress, extraAddress);
//			int n = mdao.updateMember(member);
//			loc = "javascript:history.back()";
//			
//			if(n == 1) {
//						
//				HttpSession session = request.getSession();
//				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
//				
//				loginuser.setName(name);
//				loginuser.setPwd(pwd);
//				loginuser.setEmail(email);
//				loginuser.setMobile(mobile);
//				loginuser.setPostcode(postcode);
//				loginuser.setAddress(address);
//				loginuser.setDetailaddress(detailAddress);
//				loginuser.setExtraaddress(extraAddress);
//
//				message = "회원정보 수정 성공!!";
//				loc = "/";
//				
//			} else {
//				message = "회원정보 수정 실패ㅜㅜ";
//			}
//			
//			request.setAttribute("message", message);
//			request.setAttribute("loc", loc);			
//			super.setViewPage("/WEB-INF/msgPop.jsp");
		}
	
	}

}
