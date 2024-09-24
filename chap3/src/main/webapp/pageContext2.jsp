<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<%! 
boolean rtnCheck(Object param, String rtnType){
	if(param != null){
		return true;
	}
	else{
		return false;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// String no = "";
// String name ="";
// int age = 0;
// String dept = "";
// int grade = 0;
// StudentDTO pageStudent = null;

// if( pageContext.getAttribute("pageStNo") != null){
// 	no = pageContext.getAttribute("pageStNo").toString();
// }

// if(pageContext.getAttribute("pageStName") != null){
// 	name = pageContext.getAttribute("pageStName").toString();
// }

// if(pageContext.getAttribute("pageStAge") != null){
// 	age = (Integer)pageContext.getAttribute("pageStAge");
// }


// if(pageContext.getAttribute("pageStDept") != null){
// 	dept = pageContext.getAttribute("pageStDept").toString();
// }

// if(pageContext.getAttribute("pageStGrade") != null){
// 	grade = (Integer)pageContext.getAttribute("pageStGrade");
// }

// if(pageContext.getAttribute("pageStudent") != null){
// 	pageStudent = (StudentDTO)pageContext.getAttribute("pageStudent");
// }


Object no = pageContext.getAttribute("pageStNo");
Object name = pageContext.getAttribute("pageStName");
Object age = pageContext.getAttribute("pageStAge");
Object dept = pageContext.getAttribute("pageStDept");
Object grade = pageContext.getAttribute("pageStGrade");
Object pageStudent = (StudentDTO)pageContext.getAttribute("pageStudent");

%>

<h2>삽입 페이지에서 조회 결과</h2>
<ul> 
	<li>학번 : <%= (rtnCheck(no, "String") ? no : "") %></li>
	<li>이름 : <%= (rtnCheck(name, "String") ? name : "") %></li>
	<li>나이 : <%= (rtnCheck(age, "int") ? age : "") %></li>
	<li>학과 : <%= (rtnCheck(dept, "String") ? dept : "") %></li>
	<li>학년 : <%= (rtnCheck(grade, "int") ? grade : "") %></li>
	<li>
		학생정보
		 <% if(pageStudent != null){ 
			 StudentDTO pageStudent2 = (StudentDTO)pageStudent; // 클래스의 메서드나 필드에 접근하기 위해서는 원래의 타입으로 형변환을 해야함(다운캐스팅) Object가 부모임으로
		 %>
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
</body>
</html>