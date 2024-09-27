<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="common.DBConnPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%!
public void setCookie(HttpServletResponse res, String key, String value) {
    Cookie cookie = new Cookie(key, value);
    cookie.setPath("/"); // 경로를 루트로 설정
    cookie.setMaxAge(60*60*24); // 쿠키 유효 시간 설정 (1일)
    res.addCookie(cookie); // 쿠키 저장
}

%>

<%
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
String saveIdFlag = request.getParameter("save_id_flag");
%>

<%

MemberDTO memberDTO = new MemberDTO();
memberDTO.setMemberId(user_id);
memberDTO.setName("이름");
memberDTO.setSaveIdFlag(saveIdFlag);

if (user_id == null || user_id.length() < 4 || user_id.length() > 20 ) {
	out.print("<script>");
	out.print("alert('아이디 정보가 올바르지 않습니다.');");
	out.print("window.location.replace('login.jsp');");
	out.print("</script>");
	out.close();
}
if (pwd == null || pwd.length() < 4 || pwd.length() > 20 ) {
	out.print("<script>");
	out.print("alert('비밀번호 정보가 올바르지 않습니다.');");
	out.print("window.location.replace('login.jsp');");
	out.print("</script>");
	out.close();
}

if(saveIdFlag != null && saveIdFlag.equals("Y") ){
	 setCookie(response, "user_id", memberDTO.getMemberId()); // 아이디 쿠키 저장
	 setCookie(response, "save_id_flag", "Y"); // 체크 상태 저장
	
}

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
		session.setAttribute("memberId", memberDTO.getMemberId());
		session.setAttribute("name", memberDTO.getName());
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
