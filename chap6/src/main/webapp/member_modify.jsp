<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="fullstack7.member.MemberDAO"%>
<%@page import="java.lang.reflect.Member"%>
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
<%
String member_id = request.getParameter("member_id");



//DAO롤 아이디 전달
MemberDAO dao = new MemberDAO();
List<MemberDTO> userInfo = dao.getMemberInfo(member_id);
for (MemberDTO i : userInfo) {
%>
<h2>회원 정보 수정</h2>
<form name="frmModify" id="frmModify" action="member_modify_ok.jsp" method="POST">
<table>
<tbody>
<tr>
	<th class="input_title">아이디 : </td>
	<td class="input_col">
		<input type="text" name="member_id" id="member_id" value="<%=i.getMemberId()%>" 
						maxlength="20" class="input_box_id" />
	</td>
</tr>
<tr>
	<th class="input_title">이름 : </td>
	<td class="input_col">
		<input type="text" name="name" id="name" value="<%=i.getName()%>" maxlength="10" class="input_box" />
	</td>
</tr>
<tr>
	<th class="input_title">비밀번호 : </td>
	<td class="input_col">
		<input type="password" name="pwd" id="pwd"
						 value="<%=i.getPwd() %>" maxlength="20" class="input_box" />
	</td>
</tr>
<tr>
	<th colspan="4" class="align_center"> 
		<input type="submit" id="btnModify" value="수정" />
		<input type="button" id="btnCancel" value="취소" />
	</td>
</tr>
</tbody>
</table>
</form>
<%
}
%>

<script>
const btnModify = document.getElementById("btnModify");
btnModify.addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const frm = document.querySelector("#frmModify");
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
const btnCancel = document.getElementById("btnCancel");
btnCancel.addEventListener("click", function(e){
	//history.back();
	window.location.replace('member_view.jsp?member_id=<%=member_id %>');
});
</script>
</body>
</html>