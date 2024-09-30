<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	background-color:lightgray;
}
</style>
</head>
<body>
<% 
BbsDAO dao = new BbsDAO();
List<BbsDTO> list = dao.getBbsList();
%>
<h2>게시판 목록</h2>
<table>
	<th>선택</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>등록일</th>
	<th>삭제</th>
	<tbody>
	<form id="frmList" action="frmList" method="POST">
<%
for(BbsDTO i : list){
%>
		<tr>
			<td><input type="checkbox" name="bbs_idx" id="bbs_idx" value=""></td>
			<td><a href="view.jsp?title=<%= i.getTitle() %>"><%= i.getTitle() %></td>
			<td><%= i.getMemberId() %></td>
			<td><%= i.getReadCnt() %></td>
			<td><%= i.getRegDate() %></td>
			<td><a href="delete_ok.jsp?title=<%= i.getTitle() %>"><input type="button" id="btnDelete" value="글삭제" /></td>
		</tr>
<%
}
%>
		<tr>
			<td colspan="7" class="align_center"> << 1 | 2 | 3 >> </td>
		</tr>
		<tr>
			<td colspan="6" class="align_center"> 
				<input type="button" id="btnRegist" value="글등록" />
				<input type="submit" id="btnDeleteAll" value="체크 박스 값만 삭제">
			</td>
			
		</tr>
	</tbody>
</table>
</form>
</body>
<script>
const btnRegist = document.getElementById("btnRegist")
	btnRegist.addEventListener("click", function(){
		location.href="regist.jsp";
	});
</script>
</html>