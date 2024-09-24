<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! //!있으면 선언부(멤버변수, 메서드 선언)
String str1 = "JSP";
String str2 = "Hello";
%>

<h2><%=str1 %>테스트 페이지 입니다.</h2> <!-- 표현식. 반드시 %= 붙어야 함 -->

<p>
	<% //스크립틀릿 자바코드 작성하는 부분
		out.println(str2 + "" + str1);
	%>
</p>
</body>
</html>