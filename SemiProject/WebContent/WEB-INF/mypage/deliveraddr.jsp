<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지 - 배송 주소록 관리</title>



	
	

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
		<table class="table addtable">
		
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