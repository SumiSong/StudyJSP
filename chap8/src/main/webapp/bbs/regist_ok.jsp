<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");


BbsDAO dao = new BbsDAO();
boolean result = dao.setRegistBbs(title, content, "user12");
dao.close();

if(result == true){
	out.print("<script>");
	out.print("alert('등록하였습니다.');");
	out.print("window.location.href='list.jsp';");
	out.print("</script>");
	out.close();
}
else{
	out.print("<script>");
	out.print("alert('등록 실패');");
	out.print("history.back()");
	out.print("</script>");
	out.close();
}


%>