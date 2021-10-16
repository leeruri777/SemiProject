<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript">

//결제페이지는 이런식일까 하고 적은건데 잘못한 부분이 있을 수도 있어요.

   
	$(document).ready(function() {
		
		
	});//end of $(document).ready(function(){}---------------------------
			
	//  Function Declaration
	
	
	
	// === 아임포트 결제를 해주는 함수 === //
	function goPurchaseEnd (totalAmount) {//코인구매끝 // coinPurchaseTypeChoice.jsp 결제금액 선택 뷰단에서 부모창에 넘겨준 coinmoney를 파라미터로 받는다.
		
	//	alert("확인용 부모창의 함수 호출함." +totalAmount+" 원 결제함")
		
		var userid = "${sessionScope.loginuser.userid}"; 
		
	//	alert("확인용 결제할 사용자 아이디 : " + userid);
		
	
	//  아임포트 결제 팝업창 띄우기  // PurchaseEnd.go = PurchaseEndAction가 액션클래스이고  뷰는 아임포트사에서 준 paymentGateway.jsp 이다. 
      	var url = "<%= request.getContextPath()%>/member/PurchaseEnd.go?userid="+userid+"&totalAmount="+totalAmount;  
      
      	window.open(url, "PurchaseEnd",
               		 "left=350px, top=100px, width=1000px, height=600px");
		
	} // end of function goCoinPurchaseEnd ()------------------
	
	

	
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	// === DB 상의 ORDER_SETLE 테이블에 해당 사용자의 주문내역을 insert 시켜주고, TBL_MEMBER 테이블에서 구매한만큼 적립금을 증가시켜주는  함수 === 
	
	function orderSetle() {
		
		var frm = document.orderSetleFrm;
		frm.action = "orderSetle.go"; //결제하는 페이지(결제테이블담기 액션)
		frm.method = "post";
		frm.submit();
		
	}// end of function orderRegister() {}--------------------------------
	

	
</script>

<%-- *** 예시 *** --%>

               
 [<a href="javascript:goPurchaseEnd('${totalAmount}');">결제하기</a>] <%-- *** KG이니시스 결제페이지로 가는 함수. 함수에 총결제금액을 넣음 *** --%> 
 
                
<%-- *** 결제 후 주문내역을 insert, 적립금 update 시켜주기 위한 폼 *** --%>
<form name="orderSetleFrm">
   
</form>




