<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
out.print(title);
out.print(content);
BbsDAO dao = new BbsDAO();
boolean result = dao.setModifyBbs(title, content);
dao.close();

if(result == true){
	out.print("<script>");
	out.print("alert('수정되었습니다.');");
	out.print("window.location.href='list.jsp';");
	out.print("</script>");
	out.close();

}else{
	out.print("<script>");
	out.print("alert('수정 실패');");
	out.print("window.location.href='list.jsp';");
	out.print("</script>");
	out.close();
	
}

%>