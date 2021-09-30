<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" /> --%>

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath %>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<script type="text/javascript">

	

</script>

<style>
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
	span#sm-title {
		font-size: 14px;
		font-weight: bold;
		padding-top: 5pt;
	}
	hr#line1{
		padding-left: 0;
		margin: 0;
	}
	
</style>

</head>
<body>

<div class="container mt-5 ">
	
	<div id="top_image" class="row w-100 mx-0 px-0">
		<div class=" col-lg-12 px-0 mx-0 text-center ">
			<img src="../images/tinytan/tinytan_main.jpg" class="img-fluid">
		</div>
	</div>
	<br>	
	<div id="category" class="top mx-0 px-0">	
		<span id="sm-title">타이니탄</span>	
	</div>
	
	<hr class="my-1">
			
	<div id="img_list" class="product row w-100 mx-0 px-0">    
	    
	  <div class="card col-sm-3 col-4">
	    <div class="card-body px-1">
	       <img src="../images/tinytan/4presentSet.jpg" style="width:100%">
	        <span id="font1">타이니탄 인기크림떡 4종 선물세트</span><br>
	        <span id="font1">(윈터페스타크림떡 틴케이스 세트증정)<br><b>29,800원</b></span>
	    </div>
	  </div>
	  
	  <div class="card col-sm-3 col-4">
	    <div class="card-body px-1 ">
	      <img src="../images/tinytan/4jong.jpg" style="width:100%">
	        <span id="font1">타이니탄 인기크림떡 4종<br><b>6,900원</b></span>
	    </div>
	  </div>
	  
	  <div class="card col-sm-3 col-4">
	    <div class="card-body px-1">
	      <img src="../images/tinytan/winterSet.jpg" style="width:100%">
	        <span id="font1">윈터페스타크림떡 <br>티케이스 세트 <br><b>16,800원</b></span>
	    </div>
	  </div>
	  	  
	  <div class="card col-sm-3 col-4">
		    <div class="card-body px-1">
		       <img src="../images/tinytan/4presentSet.jpg" style="width:100%">
		        <span id="font1">타이니탄 인기크림떡 4종 선물세트</span><br>
		        <span id="font1">(윈터페스타크림떡 틴케이스 세트증정)<br><b>29,800원</b></span>
		    </div>
	  </div>
	  
	  <div class="card col-sm-3 col-4">
	    <div class="card-body px-1">
	       <img src="../images/tinytan/4presentSet.jpg" style="width:100%">
	        <span id="font1">타이니탄 인기크림떡 4종 선물세트</span><br>
	        <span id="font1">(윈터페스타크림떡 틴케이스 세트증정)<br><b>29,800원</b></span>
	    </div>
	  </div>
	  
	  <div class="card col-sm-3 col-4">
	    <div class="card-body px-1">
	       <img src="../images/tinytan/4presentSet.jpg" style="width:100%">
	        <span id="font1">타이니탄 인기크림떡 4종 선물세트</span><br>
	        <span id="font1">(윈터페스타크림떡 틴케이스 세트증정)<br><b>29,800원</b></span>
	    </div>
	  </div>
	
     
    </div>
	
</div>










</body>
</html>