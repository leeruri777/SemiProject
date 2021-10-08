<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<!-- Optional JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- jquery UI -->
<link rel="stylesheet" type="text/css" href="/jquery-ui-1.12.1.custom/jquery-ui.css" />
<script type="text/javascript" src="/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
</head>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                   		 <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                   		 <li class="nav-item"><a class="nav-link" href="#">상품 Q&A</a></li>
                   		 <li class="nav-item"><a class="nav-link" href="#">청년떡집 소개</a></li>
                    <c:choose>
						<c:when test="${empty sessionScope.loginuser}">
							<li class="nav-item"><a class="nav-link" href="/member/login.go">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="/member/signUp.go">회원가입</a></li>						 
						</c:when>
						<c:otherwise>
							<c:if test="${sessionScope.loginuser.grade == 1}">
								<li class="nav-item"><a class="nav-link" href="/admin/adminMain.go">관리자 모드</a></li>
							</c:if>
							<li class="nav-item"><a class="nav-link" href="#">${sessionScope.loginuer.userid}</a></li>
							<li class="nav-item"><a class="nav-link" href="/mypage/orderlist.go">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link" href="/member/logout.go">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" href="#">주문조회</a></li>                                       
                    </ul>
                    
                </div>
            </div>
        </nav>
		<div style="text-align: center;">
			<a href="/"><img id="logo" src="/images/tteok_logo.png" alt="logo"/></a>
		</div>

<body>

