<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지-게시물 관리</title>


<style type="text/css">
		
		/* 게시판 정렬 , 글자색, 글자크기*/
		table td {
			text-align: center;
			color:#616161;
			font-size: 15px;
		}
		
		table > tbody > tr > td:nth-child(1){
			width: 6%;
		}
		
		table > tbody > tr > td:nth-child(3){
			width: 10%;
		}
		
		table > tbody > tr > td:nth-child(4){
			width: 10%;
		}
		
		table > tbody > tr > td:nth-child(5){
			width: 10%;
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
	
	<%-- 검색하기 --%>
	<div class="pt-4 pb-5">
	
	  <div class="card">
	    <div class="card-body ">
	      
	    <select class="" style="font-size: 11pt;">
		    	<option value="">제목+내용</option>
		    	<option value="">제목</option>
		    	<option value="">내용</option>
		    	<option value="">작성자</option>
		</select>
		
		&nbsp;
		
		 <tr>
	         <td>
	           <input type="text" id=""  style="height: 25px; width: 105px; font-size: 11pt;">
	         </td>
        </tr>
		&ensp;
		<button type="button" onclick="" style="border: solid 1px gray; border-radius: 5px; font-size: 10pt; padding: 3px 8px;">검색</button>
		
	    </div>
	  </div>
	
	</div>

	
	<%-- 게시물 --%>
		<table class="table">
		  
		    <tr style="background-color: #f9f9f9;">
		      <td>No</td>
		      <td>제목</td>
		      <td>작성일</td>
		      <td>작성자</td>
		      <td>조회수</td>
		    </tr>
		  
		  <tbody>
		    <tr>
		      <td>1</td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		     
		    </tr>
		    <tr>
		      <td>2</td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      
		    </tr>
		    <tr>
		      <td>3</td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		    </tr>
		  </tbody>
		</table>
		
		<br>
		
		
	<%-- 페이지네이션 --%>	
	<nav>
	  <ul class="pagination" >
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