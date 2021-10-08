<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/mypage/navbar.jsp"/>

<link rel="stylesheet" type="text/css" href="/css/mypage/mypageStyle.css" />
<title>마이페이지 - 배송 주소록 관리</title>
<style>
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
div.ec-base-help {		    
	margin-bottom : 10px;
    border: 1px solid #d6d4d4;
    line-height: 18px;
}	
</style>   
<div class="container p-5" >	
	<p style="margin-bottom:8px; font-weight: bold; color: black; text-align: center; font-size: 16pt;">&nbsp;* 배송 주소록 관리</p>
	<div class="ec-base-help">
	    <h3 style="padding: 9px 0 6px 10px; font-size:12px;">배송주소록 유의사항</h3>
	    <div class="inner" style="font-size : 9px;">
	        <ol><li>배송 주소록은 최대 10개까지 등록할 수 있습니다.</li>
	            <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
	        </ol>
	    </div>
	</div>
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
		 	 <c:if test="${empty requestScope.addrList}"><tr><td colspan="7">등록된 배송지가 없습니다.</td></tr></c:if>
		  	<c:forEach var="addrList" items="${requestScope.addrList}">
			  	<tr>
			      <td><input type='checkbox' id="selectAddr" name="selectAddr" value="${addrList.ano}"/></td>
			      <td>${addrList.delivername}&nbsp;<span style="font-size:10px;"><c:if test="${addrList.default_yn eq 'y'}">*</c:if></span></td>
			      <td>${addrList.name}</td>
			      <td>
			      	<c:if test="${addrList.hometel != 'null'}">${addrList.hometel}</c:if>
			      </td>
			      <td>${addrList.mobile}</td>
			      <td>${addrList.address}&nbsp;${addrList.detailaddress}&nbsp;${addrList.extraaddress}</td>
			      <td><button type="button" onclick="location.href = '/mypage/deliverModify.go?ano=${addrList.ano}' " class="btn btn-light" style="font-size: 9pt; padding: 3px 8px;">수정</button></td>	      
			    </tr>
		  	</c:forEach>		  
		  </tbody>
		</table>		
		<div>
			<div class="form-row float-left">
	      		<button type="button" onclick = "deleteAddr();" class="btn btn-light" style="font-size: 11pt;">선택 주소록 삭제</button>
	  		</div>			
			<div class="form-row float-right">
	      		<button type="button" id="btnRegister" class="btn btn-dark" style="font-size: 11pt;">배송지 등록</button>
	  		</div>
  		</div>
</div>
<script>
$("#btnRegister").click(function(){
	var addressCnt = ${requestScope.addressCnt};
	if(addressCnt >= 10){
		alert('배송지는 최대 10개까지 등록할 수 있습니다.');
		return;
	} else {
		location.href = '/mypage/deliverRegister.go';
	}
});

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('select');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

// 배송지 삭제
function deleteAddr(){	
	var checkBoxArr = [];
	$("input[name=selectAddr]:checked").each(function(){
		checkBoxArr.push($(this).val());
	});
	
	if($("input[name=selectAddr]:checked").length == 0){
		alert('최소 1개는 삭제할 배송지를 선택하셔야 합니다.');
		return;
	}
	
	var frm = document.createElement('form');
	frm.method = "post";
	frm.action = "/mypage/deliverDelete.go?checkBoxArr=" +checkBoxArr;
	
	
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','checkBoxArr');
	hiddenInput.setAttribute('value', checkBoxArr);
	frm.appendChild(hiddenInput);
	
	document.body.appendChild(frm);
	frm.submit();
}
</script>				 
<jsp:include page="/WEB-INF/include/footer.jsp"/>