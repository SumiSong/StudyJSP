<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- <% --%>
// if (session != null) {
//     session.invalidate();
// }
// response.sendRedirect("login2.jsp");
<%-- %> --%>

<%
session.removeAttribute("memberId");
session.removeAttribute("memberName");

session.invalidate();

out.print("<script>");
out.print("alert('로그아웃 되었습니다.');");
out.print("window.location.replace('login2.jsp');");
out.print("</script>");
out.close();
//response.sendRedirect("login.jsp");
%>
