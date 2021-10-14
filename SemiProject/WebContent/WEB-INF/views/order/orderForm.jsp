<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/mypage/navbar.jsp"/>

<link rel="stylesheet" type="text/css" href="/css/mypage/mypageStyle.css" />
<title>마이페이지 - 배송지 등록</title>
<style type="text/css">
/* 표 가운데 정렬 , 글자색, 글자크기*/
table td {
	text-align: left;
	color:#616161;
	font-size: 15px;
}

/* 표 첫번째열 가로넓이, 색, 정렬 등 */
table td:nth-child(1) {
	width:15%;
	background-color: #f9f9f9;
	text-align: left;
	font-weight: bold;
	font-size: 10pt;
	padding-left: 3%;
}
		
/* 폼 입력칸 */
  .form-control {
  		height: 25px;
  		border-radius: 0;
  		font-size : 13px;
  }
  
  /* 전화번호select */
  .selectpicker {
  		width: 57px;
  		height: 25px;
  		border-color: gray;
  }
 ::placeholder {
  color: black;
  font-size: 0.8em;
  font-weight: 200;
  opacity: 1; /* Firefox */
} 
  input {
  margin-left: 3px;
  }
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
.payTable td:nth-child(3) {
	width:15%;
	background-color: #f9f9f9;
	text-align: left;
	font-weight: bold;
	font-size: 10pt;
	padding-left: 3%;
}   
</style>
<div style="width:100%; height:10px; text-align:center; padding-top:10px;"></div>
<%-- ////내용 시작//// --%>	
<div class="container p-5">	
	<p style="margin-bottom:8px; font-weight: bold; color: black; text-align: center; font-size: 14pt;">주문서 작성</p>
	<p class="text-secondary" style="margin-bottom:25px; text-align: center; font-size: 9pt;">*상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</p>
	
	<%-- 장바구니 표 --%>
		<table class="table btable">	
		    <tr style="background-color: #f9f9f9;">
		      <td><input type='checkbox'name='select'value='selectall'onclick='selectAll(this)'/></td>
		      <td>이미지</td>
		      <td>상품정보</td>
		      <td>판매가</td>
		      <td>수량</td>
		      <td>적립금</td>
		      <td>선택</td>
		      <td>합계</td>
		    </tr>	 
		  <tbody>		  	
		    <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td>상품이미지</td>
		      <td>상품정보</td>
		      <td><input type="hidden" name="price" id="price1" class="price" value="20000"><fmt:formatNumber value="20000" pattern="#,###"/>원</td>
		      <td>	      
  				<input type="text" class="spinner" id="spinner" name="count" class="count" maxlength='2' value=3 style="border:0 solid black;" readonly/> 				
			  </td>
		      <td>적립금</td>
		      <td>[조건]</td>
		      <td><span id="totalAmount">원</span></td>		      
		    </tr>		   
		   <tr>
		      <td><input type='checkbox'name='select'value='select'/></td>
		      <td>상품이미지</td>
		      <td>상품정보</td>
		      <td><input type="hidden" name="price" id="price2" class="price" value="13500"><fmt:formatNumber value="13500" pattern="#,###"/>원</td>
		      <td>		       	
  				<input type="text" class="spinner" id="spinner2" name="count" maxlength='2' value=1 style="border:0 solid black;" readonly/>
			  </td>
		      <td>적립금</td>
		      <td>[조건]</td>
		      <td><span id="totalAmount"></span></td>		      
		    </tr>
		    <tr>
		    	<td colspan="8" style="text-align:right;"></td>
		    </tr>
		    <tr>
		   		 <td colspan="8" style="font-size:12px; color:red;">*5만원 이상 주문시 배송비 무료입니다. (기본 배송비 : 3500원)</td>		    
		    </tr>
		  </tbody>
		</table>
	<%-- 배송 주소록 관리 표 --%>
	<div style="float:left; padding-bottom:15px; font-weight: bold;">배송정보</div>
	<div style="float:right; padding-bottom:15px;">*필수입력사항</div>
	<table class="table">
		<tr>
			<td>배송지 선택</td>
			<td>
				<div style="font-size:12px;">
					<input id="defaultAddr" name="addr" value="T" type="checkbox">&nbsp;<label for="defaultAddr">기본 배송지</label>&nbsp;
					<input id="newAddr" name="addr" value="F" type="checkbox">&nbsp;<label for="newAddr">새로운 배송지</label>&nbsp;                             
					&nbsp;<button type="button" onclick="AddrPop()">주소록 보기</button>				
                   </div>
               </td>
		</tr>
	</table>
	<form id="addressFrm" name="addressFrm">
	<input type="hidden" name="userid" value="${sessionScope.loginuser.userid}"/>
	<input type="hidden" name="ano" value="${addressVo.ano}"/>		
		<table class="table">			
		    <tr>
		      <td>배송지명 *</td>
		      <td><input id='delivername' name="delivername" maxlength = "15" class="form-control col-sm-3" type='text' value = "${defaultAddr.delivername}"/></td>
		    </tr>
			<tr>
		      <td>성명 *</td>
		      <td><input id='name' name="name" maxlength ="10" class="form-control col-sm-3" type='text' value = "${defaultAddr.name}"/></td>
		    </tr>
			<tr>
		      <td>주소 *</td>
		      <td>
		      <div class="form-inline pb-1"><input id="postcode" name="postcode"  class="form-control col-sm-2 required" type='text' value = "${defaultAddr.postcode}" />&nbsp;&nbsp;
		      	<button type="button" onclick="execDaumPostcode()" class="btn btn-light" style="font-size: 9pt; padding: 3px 8px;">우편번호</button>
		      </div>
		      <div class="form-inline pb-1"><input id="address" name="address" class="form-control col-sm-4 required" type='text' placeholder="기본주소(필수)" value = "${defaultAddr.address}"/></div>
		      <div class="form-inline pb-1">
			      <input id="detailaddress" name="detailaddress" class="form-control col-sm-4" type='text' placeholder="상세주소" value = "${defaultAddr.detailaddress}"/> 
			      <input type="text" class="form-control col-sm-4" id="extraaddress" name="extraaddress" placeholder="참고항목" value = "${defaultAddr.extraaddress}"/>
		      </div>
		     
		      </td>
		      
		    </tr>
		    <tr>
		      <td>일반전화</td>
		      <td class="form-inline">
		      
		       <select class="selectpicker" id="hp1" name="hp1">
			    <option>02</option>
			    <option>031</option>
			    <option>033</option>
			    <option>041</option>
			    <option>042</option>
			    <option>043</option>
			    <option>044</option>
			    <option>051</option>
			    <option>052</option>
			    <option>053</option>
			    <option>054</option>
			    <option>055</option>
			    <option>061</option>
			    <option>062</option>
			    <option>063</option>
			    <option>064</option>
			    <option>0502</option>
			    <option>0503</option>
			    <option>0504</option>
			    <option>0505</option>
			    <option>0506</option>
			    <option>0507</option>
			    <option>0508</option>
			    <option>070</option>
			    <option>010</option>
			    <option>011</option>
			    <option>016</option>
			    <option>017</option>
			    <option>018</option>
			    <option>019</option>
			   </select>
			   &nbsp;-&nbsp;
			      <input id="hp2" name="hp2" class="form-control col-sm-1" type='text' maxlength = "4" />&nbsp;-&nbsp;
			      <input id="hp3" name="hp3" class="form-control col-sm-1" type='text' maxlength = "4" />
		      </td>		      
		    </tr>
		    <tr>
		      <td>휴대전화 *</td>
		       <td class="form-inline">
			   <select class="selectpicker required" id="mo1" name="mo1" value="${fn:substring(defaultAddr.mobile, 0, 3)}">
				    <option>010</option>
				    <option>011</option>
				    <option>016</option>
				    <option>017</option>
				    <option>018</option>
				    <option>019</option>
			   </select>
			   &nbsp;-&nbsp;
			      <input id="mo2" name="mo2" maxlength = "4" class="form-control col-sm-1 required" type='text' value="${fn:substring(defaultAddr.mobile, 3, 7)}" />&nbsp;-&nbsp;
			      <input id="mo3" name="mo3" maxlength = "4" class="form-control col-sm-1 required" type='text' value="${fn:substring(defaultAddr.mobile, 7, 11)}" />
		      </td>
		    </tr>
		    <tr>	
		    	<td>배송메세지</td>	    
		    	<td><textarea id="omessage" name="omessage" maxlength="255" cols="70"></textarea></td>
		    </tr>    
		</table>		
  	</form>
  	<div class="title">
        <p style="font-weight: bold;">결제 예정 금액</p>
    </div>
	<div class="totalArea">
		<table class="table">			
			<thead style="text-align:center;">
				<tr>
					<th><strong>총 주문 금액</strong>						
					</th>
					<th>
						<strong>배송비</strong>
					</th>
					<th><strong>총 결제예정 금액</strong></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="text-align:center;">
						<div>
							<strong><span id="totalPrice"></span>원</strong>		
						</div>
					</td>
					<td style="text-align:center;">
						<div>							
							<strong><span id="fee"></span>원</strong> 
						</div>
					</td>
					<td style="text-align:center;">
						<div>
							<strong><span id="totalAmount"></span>원</strong>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
		<div class="gMerge">
			<table class="table">			
				<!-- 적립금 -->
				<tbody>
					<tr>
						<td>적립금
							<p style="font-size:11px">(보유 적립금 : <span id="point"></span>원)</p>
						</td>					
						<td>						
							<input id="inputPoint" name="inputPoint" class="form-control col-sm-2" placeholder="" size="10" value="" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
							<ul style="list-style: none; padding-left: 3px; font-size:12px;">
								<li>적립금은 최소 1,000 이상일 때 결제가 가능합니다.</li>
								<li id="mileage_max_unlimit" class="displaynone">최대 사용금액은 제한이 없습니다.</li>
								<li id="mileage_max_limit" class="">1회 구매시 적립금 최대 사용금액은 0원입니다.</li>
								<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>								
							</ul>
						</td>
					</tr>
				</tbody>
				<!-- 예치금 -->			
			</table>
		</div>
	<!-- 결제 -->
	<table class="table payTable">
		<tr>
			<td>총 적립금</td>
			<td style="text-align:center;">111111원</td>
			<td>총 결제금액</td>
			<td style="text-align:center;"><span id="totalAmount"></span>111111원</td>
			<td style="float:right"><a href="#none" id="btn_payment" class="btn btn-secondary" style="font-size:16px; font-weight:700; padding:10px 20px;width:170px; ">결제하기</a></td>
		</tr>
	</table>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<script>
