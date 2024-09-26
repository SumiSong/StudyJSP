<%@page import="common.DBConnPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
String saveIdFlag = request.getParameter("save_id_flag");

//System.out.print(user_id);
//System.out.print(pwd);

%>

<%

// String sql = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ?;";
// JDBConnect jdbc = new JDBConnect();
// PreparedStatement psmt = jdbc.con.prepareStatement(sql);
// psmt.setString(1, user_id);
// ResultSet rs = psmt.executeQuery();
String sql = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ?;";
DBConnPool pool = new DBConnPool();
PreparedStatement psmt = pool.con.prepareStatement(sql);
psmt.setString(1, user_id);
ResultSet rs = psmt.executeQuery();


if(rs.next()){
	System.out.print("aaa");
	String user_id1 = rs.getString("memberId");
	String pwd1 = rs.getString("pwd");
	
	if(user_id.equals(user_id1) && pwd.equals(pwd1)){
		pool.close();
		// 세션 처리
		session.setAttribute("memberId", user_id);
		session.setAttribute("name", "");
		response.sendRedirect("login.jsp");
	}
	else{
		out.print("<script>");
		out.print("alert('로그인 정보가 올바르지 않습니다.');");
		out.print("window.location.replace('login.jsp');");
		out.print("</script>");
		out.close();
	}
	
	
}
else{
	out.print("ccc");
}

pool.close();
%>
