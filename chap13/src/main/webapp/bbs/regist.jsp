<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일 업로드</h2>
<form name = "frmRegist" id="frmRegist" action="/chap13/bbs/BbsRegist.do" method="POST" enctype="multipart/form-data" >
<fieldset>
	<legend>파일 업로드</legend>
	<span>${errMsg}</span>
	<label for="memberId">아이디 : </label>
	<input type="text" name="memberId" id="memberId" value="user1"/>
	<br>
	<label for="title">제목 : </label>
	<input type="text" name ="title" id="title" value="제목 테스트 입니다."/>
	<br>
	<label for="content">내용 : </label>
	<textarea name="content" id="content" style="width:600px; height:200px" ></textarea>
	<br>
	<label for="fileCategory">파일 종류 : </label>
	<input type="radio" name="fileCategory" id="fileCategory" value="이미지"/>이미지
	<input type="radio" name="fileCategory" id="fileCategory" value="문서"/>문서
	<input type="radio" name="fileCategory" id="fileCategory" value="압축"/>압축
	<br>
	<label for="file">첨부 파일 : </label>
	<input type="file" name="file" id="file" />
	<br>
	<input type="submit" value="등록하기"/>
</fieldset>
</form>
<script>
const frm = document.getElementById("frmRegist");
frm.addEventListener("submit" function(){
	e.PreventDefault();
	e.StopPropagation();
	
	if(frm.memberId.value != ""){
		alert("아이디를 입력해 주세요");
		frm.memberId.focus();
		return;
	}
	if(frm.title.value != ""){
		alert("제목을 입력해 주세요");
		frm.title.focus();
		return;
	}
	if(frm.content.value != ""){
		alert("내용을 입력해 주세요");
		frm.content.focus();
		return;
	}
	if(frm.file.value != ""){
		alert("파일을 등록해 주세요");
		frm.file.focus();
		return;
	}
	frm.submit();
})
</script>
</body>
</html>