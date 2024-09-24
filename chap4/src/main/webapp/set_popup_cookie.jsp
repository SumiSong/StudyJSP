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
<%
String popFlag = request.getParameter("popFlag");
if(popFlag != null && popFlag.equals("Y")){
	setCookie(response, "popup_close", request, popFlag);
}
response.sendRedirect("popup.jsp");
%>
