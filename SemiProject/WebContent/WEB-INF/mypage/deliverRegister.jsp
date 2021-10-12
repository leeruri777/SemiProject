<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="./navbar.jsp" />

<title>마이페이지 - 배송지 등록</title>

		

	
	

<script type="text/javascript">


	$(document).ready(function() {
		  
	
     
	});// end of $(document).ready(function()})-----------------------------------------
	
	
	


</script>
    
    
    
    
    

<%-- ////내용 시작//// --%>	
<div class="container p-5" >	
	
		
	<p style="margin-bottom:8px; font-weight: bold; color: black; text-align: center; font-size: 14pt;">배송 주소록 관리</p>
	<p class="text-secondary" style="margin-bottom:25px; text-align: center; font-size: 9pt;">자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
	<%-- 배송 주소록 관리 표 --%>
		<table class="table regtable">
		 
		    <tr>
		      <td>배송지명</td>
		      <td><input id='delibername' name="delibername" class="form-control col-sm-3" type='text'/></td>
		    </tr>
			<tr>
		      <td>성명</td>
		      <td><input id='name'  name="name" class="form-control col-sm-3" type='text'/></td>
		    </tr>
			<tr>
		      <td>주소</td>
		      <td>
		      <div class="form-inline pb-1"><input id="postcode" name="postcode"  class="form-control col-sm-3" type='text'/>&nbsp;&nbsp;<button type="button" onclick="" class="btn btn-light" style="font-size: 9pt; padding: 3px 8px;">우편번호</button></div>
		      <div class="form-inline pb-1"><input id="address" name="address" class="form-control col-sm-8" type='text'/>&nbsp;&nbsp;<div style="font-size: 9pt;">기본주소</div></div>
		      <div class="form-inline pb-1"><input id="detailAddress" name="detailAddress" class="form-control col-sm-8" type='text'/>&nbsp;&nbsp;<div style="font-size: 9pt;">상세주소</div></div>
		      </td>
		      
		    </tr>
		    <tr>
		      <td>일반전화</td>
		      <td class="form-inline">
		      
		       <select class="selectpicker">
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
			      <input id="" name="" class="form-control col-sm-1" type='text'/>&nbsp;-&nbsp;
			      <input id="" name="" class="form-control col-sm-1" type='text'/>
		      </td>
		      
		    </tr>
		    <tr>
		      <td>휴대전화</td>
		       <td class="form-inline">
			   <select class="selectpicker">
				    <option>010</option>
				    <option>011</option>
				    <option>016</option>
				    <option>017</option>
				    <option>018</option>
				    <option>019</option>
			   </select>
			   &nbsp;-&nbsp;
			      <input id="" name="" class="form-control col-sm-1" type='text'/>&nbsp;-&nbsp;
			      <input id="" name="" class="form-control col-sm-1" type='text'/>
		      </td>
		    </tr>
		    
		</table>
		
		
		
		<div class="form-row float-right">
			<input type='checkbox' name='delibersave' value='delibersave' style="position: relative; top:12px;"/>&nbsp;<span class="text-secondary" style="font-size: 11pt; position: relative; top: 7px;">기본배송지로 저장</span>
			&emsp;&emsp;
      		<button type="button"  onclick = "" class="btn btn-dark" style="font-size: 11pt;">등록하기</button>
      		&nbsp; &nbsp;
      		<button type="button" onclick = "" class="btn btn-light" style="font-size: 11pt;">취소</button>
  		</div>
  		
		
		

</div>
	
	<%-- ////내용 끝//// --%>
				 
</body>
</html>