<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//String name = request.getParameter("name");

String name = null;
String id = null;

//쿠키
/*
Cookie[] ar = request.getCookies(); //특정 쿠키만을 가져오지 못한다. 모든 쿠키들을 가져온다.
if(ar != null){
	for(int i=0; i<ar.length; i++){
		String cookieName = ar[i].getName();
		String cookieValue = ar[i].getValue();
		
		System.out.println("쿠키명 = " + cookieName);
		System.out.println("쿠키값 = " + cookieValue);
		System.out.println();
		
		if(cookieName.equals("memName")) name = cookieValue;
		if(cookieName.equals("memId")) id = cookieValue;
		
	}//for
}//if
*/

//세션
name = (String)session.getAttribute("memName");
id = (String)session.getAttribute("memId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>
	<img src="../image/망상토끼.gif" width="50" height="50" 
	     onclick="location.href='../index.jsp'" style="cursor: pointer;" alt="망상토끼"> <%=name %>님 로그인
</h3>

<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
</body>
</html>











