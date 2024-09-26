<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
if (session != null) {
    session.invalidate();
}
response.sendRedirect("login.jsp");
%>
