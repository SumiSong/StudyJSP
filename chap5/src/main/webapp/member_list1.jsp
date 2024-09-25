<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table,th, tr,td, tbody{
	border:1px solid black;
	border-collapse:collapse;
}
th{
text-aligin: center;
width:150px;
height:40px;
}
</style>
</head>
<body>
<h2>회원 목록 조회(statement)</h2>
<%
JDBConnect jdbc = new JDBConnect();
String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member";
Statement stmt = jdbc.con.createStatement();
ResultSet rs = stmt.executeQuery(sql); //sql 조회(executeQuery) 용도 | executeUdate(수정 삭제, 추가)
//PreparedStatement psmt = jdbc.con.prepareCall(sql); // 여기서 컴파일 시키기 때문에 
//ResultSet rs = psmt.executeQuery(); //아래에서 쿼리 필요 없음
%>
<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
<%
while(rs.next()){
%>
		<tr>
			<td><a href="member_regist_view.jsp?memberId=<%=rs.getString(1)%>"><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getDate(4) %></td>
		</tr>
<%
}
jdbc.close();
%>
		<tr>
			<td colspan="4" class="align_center"><<1 | 2 | 3>> </td>
		</tr>
		<tr>
			<td colspan="4" class="align_center">
				<input type="button" id="btnRegist" value="회원등록" />
				<input type="button" id="btnDelete" value="회원삭제" />
			</td>
		</tr>
	</tbody>
</table>
<script>
const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(){
	location.href="member_regist.jsp";
});
</script>
</body>
</html>