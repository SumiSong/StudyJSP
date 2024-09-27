<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="fullstack7.member.MemberDAO"%>
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
	width:150px;
	height:40px;
	backgroud-color:blue;
}
</style>

</head>
<body>
<h2>획원 목록 조회(statement)</h2>

<%
// String dbDriver = application.getInitParameter("MariaDriver");
// String dbURL = application.getInitParameter("MariaURL");
// String dbId = application.getInitParameter("dbId");
// String dbPwd = application.getInitParameter("dbPwd");


//MemberDAO dao = new MemberDAO(dbDriver, dbURL, dbId, dbPwd);
MemberDAO dao = new MemberDAO();
List<MemberDTO> dtoList = dao.getMemberList();
dao.close();

%>
<form name="list" id="list" action="member_delete.jsp" method="post">
<table>
	<thead>
		<tr><th for = "user_id2">아이디</th><th>이름</th><th>비밀번호</th><th>삭제</th><th>삭제</th></tr>
	</thead>
	<tbody>
<%
// MemberDAO dao = new MemberDAO();
// List<MemberDTO> dtoList = dao.getMemberList();
// dao.close();

//if ( rs != null ){
// 	while (rs.next()) {
for (MemberDTO mem : dtoList) {
%> 
		<tr>
			<td><a href="member_view.jsp?member_id=<%=mem.getMemberId()%>"><%=mem.getMemberId() %></a></td>
			<td><%=mem.getName() %></td>
			<td><%=mem.getPwd() %></td>
			<td><a href="member_delete.jsp?member_id=<%=mem.getMemberId() %>"><input type="button" id="btnDelete" value="회원삭제" /></td>
			<td><input type="checkbox" id="popFlag" name="member_id" value="<%=mem.getMemberId()%>"/></td>
			
		</tr>
<%
}
%>
		<tr>
			<td colspan="6" class="align_center"> << 1 | 2 | 3 >> </td>
		</tr>
		<tr>
			<td colspan="6" class="align_center"> 
				<input type="button" id="btnRegist" value="회원등록" />
				<input type="submit" id="btnDelete" value="체크 박스 값만 삭제">
			</td>
		</tr>
	</tbody>
</table>
</form>

<script>
const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(){
	location.href="member_regist.jsp";
});


</script>


</body>
</html>