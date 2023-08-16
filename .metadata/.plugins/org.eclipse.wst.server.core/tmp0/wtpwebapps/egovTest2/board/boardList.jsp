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
	.div1{
		width:600px;
		text-align:center;
		font-size:20pt;
	}
	.search{
		width:600px;
		text-align:right;
		margin-bottom:5px;
	}
</style>
	<style>
		body{
			font-size:9pt;
			font-color:#333333;
			font-family:맑은 고딕;
			
		}
		a{
			text-decoration:none;
			
		}
		table{
			width:600px;
			border-collapse:collapse;
			
		}
		th,td{
			border:1px solid #cccccc;
			padding: 3px;
			line-height:2;
			
		}
		caption{
			font-size:15pt;
			font-weight:bold;
			margin-top:10px;
			padding-bottom:5px;
			
		}
		
		.div_button{
			width:600px;
			text-align:center;
			margin:0 auto;
			margin-top:5px;
			
		}
		body{
			margin:0 auto;
			width: 800x;
		}
		table{
			margin:0 auto;
			margin-top:10px;
		}
	</style>
<body>
<%@ include file="../include/topmenu.jsp" %>
	<div class="div1">일반게시판 목록</div>
	<div style="text-align:left;">Total : ${total }</div>
	
	<form id="searchFrm" method="post" action="boardList.do">
		<div class="search">
			<select name="searchGubun" id="searchGubun">
				<option value="title" <c:if test="${vo.searchGubun=='title' }"> selected</c:if>>제목</option>
				<option value="name" <c:if test="${vo.searchGubun=='name' }"> selected</c:if>>글쓴이</option>
				<option value="content" <c:if test="${vo.searchGubun=='content' }"> selected</c:if>>내용</option>
			</select>
			<input type="text" name="searchText" id="searchText" value="${vo.searchText }">
			<button type="submit" onclick="fn_search(); return false;">검색</button>
		</div>
	</form>	
<table>
	<tr>
		<th width="15%">번호</th>
		<th width="35%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="20%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
		<c:set var="cnt" value="${rowNumber }"/>
<c:forEach var="result" items="${resultList}">	
	<tr align="center">
		<td><c:out value="${cnt }"/></td>
		<td align="left">
			<a href="boardDetail.do?unq=${result.unq }"><c:out value="${result.title }"/></a>
		</td>
		<td><c:out value="${result.name }"/></td>
		<td><c:out value="${result.rdate }"/></td>
		<td><c:out value="${result.hits }"/></td>
	</tr>
		<c:set var="cnt" value="${cnt-1 }"/>
</c:forEach>
	
</table>

<div style="width:600px; margin-top:5px; text-align:center; ">
	
	<c:forEach var="i" begin="1" end="${totalPage }">
		<a href="boardList.do?viewPage=${i }">${i }</a> 
	</c:forEach>

</div>

<div style="width:600px; margin-top:5px; text-align:right; ">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
</div>


</body>
</html>