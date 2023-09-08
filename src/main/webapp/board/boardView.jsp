<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>

<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
BoardDAO boardDAO = new BoardDAO();
BoardDTO boardDTO = boardDAO.getBoard(seq);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}
</style>
</head>
<body>
<% if(boardDTO != null) { %>
	<table border="1" frame="hsides" rules="rows">
		<tr>
			<td colspan="3"><h2><%=boardDTO.getSubject() %></h2></td>
		</tr>
		
		<tr>
			<td width="150" align="center">글번호 : <%=boardDTO.getSeq() %></td>
			<td width="150" align="center">작성자 : <%=boardDTO.getId() %></td>
			<td width="150" align="center">조회수 : <%=boardDTO.getHit() %></td>
		</tr>
		
		<tr>
			<td colspan="3" height="250" valign="top"><pre><%=boardDTO.getContent() %></pre></td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg%>'">
<%}//if %>
</body>
</html>



















