<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String title = request.getParameter("title");
BbsDAO dao = new BbsDAO();
BbsDTO info = dao.getBbsInfo(title);
%>
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
	<table>
		<tbody>
<%
if(info != null){
%>
			<tr>
				<th class="input_title">제목: </th>
				<td>
					<%= info.getTitle() %>
				</td>
				
			</tr>
			<tr>
				<th class="input_title">작성자:  </th>
				<td>
				 	<%= info.getMemberId() %>
				</td>
			</tr>
			<tr>
				<th class="input_title">글내용 : </th>
				<td>
					<%= info.getContent() %>
				</td>
			</tr>
				<td colspan="6" class="align_center">
				<input type="button" id="btnModifyOk" value="수정" />
					<input type="button" id="btnDelete" value="삭제" />
					<input type="submit" id="btnToList" value="목록으로">
				</td>
			</tr>
		</tbody>
	</table>
<% } else { %>
<p>해당 정보를 찾을 수 없습니다.</p>
<% } %>
</body>
<script>
const btnModifyOk = document.getElementById("btnModifyOk");
btnModifyOk.addEventListener("click", function(){
	location.href="modify.jsp?title=<%= info.getTitle() %>";
})

const btnDelete = document.getElementById("btnDelete");
btnDelete.addEventListener("click", function(){
	location.href="delete_ok.jsp?title=<%= info.getTitle() %>";
})

const btnToList = document.getElementById("btnToList");
btnToList.addEventListener("click", function(){
	location.href="list.jsp";
})

</script>
</html>