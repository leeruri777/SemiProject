package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends AbstractController {

	/*
	@Override
	public String toString() {  //toString() 재정의이다.
		return "@@@ 클래스 MainControlle 의 인스턴스 메소드 toString() 호출됨 @@@";
	}
	*/
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("### MainController 클래스의 execute() 메소드 호출됨 ###");
		super.setRedirect(true);//true이니 아래 적은 페이지로 이동하라는 것
		super.setViewPage("index.go");  //index.go 페이지로 이동한다
	}
	
	
	
}
