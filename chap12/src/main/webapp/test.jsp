<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml 에 매핑</h2>
	<p>
		<b>메시지를 리턴받아서 전달합니다</b>
		<br><strong><%= request.getAttribute("msg") %></strong>
		<br><a href="./HelloServlet.do">바로가기</a>
	</p>
</body>
</html>