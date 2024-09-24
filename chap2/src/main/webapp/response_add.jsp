<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = sf.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String name = request.getParameter("name");


response.addDateHeader("birth_day", add_date);
response.addIntHeader("no", add_int);
response.addHeader("name", name);
response.setHeader("name", "하니"); //수정

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>응답 헤더 조회</h2>
<ul>
<%
Collection<String> hNames = response.getHeaderNames();
for(String hName : hNames){
	String hValue = response.getHeader(hName);
	out.println("<li>" + hName +":"+ hValue + "</li>");
}
%>
</ul>
<h2>여러개 추가된 헤더값 출력 응답 헤더 조회</h2>
<ul>
<%
Collection<String> hNos = response.getHeaders("no");
for(String hN : hNos){
	out.println("<li>no :" + hN + "</li>");
}
%>
</ul>
</body>
</html>