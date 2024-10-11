<%@page import="net.fullstack7.utils.CommonUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
CommonUtils COOKs = new CommonUtils();
String saveIdFlag = COOKs.getCookiesInfo(request, "save_id_flag");
String saveUserId = COOKs.getCookiesInfo(request, "save_user_id");
String errorMessage = (String) request.getAttribute("error");
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 페이지</h2>
    <c:choose>
        <c:when test="${not empty memberId}">
            <p>${name} 님, ([${memberId}]) 환영합니다</p>	
            <button><a href="bbs/list.jsp">목록보기</a></button>
            <a href="/chap13/member/Login.do?action=logout">로그아웃</a>
        </c:when>
        <c:otherwise>
            <form name="frmLogin" id="frmLogin" action="/chap13/member/Login.do" method="post">
            <input type="hidden" name="action" value="login">
                <label for="user_id">아이디</label>
                <input type="text" id="user_id" name="user_id" value="<%= saveUserId %>" maxlength="20" />
                <input type="checkbox" id="save_id_flag" name="save_id_flag" value="Y" <%=(saveIdFlag != null && saveIdFlag.equals("Y") ? "checked" : "")%> />
                <label for="save_id_flag">아이디 저장</label>
                <br><br>
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" maxlength="20" />
                <br><br>
                <input type="submit" id="btnLogin" value="로그인" />
            </form>
        </c:otherwise>
    </c:choose>
<script>
const frmLogin = document.getElementById("frmLogin");
const btnLogin = document.getElementById("btnLogin");
btnLogin.addEventListener("click", function(e){
    e.preventDefault();
    const user_id = frmLogin.user_id.value;
    const pwd = frmLogin.pwd.value;
    if (user_id.length < 4 || user_id.length > 20) {
        alert("아이디를 4자리 이상 20자리 이하로 입력하세요");
        frmLogin.user_id.focus();
        return;
    }
    if (pwd.length < 4 || pwd.length > 20) {
        alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요");
        frmLogin.pwd.focus();
        return;
    }
    frmLogin.submit();
});
</script>
