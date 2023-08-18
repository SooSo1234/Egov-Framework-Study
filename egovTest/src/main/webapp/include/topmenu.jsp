<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body style="width:600px;">

<%
	String USERID = (String) session.getAttribute("SessionUserID");
%>
<h1 style="text-align:center; padding-top:10px;">Egove Framework Study</h1>
<c:set var="user" value="<%=USERID %>"/>
	<table>
		<tr>
			<th width="25%"><a href="main.do">홈</a></th>
			<th width="25%"><a href="boardList.do">게시판</a></th>
			
			<%
				if(USERID == null) {
			%>
			
			<th width="25%"><a href="memberWrite.do">회원가입</a></th>
			<th width="25%"><a href="loginWrite.do">로그인</a></th>
			
			<%
				} else {
			%>
			<th width="25%"><a href="memberModify.do">회원정보</a></th>
			<th width="25%"><a href="logoutWrite.do">로그아웃</a></th>
			<%
				}
			%>
		</tr>
	</table>
	<hr/>
</body>
</html>