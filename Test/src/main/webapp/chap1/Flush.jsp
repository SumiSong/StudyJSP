<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page buffer="1kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>page 지시어 - buffer, autoFlush 속성</h2>
<%
for(int i=1; i<=1000; i++){
	out.println("123456789");
}
%>
</body>
</html>  