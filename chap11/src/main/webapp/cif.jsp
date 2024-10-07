<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL - core - if</h2>
<c:set var="num1" value= "10"/>
<c:set var="str1" value= "문자열"/>


<h3>JSTL if 태그로 짝수/홀수 판단</h3>
<c:if test="${num1 mod 2 eq 0}" var="even">
	${num1} 은 짝수
	<br>even : ${even}
</c:if>

<c:if test="${not even}">
	${num1} 은 홀수
	<br>even : ${even}
</c:if>
<br>
<c:if test="${str1 == '테스트'}" var="str1Result">
	문자열은 ${str1}입니다.
</c:if>

<c:if test="${not str1Result}">
	문자열은 '테스트'가 아닙니다.
</c:if>

<c:if test="${true}">
	<br>
	true
</c:if>

<c:if test="True">
	<br>
	True
</c:if>

<c:if test="tRue" var="tResult">
	<br>
	tRue
</c:if>
<br>${tResult}

<c:if test="tRue " var="tResult2">
	<br>
	tRuE
</c:if>
<br>${tResult2}


<%-- <c:if test="${num1 mod 2 ne 0}" var="odd"> --%>
<%-- 	${num1} 은 홀수 --%>
<%-- </c:if> --%>
<%-- <c:if test="${empty odd}" var="odd_result"> --%>
<%-- <br>odd : ${odd } --%>
<%-- </c:if> --%>
</body>
</html> 