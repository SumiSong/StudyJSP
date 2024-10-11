<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    List<BbsDTO> list = (List<BbsDTO>) request.getAttribute("list");
    Pagination paging = (Pagination) request.getAttribute("paging");
    String searchKey = (String) request.getAttribute("searchKey");
    String searchValue = (String) request.getAttribute("searchValue");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table,thead,tbody,th,tr,td {
	border:1px solid black;
	border-collapse:collapse;
	
}
th {
	text-align:center;
	width:150px;
	height:40px;
	background-color:lightgray;
}
</style>
<body>
<h2>게시글 리스트</h2>
<form id="frmList" action="delete_checkbox_ok.jsp" method="POST">

	<table>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>삭제</th>
		<th>삭제</th>
		<tbody>
<% for(BbsDTO i : listLimit){ %>
			<tr>
				<td><%= i.getIdx() %></td>
				<td><a href="view.jsp?idx=<%= i.getIdx() %>"><%= i.getTitle() %></td>
				<td><%= i.getMemberId() %></td>
				<td><%= i.getRegDate() %></td>
				<td><a href="delete_ok.jsp?idx=<%= i.getIdx()%>"><input type="button" id="btnDelete" value="삭제" /></td>
				<td><input type="checkbox" name="bbsIdx" value="<%= i.getIdx() %>"></td>
			</tr>
<%
}
%>
		<tr>
			<td colspan="6" class="align_center">
<%-- 				 <% if(startBlock > 1) { %> --%>
<%-- 			      <a href="list.jsp?page=<%= startBlock - 1 %>&key=<%= searchKey %>&value=<%= searchValue %>">이전</a> --%>
<%-- 			    <% } %> --%>
			    
<%-- 			    <% for(int i = startBlock; i <= endBlock; i++) { %> --%>
<%-- 			      <% if(i == pageNo) { %> --%>
<%-- 			        <strong>[<%= i %>]</strong> --%>
<%-- 			      <% } else { %> --%>
<%-- 			        <a href="list.jsp?page=<%= i %>&key=<%= searchKey %>&value=<%= searchValue %>"><%= i %></a> --%>
<%-- 			      <% } %> --%>
<%-- 			    <% } %> --%>
			    
<%-- 			    <% if(endBlock < paging.getTotalPage()) { %> --%>
<%-- 			      <a href="list.jsp?page=<%= endBlock + 1 %>&key=<%= searchKey %>&value=<%= searchValue %>">다음</a> --%>
<%-- 			    <% } %> --%>
			</td>
		</tr> 
		<tr>
			<td colspan="6" class="align_center"> 
				<input type="button" id="btnRegist" value="게시글 등록" />
				<input type="submit" id="btnDeleteAll" value="체크 박스 값만 삭제">
			</td>
		</tr>
		</tbody>
	</table>
	</form>
	<form action="list.jsp" method="GET">
	    <select name="key">
	        <option value="title" <%= "title".equals(searchKey) ? "selected" : "" %>>제목</option>
	        <option value="memberId" <%= "memberId".equals(searchKey) ? "selected" : "" %>>작성자</option>
	    </select>
	    <input type="text" name="value" value="<%= searchValue != null ? searchValue : "" %>">
	    <input type="submit" value="검색">
	</form>
</body>
</html>