<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="fullstack7.member.MemberDAO"%>
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
MemberDAO dao = new MemberDAO();
List<MemberDTO> dtoList = dao.getMemberList();
for (MemberDTO mem : dtoList) {
	%>
	<div><%= mem.getMemberId() %></div>
	<%
}

%>
</body>
</html>