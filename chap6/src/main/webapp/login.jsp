<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%!
public String getCookie(Cookie[] cookies, String key){
	if (cookies != null) {
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			if(cookieName.equals(key)){
				return cookieValue;
			}
		}
	}
	return null;
}
%>

<%
//String save_id_flag = getCookie(request.getCookies(), "save_id_flag"); 

%>

<%
String user_id = (String)session.getAttribute("memberId");
String save_user_id = getCookie(request.getCookies(), "user_id");
String save_id_flag = getCookie(request.getCookies(), "save_id_flag");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<h2>로그인 페이지</h2>

<% if (user_id == null) { %>
<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
	<label for="user_id">아이디</label> 
	<input type="text" id="user_id" name="user_id" value="<%=(save_user_id != null) ? save_user_id : "" %>" maxlength="20" />
	<input type="checkbox" id="save_id_flag" name="save_id_flag" value="Y" <%= (save_id_flag != null && save_id_flag.equals("Y")) ? "checked" : "" %> > 아이디 저장
	<br><br>

	<label for="pwd">비밀번호</label> 
	<input type="password" id="pwd" name="pwd" value="" maxlength="20" />
	<br><br>

	<input type="submit" id="btnLogin" value="로그인" />
</form>
<% } else { %>
	<p>로그인 완료: <%= user_id %> 님 환영합니다.</p>
<a href="logout.jsp">로그아웃</a>
<% } %>

<script>
const frmLogin = document.getElementById("frmLogin");
const btnLogin = document.getElementById("btnLogin");

if (btnLogin) {
    btnLogin.addEventListener("click", function(e) {
        e.preventDefault();
        e.stopPropagation();

        const user_id = frmLogin.user_id.value;
        const pwd = frmLogin.pwd.value;

        if (user_id.length < 4 || user_id.length > 20) {
            alert("아이디를 4자리 이상 20자리 이하로 입력하세요.");
            frmLogin.user_id.focus();
            return;
        }

        if (pwd.length < 4 || pwd.length > 20) {
            alert("비밀번호를 4자리 이상 20자리 이하로 입력하세요.");
            frmLogin.pwd.focus();
            return;
        }

        frmLogin.submit();
    });
}

function goLogout() {
	const frmLogin = document.
    window.location.href = 'logout.jsp';
}
</script>

</body>
</html>
