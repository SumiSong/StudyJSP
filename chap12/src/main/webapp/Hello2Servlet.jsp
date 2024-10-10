<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>어노테이션으로 매핑</h2>
<p>
	<strong>${msg}</strong>
	<br>
	<a href="<%= request.getContextPath()%>/Hello2Servlet.do">바로가기</a>
	<form method="post" action="Hello2Servlet.do">
		<input type="submit" value="직접 내용 출력하기"/>
	</form>
</p>
</body>
</html>