<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>

<style >
	
	body{
		fond-size:9pt;
	}
	button{
		font-size:9pt;
	}
	table{
		width:600px;
		border-collapse:collapse;
	}
	th, td{
		border:1px solid #cccccc;
		padding: 3px;
	}
	.input1{
		width:98%;
	}
	.textarea{
		width:98%;
		height:70px;
	}
	
</style>

<body>

<table>
	<tr>
		<th width="15%">번호</th>
		<th width="35%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="20%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
		<c:set var="cnt" value="1"/>
<c:forEach var="result" items="${resultList}">	
	<tr align="center">
		<td><c:out value="${cnt }"/></td>
		<td align="left"><c:out value="${result.title }"/></td>
		<td><c:out value="${result.name }"/></td>
		<td><c:out value="${result.rdate }"/></td>
		<td><c:out value="${result.hits }"/></td>
	</tr>
		<c:set var="cnt" value="${cnt+1 }"/>
</c:forEach>
	
</table>

<div style="width:600px; margin-top:5px; text-align:right; ">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>

</div>


</body>
</html>