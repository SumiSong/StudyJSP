<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.input_content{
width:500px;
height:200px;
}
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
				<textarea name="content" id="content" clas="input_content"></textarea>
			</tr>
				<td colspan="6" class="align_center"> 
					<input type="submit" id="btnRegist" value="등록하기" />
					<input type="button" id="btnDelete" value="취소" />
					<input type="button" id="btnToList" value="목록으로">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>