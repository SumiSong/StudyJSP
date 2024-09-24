<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
// 선언부. _jspService() 메서드 외부에 선언됨
int i = 100;
public int add(int num1, int num2){
	return num1 + num2;
}
%>

<!DOCTYPE html> <!-- _jspService() 메서드 내부에 선언됨 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int result = add (10,20);
%>

결과 1 : <%=result %> <br/>
결과 2 : <%=add(30, 40) %> <br/>
i : <%=i %>
</body>
</html>