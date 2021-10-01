package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;

public abstract class AbstractController implements InterCommand{

	private boolean isRedirect = false;
	// isRedirect가 false면 foward로 이동시키고, true면 response.sendRedirect로 이동시키겠다.
	
	private String viewPage; // 반환할 페이지

	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getViewPage() {
		return viewPage;
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	public boolean checkLogin(HttpServletRequest request) {
		boolean check = false;
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		if(loginuser != null) check = true;
		
		return check;
	}
}
