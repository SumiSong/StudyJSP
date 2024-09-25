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

.input_col{
width:400px;
height:20px
}

.input_box{
width:400px;
height:20px
}

.input_box_id{
width:100px;
height:20px
}
</style>
</head>
<body>
<h2>회원 조회</h2>
<%
String memberId = request.getParameter("memberId");
String name = "";
String pwd = "";
%>
<%
String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member WHERE memberId = ?";
JDBConnect jdbc = new JDBConnect();
PreparedStatement psmt = jdbc.con.prepareStatement(sql);
psmt.setString(1, memberId); // 파라미터 값이 있기 때문에 넣어야함
ResultSet rs = psmt.executeQuery(); 

if(rs.next()){
	memberId = rs.getString(1);
	name = rs.getString(2);
	pwd = rs.getString(3);
}
%>
<form id="frmModify" action="member_modify.jsp" method="post">
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=memberId%></td>
				<td><%=name%></td>
				<td><%=pwd%></td>
			</tr>
			<tr>
				<td colspan="3" >
					<input type="button" id="btnModify" value="수정" />
					<input type="button" id="btnList" value="목록으로" />
				</td>
			</tr>
	</table>
</form>
<script>
	const btnModify = document.getElementById("btnModify");
	btnModify.addEventListner("click", function(){
		location.href="member_modify.jsp";
	})
	
	const btnList = document.getElementById("btnList");
	btnList.addEventListner("click", function(){
		location.href="member_list1.jsp";
	})
</script>
</body>
</html>