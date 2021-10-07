<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지 - 배송 주소록 관리</title>


<style type="text/css">
	
		/* 표 가운데 정렬 , 글자색, 글자크기*/
		table td {
			text-align: center;
			color:#616161;
			font-size: 15px;
		}
		
		/* 표 체크박스 칸 가로넓이 줄이기*/
		table td:nth-child(1) {
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
			
	
</style>
	
	

<script type="text/javascript">


	$(document).ready(function() {
		  
	
     
	});// end of $(document).ready(function()})-----------------------------------------
	
	
	
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('select');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}



</script>
    
    
    
    


<%-- ////내용 시작//// --%>	
<div class="container p-5" >	
	
		
	

	<p style="margin-bottom:8px; font-weight: bold; color: black; text-align: center; font-size: 14pt;">배송 주소록 관리</p>
	<p class="text-secondary" style="margin-bottom:25px; text-align: center; font-size: 9pt;">자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
	<%-- 배송 주소록 관리 표 --%>
		<table class="table">
		
		    <tr style="background-color: #f9f9f9;">
		      <td><input type='checkbox'name='select'value='selectall'onclick='selectAll(this)'/></td>
		      <td>배송지명</td>
		      <td>수령인</td>
		      <td>일반전화</td>
		      <td>휴대전화</td>
		      <td>주소</td>
		      <td>수정</td>
		    </tr>
		 
		  <tbody>
		    <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td><button type="button" onclick="location.href = '/deliverModify.go' " class="btn btn-light" style="font-size: 9pt; padding: 3px 8px;">수정</button></td>
		      
		    </tr>
		    <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td><button type="button" onclick="location.href = '/deliverModify.go' " class="btn btn-light" style="font-size: 9pt; padding: 3px 8px;">수정</button></td>
		    </tr>
		  
		  </tbody>
		</table>
		
		
		
		<div class="form-row float-left">
      		<button type="button" onclick = "" class="btn btn-light" style="font-size: 11pt;">선택 주소록 삭제</button>
  		</div>

		
		<div class="form-row float-right">
      		<button type="button"  onclick = "location.href = '/deliverRegister.go' " class="btn btn-dark" style="font-size: 11pt;">배송지 등록</button>
  		</div>

</div>
	
	<%-- ////내용 끝//// --%>
				 
</body>
</html>