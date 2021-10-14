<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/include/header.jsp"/>
<style>
</style>
<title>소녀떡집</title>
	<!-- Header-->
<div id="mainContent">
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/images/carousel-bg/carousel-bg1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/images/carousel-bg/carousel-bg2.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/images/carousel-bg/carousel-bg3.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only"></span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only"></span>
		  </a>
	</div>
	<!-- Section-->
        <a href="/member/login.go">로그인화면</a>
		<a href="/member/signUp.go">회원가입 화면</a>
		<a href="/member/updateMember.go">회원정보 수정 화면</a>
		<a href="javascript:addAddresForm()">배송지 등록하기</a>
		<a href="/admin/sendMessage.go">메세지 전송하기</a>
		<a href="/product/prodList.go">상품 리스트</a>
		<a href="/product/prodRegister.go">상품 등록</a>
		<a href="/order/orderForm.go">상품 등록</a>
</div>
<script>
function addAddresForm(){
	var url = "/member/addAddress.go";
	// 너비 800, 높이 650인 팝업창을 화면 가운데에 띄우기 
	var pop_width = 800;
	var pop_height = 600;
	var pop_left = Math.ceil((window.screen.width - pop_width)/2 );
	var pop_top = Math.ceil((window.screen.height - pop_height)/2 );
	
	window.open(url, "배송지 추가",
    "left="+pop_width+", top="+pop_top+", width="+pop_width+", height="+pop_height);
}
</script>
<jsp:include page="/WEB-INF/include/footer.jsp"/>