<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>표현언어(EL) - 연산자</h2>
<h3>변수</h3>

<%!
String name = "홍길동";
String memberId = "user1";
String gender = "여성";

int num1 = 10;
int num2 = 20;
int num3 = 30;
int num4 = 40;
int num5 = 50;
%>

<%
pageContext.setAttribute("name", name);
pageContext.setAttribute("memberId", memberId);
pageContext.setAttribute("gender", gender);

pageContext.setAttribute("num1", num1);
pageContext.setAttribute("num2", num2);
pageContext.setAttribute("num3", num3);
pageContext.setAttribute("num4", num4);
%>

<ul>
	<li>이름 : ${name}</li>
	<li>아이디 : ${memberId}</li>
	<li>성별 :  ${gender}</li>
</ul>

<h3>변수 선언 및 할당</h3>
<ul>
	<li>스크립틀릿에서 선언 : ${num5}</li>
	<li>pageContext : ${num1}</li>
	<li>num1 변수 할당과 동시에 출력 : ${num1 = 11} </li>
	<li>num2 변수 할당만하고 출력은 안 함 : ${num2 = 21;''} </li>
	<li>num2 변수 할당 후 출력함 : ${num2 = 21;''} =>  ${num2}</li>
	<li>num1=${num1}, num2=${num2}, num3=${num3}, num4=${num4}</li>
</ul>

<h3>산술연산자</h3>
<ul>
	<li>num1 + num2 = ${num1 + num2 }</li>
	<li>num1 - num2 = ${num1 - num2 }</li>
	<li>num1 * num2 = ${num1 * num2 }</li>
	<li>num1 / num2 = ${num1 / num2 }</li>
	<li>num1 div num4 = ${num4 div num1 }</li> 
	<li>num1 % num4 = ${num1 % num4 }</li>
	<li>num3 mod num4 = ${num3 mod num4 }</li> 
</ul>

<h3>+ 연산</h3>
<ul>
	<li>${num1 } + "25" = ${num1 + "25"}</li>
	<li>"25" + ${num1}  = ${ "25" + num1}</li>
</ul>

<h3>비교 연산자</h3>
<ul>
	<li>${num1} > ${num2} : ${num1 > num2}</li> 
	<li>${num1} gt ${num2} : ${num1 gt num2}</li>
	<li>${num1} < ${num2} : ${num1 < num2}</li>
	<li>${num1} lt ${num2} : ${num1 lt num2}</li>
	<li>${num1} >= ${num2} : ${num1 >= num2}</li>
	<li>${num1} ge ${num2} : ${num1 ge num2}</li>
	<li>${num1} <= ${num2} : ${num1 <= num2}</li>
	<li>${num1} le ${num2} : ${num1 le num2}</li>
	<li>${num1} == ${num2} : ${num1 == num2}</li>
	<li>${num1} eq ${num2} : ${num1 eq num2}</li>
</ul>

<h3>논리연산자</h3>
<ul>
	<li>${num1} <= ${num2} &&  ${num3} == ${num4} :  ${num1 <= num2 and num3 eq num4}</li>
	<li>${num3} >= ${num4} ||  ${num3} == ${num4} :  ${num1 ge num or num3 ne num4}</li>
</ul>

<h3>empty 연산자</h3>
<%
pageContext.setAttribute("str", null);
pageContext.setAttribute("emptystr", "");
pageContext.setAttribute("num0", new Integer[0]);
pageContext.setAttribute("arrList", new ArrayList<Object>());
%>
<ul>
	<li>null String : ${empty str }</li>
	<li>empty String : ${empty emptystr }</li>
	<li>num0 length : ${empty num0 }</li>
	<li>arrList size : ${empty arrList }</li>
</ul>

<h3>삼항연산자</h3>
<ul>
	<li>${num1} gt ${num2} ? "참" : "거짓" => ${num1 gt num2 ? "num1크다" : "num2크다" }</li> 
</ul>
</body>
</html>