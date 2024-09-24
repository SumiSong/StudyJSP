<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
List<String> lists = new ArrayList<String>();
lists.add("조수진");
lists.add("송수미");
lists.add("최사랑");
session.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>session 영역</h2>
<%
//세션에 저장된 리스트를 Object로 가져온 후(getAttribute("lists")는 Object 타입으로 반환되기 때문에) List<String> 타입으로 형변환
List<String> lists2 = (List<String>)session.getAttribute("lists");
for(String str : lists2){
	out.print("str : " + str + "<br>");
}
%>
<hr>
<a href="session2.jsp">페이지 이동 후 session 영역 조회</a> <!-- 웹브라우저를 닫을 때까지 공유됨 -->
</body>
</html>