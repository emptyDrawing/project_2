<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	function clear(elem) {
		//elem.$('input').value="";
		console.log(elem.value);
		elem.value="";
	}
	function loginChk(){
		var id = $("input[name=id]").val();
		var pw = $("input[name=password]").val();
		$.post("?mode=login", {"id":id,"password":pw} , function( data ) {
			  if(data.result == 1 ){
				alert(data.name+"님 환영합니다.");
				window.location.href="/";
			  }else{
				  
			  }
		});
	}
</script>
<body>
	<form method="post">
	<div>
		<label>아이디</label>  <input type="text" name="id" onfocus="clear(this)" value="아이디" /><br>
		<label>비밀번호 <input type="password" name="password" onfocus="clear(this)"  value="비밀번호를 입력해주세요" /></label><br>
		<button type="button" onclick="loginChk()">로그인</button><br>
	</div>
	<label><a href="?mode=join">회원가입</a> | </label>
	<label><a href="?mode=idChk">아이디찾기</a> | </label>
	<a href="?mode=pwChk">비밀번호찾기</a><br>
	
	</form>
</body>
</html>