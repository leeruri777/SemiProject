<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>로그인</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Optional JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<style>
body {
	 width: 600px;
	 margin: 0 auto;
	 font-family: Noto Sans KR,sans-serif!important;
	 padding: 0 70px;
}

.shopname img{
    display: block;
 	margin : 0 auto;
 	margin-top : 50px;
}
.contents{
  	position: relative;
    width: 100%;
    padding: 36px 0;
}
.title{
	margin: 0 0 20px;
    font-size: 24px;
    font-weight: bold;
    
}
.text{
	margin-bottom: 24px;
    font-size: 16px;
    font-weight: lighter;
}
.btn {
	margin-top: 10px;
    padding: 0;
    display: inline-block;
    width: 100%;
    height: 45px;
    line-height: 45px;
    border: 1px;
    border-radius: 5px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-size: 12px;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    
}
.btnkakao{
	margin-top: 12px;
    padding: 0 0 0 20px;
    height: 60px;
    line-height: 60px;
    background-color: #fee500;
    font-size: 15px;
    color: #111;
    background-image: url(//storage.keepgrow.com/admin/campaign/20200611043456590.svg);
    background-repeat: no-repeat;
    background-size: 18px;
    background-position: 15px;
}
  .inputbox{
  	border: 1px solid #e1e1e1;
    border-radius: 5px;
    overflow: hidden;
  }
  .inputbox input{
    padding: 0 15px;
    width: 100%;
    height: 50px;
    line-height: 50px;
    border: none;
    font-size: 14px;
    color: #000;
    box-sizing: border-box;
  }
      
  
  .logincheckbox{
  	margin: 15px 0;
  }
  .loginBtn{
  	padding: 0;
    display: inline-block;
    line-height: 45px;
    border: 1px;
    border-radius: 5px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-size: 12px;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    
    background: #31363d;
    font-size: 15px;
    color: #fff;
  }
  .utilmenu{
  	float: inherit;
    margin: 24px 0 0;
    border: none;
  }
  .utilmenu a{
    font-size: 12px;
    font-weight: lighter;
    color: #222;
  }
  .after{
    text-align : center;
    padding: 0 10px;
    font-size: 12px;
    color: #b2b2b2;
}
.footer{
    border: none;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.ment{
    padding: 24px 0 10px;
    border-top: 2px solid #333;
    font-size: 14px;
}

  
</style>

    
<!-- Custom styles for this template -->
</head>
<body>
<div class="main">
	<div class="header">
		<h1 class="shopname">
			<a href="/"><img src="/images/login/logo_main.jpg"></a>
		</h1>
	</div>
	<div class="section">
		<div class="contents">
			<h2 class="title">로그인</h2>
			<p class="text">
				아이디와 비밀번호 입력하기 귀찮으시죠?
				<br>
				카카오로 1초 만에 로그인 하세요.
			</p>	
			<a class="btn btnkakao" style="text-align:center;">카카오 1초 로그인/회원가입</a>
		</div>
	</div>
	<p class="after">또는</p>
	<div class="banner">
		<img src="/images/login/loginCoupon.jpg" alt="banner">
	</div>
		<div id="loginForm" style="margin-bottom: 30px;">
			<div class="inputbox">
				<form name="loginFrm">
					<input type="text" class="form-control" id="userid" name="userid"autocomplete="off" placeholder="Id">
					<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
				</form>
			</div>
			<div class="logincheckbox">
				<label style="font-size : 10px;">
		      	  <input type="checkbox" id="savdid"> 아이디 저장
		        </label>
			</div>
			<button class="btn loginBtn" onclick="goLogin()">로그인</button>
			<div class="utilmenu">
				<a href="#" >아이디 찾기</a>
				<a href="#">비밀번호 찾기</a>
				<a href="#" style="float: right;">가입하기</a>
			</div>
		</div>
	<div class="footer">
		<div class="ment">
          <b>카카오 1초 로그인/회원가입 이란?</b>
          <br>
          카카오 싱크를 활용한 간편 로그인/가입 기능입니다.
        </div>
	</div>
</div>

<!-- <div class="backBtn" onclick="history.go(-1);return false;">뒤로가기</div>
<main class="form-signin">
	
  <form name="loginFrm">
    <h1 class="h4 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="userid" name="userid"autocomplete="off" placeholder="Id">
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" id="savdid"> 아이디 기억
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" id = "btnSubmit" onClick="goLogin()">로그인</button>
    <img src="/images/login/kakao_login_medium_wide.png" alt="카카오로그인이미지"/>
    <div class="utilMenu" style="display:block">
    	<a href="#">아이디 찾기</a>
    	<a href="#">비밀번호 찾기</a>
    	<a class="right" style="display:" href="#">회원가입</a>
    </div>
    
    
  </form>
</main> -->
<script>

$(function(){
	
	// 아이디저장 체크 유무
	const saveid = localStorage.getItem("saveid");
	if(saveid != null){
		$("input#loginUserid").val(saveid);
		$("input:checkbox[id=saveid]").prop('checked', true);
	}
		
	$("input#loginPwd").bind("keyup", function(event){
		if(event.keyCode == 13) { // 키보드로 엔터를 입력했을 경우
			goLogin();
		}
	});
});

function goLogin(){
	
	const loginUserid = $("input#userid").val().trim();
	const loginPwd = $("input#pwd").val().trim();
	
	if(loginUserid == ""){
		alert("아이디를 입력하세요");
		$("input#userid").val("");
		$("input#userid").focus();
		return;
	}
	if(loginPwd == ""){
		alert("비밀번호를 입력하세요");
		$("input#pwd").val("");
		$("input#pwd").focus();
		return;
	}
	
	var frm = document.loginFrm;
	
	if($("input:checkbox[id=savdid]").prop("checked")){
		localStorage.setItem("savdid", loginUserid);
	} else {
		localStorage.clear();
	}
	frm.action = "/member/login.go",
	frm.method = "post";
	frm.submit();
	
}
</script>
</body>
</html>
