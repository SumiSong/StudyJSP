<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="fullstack7.member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.JDBConnect" %>

<%
String member_id = request.getParameter("member_id");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");

if (member_id == null || member_id.length() < 4 || member_id.length() > 20 ) {
	out.print("<script>");
	out.print("alert('아이디 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (name == null || name.length() < 2 ) {
	out.print("<script>");
	out.print("alert('이름이 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if (pwd == null || pwd.length() < 4 || pwd.length() > 20 ) {
	out.print("<script>");
	out.print("alert('비밀번호 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>
<%

MemberDAO dao = new MemberDAO();

Map<String, String> memberInfo = new HashMap<>();
memberInfo.put("member_id", member_id);
memberInfo.put("name", name);
memberInfo.put("pwd", pwd);

// 회원 등록 결과 
boolean result = dao.setMemberRegist(memberInfo);

if (result == true) {
	out.print("<script>");
	out.print("alert('회원 정보를 등록하였습니다.');");
	out.print("window.location.href='member_list1.jsp';");
	out.print("</script>");
	out.close();
} else {
	out.print("<script>");
	out.print("alert('회원 정보 등록시 에러가 발생하였습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
%>
