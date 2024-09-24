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
<h2>page 영역 속성값 처리(저장)</h2>
<%
pageContext.setAttribute("pageStNo", "20240101");
pageContext.setAttribute("pageStName", "홍길동");
pageContext.setAttribute("pageStAge", 20);
pageContext.setAttribute("pageStDept", "전자공학");
pageContext.setAttribute("pageStGrade", 1);
pageContext.setAttribute("pageStudent", new StudentDTO("20240101","홍길순", 20, "간호학과", 1));
%>

<h2>page 영역의 속성값 읽기</h2>
<%
String no = pageContext.getAttribute("pageStNo").toString(); // getAttribute() 메서드가 반환하는 값이 Object 타입. 이를 문자열로 변환하기 위함
String name = pageContext.getAttribute("pageStName").toString();
int age = (Integer)pageContext.getAttribute("pageStAge");
String dept = pageContext.getAttribute("pageStDept").toString();
int grade = (Integer)pageContext.getAttribute("pageStGrade");
%>
	
<h2> include 된 파일에서 page 영역 읽어오기</h2>
<%@ include file="pageInclude.jsp" %>

<h2> 페이지 이동 후 page 영역 값 조회</h2>
<a href="pageContext2.jsp">이동하기</a> <!-- 서로 다른 페이지임으로 공유안됨 -->
</html>