<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request 영역</h2>
<%
String reqType = request.getParameter("reqType"); // request 객체에서 클라이언트로부터 전달된 파라미터 값 "reqType"을 가져와 **reqType**이라는 문자열 변수에 저장
%>
<%
request.setAttribute("req1", "request 영역"); // setAttribute 키, 값 쌍을 가지기 때문
request.setAttribute("reqStudent", new StudentDTO("20240101","홍길순", 20, "간호학과", 1));
%>

<%
request.removeAttribute("req1");
request.removeAttribute("req2");
%>

<h2>request 영역 속성값 조회</h2>
<%
Object req1 = request.getAttribute("req1"); //반환 타입이 Object임으로 형변환
Object reqStudent = request.getAttribute("reqStudent");
%> 

<ul>
	<li>req 문자열 정보 : <%= (req1 !=null ? req1.toString() : "") %></li>
	<li>
	학생정보 : 
		 <% if(reqStudent != null){ 
			 StudentDTO pageStudent2 = (StudentDTO)reqStudent;%> <!--StudentDTO 타입으로 형 변환  -->
		 <ul>
			<li>학번 : <%=pageStudent2.getNo() %></li>
			<li>이름 : <%=pageStudent2.getName() %></li>
			<li>나이 : <%=pageStudent2.getAge() %></li>
			<li>학과 : <%=pageStudent2.getDept() %></li>
			<li>학년 : <%=pageStudent2.getGrade() %></li>
		</ul>
		<%} %>
		</li>
</ul>

<% 
if(reqType !=null && reqType.equalsIgnoreCase("send")){ //equalsIgnoreCase 는 대소문자를 무시하고 문자열과 같은 값인가 확인
	response.sendRedirect("req2.jsp");
}
else if(reqType !=null && reqType.equals("req")){
 	//response.sendRedirect("req2.jsp?user_id=user1&pwd=1234");
 	request.getRequestDispatcher("req2.jsp").forward(request, response);
}
%>
<a href="req2.jsp">페이지 이동시 소멸</a> <br/>
<a href="req.jsp?reqType=req">request 페이지 이동시 소멸</a><br/>
<a href="req.jsp?reqType=send">send 페이지 이동시 소멸</a><br/>

<!-- 
<a href="req2.jsp">페이지 이동시 소멸</a> <br/> 이 부분은 페이지가 이동했기 때문에 필드를 공유할 수 없고 
<a href="req.jsp?reqType=req">request 페이지 이동시 소멸</a><br/> 이 부분은 페이지는 이동했지만 포워드를 통해서 request 객체를 넘겼기 때문에 url 변형 없이 데이터를 공유하고 있고 
<a href="req.jsp?reqType=send">send 페이지 이동시 소멸</a><br/> 이건 sendRedirect 했기 때문에 request 객체가 새로 생성됨으로 데이터 공유가 일어나지 않음
 -->
</body>
</html>