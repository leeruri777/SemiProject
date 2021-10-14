<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<%
   String ctxPath = request.getContextPath();
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath %>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("div.card").click(function(event){
			
			//	var prod_name = $(this).(".card-body").html();
				console.log($(this).find("#prod_code").val());
			//	location.href="<%= ctxPath%>/product/prodDetail.go?prod_code="+prod_code;
				
		}); // end of $("div.card").click(function(event){
			
		
		
	});

	// Function Delclaration
	
	
</script>

<style type="text/css">
	div.container{
		width:80%;
		font-family: Sans KR;
		font-style: normal;
  		font-weight: 100;
	}
	div.top{
		margin : 5pt 0pt 0pt 0pt;
		padding: 0;
		text-align: left;
	}
	div.products{
		margin:0;
		display: inline-block;
		
	}
	span#font1 {
		font-size: 10pt;
		
	}
	div.card {
		border: none;
		
	}
	
	div.card:hover { border: solid 1px gray;}
	
	span#sm-title {
		font-size: 14px;
		font-weight: bold;
		padding-top: 5pt;
	}
	
	
	
	div.card-body {
		heigth:50px;
		text-align: center;
	}
	
	hr#line1{
		padding-left: 0;
		margin: 0;
	}
	
</style>

</head>
<body>

<div class="container mt-5 ">
	<c:if test="${not empty productList}">
	
		<div id="top_image" class="row w-100 mx-0 px-0">
			<c:if test="${requestScope.adimg != ''}">
				<div class=" col-lg-12 px-0 mx-0 text-center ">
					<img src="../img_prod/${requestScope.adimg}" class="img-fluid">
				</div>
			</c:if>
		</div>
		<br>	
		<div id="category" class="top mx-0 px-0">
			<c:if test="${requestScope.categoryName != '' }">
				<span id="sm-title">${requestScope.categoryName}</span>
			</c:if>		
		</div>
	
		<hr class="my-1">
				
		<div id="img_list" class="product row w-100 mx-0 px-0">    
		  <c:forEach var="prodmap" items="${productList}">
			  <div class="card col-sm-3 col-4">
			    <div class="card-body px-1">
			       <img src="../img_prod/${prodmap.ivo.prod_img_url}" style="width:100%">
			        <span id="font1" style="text-align: center">${prodmap.pvo.prod_name}<b><br>${prodmap.pvo.prod_price}원</b></span>
			    	<input id="prod_code" type="hidden" value="${prodmap.pvo.prod_code}" /> <!-- value에 DB연결하고 prod_code 넣을것 -->
			    </div>
			  </div>
	     </c:forEach>	
	  
	</div>
	</c:if>
</div>









</body>
</html>