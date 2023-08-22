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
<link type="text/css" rel="stylesheet" href="<c:url value='/include/mainstyles.css'/>"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
	<br>
</body>
</html>