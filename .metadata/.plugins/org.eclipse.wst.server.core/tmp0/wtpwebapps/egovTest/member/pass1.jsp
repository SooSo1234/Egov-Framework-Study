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

<script type="text/javascript">

var result="입력하세요.";

	$( function() {
		
		var check = false;


		$("#newpass1").change(()=>{
			$("#pass").val("");
			check=false;
		});

		
		$("#pass").change(()=>{
	    	var newpass1 = $("#newpass1").val();
	    	var pass = $("#pass").val();
	    	pass=$.trim(pass);	
	    	newpass1=$.trim(newpass1);
	    	
	    	if(pass==newpass1){
	    		check=true;
	    	} else {
	    		check=false;
	    	}
	    	
	    	if(check){
	    		$("#result").val("사용가능합니다.");
	    	} else {
	    		$("#result").val("잘못 입력하였습니다.");
	    	}

		});
		
		
		
		$("#btn_passchange").click(()=>{
			
	    	var pass = $("#pass").val();
	    	var oldpass = $("#oldpass").val();
	    	var newpass1 = $("#newpass1").val();
	    	
	    	pass=$.trim(pass);	
	    	oldpass=$.trim(oldpass);	
	    	newpass1=$.trim(newpass1);	
	    	
	    	if(oldpass==""){
	    		alert("기존 비밀번호를 입력해주세요.");
	    		$("#oldpass").focus();
	    		return false;
	    	}
	    	if(newpass1==""){
	    		alert("새로운 비밀번호를 입력해주세요.");
	    		$("#newpass1").focus();
	    		return false;
	    	}
	    	if(newpass1==oldpass){
	    		alert("기존 비밀번호와 같습니다.");
	    		$("#newpass1").focus();
	    		return false;
	    	}
	    	
	    	if(check==false){
	    		alert("비밀번호 재확인을 입력해주세요.");
	    		$("#pass").focus();
	    		return false;
	    	}

	    	
	    	$("#oldpass").val(oldpass);
	    	$("#pass").val(pass);
	    	$("#newpass1").val(newpass1);
	    	
	    	$.ajax({
	    		
	    		type:"POST",
	    		data:"oldpass="+oldpass+"&pass="+pass,
	    		url:"passUpdate.do",
	    		dataType:"text",
	    		
	    		success:function(result){
	    			if(result=="success"){
	    				alert("수정완료");
	    				self.close();
	    			} else if(result=="notcorrect"){
	    				alert("기존 비밀번호를 틀렸습니다.")
	    			}
	    		},
	    		error:function(){
	    			alert("오류발생");
	    		}
	    		
	    	});
			
		});
		
	});

</script>

<body style="height:250px; width:450px; min-height:200px;">

	<table style="width:400px; margin-top:10%;">
		<tr>
			<th>
				<label for="oldpass">기존 비밀번호: </label>
			</th>
			<td>
				<input type="password" name="oldpass" id="oldpass">
			</td>
		</tr>
		<tr>
			<th>
				<label for="newpass1">새로운 비밀번호: </label>
			</th>
			<td>
				<input type="password" name="newpass1" id="newpass1">
			</td>
		</tr>
		<tr>
			<th>
				<label for="pass">비밀번호 재확인: </label>
			</th>
			<td>
				<input type="password" name="pass" id="pass"><input style="width:100px; border-width:0px; font-size:8pt; " type="text" id="result" disabled value="입력하세요.">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" id="btn_passchange">수정</button>
			</th>
		</tr>
	</table>
</body>
</html>