$(function(){
	
	$('input[name="addr"]').click(function(){
		 
		  if($(this).prop('checked')){
		 
		     $('input[name="addr"]').prop('checked',false);
		 
		     $(this).prop('checked',true);
		 	 console.log('클릭');
		    }
		  
		   if($(this)[0].id == "newAddr") {		
			   
			    $("#delivername").val("");
				$("#name").val("");
				$("#postcode").val("");
				$("#address").val("");
				$("#detailaddress").val("");
				$("#extraaddress").val("");
				$("#mo1").val("");
				$("#mo2").val("");
				$("#mo3").val("");
				
		   } else {
		    	
		    	$("#delivername").val("${defaultAddr.delivername}");
				$("#name").val("${defaultAddr.name}");
				$("#postcode").val("${defaultAddr.postcode}");
				$("#address").val("${defaultAddr.address}");
				$("#detailaddress").val("${defaultAddr.detailaddress}");
				$("#extraaddress").val("${defaultAddr.extraaddress}");
				$("#mo1").val("${fn:substring(defaultAddr.mobile, 0, 3)}")
				$("#mo2").val("${fn:substring(defaultAddr.mobile, 3, 7)}")
				$("#mo3").val("${fn:substring(defaultAddr.mobile, 7, 11)}")
		   } 
	});
	
}); 
// 다음 주소 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraaddress").value = extraAddr;
            
            } else {
                document.getElementById("extraaddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailaddress").focus();
        }
    }).open();
}

// 주소록 보기 팝업
function AddrPop(){
	var url = "/mypage/deliveraddr.go?type=orderForm";
	// 너비 800, 높이 650인 팝업창을 화면 가운데에 띄우기 
	var pop_width = 1200;
	var pop_height = 600;
	var pop_left = Math.ceil((window.screen.width - pop_width)/2 );
	var pop_top = Math.ceil((window.screen.height - pop_height)/2 );
	
	window.open(url, "memberUpdate",
    "left="+pop_width+", top="+pop_top+", width="+pop_width+", height="+pop_height);
}

// 전체 선택
function selectAll(selectAll)  {
	 
	const checkboxes = document.getElementsByName('select');
	 
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}
function getAddr(ano){
	
}
</script>				 
<jsp:include page="/WEB-INF/include/footer.jsp"/>