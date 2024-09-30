<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String title = request.getParameter("title");
BbsDAO dao = new BbsDAO();
BbsDTO info = dao.getBbsInfo(title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>게시글 수정</h2>
<form  name="frmModify" id="frmModify" action="modify_ok.jsp" method="POST">
	<table>
		<tbody>
			<tr>
				<th class="input_title">제목 : </th>
				<td>
					<input type="text" name="title" value="<%= info.getTitle()%>" />
				</td>
				
			</tr>
			<tr>
				<th class="input_title">내용 : </th>
				<td>
					<textarea name="content" id="content" value="<%=info.getContent()%>"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" class="align_center"> 
					<input type="submit" id="btnModifyOk" value="완료" />
					<input type="submit" id="btnToList" value="목록으로">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>