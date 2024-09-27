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
<h2>회원 등록</h2>
<form name="frmRegist" id="frmRegist" action="member_regist_ok.jsp" method="POST">
<table>
<tbody>
<tr>
	<th class="input_title">아이디 : </td>
	<td class="input_col">
		<input type="text" name="member_id" id="member_id" value="" 
						maxlength="20" class="input_box_id"/>
	</td>
</tr>
<tr>
	<th class="input_title">이름 : </td>
	<td class="input_col">
		<input type="text" name="name" id="name" value="" maxlength="10" class="input_box" />
	</td>
</tr>
<tr>
	<th class="input_title">비밀번호 : </td>
	<td class="input_col">
		<input type="password" name="pwd" id="pwd"
						 value="" maxlength="20" class="input_box" />
	</td>
</tr>
<tr>
	<th colspan="4" class="align_center"> 
		<input type="submit" id="btnRegist" value="등록" />
		<input type="button" id="btnCancel" value="취소" />
	</td>
</tr>
</tbody>
</table>
</form>

<script>
const btnRegist = document.getElementById("btnRegist");
btnRegist.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const frm = document.querySelector("#frmRegist");
	const memberId = frm.member_id.value;
	const memberName = frm.name.value;
	const pwd = frm.pwd.value;
	
	if ( memberId.length < 4 || memberId.length > 20 ) {
		alert("아이디를 4자리 이상 20자리 이하로 입력하세요.");
		frm.member_id.focus();
		return;
	}
	if ( memberName.length < 4 || memberName.length > 20 ) {
		alert("이름을 입력하세요.");
		frm.name.focus();
		return;
	}
	if ( pwd.length < 4 || pwd.length > 20 ) {
		alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요.");
		frm.pwd.focus();
		return;
	}

	//frm.action = "member_regist_ok.jsp";
	//frm.method = "POST";
	frm.submit();
});

</script>
</body>
</html>