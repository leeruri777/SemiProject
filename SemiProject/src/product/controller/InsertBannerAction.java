package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class InsertBannerAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String sort_code = request.getParameter("sort_code_plus");
		
		String ad_img_url = request.getParameter("ad_img");
		
		Map<String, String> paraMap = new HashMap<>();
		
		paraMap.put("sort_code", sort_code);
		paraMap.put("ad_img_url", ad_img_url);
		
		InterProductDAO_KJH pdao = new ProductDAO_KJH();
		
		int result = pdao.insertBanner(paraMap);
		
		if(result == 0) {
			request.setAttribute("message", "배너등록에 실패하였습니다. 다시 진행해주세요.");
			request.setAttribute("loc", "/product/adManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
		else {
			request.setAttribute("message", "배너등록이 완료되었습니다.");
			request.setAttribute("loc", "/product/adManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
