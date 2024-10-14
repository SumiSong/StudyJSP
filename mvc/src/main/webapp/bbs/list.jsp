<%@page import="net.fullstack7.utils.Pagination"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
List<BbsDTO> list = (List<BbsDTO>)request.getAttribute("list");
Pagination paging = (Pagination)request.getAttribute("paging");
String searchCategory = (String) request.getAttribute("searchCategory");
String searchValue = (String) request.getAttribute("searchValue");
%>
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
	width:150px;
	height:40px;
	background-color:lightgray;
}
</style>
</head>
<body>
<h2>게시글 목록</h2>

<table>
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="i" items="${list}">
            <tr>
                <td>${i.idx}</td>
                <td>${i.title}</td>
                <td>${i.memberId}</td>
                <td>${i.regDate}</td>
                <td><input type="checkbox" name="delete" value="${i.idx}"/></td>
            </tr>
        </c:forEach>
        <tr>
			<td colspan="6">
				<c:if test="${startBlock > 1}">
				    <a href="${pageContext.request.contextPath}/bbs/list?page=${startBlock - 1}&key=${searchCategory}&value=${searchValue}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
				    <c:choose>
				        <c:when test="${i == pageNo}">
				            <strong>[${i}]</strong>
				        </c:when>
				        <c:otherwise>
				            <a href="${pageContext.request.contextPath}/bbs/list?page=${i}&key=${searchCategory}&value=${searchValue}">${i}</a>
				        </c:otherwise>
				    </c:choose>
				</c:forEach>
				<c:if test="${endBlock < paging.totalPage}">
				    <a href="${pageContext.request.contextPath}/bbs/list?page=${endBlock + 1}&key=${searchCategory}&value=${searchValue}">다음</a>
				</c:if>
			</td>
		</tr>
        <tr>
            <td colspan="6">
                <input type="button" value="등록" onclick="location.href='/mvc/bbs/regist.jsp'"/>
                <input type="submit" value="선택 된 값 삭제"/>
            </td>
        </tr>
    </tbody>
</table>
	<form action="list.jsp" method="GET">
	    <select name="key">
	        <option value="title" <%= "title".equals(searchCategory) ? "selected" : "" %>>제목</option>
	        <option value="memberId" <%= "memberId".equals(searchCategory) ? "selected" : "" %>>작성자</option>
	    </select>
	    <input type="text" name="value" value="<%= searchValue != null ? searchValue : "" %>">
	    <input type="submit" value="검색">
	</form>
</body>
</html>
<script>
cont 
</script>