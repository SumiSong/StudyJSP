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
<h2>JSTL - core - choose</h2>
<c:set var="num1" value= "200"/>


<h3>JSTL if 태그로 짝수/홀수 판단</h3>
<c:choose>
	<c:when test="${num1 % 2 == 0}"> ${num1 }은 짝수 </c:when>
	<c:otherwise>${num1 }은 홀수</c:otherwise>
</c:choose>

<hr>

<h3>평균값 출력하기</h3>
<form>
<span for="math">수학</span>
<input type="text" name="math" id="math" value="90"/><br>
<span for="eng">영어</span>
<input type="text" name="eng" id="eng" value="44"/><br>
<span for="science">과학</span>
<input type="text" name="science" id="science" value="80"/><br>
<br> <input type="submit" value="평균구하기"/><br>

<c:if test="${not (empty param.math and empty param.eng and empty param.science)}">
	<c:set var="avg" value="${(param.math + param.eng + param.science) / 3}"/>
	평균 점수 : ${avg}
	<br> 학점 : 
	<c:choose>
		<c:when test="${avg >= 90}">A</c:when>
		<c:when test="${avg ge 80}">B</c:when>
		<c:when test="${avg ge 70}">C</c:when>
		<c:when test="${avg ge 60}">D</c:when>
		<c:otherwise>F</c:otherwise>
	</c:choose>
</c:if>
</form>
</body>
</html> 