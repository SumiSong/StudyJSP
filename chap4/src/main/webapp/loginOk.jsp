<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public void setCookie(HttpServletResponse res, String key, HttpServletRequest req, String value){
	Cookie cookie = new Cookie(key,value);
	cookie.setPath(req.getContextPath());
	cookie.setMaxAge(60*60*24);
	res.addCookie(cookie);
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
String check = request.getParameter("save_id_flag");
//addInfo(response, "user1", request, "1234");
if(user_id == null || user_id.length() < 3 || user_id.length() > 10){
	out.print("아이디를 다시 입력하시오");
}

if(pwd == null || pwd.length() < 3 || pwd.length() > 15){
	out.print("비밀번호를 다시 입력하시오");
}

if(check != null && check.equals("Y") ){
	setCookie(response, "user1", request, "1234");
}
response.sendRedirect("login.jsp");
%>
</body>
</html>