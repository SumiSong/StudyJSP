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
.input_content{
	width:500px;
	height : 300px;
}
</style>
</style>
</head>
<body>
<h2>회원 등록</h2>
<form  name="frmRegist" id="frmRegist" action="regist_ok.jsp" method="POST">
<table>
	<tbody>
		<tr>
			<th class="input_title">제목 : </th>
			<td>
				<input type="text" id="title" name="title" value="" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<th class="input_title">노출일 : </th>
			<td>
				<input type="date" id="displayDate" name="displayDate" value=""/>
			</td>
		</tr>
		<tr>
		<tr>
			<th class="input_title">글 내용 : </th>
			<td>
			<textarea name="content" id="content" class="input_content"></textarea>
			</td>
		</tr>
			<td colspan="6" class="align_center"> 
				<input type="submit" id="btnRegist" value="등록하기" />
				<input type="button" id="btnCancel" value="취소" />
				<input type="button" id="btnToList" value="목록으로">
			</td>
		</tr>
	</tbody>
</table>
</form>
<script>
const btnCancel = document.getElementById("btnCancel");
btnCancel.addEventListener("click", function(){
	location.href="list.jsp";
})

const btnToList = document.getElementById("btnToList");
btnToList.addEventListener("click", function(){
	location.href="list.jsp";
})
</script>
</body>
</html>