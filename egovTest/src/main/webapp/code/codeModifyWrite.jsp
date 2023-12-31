<%@page import="egovframework.example.sample.service.DeptVO"%>
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
<title>코드수정</title>

	<style>
		table{
			width:400px;
			border-collapse:collapse;
		}
		th,td {
			border:1px solid #cccccc;
			padding:5px;
		}
	</style>

</head>
<body>
<form name="frm" method = "post" action ="codeModifySave.do">
<input type="hidden" name="code" value="${vo.code }">
<table>
	<tr>
		<th>분류</th>
		<td>
			<select name="gid">
					<option value="1" <c:if test="${vo.gid=='1' }">selected</c:if>>Job(업무)</option>
					<option value="2" <c:if test="${vo.gid=='2' }">selected</c:if>>Hobby(취미)</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>코드명</th>
		<td><input type="text" name="name" value="${vo.name }"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">저장</button>
			<button type="reset">취소</button>
		</th>
	</tr>

</table>
</form>

</body>
</html>