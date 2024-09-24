<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public String getCookie(Cookie[] cookies, String key){
	if (cookies != null) {
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			if(cookieName.equals(key)){
				return cookieValue;
			}
		}
	}
	return null;
}
%>
<%
String save_id_flag = getCookie(request.getCookies(), "save_id_flag");
String user_id = getCookie(request.getCookies(), "user_id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 페이지</h2>
<form name="frmLogin" id="frmLogin" action="loginOk.jsp" method="post">
	<span for="user_id">아이디</span> <input type="text" id="user_id" name="user_id" value="<%= (save_id_flag != null && save_id_flag.equals("Y")) ? "checked" : "" %>" maxlength="20"/>
	<input type="checkbox" id="save_id_flag" name="save_id_flag" value="<%= (save_id_flag != null && save_id_flag.equals("Y")) ? "checked" : "" %>" > 아이디 저장
	<br>
	<span for="pwd">아이디</span> <input type="password" id="pwd" name="pwd" value=""/>
	<br>
	<input type="submit" id="btnLogin" value="로그인">
</form> 
</body>
</html>

<!--아이디 저장하기 체크, 로그인 후에 아이디가 노출되게 코드 작성  -->