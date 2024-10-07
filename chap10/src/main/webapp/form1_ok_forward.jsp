<%@page import="net.fullstack7.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>EL - 폼 값 전송하기</h2>
<ul>
	<li>이름 : ${param.name} </li>
	<li>아이디 : ${param.memberId} </li>
	<li>성별 : ${param.gender} </li> 
	<li>학력 : ${param.school} </li>
	<li>취미 : ${paramValues.hobby[0]} ${paramValues.hobby[1]}</li>
	<li>회원정보 : 
	<ul>
		<li>이름 : ${memberObj.name }</li>
		<li>아이디 : ${memberObj.memberId }</li> <!--// 특수문자가 있을 때 도트로 접근할 수 없음 -->
		<li>성별 : ${memberObj.gender }</li>
		<li>학력 : ${memberObj.school } </li>
		<li>취미 :${memberObj.hobby }</li>
	</ul>
	</li>
</ul>

<h2>EL - forward 매개변수 값 처리</h2>
<ul>
	<li>나이 : ${param.age} </li>
	<li>이메일 : ${param.email} </li>
	
</ul>
</body>
</html>