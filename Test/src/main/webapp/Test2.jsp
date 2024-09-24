<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import= "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String today2 = dateFormat.format(today);
out.println("오늘 날짜 : " + today + "</br>"); // println은 콘솔에서만 적용됨. html은 블록구조임으로 br 태그 사용
out.println("오늘 날짜 : " + today2);

%>
</body>
</html>