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
<title>Egove Test</title>
</head>

<link type="text/css" rel="stylesheet" href="<c:url value='/include/mainstyles.css'/>"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>

</style>

<script>

	$(function(){
		$("#btn_login").click(()=>{
			
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
						location = "main.do";
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
<div class="login_div">
<% if(USERID==null){%>
<table class="login_table">

	<tr>
		<th width="40%">
			아이디 : 
		</th>
		<td width="60%">
			<input type="text" name="userid" id="userid" class="login_input">
		</td>
	</tr>
	<tr>
		<th>
			비밀번호 :
		</th>
		<td>
			<input type="password" name="pass" id="pass" class="login_input">			
		</td>
	</tr>
</table>

<button type="button" class="btn_login" id="btn_login">로그인</button>
	<%} else { %>
		<div class="logout_div">
			<h3 style="text-align:center;"><%=USERID %>님 환영합니다!</h3>
			<button type="button" class="btn_logout" onclick="location.href='logoutWrite.do';">로그아웃</button>
		</div>
	<%} %>

</div>
<div class="div_recboard">
	<h2 style="margin-left:20px;">최신글</h2>
	<table class="table_board">
		<tr>
			<th width="45%">제 목</th>
			<th width="20%">글쓴이</th>
			<th width="20%">등록일</th>
			<th width="15%">조회수</th>
		</tr>
	<c:forEach var="recList" items="${recList }">
		<tr>
		<td align="left">
			<a href="boardDetail.do?unq=${recList.unq }"><c:out value="${recList.title }"/></a>
		</td>
		<td><c:out value="${recList.name }"/></td>
		<td><c:out value="${recList.rdate }"/></td>
		<td style="text-align:center;"><c:out value="${recList.hits }"/></td>
		
		<tr>
	</c:forEach>
	</table>
</div>
<div class="div_hotboard">
	<h2 style="margin-left:20px;">인기글</h2>
	<table class="table_board">
		<tr>
			<th width="45%">제 목</th>
			<th width="20%">글쓴이</th>
			<th width="20%">등록일</th>
			<th width="15%">조회수</th>
		</tr>
	<c:forEach var="hotList" items="${hotList }">
		<tr>
		<td align="left">
			<a href="boardDetail.do?unq=${hotList.unq }"><c:out value="${hotList.title }"/></a>
		</td>
		<td><c:out value="${hotList.name }"/></td>
		<td><c:out value="${hotList.rdate }"/></td>
		<td style="text-align:center;"><c:out value="${hotList.hits }"/></td>
		<tr>
	</c:forEach>
	</table>
</div>


<%@ include file="../include/bottommenu.jsp" %>
</body>

</html>