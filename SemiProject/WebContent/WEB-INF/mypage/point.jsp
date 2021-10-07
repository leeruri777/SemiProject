<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지-적립금</title>

<style type="text/css">
	/* 주문상품정보 표 가운데 정렬 , 글자색, 글자크기*/
		table td {
			text-align: center;
			color:#616161;
			font-size: 15px;
		}
		
		
		
		
	/* 페이지네이션 */
		.pagination {
		   justify-content: center;
		}
		
		body > div.container.p-5 > nav > ul > li > a{
			color:#616161;
			font-size: 13px;
			padding-bottom: 10px;
		}
		
		body > div.container.p-5 > nav > ul > li > a > span {
			color:#616161;
			font-size: 11px;
		}


</style>


<script type="text/javascript">


	$(document).ready(function() {
		  
	
     
	});// end of $(document).ready(function()})-----------------------------------------
	
	
</script>	


<%-- ////내용 시작//// --%>	
<div class="container p-5" >	
	
	
	<p style="margin-bottom:8px; font-weight: bold; color: black; text-align: center; font-size: 14pt;">적립금</p>
	<p class="text-secondary" style="margin-bottom:25px; text-align: center; font-size: 9pt;">고객님의 사용가능 적립금 금액 입니다.</p>
	
	
	<div class="pt-2 pb-5">
	
	  <div class="card">
	    <div class="card-body" style="text-align: center; font-weight: bold; color: black; font-size: 21pt;">
	     	&nbsp; 총 적립금 <span> 0P </span> 
	    </div>
	  </div>
	
	</div>
	
	
	
	<%-- 적립금  표 --%>
		<table class="table">
		
		    <tr style="background-color: #f9f9f9;">
		      <td>주문날짜</td>
		      <td>적립금</td>
		      <td>내용</td>
		    </tr>
		 
		  <tbody>
		    <tr>
		      <td>2021-09-27</td>
		      <td>200P</td>
		      <td>구매감사 적립금</td>
		     
		    </tr>
		    <tr>
		      <td>2021-09-28</td>
		      <td>-200P</td>
		      <td>구매취소</td>
		      
		    </tr>
		  
		  </tbody>
		</table>
	
	
	
	<%-- 페이지네이션 --%>	
	<nav>
	  <ul class="pagination pt-5" >
	    <li class="page-item"><a class="page-link" href="#"><span aria-hidden="true"> << </span></a></li>
	    <li class="page-item"><a class="page-link" href="#"><span aria-hidden="true"> < </span></a></li>
	    	<li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#"><span aria-hidden="true"> > </span></a></li>
	    <li class="page-item"><a class="page-link" href="#"><span aria-hidden="true"> >> </span></a></li>
	  </ul>
	</nav>
	
	
	

</div>
<%-- ////내용 끝//// --%>
</body>
</html>