<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String reqType = request.getParameter("reqType");
%>
<h2><%= (reqType != null && reqType.equals("req") ? "request foward" : "send") %>로 전달된 페이지</h2>
<%
Object req1 = request.getAttribute("req1");
Object reqStudent = request.getAttribute("reqStudent");
%>  

<ul>
	<li>req 문자열 정보 : <%= (req1 !=null ? req1.toString() : "") %></li>
	<li>
	학생정보 : 
		 <% if(reqStudent != null){ 
			 StudentDTO pageStudent2 = (StudentDTO)reqStudent;%>
		 <ul>
			<li>학번 : <%=pageStudent2.getNo() %></li>
			<li>이름 : <%=pageStudent2.getName() %></li>
			<li>나이 : <%=pageStudent2.getAge() %></li>
			<li>학과 : <%=pageStudent2.getDept() %></li>
			<li>학년 : <%=pageStudent2.getGrade() %></li>
		</ul>
		<%} %>
		</li>
	<!-- 	
	<li>request user_id : <%=request.getParameter("user_id") %></li>
	<li>request pwd : <%=request.getParameter("pwd") %></li>
	 -->

</ul>

<% %>
</body>
</html>