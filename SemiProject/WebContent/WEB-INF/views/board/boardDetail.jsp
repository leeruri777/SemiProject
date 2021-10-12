<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:useBean id="dao" class="board.member.BoardDAO"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVO vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
</head>
<body>
<h3>글 정보</h3>
<p>번호:${vo.num}</p>
<p>제목:${vo.title}</p>
<p>작성자:${vo.writer}</p>
<p>내용:${vo.content}</p>
<p>등록일자:${vo.regdate}</p>
<p>조회수:${vo.cnt}</p>

<a href="${pageContext.request.contextPath}/board/editForm.go?num=${vo.num}"><button>수정</button></a>
<a href="${pageContext.request.contextPath}/board/deleteForm.go?num=${vo.num}"><button>삭제</button></a>
</body>
</html>