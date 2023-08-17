<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<link type="text/css" rel="stylesheet" href="<c:url value='/include/mainstyles.css'/>"/>
<!-- 	<style>
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
		} -->
	</style>
	
  	<!-- 달력 (https://jqueryui.com/datepicker/)-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  	<!-- 우편번호 검색 (https://www.poesis.org/postcodify/guide/example)-->
<!-- 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


  
  <script>

  $( function() {
		
	var idchecked=false;
	
	
	<!-- "생년월일" 입력창 선택시 달력 출력 -->
	$( "#birth" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	});
	$( "#birth" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
	
	<!-- "우편번호 찾기" 단추 누르면 팝업 레이어 열림 -->
	$("#btn_zipcode").click(()=>{
		var w = 500;
		var h = 500;
		var url = "post1.do";
		window.open(url,'zipcode','width='+w+',height='+h);
	});
	

	
	/* 저장 */
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
    	} else if(userid.split(" ").length>1){
    		alert("아이디에 공백 입력불가");
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
    	if(idchecked==false){
    		alert("아이디 중복을 확인을 해주세요.");
    		$("#userid").focus();
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
    
	/* ID중복체크 */
    $('#btn_idcheck').click(()=>{
    	
    	var userid = $("#userid").val();
    	userid=$.trim(userid);	
    	if(userid==""){
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	} else if(userid.split(" ").length>1){
    		alert("아이디에 공백 입력불가");
    		$("#userid").focus();
    		return false;
    	}
    	$("#userid").val(userid);
    	
    	$.ajax({
    		type:"POST",
    		data:"userid="+userid,
    		url:"idcheck.do",
    		dataType:"text",
    		success:function(result){
    			if(result=="ok"){
    				alert("사용 가능한 아이디입니다.");
    				idchecked=true;
    			} else {
    				alert("이미 사용중인 아이디입니다.");
    			}
    		},
    		error:function(){
    			alert("오류발생");
    		}
    	});
    });
    
    $("#userid").change(()=>{
    	if(idchecked==true){
    		idchecked=false;
    	}
    });
	
	
  });
  
  
  </script>
  
  

<body>

<%@ include file="../include/topmenu.jsp" %>
<form name="frm" id="frm">
	<table>
		<caption>회원가입 폼</caption>
		<tr>
			<th><label for="userid">아이디</label></th>
			<td>
				<input type="text" name="userid" id="userid" placeholder="아이디입력">
				<button type="button" id="btn_idcheck">중복체크</button>
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
				<input type="radio" name="gender" id="gender_M" value="M" checked>남
				<input type="radio" name="gender" id="gender_F" value="F">여
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
				<div style="width:70px; display:inline-block; ">우편번호 :</div><input type="text" name="zipcode" id="zipcode">
				<button type="button" id="btn_zipcode">우편번호찾기</button>
				<br>
				<div style="width:70px; display:inline-block; ">도로명주소 :</div><input type="text" name="address"id="address">
				<br>
				<div style="width:70px; display:inline-block; ">세부주소 :</div><input type="text" name="address_detail" id="address_detail">
			</td>
		</tr>
	</table>
	<div class="div_button">
		<button type="button" id="btn_submit">저장</button>
		<button type="reset">취소</button>
	</div>

</form>

</body>
</html>