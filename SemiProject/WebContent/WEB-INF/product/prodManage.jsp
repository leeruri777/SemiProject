<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자메뉴]상품관리</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

    
    <!-- Font Awesome 5 Icons --> <!-- 아이콘을 사용하려면 헤드에서 미리 링크를 걸어줘야한당 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath %>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css">

	div.container {	width: 90%;	}
	
	div#top {margin: 0 auto;}
	
	div#main {margin: 0 auto;}
	
	
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		
		
	})// end of $(document).ready(function() {})-------------------------------------------
	
</script>
</head>
<body>
		
	<div class="container mt-5">	
			
			<div class="modal fade" id="addModal">
			  <div class="modal-dialog modal-dialog-scrollable modal modal-dialog-centered">
			  
			    <div class="modal-content">
			      
			      <!-- Modal header -->
			      <div class="modal-header">
			        	<h5 class="modal-title">상품입고</h5>
			        	<button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      
			      <!-- Modal body -->
			      <div class="modal-body">
			      		<p class="row"><span class="col-2">상품코드</span><span>:&nbsp;&nbsp;12312314</span></p>
			        	<p class="row"><span class="col-2">상품명</span><span>:&nbsp;&nbsp;타이니탄크림떡</span></p>
	          			<p class="row">
	          				<label class="col-2" for="addMount">입고량</label>
	          				:&nbsp;&nbsp;
				    		<input type="text" class="inventory" id="box" placeholder="0 이상의 숫자 입력"/>
				    	</p>
			      </div>
			      
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-info">입고</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<div class="modal fade" id="delModal">
			  <div class="modal-dialog modal-dialog-scrollable modal modal-dialog-centered">
			  
			    <div class="modal-content">
			      
			      <!-- Modal header -->
			      <div class="modal-header">
			        	<h5 class="modal-title">상품폐기</h5>
			        	<button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      
			      <!-- Modal body -->
			      <div class="modal-body">
			      		<p class="row"><span class="col-2">상품코드</span><span>:&nbsp;&nbsp;12312314</span></p>
			        	<p class="row"><span class="col-2">상품명</span><span>:&nbsp;&nbsp;타이니탄크림떡</span></p>
	          			<p class="row">
	          				<label class="col-2" for="delMount">폐기량</label>
				    		:&nbsp;&nbsp;
				    		<input type="text" class="inventory" id="box" placeholder="0 이상의 숫자 입력"/>
				    	</p>
				    	<p class="row">
					    	<label class="col-2" for="delWhy">폐기사유</label>
					    	:&nbsp;&nbsp;
					    	<select id="delWhy">
					    		<option>유통기한만료</option>
					    		<option>상품판매중단</option>
					    		<option>기타</option>
					    	</select>
				    	</p>
			      </div>
			      
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-info">입고</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<h4>상품관리</h4>
			<hr>
			
			<%-- 상품페이지 탑부분 시작 --%>	
			<div id="top">
				
				<form name="memberFrm" class="row w-100">
					
					<div class="col-md-9 mb-2 pl-4">
						<select id="searchType" name="searchType">						
							<option value="Category">카테고리명</option>
							<option value="ProdName" selected="selected">상품명</option>
						</select>
						
						<input type="text" id="searchWord" name="searchWord" />
						
						
						<button type="button" class="btn btn-light btn-sm" style="border: solid 1px #d9d9d9" onclick="goSearch();" style="margin-right: 30px;">검색</button>
					</div>
					
					<div class="col-md-3 text-right mb-2 px-0 mx-0">
						<span style="font-size: 12pt;">정렬방법 : </span>
				
						<select id="orderby" name="orderby">
							<option value="addDate">등록일순</option>
							<option value="prodName">상품명순</option>
							<option value="jaego">재고량순</option>
						</select>
					</div>	
					
				</form>
				
			</div>
			<%-- 상품페이지 탑부분 끝 --%>	
			
			
			
			<%-- 상품페이지 메인부분 시작 --%>
			
			<div id="main" class="w-100 row">
				
				<div class="table-responsive">
						<table class="table table-hover text-center">
														
							<tbody>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2 ">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2 ">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2 ">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2 ">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								<tr class="row w-100 px-0 mx-0">
									<td class="col-sm-2 mx-0 px-0">
										<img src="../../images_product/practiceimg.jpg" class="img-fluid mx-0 px-0">
									</td>
									<td class="col-sm-2">
										<span>상품코드입니다</span>
									</td>
									<td class="col-sm-2">
										<span>상품명자리입니다</span>
									</td>
									<td class="col-sm-2">
										<p>재고몇개입니다</p>
										<button type="button" class="btn btn-sm btn-info my-1 mx-1" data-toggle="modal" data-target="#addModal">입고</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1" data-toggle="modal" data-target="#delModal">폐기</button>
									</td>
									<td class="col-sm-2 ">
										<p>판매상태입니다</p>
										<input type="radio" name="sale1" id="sale" checked /><label for="sale">&nbsp;판매&nbsp;&nbsp;&nbsp;</label>
										<br>
										<input type="radio" name="sale1" id="notsale" /><label for="notsale">&nbsp;미판매</label>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1 mx-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1 mx-1">삭제</button>
									</td>
								</tr>
								
												
							</tbody>
							
						</table>
					</div>
			   	
			   	<div id="nav"  class="mt-4 col-12">
				   	<nav>
						  <ul class="pagination justify-content-center" style="margin:20px 0">
								<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">다음</a>
						  </ul>
					</nav>
			   	</div>
			</div>			
			<%-- 상품페이지 메인부분 끝 --%>
			
			
	</div>

</body>
</html>