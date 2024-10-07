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
<h2>request 값 처리</h2>
<%
String name = request.getParameter("name");
String memberId = request.getParameter("memberId");
String gender = request.getParameter("gender");
String school = request.getParameter("school");
String[] hobby = request.getParameterValues("hobby");
String hobbies ="";

MemberDTO member = new MemberDTO();
member.setName(name);
member.setMemberId(memberId);
member.setGender(gender);
member.setSchool(school);
if(hobby != null){
	for(int i=0; i<hobby.length; i++){
		hobbies += hobby[i]+",";
	}
}
member.setHobby(hobbies);

request.setAttribute("memberObj", member);
%>
<ul>
	<li>이름 : <%=name %></li>
	<li>성별 : <%=gender %></li>
	<li>학력 : <%=school %></li>
	<li>취미 : <%
	for(String i : hobby){
		out.print(i + "	");
	}%></li>
	<li>회원정보 : 
	<ul>
		<li>이름 : <%=member.getName() %></li>
		<li>아이디 : <%=member.getMemberId() %></li>
		<li>성별 : <%=member.getGender() %></li>
		<li>학력 : <%=member.getSchool() %></li>
		<li>취미 : <%=member.getHobby() %></li>
	</ul>
	</li>
</ul>


<h2>EL - 폼 값 전송하기</h2>
<ul>
	<li>이름 : ${param.name} </li>
	<li>성별 : ${param.gender} </li> 
	<li>학력 : ${param.school} </li>
	<li>취미 : ${paramValues.hobby[0]} ${paramValues.hobby[1]}</li>
	<li>회원정보 : 
	<ul>
		<li>이름 : ${memberObj.name }</li>
		<li>아이디 : ${memberObj.memberId }</li>
		<li>성별 : ${memberObj.gender }</li>
		<li>학력 : ${memberObj.school } </li>
		<li>취미 :${memberObj.hobby }</li>
	</ul>
	</li>
</ul>
<jsp:forward page="form1_ok_forward.jsp">
	<jsp:param name="age" value="30"/>
	<jsp:param name="email" value="email@www.net"/>
</jsp:forward>
</body>
</html>