package product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import product.model.InterProductDAO_JDH;
import product.model.ProductDAO_JDH;

public class MinusProductAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prod_code = request.getParameter("prod_code_minus");
		String status = request.getParameter("status_minus");
		String inout_qty = request.getParameter("minusqty");
		String inout_exp = request.getParameter("plus_minus_exp");
		
		System.out.println(prod_code);
		System.out.println(status);
		System.out.println(inout_qty);
		System.out.println(inout_exp);
		
		Map<String, String> mmMap = new HashMap<>();
		
		mmMap.put("prod_code", prod_code);
		mmMap.put("status", status);
		mmMap.put("inout_qty", inout_qty);
		mmMap.put("inout_exp", inout_exp);
		
		InterProductDAO_JDH pdao = new ProductDAO_JDH();
		
		int result = pdao.MinusProduct(mmMap);
		
		if(result == 0) {
			request.setAttribute("message", "폐기에 실패하였습니다.");
			request.setAttribute("loc", "/product/prodManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
		if(result == 1) {
			request.setAttribute("message", "폐기에 성공하였습니다.");
			request.setAttribute("loc", "/product/prodManage.go");
			setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
