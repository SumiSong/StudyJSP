<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.JDBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table,thead,tbody,th,tr,td {
	border:1px solid black;
	border-collapse:collapse;
}
th {
	text-align:center;
	width:120px;
	height:20px;
	backgroud-color:#333333;
}
.input_col {
	width:400px;
	height:20px;
}
.input_box {
	width:300px;
	height:20px;
	margin:2px;
}
.input_box_id {
	width:100px;
	height:20px;
	margin:2px;
}

</style>
</head>
<body>
<h2>회원정보 조회</h2>



<%
String member_id = request.getParameter("member_id");
String name = "";
String pwd = "";

String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member WHERE memberId = ?";

JDBConnect jdbc = new JDBConnect();
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1, member_id);
ResultSet rs = psmt.executeQuery();

if (rs.next()) {
	member_id = rs.getString("memberId");
	name = rs.getString("name");
	pwd = rs.getString(3);
} else {
	out.print("<script>");
	out.print("alert('회원 정보가 존재하지 않습니다.');");
	out.print("window.location.replace('member_list1.jsp');");
	out.print("</script>");
	out.close();
}
%>

<table>
<tbody>
<tr>
	<th class="input_title">아이디 : </td>
	<td class="input_col"><%=member_id %></td>
</tr>
<tr>
	<th class="input_title">이름 : </td>
	<td class="input_col"><%=name %></td>
</tr>
<tr>
	<th class="input_title">비밀번호 : </td>
	<td class="input_col"><%=pwd %></td>
</tr>
<tr>
	<td colspan="4" class="align_center"> 
		<input type="button" id="btnList" value="목록으로" />
		<input type="button" id="btnModify" value="수정하기" />
	</td>
</tr>
</tbody>
</table>

<script>
const btnList = document.getElementById("btnList");
btnList.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	location.href = "member_list1.jsp";
});
const btnModify = document.getElementById("btnModify");
btnModify.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	location.href = "member_modify.jsp?member_id=<%=member_id%>";
});
</script>
</body>
</html>