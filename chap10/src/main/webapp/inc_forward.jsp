<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// pageContext.setAttribute("param1", "page 영역");
// request.setAttribute("param1", "request 영역");
// session.setAttribute("param1", "session 영역");
// application.setAttribute("param1", "application 영역");
%>

<h2>표현 언어(EL) - 내장 객체</h2>
<h3>액션 태그 - forward</h3>
<ul>
	<li>페이지 영역 : ${pageScope.param1} </li>
	<li>리퀘스트 영역 : ${requestScope.param1} </li>
	<li>세션 영역 : ${sessionScope.param1} </li>
	<li>어플리케이션 영역 : ${applicationScope.param1} </li>
</ul>

<hr>

<h3>영역 지정 없이 속성값 조회</h3>
<ul>
	<li>${param1 }</li>
</ul>
</body>
</html>

