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
<title>[관리자 메뉴]상품관리</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

    
    <!-- Font Awesome 5 Icons --> <!-- 아이콘을 사용하려면 헤드에서 미리 링크를 걸어줘야한당 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" /> --%>

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
			
			<h4>상품관리</h4>
			<hr>
			
			<%-- 상품페이지 탑부분 시작 --%>	
			<div id="top">
				
				<form name="memberFrm" class="row w-100">
					
					<div class="col-md-9 mb-2 pl-4">
						<select id="searchType" name="searchType">						
							<option value="Category_Large">대분류명</option>
							<option value="Category_Small">소분류명</option>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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
										<span>재고몇개입니다</span>
									</td>
									<td class="col-sm-2">
										<span>판매상태입니다</span>
									</td>
									<td class="col-sm-2">
										<button type="button" class="btn btn-sm btn-dark my-1">수정</button>						
										<button type="button" class="btn btn-sm btn-danger my-1">삭제</button>
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