<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소입력창</title>
</head>

<style>
	table{
		width:460;
		margin-left:20px;
		text-align:center;
		font-size:12pt;
		font-weight:bold;
	}
	.search_button,.keyword{
		margin-left:10px;
	}
	#postcodify{
		margin-left:10px;
		font-size:12pt;
		font-weight:bold;
	}
</style>

  	<!-- 우편번호 검색 (https://www.poesis.org/postcodify/guide/example)-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<script>
    $(function() { 
    	$("#postcodify").postcodify({
	        insertPostcode5 : "#postcode",
	        insertAddress : "#address",
	        insertDetails : "#details",
	        insertExtraInfo : "#extra_info",
	        hideOldAddresses : false
    	}); 
    	
    	$("#btn_send").click(()=>{
    		
    		var zipcode = $("#postcode").val();
    		var address = $("#address").val();
    		var address_detail = $("#details").val();
    		
     		opener.document.frm.zipcode.value = zipcode;
    		opener.document.frm.address.value = address;
    		opener.document.frm.address_detail.value = address_detail;
    		
    		self.close();
    	});
    	
    });
</script>
<body>
<div id="postcodify"></div>
<hr/>
<form name="post1" id="post1">
<table>
	<tr>
		<th>우편번호</th>
		<td>
			<input type="text" name="zipcode" id="postcode" ><br />
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" name="address" id="address" ><br />
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>
			<input type="text" name="address_detail" id="details" ><br />
		</td>
	</tr>
	<tr>
		<th colspan="2">
		</th>
		<td>
		<button type="button" id="btn_send">입력</button></td>
	</tr>
</table>

</form>
</body>
</html>