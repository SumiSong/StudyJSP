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
int sts = response.getStatus();

if(sts == 404){
	out.print("404 에러가 발생함");
	out.print("<br>파일 경로를 확인해보세요");
}
%>
</body>
</html>