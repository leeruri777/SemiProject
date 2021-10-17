package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.*;

public class PlusProductAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prod_code = request.getParameter("prod_code_plus");
		String status = request.getParameter("status_plus");
		String inout_qty = request.getParameter("plusqty");
		
		Map<String, String> pmMap = new HashMap<>();
		
		pmMap.put("prod_code", prod_code);
		pmMap.put("status", status);
		pmMap.put("inout_qty", inout_qty);
		
		//System.out.println(prod_code);
		//System.out.println(status);
		//System.out.println(inout_qty);
		
		InterProductDAO_JDH pdao = new ProductDAO_JDH();
		
		
		int result = pdao.PlusProduct(pmMap);
		
		if(result == 0) {
			request.setAttribute("message", "입고에 실패하였습니다.");
			request.setAttribute("loc", "/product/prodManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
		if(result == 1) {
			request.setAttribute("message", "입고에 성공하였습니다.");
			request.setAttribute("loc", "/product/prodManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
