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
<h2>회원 등록</h2>
<!-- <form name="frmRegist" id="frmRegist" action="" method="post"> -->
<!-- <table> -->
<!-- 	<tbody> -->
<!-- 		<tr> -->
<!-- 			<th class="input_title">아이디: </th> -->
<!-- 			<td><input type="text" name="member_id" id="member_id" value="" maxlength="20" class="input_box_id"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th class="input_title">이름: </th> -->
<!-- 			<td><input type="text" name="name" id="name" value="" maxlength="10"  class="input_box"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th class="input_title">비밀번호: </th> -->
<!-- 			<td><input type="password" name="pwd" id="pwd" value="" class="input_box"></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="4" class="align_center"> -->
<!-- 				<input type="button" id="btnRegist" value="등록" /> -->
<!-- 				<input type="button" id="btnDelete" value="삭제" /> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</tbody> -->
<!-- </table> -->
<!-- </form> -->
<form id="frmRegist" id="frmRegist" action="" method="post">
<table>
	<tbody>
	<tr>
		<td class="input_title">아이디</td>
		<td><input type="text" name="memberId" value="" maxlength="20"/></td>
	</tr>
	<tr>
		<td class="input_title">이름</td>
		<td><input type="text" name="name" value="" maxlength="20"/></td>
	</tr>
	<tr>
		<td class="input_title">비밀번호</td>
		<td><input type="password" name="pwd" value="" maxlength="20"/></td>
	</tr>
	<tr>
		<td colspan="5" class="center"></td>
	</tr>
	<tr>
		<td colspan="5" class="center">
			<input type="button" id="btnRegist" value="등록" />
			<input type="button" id="btnCancle" value="취소" />
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
	
	const frm = document.getElementById('frmRegist');
	const memberId = frm.memberId.value;
	const memberName = frm.name.value;
	const pwd = frm.pwd.value;
	if(memberId.length < 4 || memberId.length > 20){
		alert("아이디를 4자리 이상 20자리 이하로 입력하세요");
		frm.memberId.focus();
		return;
	}
	if(memberName.length < 2 || memberName.length > 20){
		alert("이름을 입력하세요");
		frm.name.focus();
		return;
	}
	if(pwd.length < 4 || pwd.length > 20){
		alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요");
		frm.pwd.focus();
		return;
	}
	
	frm.action = "./member_regist_ok.jsp";
	frm.method= "POST";
	frm.submit();
});
</script>
</body>
</html>