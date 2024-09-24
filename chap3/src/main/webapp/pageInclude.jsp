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
String no2 = pageContext.getAttribute("pageStNo").toString();
String name2 = pageContext.getAttribute("pageStName").toString();
int age2 = (Integer)pageContext.getAttribute("pageStAge");
String dept2 = pageContext.getAttribute("pageStDept").toString();
int grade2 = (Integer)pageContext.getAttribute("pageStGrade");
StudentDTO pageStudent2 = (StudentDTO)pageContext.getAttribute("pageStudent");
%>

<h2>삽입 페이지에서 조회 결과</h2>
<ul>
	<li>학번 : <%=no2 %></li>
	<li>이름 : <%=name2 %></li>
	<li>나이 : <%=age2 %></li>
	<li>학과 : <%=dept2 %></li>
	<li>학년 : <%=grade2 %></li>
	<li>
	학생정보
	<ul>
		<li>학번 : <%=pageStudent2.getNo() %></li>
		<li>이름 : <%=pageStudent2.getName() %></li>
		<li>나이 : <%=pageStudent2.getAge() %></li>
		<li>학과 : <%=pageStudent2.getDept() %></li>
		<li>학년 : <%=pageStudent2.getGrade() %></li>
	</ul>
	</li>
</ul>
</body>
</html>