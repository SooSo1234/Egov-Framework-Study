<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>

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
	<script>
		$(function (){
			
			$("#btn_submit").click(()=>{
				
			});
			
			
		});
	</script>
<body>

<form name="frm" id="frm">
	<table>
		<caption>로그인</caption>
		<tr>
			<th><label for="userid">아이디</label></th>
			<td>
				<input type="text" name="userid" id="userid" placeholder="아이디입력">
			</td>
		</tr>	
		<tr>
			<th><label for="pass">암호</label></th>
			<td>
				<input type="password" name="pass" id="pass">
			</td>
		</tr>	
	</table>
	<div class="div_button">
		<button type="button" id="btn_submit" >로그인</button>
		<button type="reset">취소</button>
	</div>

</form>		
</body>
</html>