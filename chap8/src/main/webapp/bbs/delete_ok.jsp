<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String title = request.getParameter("title");

BbsDAO dao = new BbsDAO();
boolean result = dao.setDeleteBbs(title);


if(result == true){
	out.print("<script>");
	out.print("alert('삭제되었습니다.');");
	out.print("window.location.href='list.jsp';");
	out.print("</script>");
	out.close();
}
else{
	out.print("<script>");
	out.print("alert('삭제 실패임');");
	out.print("window.location.href='list.jsp';");
	out.print("</script>");
	out.close();
}
%>