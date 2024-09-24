<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public void setCookie(HttpServletResponse res, String key, HttpServletRequest req, String value){
	Cookie cookie = new Cookie(key,value);
	cookie.setPath(req.getContextPath());
	cookie.setMaxAge(3600);
	res.addCookie(cookie);
}

public String getCookie(HttpServletRequest req, String key){
	Cookie[] cookies = req.getCookies();
	if (cookies != null) {
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			if(cookieName.equals(key)){
				return cookieValue;
			}
		}
	}
	return "쿠키 없음";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1. 쿠키(cookie) 설정</h2>
<%
// Cookie cookie = new Cookie("cookie1", "쿠키값1");
// cookie.setPath(request.getContextPath()); 
// cookie.setMaxAge(3600);
// response.addCookie(cookie);
%>

<h2>2. 쿠키(cookie) 값 확인</h2>
<%
// Cookie[] cookies = request.getCookies();
// if(cookies != null){
// 	for(Cookie c : cookies){
// 		String cookieName = c.getName();
// 		String cookieValue = c.getValue();
// 		out.print(String.format("%s : %s<br>", cookieName, cookieValue));
// 	}
// }
%>
<%
setCookie(response, "cookie2", request, "쿠키값2");
String cookie = getCookie(request, "cookie2");
if(cookie != null){
	out.print("쿠키값: " + cookie);
}
else{
	out.print("쿠키 없음");
}
%>

<h2>3. 페이지 이동 후 쿠키(cookie) 값 확인</h2>
<a href="cookie2.jsp">페이지 이동</a>
</body>
</html>