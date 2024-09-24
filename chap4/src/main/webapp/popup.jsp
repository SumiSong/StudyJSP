<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
public String getCookie(HttpServletRequest req, String key){
	Cookie[] cookies = req.getCookies();
	if (cookies != null) {
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			if(cookieName.equals(key)){
				return cookieValue;
			}
		}
	}
	return "쿠키 없음";
}
%>
<%
String pop_flag = getCookie(request, "popup_close");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery.3.7.1.js"></script>
<style>
	div#divPop1{
		width:300px;
		height:100px;
		background-color: yellow;
	}
	div#divPop1>div{
		margin-top:80px;
	}
</style>
</head>
<body>
<h2>팝업창 페이지</h2>
<%
if(!pop_flag.equals("Y")){
%>
<div id="divPop1">
	<h2 align="center">공지사항 팝업</h2>
	<div align="right">
		<form name = "frmPop1" id="frmPop1" action="set_popup_cookie.jsp" method="get">
			<input type="checkbox" id="popFlag" name="popFlag" value="Y"/>하루 동안 창 열지 않음
			<input type= "button" id="btnClose" value ="닫기">
			<input type="submit" value="확인">
		</form>
	</div>
</div>
<% } %>
<script>
$(function(){
	$("#btnClose").click(function(){
		console.log("aaa");
		$("#divPop1").hide(); // document.getElementById("divPop1").style.disiplay='none'
		var popVal = $("input:checkbox[id=popFlag]:checked").val(); 
		if(popVal == "Y"){
			console.log("bbb");
			$.ajax({
				url : './set_popup_cookie.jsp',
				type : 'get',
				data : {popFlag : popVal},
				dataType : "text",
				success : function(resData){
					console.log(resData);
					if(resData != ''){
						location.reload();
					}
				}

				
			})
		}
	})
	
})
</script>
</body>
</html>