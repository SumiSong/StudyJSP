<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 3. HTTP 요청 헤더 정보 출력하기</h2>
<%
Enumeration headers = request.getHeaderNames();
%>
<ul>
<%
while(headers.hasMoreElements()){
	String hName = (String)headers.nextElement();
	String hValue = request.getHeader(hName);
	out.println("<li> 헤더명: " + hName + " 헤더값 : " + hValue);
}
%>
</ul>

</body>
</html> 