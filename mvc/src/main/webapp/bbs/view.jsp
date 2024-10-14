<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
// String idx = request.getParameter("idx");
// BbsDAO dao = new BbsDAO();
// BbsDTO info = dao.getBbsInfo(idx);
// dao.close();
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
<form action="modify.jsp?idx=${info.getIdx()}" method="POST">
	<table>
		<tbody>
			<tr>
				<th class="input_title">번호</th>
				<td>
					${info.getIdx()}
				</td>
			</tr>
			<tr>
				<th class="input_title">작성자</th>
				<td>
					${info.getMemberId()}
				</td>
			</tr>
			<tr>
				<th class="input_title">제목</th>
				<td>
					${info.getTitle()}
				</td>
			</tr>
			<tr>
			<tr>
				<th class="input_title">내용 : </th>
				<td>
					${info.getContent()}
				</td>
			</tr>
				<td colspan="6" class="align_center"> 
					<input type="submit" id="btnModify" value="수정하기" />
					<input type="button" id="btnToList" value="목록으로">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
<script>
const btnToList = document.getElementById("btnToList");
btnToList.addEventListener("click", function(){
	location.href="list.jsp";
})
</script>
</html>
