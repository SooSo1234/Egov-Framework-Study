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

<link type="text/css" rel="stylesheet" href="<c:url value='/include/mainstyles.css'/>"/>
	<script>
		$(function (){
			
			$("#btn_submit").click(()=>{
				
				var userid = $.trim($("#userid").val());
				var pass = $.trim($("#pass").val());
				
				if(userid == "") {
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if(pass == "") {
					alert("암호를 입력해주세요.");
					$("#pass").focus();
					return false;
				}
				
				$.ajax({
					
					type:"POST",
					data:"userid="+userid+"&pass="+pass,
					url:"loginWriteSub.do",
					dataType:"text",
					
					success: function(result) {
						if(result == "ok"){
							alert(userid+"님 로그인 되었습니다.");
							location = "boardList.do";
						} else {
							alert("로그인 정보를 다시 확인해주세요.");
						}
					},
					error: function() {
						alert("오류발생");
					}
				});
			});
			
			
		});
	</script>
<body>

<%@ include file="../include/topmenu.jsp" %>

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