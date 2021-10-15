<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>           
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<style type="text/css">
	
	body {
      margin: 0;
      padding: 0; 
      font-family: 궁서체;
      font-size:small;
      word-break: break-all; /* 공백없이 영어로만 되어질 경우 해당구역을 빠져나가므로 이것을 막기위해서 사용한다. */
    }
		
	div#container {
		width:80%;
		margin: 0 auto;
		
	}
	
	form {
		margin-top: 50px;
	}
	
	legend {
		font-size:15pt;
	}
	
	select {
		width: 200px;
	}
	
	ul {
		list-style-type: none;
		padding: 0;
	}
	
	ul > li {
		line-height: 40px;
	}
	
	select.form-control {
		width: 150px;
		display: inline-block;
	}
	
	input.form-control {
		width: 200px;
		display: inline-block;
	}
	
	input.explain {
		width: 350px;
		height: 60px;
	}
	
	label.title {
		display: inline-block;
		width: 120px;
		color: navy;
		font-weight: bold;
	}
	
	input#box {
		line-height: 40px;
		padding-top: 10px;
	}
	
	
	input[type=submit], input[type=reset] {
		width: 100px;
		height: 40px;
		background-color: #000;
		color: #fff;
		font-size: 16pt;
		margin: 20px 0 0 40px;
		border: none;
	}

	
</style>

</head>
<body>
	<div id="container">
		<form action="register.go">
			<fieldset>
			 	<legend>프로젝트 정보</legend>
				<ul>
					<li>
						<label class="title" for="select1">소분류</label>
					    <select class="form-control" id="select1">
					      <option>소분류 선택</option>
					      <option>타이니탄</option>
					      <option>선물세트</option>
					      <option>크림떡</option>
					      <option>끼니떡</option>
					      <option>답례품 및 대량주문</option>
					      <option>청년제과</option>
					    </select>
					    <input type="text" class="form-control">
					</li>
					
					<li>
						<label class="title" for="prodName">상품명</label>
				    	<input type="text" class="productname" id="box">
					</li>
					<li>
						<label class="title" for="expalin">설명란</label>
				    	<input type="text" class="explain" id="box">
					</li>
					<li>
						<label class="title" for="inventory">재고</label>
				    	<input type="text" class="inventory" id="box">
					</li>
					<li>
						<label class="title" for="addFile">이미지 첨부</label>
						<input type=file multiple=multiple id="addFile" />
					</li>
					
					<li>
						<label class="title" >상품판매 여부</label>
						<label for="sale">판매</label><input type="radio" name="sale1" id="sale" checked />
						<label for="notsale">미판매</label><input type="radio" name="sale1" id="notsale" />
					</li>
					

					<li>
						<label class="title" for="prodregisterday">상품등록일</label>
						<input type="date" id="prodregisterday"/>
					</li>
					
					
					<li>
						<input type="submit" value="확인" />
						<input type="reset"  value="취소" />
					</li>	
					
				</ul>
				
			</fieldset>
		
		</form>
		
	</div>

</body>
</html>