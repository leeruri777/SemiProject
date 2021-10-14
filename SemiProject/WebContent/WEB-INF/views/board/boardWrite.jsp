<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.member.*, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	BoardDAO dao = new BoardDAO();
	List<BoardVO> ls = dao.selectAll();
	pageContext.setAttribute("ls", ls);
%>
<!DOCTYPE html>


<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/include/header.jsp"/>


</head>
<body>

<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }
  .a {
  	font-size : 40px;
  	color: blue;
  	text-align: center;
  }
  div.button {
  	margin: auto;
	width: 10%;
  }
  
</style>


<div class= "a">공지사항입니다</div>
<table border="1">


<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>등록일</th>
	<th>조회수</th>
</tr>


<c:forEach var="board" items="${ls}">
<tr>
	<td>${board.num}</td>
	<td><a href="${pageContext.request.contextPath}/board/boardDetail.go?num=${board.num}">${board.title}</a></td>
	<td>${board.writer}</td>
	<td>${board.regdate}</td>
	<td>${board.cnt}</td>
</tr>

</c:forEach>
</table>
<a href="${pageContext.request.contextPath}/board/registForm.go">
<c:if test="${sessionScope.loginuser !=null and sessionScope.loginuser.userid == 'admin'}">
<div class="button">
<input type="button" value="글 등록 버튼" /></a>
</div>
</c:if>

<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>