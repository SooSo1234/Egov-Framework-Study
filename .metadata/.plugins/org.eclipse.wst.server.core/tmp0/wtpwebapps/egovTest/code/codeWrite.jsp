<%@page import="egovframework.example.sample.service.DeptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드입력</title>
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
	
	<script>
		function fn_submit(){
			if(document.frm.name.value == ""){
				alert("코드명을 입력해주세요.");
				document.frm.name.focus();
				return false;
			}
			document.frm.submit();
		}
	</script>

</head>
<body>
<form name="frm" method = "post" action ="codeWriteSave.do">
<table>
	<tr>
		<th>분류</th>
		<td>
			<select name="gid">
				<option value="1">JOB(업무)</option>
				<option value="2">HOBBY(취미)</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>코드이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" onclick="fn_submit(); return false;">저장</button>
			<button type="reset">취소</button>
		</th>
	</tr>

</table>
</form>

</body>
</html>