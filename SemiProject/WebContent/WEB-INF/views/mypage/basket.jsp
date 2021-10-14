<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/mypage/navbar.jsp"/>

<title>마이페이지 - 장바구니</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/mypageStyle.css" />
<style>
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
.spinner {
	width: 30px;
	height: 18px;
}
.pmButton {
	font-size:8px; 
	padding:2px 2px;
}    	
</style>
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
		      <td>합계</td>
		      <td>선택</td>
		    </tr>	 
		  <tbody>
		  	<c:forEach var="basketList" items="${requestScope.basketList}">
			  	<tr>
			      <td><input type='checkbox' name='select' value="${basketList.bno}"/></td>
			      <td><a href="#"><img src="${basketList.url}"/></a></td>
			      <td>${basketList.info}</td>
			      <td>
			      	<input type="hidden" name="price" id="price1" class="price" value="${basketList.price}">${basketList.price}원
			      </td>
			      <td>
			       	
	  				<input type="text" class="spinner" id="spinner" name="count" class="count" maxlength='2' value=3 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	  				<input type='button' class="pmButton" value='+' /> 
	  				<input type='button' class="pmButton" value='-' />
	  				<div class="btnArea b_center" style="margin:5px auto;">
	  					<input type='button' class="changeCount" value='변경' />
	    			</div>
				  </td>
			      <td></td>
			      <td>합계</td>
			      <td>
			      <button  type="button" class="btn btn-dark" style="font-size: 9pt; padding: 3px 8px;">주문하기</button>
			      <button  type="button" class="btn btn-default" style="font-size: 9pt; padding: 3px 8px;">삭제</button>
			      </td>		      
			    </tr>
		  	</c:forEach>
		    <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td>상품이미지</td>
		      <td>상품정보</td>
		      <td><input type="hidden" name="price" id="price1" class="price" value="20000">20000원</td>
		      <td>
		       	<label for="spinner"></label>
  				<input type="text" class="spinner" id="spinner" name="count" class="count" maxlength='2' value=3 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
  				<input type='button' class="pmButton" value='+' /> 
  				<input type='button' class="pmButton" value='-' />
  				<div class="btnArea b_center" style="margin:5px auto;">
  					<input type='button' class="changeCount" value='변경' />
    			</div>
			  </td>
		      <td>적립금</td>
		      <td>합계</td>
		      <td>
		      <button  type="button" onclick=" " class="btn btn-dark" style="font-size: 9pt; padding: 3px 8px;">주문하기</button>
		      <button  type="button" onclick=" " class="btn btn-default" style="font-size: 9pt; padding: 3px 8px;">삭제</button>
		      </td>		      
		    </tr>		   
		   <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td>상품이미지</td>
		      <td>상품정보</td>
		      <td><input type="hidden" name="price" id="price2" class="price" value="13500">13500원</td>
		      <td>
		       	
  				<input type="text" class="spinner" id="spinner2" name="count" maxlength='2' value=1 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
  				<input type='button' class="pmButton" onclick="" value='+' /> 
  				<input type='button' class="pmButton" onclick="" value='-' />
  				<div class="btnArea b_center" style="margin:5px auto;">
  					<input type='button' class="changeCount" value='변경' />
    			</div>
			  </td>
		      <td>적립금</td>
		      <td>합계</td>
		      <td>
		      <button  type="button" onclick="" class="btn btn-dark" style="font-size: 9pt; padding: 3px 8px;">주문하기</button>
		      <button  type="button" onclick=")" class="btn btn-default" style="font-size: 9pt; padding: 3px 8px;">삭제</button>
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
		      <td><span id="totalPrice"></span>원</td>
		      <td>+&nbsp;<span id="dliverFee"></span>원</td>
		      <td><span id="totalAmount" name=""></span>원</td>
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

<script type="text/javascript">
$(document).ready(function() {
	 
 // 총 결제금액 불러오기
 calTotal();

});

function calTotal(){
	
	var totalPrice = 0; 
	var countArr = $('input[name=count]');
	
	$(".price").each(function (index, item){
		
		var count = countArr[index].value;
		totalPrice = totalPrice + Number($(this).val()) * count;
		
	});
	
	$("#totalPrice").text(totalPrice);
	// 배송비(변수) 5만원 이상 무료 request로 배송비를 받아온다
	var fee = 0;
	if(totalPrice >= 50000){
		fee = 0;
		$("#dliverFee").text(fee);
	} else {
		fee = 3500;
		$("#dliverFee").text(fee);
	}
	$("#totalAmount").text(totalPrice + fee);
	
}
// 전체 체크
function selectAll(selectAll)  {
	 
	const checkboxes = document.getElementsByName('select');
	 
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}

// +,- 버튼 클릭시 spinner(수량)의 아이디값 가져오기.
$(".pmButton").click(function(){
	
	var prev = $(this).prev();
	var type = "plus";
	
	if(prev[0].name != "count"){
		prev = $(this).prev().prev();
		type = "minus";
	}
	var id = prev[0].id;
	count(type, id);
});
// +,- 버튼으로 수량 변경시 결제금액 변경
function count(type, inputId)  {
	  	     
	  var id = inputId;
	  var spinner = document.getElementById(id);
	  let number = spinner.value;
	    
	  // 더하기/빼기	  
	  if(type === 'plus') {
		  
		  // 재고 만큼
		  if(number >= 10){
			  return;
		  }
	      number = parseInt(number) + 1;
	      
	  }else if(type === 'minus')  {
		  
		  if(number == 1){
			  return;
		  }
	      number = parseInt(number) - 1;
	  }
	  
	  if(Number.isNaN(number)){
    	  number = 1;
      }
	  spinner.value = number;
	  
	  calTotal();
}
// 변경 버튼 누를 경우 결제금액 다시 계산
$(".changeCount").click(function(){
	calTotal();
});
</script>
<jsp:include page="/WEB-INF/include/footer.jsp"/>