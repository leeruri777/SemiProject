package display.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import display.model.DisplayDAO;
import display.model.InterDisplayDAO;
import display.model.MainLogoVO;
import member.model.MemberVO;

public class LogoRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			
			if(super.checkLogin(request)) {
				
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				int grade = loginuser.getGrade();
				if(grade == 1) {
					
					InterDisplayDAO ddao = new DisplayDAO();
					List<MainLogoVO> logoList = ddao.getLogoList();
					
					request.setAttribute("logoList", logoList);
					super.setViewPage("/WEB-INF/views/admin/logoRegister.jsp");
					
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
			
		} else { // POST 전송일 때
			
			
		}
	}

}
