<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>page 지시어 - errorPage/isErrorPage 속성</h2>
<h2>오류 발생</h2>
<p> 
오류명 : <%=exception.getClass().getName() %> 
오류 메세지 : 	<%=exception.getMessage() %> 
</p>
</body>
</html>