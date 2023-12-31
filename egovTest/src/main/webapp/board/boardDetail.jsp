<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- '\n'을 <br>로 변환해서 출력하기 -->
<% pageContext.setAttribute("newline","\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content,newline,'<br>' ) }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>

</head>


<link type="text/css" rel="stylesheet" href="<c:url value='/include/mainstyles.css'/>"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

function btn_delete(unq){
	var w = 400;
	var h = 150;
	var url = "passWrite.do?unq="+unq;
	window.open(url,'passWrite','width='+w+',height='+h);
}


</script>


<body>
<%@ include file="../include/topmenu.jsp" %>
<c:set var="USERID" value="<%=USERID%>" />

<form name="frm" id="frm">
	<table>
		<caption>게시판 상세</caption>
		<tr>
			<th width="20%">제목</th>
			<td width="80%">${boardVO.title }</td>
		</tr>
		<tr>
			<th><label for="name">글쓴이</label></th>
			<td>${boardVO.name }</td>
		</tr>
		<tr>
			<th><label for="content">내용</label></th>
			<td height="100">
				${boardVO.content }
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${boardVO.rdate }</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" onclick="location='boardList.do'">목록</button>
				<c:if test="${USERID eq boardVO.name }">
				<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
				<button type="button" onclick="btn_delete('${boardVO.unq}')">삭제</button>
				</c:if>

			</th>
		</tr>
	</table>
</form>

<%@ include file="../include/bottommenu.jsp" %>
</body>
</html>