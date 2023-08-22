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
<title>게시판 등록 화면</title>


</head>

<link type="text/css" rel="stylesheet" href="<c:url value='/include/mainstyles.css'/>"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>



	function fn_submit() {
		
		//jquery 방식
		
		if( $.trim($("#title").val()) == "") {
			alert("제목을 입력해주세요!");
			$("#title").focus();
			return false;
		}
		
		$("#title").val( $.trim($("#title").val()) );
		
		if($.trim($("#pass").val())==""){
			alert("암호를 입력해주세요!");
			$("#pass").focus();
			return false;
		}
		$("#pass").val($.trim($("#pass").val()) );

		if($.trim($("#name").val())==""){
			alert("글쓴이를 입력해주세요!");
			$("#name").focus();
			return false;
		}
		$("#name").val($.trim($("#name").val()) );
		
		var formData = $("#frm").serialize();
		
		//비동기 전송방식
		$.ajax({ 
			type:"POST",
			data:formData,
			url:"boardWriteSave.do",
			dataType:"text",
			success: function(data) {
				if(data =="ok"){
					alert("저장하였습니다.");
					location = "boardList.do";
				} else {
					alert("저장 실패했습니다. 다시 시도해주세요.");
				}
			},
			error: function() {
				alert("오류발생");
			}
		});
		
		/*javascript 방식
 
 		if(document.frm.title.value == ""){
			alert("제목을 입력해주세요!");
			document.frm.title.focus();
			return false;
		}
		if(document.frm.pass.value==""){
			alert("암호를 입력해주세요!");
			document.frm.pass.focus();
			return false;
		} */
		
		//document.frm.submit(); 동기전송방식
		
		//비동기전송방식
		
		
	}
</script>


<body>
<%@ include file="../include/topmenu.jsp" %>
<form id="frm">
	<table>
		<caption>게시판 등록</caption>
		<tr>
			<th width="20%"><label for="title">제목</label></th>
			<td width="80%"><input type="text" name="title" id="title" class="input1" placeholder="제목입력"></td>
		</tr>
		<tr>
			<th><label for="pass">암호</label></th>
			<td><input type="password" name="pass" id="pass"  class="input1"></td>
		</tr>
		<tr>
			<th><label for="name">글쓴이</label></th>
			<td><input type="text" name="name" id="name" class="input1" value="<%=USERID %>" readonly></td>
		</tr>
		<tr>
			<th><label for="content">내용</label></th>
			<td><textarea name="content" id="content" class="textarea"></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit" onclick="fn_submit(); return false;">저장</button>
				<button type="reset">취소</button>
			</th>
		</tr>
	</table>
</form>

<%@ include file="../include/bottommenu.jsp" %>
</body>
</html>