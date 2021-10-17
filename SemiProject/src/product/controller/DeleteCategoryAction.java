package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class DeleteCategoryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String sort_code = request.getParameter("sort_code");
		
		Map<String, String> sortMap = new HashMap<>();
		
		sortMap.put("sort_code", sort_code);
		
		System.out.println(sort_code);
			
		InterProductDAO_JDH pdao = new ProductDAO_JDH();
		
		int result = pdao.deleteCategory(sortMap);
		
		if(result == 0) {
			request.setAttribute("message", "삭제에 실패하였습니다.");
			request.setAttribute("loc", "/product/prodManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
		if(result == 1) {
			request.setAttribute("message", "삭제에 성공하였습니다.");
			request.setAttribute("loc", "/product/prodManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
