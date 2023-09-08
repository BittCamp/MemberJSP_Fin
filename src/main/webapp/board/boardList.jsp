<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.bean.BoardPaging" %>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//1페이지당 5개씩
int endNum = pg*5;
int startNum = endNum-4;

//DB
BoardDAO boardDAO = new BoardDAO();
List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);

//페이징 처리
int totalA = boardDAO.getTotalA(); //총글수

BoardPaging boardPaging = new BoardPaging();
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);

boardPaging.makePagingHTML();

//세션
String id = (String)session.getAttribute("memId");
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

#currentPaging {
	border: 1px solid #ccc;
	margin: 5px;
	padding: 5px 8px;
	color: red;
	cursor: pointer;
}
#paging {
	color: black;
	margin: 5px;
	padding: 5px;
	cursor: pointer;
}

.subjectA:link { color: black; text-decoration: none; }
.subjectA:visited { color: black; text-decoration: none; }
.subjectA:hover { color: green; text-decoration: underline; }
.subjectA:active { color: black; text-decoration: none; }
</style>
</head>
<body>
<% if(list != null){ %>
	<table border="1" frame="hsides" rules="rows">
		<tr>
			<th width="100">글번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>	
	
		<%for(BoardDTO boardDTO : list){ %>
			<tr>
				<td align="center"><%=boardDTO.getSeq() %></td>
				<td>
					<a class="subjectA" href="javascript:void(0)" 
					   onclick="isLogin('<%=id%>', <%=boardDTO.getSeq() %>, <%=pg%>)"><%=boardDTO.getSubject() %></a>
				</td>
				<td align="center"><%=boardDTO.getId() %></td>
				<td align="center"><%=new SimpleDateFormat("yyyy.MM.dd.").format(boardDTO.getLogtime()) %></td>
				<td align="center"><%=boardDTO.getHit() %></td>
			</tr>
		<%}//for %>
	</table>
	<img src="../image/망상토끼.gif" width="50" height="50" 
	     onclick="location.href='../index.jsp'" style="cursor: pointer;" alt="망상토끼">
	
	<div style="width: 900px; text-align: center;">
		<%=boardPaging.getPagingHTML() %>
	</div>
		     
<%}//if %>

<script type="text/javascript">
function boardPaging(pg){
	location.href = "boardList.jsp?pg=" + pg;
}

function isLogin(id, seq, pg){
	if(id == 'null') alert("먼저 로그인하세요");
	else location.href = "boardView.jsp?seq=" + seq + "&pg=" + pg;
}
</script>
</body>
</html>





















