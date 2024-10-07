<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
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
<h2>JSTL - core - 객체할당</h2>
<c:set var="num1" value= "10"/>
<c:set var="num2" value= "${num1 mod 5}"/>
<c:set var="date1" value= "<%= new Date() %>"/>
<c:set var="str1">문자열값지정</c:set>

<h3>List 컬렉션 사용</h3>
<%
ArrayList<MemberDTO> mList = new ArrayList<MemberDTO>();
mList.add(new MemberDTO("user1", "홍길동1", "남성"));
mList.add(new MemberDTO("user2", "홍길동2", "남성"));
mList.add(new MemberDTO("user3", "홍길동3", "남성"));
%>

<h3>EL 을 이용하여 출력</h3>
<c:set var="mList" value=<%=mList %> scope="request"/>
<ul>
<li>아이디 : ${requestScope.mList[0].memberId} }</li>
<li>이름: ${mList[0].name} }</li>
<li>성별: ${mList[0].gender} }</li>
<li>아이디 : ${requestScope.mList[1].memberId} }</li>
<li>이름: ${mList[1].name} }</li>
<li>성별: ${mList[1].gender} }</li>
<li>아이디: ${requestScope.mList[2].memberId} }</li>
<li>이름: ${mList[2].name} }</li>
<li>성별: ${mList[2].gender} }</li>
</ul>

<h3>Map 컬렉션 사용</h3>
<%
Map<String, MemberDTO> map = new HashMap<String, MemberDTO>();
map.put("member1", new MemberDTO("user1", "홍길동", "남성"));
map.put("member1", new MemberDTO("user1", "홍길동", "남성"));
map.put("member1", new MemberDTO("user1", "홍길동", "남성"));
%>
<c:set var="mMap" value=<%=map %> scope="request"/>
<ul>
<li>아이디 : ${requestScope.mMap.member1.memberId }</li>
<li>이름: ${mMap.member1.name}</li>
<li>성별: ${mMap.member1.gender}</li>
<li>아이디 : ${requestScope.mMap.member2.memberId }</li>
<li>이름: ${mMap.member2.name}</li>
<li>성별: ${mMap.member2.gender}</li>
<li>아이디 : ${requestScope.mMap.member3.memberId }</li>
<li>이름: ${mMap.member3.name}</li>
<li>성별: ${mMap.member3.gender}</li>
</ul>





<h3>자바 객체 - 생성자 사용</h3>
<c:set var="member" value= '<%= new MemberDTO("user1", "홍길동", "남성") %>' scope="request"/> 
<ul>
	<li>아이디: ${member.memberId }</li>
	<li>이름: ${member.name }</li>
	<li>성별: ${member.gender }</li>
</ul>

<h3>자바 객체 - 자바빈즈 사용</h3>
<c:set var="member2" value="<%= new MemberDTO() %>" scope="request"/> 
<c:set property="memberId" value="user2" target="${member2}" />
<c:set property="name" value="홍길순" target="${member2}" />
<c:set property="gender" value="여성" target="${member2}" />
<ul>
	<li>아이디: ${requestScope.member2.memberId }</li>
	<li>이름: ${member2.name }</li>
	<li>성별: ${member2.gender }</li>
</ul>
</body>
</html>