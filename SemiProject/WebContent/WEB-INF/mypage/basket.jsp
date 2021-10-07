<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지 - 장바구니</title>



	
<style type="text/css">
	
		/* btable표, mtable표 가운데 정렬 , 글자색, 글자크기*/
		table.table.btable td {
			text-align: center;
			
		}
		
		table.table.mtable td {
			text-align: center;
			color: black;
			font-size: 22px;
			font-weight: bold;
		}
		
		
		 
		/* btable표 체크박스 칸 가로넓이 줄이기*/
		table.table.btable > tbody > tr > td:nth-child(1){
			width: 4%;
		}
		
		
		/* 하단 부트스트랩 하단 부트스트랩 버튼 (선택주소록 삭제, 배송지등록)색 변경    */
		.btn-light {
		    background-color: #EEEEEE;
		    border-color: #cccccc;
		    color: #616161; }
		.btn-light:hover,
		.btn-light:focus {
		    border-color: #cccccc;
		    background-color: #cccccc;
		    color: #FFF; }
		.btn-light:active,
		.btn-light:visited,
		.btn-light:active:focus,
		.btn-light:active:hover {
		    border-color: #cccccc;
		    background-color: #cccccc;
		    color: #FFF; }
		    
		    
		    .btn-dark {
		    background-color: #555555;
		    border-color: #555555;
		    color: #black; }
		.btn-dark:hover,
		.btn-dark:focus {
		    border-color: #cccccc;
		    background-color: #cccccc;
		    color: #FFF; }
		.btn-dark:active,
		.btn-dark:visited,
		.btn-dark:active:focus,
		.btn-dark:active:hover {
		    border-color: #cccccc;
		    background-color: #cccccc;
		    color: #FFF; }
			
		
		 .btn-default {
		   
		    border-color: #cccccc;
		    color: #black; }
		.btn-default:hover,
		.btn-default:focus {
		    border-color: #cccccc;
		    background-color: #cccccc;
		    color: #FFF; }
		.btn-default:active,
		.btn-default:visited,
		.btn-default:active:focus,
		.btn-default:active:hover {
		    border-color: #cccccc;
		    background-color: #cccccc;
		    color: #FFF; }
		    
		    
		#spinner {
			width: 30px;
			height: 18px;
		}    
		
</style>
	
	

<script type="text/javascript">


	$(document).ready(function() {
		
		/* 제이쿼리 Ui spinner    https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=skawo32167&logNo=220496628988 참조*/
		$('#spinner').spinner({
			
			min:0,
			max:300,
			step:1
			
		});
     
	});// end of $(document).ready(function()})-----------------------------------------
	
	
	
	
	
	
	
	


</script>
    
    
    

<%-- ////내용 시작//// --%>	
<div class="container p-5" >	
	
		
	<p style="margin-bottom:8px; font-weight: bold; color: black; text-align: center; font-size: 14pt;">장바구니</p>
	<br>
	<%-- 장바구니 표 --%>
		<table class="table btable">
		
		    <tr style="background-color: #f9f9f9;">
		      <td><input type='checkbox'name='select'value='selectall'onclick='selectAll(this)'/></td>
		      <td>이미지</td>
		      <td>상품정보</td>
		      <td>판매가</td>
		      <td>수량</td>
		      <td>적립금</td>
		      <td>배송비</td>
		      <td>합계</td>
		      <td>선택</td>
		    </tr>
		 
		  <tbody>
		    <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td>상품이미지</td>
		      <td></td>
		      <td>20000원</td>
		      <td>
		       	<label for="spinner"></label>
  				<input type="text" id="spinner" name="value" value=1>
		      </td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td >
		      <button  type="button" onclick=" " class="btn btn-dark" style="font-size: 9pt; padding: 3px 8px;">주문하기</button>
		      <button  type="button" onclick=" " class="btn btn-default" style="font-size: 9pt; padding: 3px 8px;">삭제</button>
		      </td>
		      
		    </tr>
		   
		   <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td>
		      	<button  type="button" onclick=" " class="btn btn-dark" style="font-size: 9pt; padding: 3px 8px;">주문하기</button>
		      	<button  type="button" onclick=" " class="btn btn-default" style="font-size: 9pt; padding: 3px 8px;">삭제</button>
		      </td>
		      
		    </tr>
		   
		  </tbody>
		</table>
		
		<br>
		<br>
		<br>
		
		<table class="table mtable">
		
		    <tr style="background-color: #f9f9f9;" >
		      <td>총 상품금액</td>
		      <td>총 배송비</td>
		      <td>결제예정금액</td>
		    </tr>
		 
		  <tbody>
		    <tr>
		      <td>20,000원</td>
		      <td>+ 3500원</td>
		      <td>= 23,500원</td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		    </tr>
		  </tbody>
		</table>
		
		
	<%-- 	col-sm-3 text-center --%>
		
		<div  class="text-center">
      		<button type="button"  onclick = "location.href = '' " class="btn btn-dark" style="font-size: 12pt;">전체상품주문</button>&nbsp;
  			<button type="button" onclick = "" class="btn btn-light" style="font-size: 12pt;">선택상품주문</button>&nbsp;
  			<button type="button" onclick = "" class="btn btn-default" style="font-size: 12pt;">쇼핑계속하기</button>
  		</div>

</div>
<%-- ////내용 끝//// --%>
				 
</body>
</html>