package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class OrderSetleEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prod_name_join = request.getParameter("prod_name");
		String price_join = request.getParameter("price");
		String goods_qy_join = request.getParameter("goods_qy");
		
		String user_name = request.getParameter("user_name");
		
		String[] prod_name_Arr = prod_name_join.split(",");
		String[] price_Arr = price_join.split(",");
		String[] goods_qy_Arr = goods_qy_join.split(",");
		
		for(int i=0; i<prod_name_Arr.length; i++) {
			System.out.println("~~~~ 확인용 prod_name : " + prod_name_Arr[i] + ", price : " + price_Arr[i] + ", goods_qy : " + goods_qy_Arr[i]);   
		}
		
		System.out.println("~~~~ 확인용 user_name : " + user_name);
		
	}

}
