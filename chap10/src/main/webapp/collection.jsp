<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>List 컬렉션</h2>
<%
List<MemberDTO> dto = new ArrayList<>();
MemberDTO m1 = new MemberDTO();
m1.setMemberId("user1");
m1.setName("홍길동");
m1.setGender("남성");

dto.add(m1);

m1 = null;
m1 = new MemberDTO();
m1.setMemberId("user2");
m1.setName("홍길동2");
m1.setGender("여성");

dto.add(m1);

pageContext.setAttribute("memberList", dto);
%>
<ul>
	<li>컬렉션 요소 0: 
	<ul>
		<li>아이디 : ${memberList[0].memberId }</li>
		<li>이름 : ${memberList[0].name }</li>
		<li>성별 : ${memberList[0].gender }</li>
	</ul>
	<li>컬렉션 요소 1: 
	<ul>
		<li>아이디 : ${memberList[1].memberId }</li>
		<li>이름 : ${memberList[1].name }</li>
		<li>성별 : ${memberList[1].gender }</li>
	</ul>
</ul>
<%
Map<String, String> map = new HashMap<>();
map.put("키1", "값1");
map.put("memberId", "memberId");
map.put("name", "name");
map.put("gender", "gender");
pageContext.setAttribute("map", map);
%>
<li>map 요소: 
<ul>
	<li>키1 : ${map["키1"]}</li>
	<li>아이디 : ${map.memberId }</li>
	<li>이름 : ${map.name }</li>
	<li>성별 : ${map.gender }</li>
</ul>
</body>
</html>