<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지 - 주문내역조회</title>


	
	

<script type="text/javascript">


	$(document).ready(function() {
		  
	
     
	});// end of $(document).ready(function()})-----------------------------------------
	
	
	
	  $(function() {
          //모든 datepicker에 대한 공통 옵션 설정
          $.datepicker.setDefaults({
              dateFormat: 'yy-mm-dd' //Input Display Format 변경
              ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
              ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
              ,changeYear: true //콤보박스에서 년 선택 가능
              ,changeMonth: true //콤보박스에서 월 선택 가능                
           // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
           // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
              ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
              ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
              ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
              ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
              ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
           // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
          });

          //input을 datepicker로 선언
          $("input#fromDate").datepicker();                    
          $("input#toDate").datepicker();
          
          //From의 초기값을 오늘 날짜로 설정
          $('input#fromDate').datepicker('setDate', '-2M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
          
          //To의 초기값을 3일후로 설정
          $('input#toDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
      });
	



</script>
    
    
    
    
    


<%-- ////내용 시작//// --%>	
<div class="container p-5" >	
	
	<%-- 탭 --%>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active text-secondary" href="/orderlist.go">주문내역조회</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link text-secondary" href="/cancellist.go">취소/반품/교환 내역</a>
	  </li>
	</ul>

		
	<div class="pt-4 pb-5">
	
	  <div class="card">
	    <div class="card-body">
	      
	      <select style="font-size: 11pt;">
		    	<option value="orderstatus">전체 주문처리상태</option>
		        <option value="beforedeposit">입금전</option>
		        <option value="readydelivery">배송준비중</option>
		        <option value="beingdelivered">배송중</option>
		        <option value="deliverycompleted">배송완료</option>
		        <option value="cancel">취소</option>
		        <option value="exchange">교환</option>
		        <option value="return">반품</option>
		</select>
		
		&emsp;&nbsp;
		
		<%-- 날짜로 조회하기 --%>
		 <tr>
	         <td>
	           <input type="text" id="fromDate"  style="height: 25px; width: 105px; font-size: 11pt;">&ensp;
	           <input type="text" id="toDate"  style="height: 25px; width: 105px; font-size: 11pt;">
	         </td>
        </tr>
		&ensp;
		<button type="button" onclick="" style="border: solid 1px gray; border-radius: 5px; font-size: 10pt; padding: 3px 8px;">조회</button>
		
	    </div>
	  </div>
	
	</div>

	<p style="font-weight: bold; color: #666666;">주문 상품 정보</p>
	<%-- 주문 상품 정보 표 --%>
		<table class="table">
		  
		    <tr style="background-color: #f9f9f9;">
		      <td>주문일자[주문번호]</td>
		      <td>이미지</td>
		      <td>상품정보</td>
		      <td>수량</td>
		      <td>상품구매금액</td>
		      <td>주문처리상태</td>
		    </tr>
		  
		  <tbody>
		    <tr>
		      <td>1</td>
		      <td></td>
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
		      <td></td>
		      
		    </tr>
		    <tr>
		      <td>3</td>
		      <td></td>
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