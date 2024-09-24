<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 처리</h2>
<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
if(user_id.equals("user1") && pwd.equalsIgnoreCase("1234")){
	response.sendRedirect("login_complete.jsp"); // 완전 새로운 페이지로 이동하는 걸로 생각
}
else{
	request.getRequestDispatcher("login.jsp?loginErr=1").forward(request, response); // forward : 화면은 바뀌지만 url은 바뀌지 않음  전송한 데이터를 그대로 유지 , getRequestDispatcher 는 둘 다 바뀜
}
%>
</body>
</html>