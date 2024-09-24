<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>내장 객체 - application 객체</h2>
<h2>1. web.xml에 설정한 정보 조회</h2>
초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %>
<hr>
<h2>서버의 물리적 경로 조회</h2>
application 객체 이용 : <%= application.getRealPath("/chap2") %> <!-- 이클립스의 물리적 정보를 가져오게 됨 -->
<hr>
<h2>선언부에서 application 객체 사용</h2>
<%!
public String getMyRealPath(){
	return this.getServletContext().getRealPath("/chap2"); // 서블릿 자기 자신
}
public String getMyRealPath(ServletContext app){
	return app.getRealPath("/chap2"); // 서블릿 자기 자신
}
%>
<ul>
	<li>this 사용 : <%=getMyRealPath() %></li>
	<li>매개변수 전달 : <%=getMyRealPath(application) %></li>
</ul>
</body>
</html>