<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
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
			margin-top:5px;
			
		}

		
	</style>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <script>
  $( function() {
    $( "#birth" ).datepicker();
    
    $("#btn_submit").click(()=>{
    	
    	var userid = $("#userid").val();
    	var pass = $("#pass").val();
    	var name = $("#name").val();
    	
    	userid=$.trim(userid);	
    	pass=$.trim(pass);	
    	name=$.trim(name);
    	
    	if(userid==""){
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	}
    	if(pass==""){
    		alert("비밀번호를 입력해주세요.");
    		$("#pass").focus();
    		return false;
    	}
    	if(name==""){
    		alert("이름을 입력해주세요.");
    		$("#name").focus();
    		return false;
    	}
    	
    	$("#userid").val(userid);
    	$("#pass").val(pass);
    	$("#name").val(name);
    	
    	var formData = $("#frm").serialize();
    	$.ajax({
    		type:"POST",
    		data:formData,
    		url:"memberWriteSave.do",
    		dataType:"text",
    		success:function(result){
    			if(result=="ok"){
    				alert("저장완료");
    				location="loginWrite.do";
    			} else {
    				alert("저장실패");
    			}
    		},
    		error:function(){
    			alert("오류발생");
    		}
    	});
    	
    });
    
    
  });
  </script>
  
<body>
<form id="frm">
	<table>
		<tr>
			<th width="25%">홈</th>
			<th width="25%"><a href="boardList.do">게시판</a></th>
			<th width="25%"><a href="memberWrite.do">회원가입</a></th>
			<th width="25%"><a href="loginWrite.do">로그인</a></th>
		</tr>
	</table>

	<table>
		<caption>회원가입 폼</caption>
		<tr>
			<th><label for="userid">아이디</label></th>
			<td>
				<input type="text" name="userid" id="userid" placeholder="아이디입력">
				<button type="button">중복체크</button>
			</td>
		</tr>	
		<tr>
			<th><label for="pass">암호</label></th>
			<td>
				<input type="password" name="pass" id="pass">
			</td>
		</tr>	
		<tr>
			<th><label for="name">이름</label></th>
			<td>
				<input type="text" name="name" id="name">
			</td>
		</tr>
		<tr>
			<th><label for="gender">성별</label></th>
			<td>
				<input type="radio" name="gender" id="gender" value="M" checked>남
				<input type="radio" name="gender" id="gender" value="F">여
			</td>
		</tr>
		<tr>
			<th><label for="birth">생년월일</label></th>
			<td>
				<input type="text" name="birth" id="birth" readonly>
			</td>
		</tr>
		<tr>
			<th><label for="phone">연락처</label></th>
			<td>
				<input type="text" name="phone" id="phone"> (예: 010-1234-1234)
			</td>
		</tr>
		<tr>
			<th><label for="zipcode">주소</label></th>
			<td>
				<input type="text" name="zipcode" id="zipcode">
				<button type="button">우편번호찾기</button>
				<br>
				<input type="text" name="address" id="address">
			</td>
		</tr>
	</table>
	<div class="div_button">
		<button type="submit" id="btn_submit" onclick="return false;">저장</button>
		<button type="reset">취소</button>
	</div>
</form>

</body>
</html>