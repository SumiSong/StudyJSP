<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String memberId = request.getParameter("memberId");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");

if(memberId == null || memberId.length() < 3 || memberId.length() > 10){
	out.print("<script>");
	out.print("alert('아이디 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}
if(name == null || name.length() < 2 || name.length() > 10){
	out.print("<script>");
	out.print("alert('이름 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}

if(pwd == null || pwd.length() < 3 || pwd.length() > 15){
	out.print("<script>");
	out.print("alert('비밀번호 정보가 올바르지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
	out.close();
}

response.sendRedirect("member_list1.jsp");
%>

<%
String sql = "INSERT INTO tbl_member(memberId, name, pwd) VALUES(?,?,?)";
JDBConnect jdbc = new JDBConnect(); // 커넥션 가져오기
PreparedStatement psmt = jdbc.con.prepareStatement(sql); //동적쿼리를 만들 때 
psmt.setString(1, memberId);
psmt.setString(2, name);
psmt.setString(3, pwd);
int intResult = psmt.executeUpdate(); // 리턴 타입은 integer 타입 (insert,updqte, delete 용도)
jdbc.close();

if(intResult > 0){
	out.print("<script>");
	out.print("alert(회원 정보를 등록하였습니다.)");
	out.print("window.location.href='member_list1.jsp';");
	out.print("</script>");
}
else{
	// request.getRequestDispatcher("member_regist.jsp").forward(request, response); 이것도 가능
	out.print("<script>");
	out.print("alert(회원 정보를 다시 입력하시오.)");
	out.print("history.back();");
	out.print("</script>");
}
%>
