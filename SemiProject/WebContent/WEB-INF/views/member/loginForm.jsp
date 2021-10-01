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

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

    <style>
    html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 10px;
  padding-bottom: 20px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-size : 10;
  font-weight: 10;
  text-align : left;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: 1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
<!-- Custom styles for this template -->
</head>
<body class="text-center">
    
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
</main>
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
