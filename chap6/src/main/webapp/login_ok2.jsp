<%@page import="utils.CommonUtils"%>
<%@page import="fullstack7.member.MemberDAO"%>
<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="inc_func.jsp" %>

<%

String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");
String saveIdFlag = request.getParameter("save_id_flag");

String dbDriver = application.getInitParameter("MariaDriver");
String dbURL = application.getInitParameter("MariaURL");
String dbId = application.getInitParameter("dbId");
String dbPwd = application.getInitParameter("dbPwd");


MemberDAO dao = new MemberDAO(dbDriver, dbURL, dbId, dbPwd);
MemberDTO dto = dao.getMemberInfo(user_id, pwd);
dao.close();

if (dto != null && dto.getMemberId() != null) {
    session.setAttribute("memberId", dto.getMemberId());
    session.setAttribute("memberName", dto.getName());
    
    if (saveIdFlag != null && saveIdFlag.equals("Y")) {
        CommonUtils COOKs = new CommonUtils();
        COOKs.setCookiesInfo(request, response, "/", 60*60*24*30, "", "save_id_flag", "Y"); // 30일 유지
        COOKs.setCookiesInfo(request, response, "/", 60*60*24*30, "", "save_user_id", dto.getMemberId());
    }
    
    response.sendRedirect("login2.jsp");
} else {
    out.print("<script>");
    out.print("alert('아이디 또는 비밀번호가 잘못되었습니다.');");
    out.print("window.location.replace('login.jsp');");
    out.print("</script>");
    out.close();
}








// if (user_id == null || user_id.length() < 4 || user_id.length() > 20 ) {
// 	out.print("<script>");
// 	out.print("alert('아이디 정보가 올바르지 않습니다.');");
// 	out.print("window.location.replace('login2.jsp');");
// 	out.print("</script>");
// 	out.close();
// }
// if (pwd == null || pwd.length() < 4 || pwd.length() > 20 ) {
// 	out.print("<script>");
// 	out.print("alert('비밀번호 정보가 올바르지 않습니다.');");
// 	out.print("window.location.replace('login2.jsp');");
// 	out.print("</script>");
// 	out.close();
// }


// 아이디/비밀번호 체크 플래그
// boolean check_id_flag = false;
// boolean check_pwd_flag = false;

// String sql = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId = ?";
// DBConnPool DBPool = new DBConnPool();
// PreparedStatement psmt = DBPool.con.prepareStatement(sql);
// psmt.setString(1, user_id);
// ResultSet rs = psmt.executeQuery();
// if ( rs.next() ) {
// 	check_id_flag = true;
	
// 	if ( pwd.equals(rs.getString("pwd")) ) {
// 		check_pwd_flag = true;
// 	}
// }

// DBPool.close();

// if ( saveIdFlag != null && saveIdFlag.equals("Y") ) {
// 	setCookiesInfo(request, response, "/", 10, "", "save_id_flag", memberDTO.getSaveIdFlag());
// 	setCookiesInfo(request, response, "/", 10, "", "save_user_id", memberDTO.getMemberId());
// }

//String sql = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ?;";
//JDBConnect jdbc = new JDBConnect();
//PreparedStatement psmt = jdbc.con.prepareStatement(sql);
//psmt.setString(1, user_id);
//ResultSet rs = psmt.executeQuery();


// String sql = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ?;";
// DBConnPool pool = new DBConnPool();
// PreparedStatement psmt = pool.con.prepareStatement(sql);
// psmt.setString(1, user_id);
// ResultSet rs = psmt.executeQuery();


	
	
// }

//response.sendRedirect("login2.jsp");
// pool.close();

%>
