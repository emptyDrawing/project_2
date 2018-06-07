<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function checkId(){
		var id=$('input[id=id]').val();
		for(var i=0; i<id.length; i++){
			var su=id.charCodeAt(i);
			if(i==0){
				if(!((su>=65 && su<=90)
						|| (su>=97 && su<=122))) return false;
			} else {
				if(!((su>=65 && su<=90)
						|| (su>=97 && su<=122)
						|| (su>=48 && su<=57))) false; 
			}
		}
		return true;
	}
	
	function checkPw() {
		var boo1=false;
		var boo2=false;
		var boo3=false;
		var pw = $('input[id=password]').val();
		for(var i=0; i<pw.length; i++) {
			var su=pw.charCodeAt(i);
			if(su>=65 && su<=90) boo1 = true;
			if(su>=97 && su<=122) boo2 = true;
			
		}
		if(boo1 && boo2 && boo3) return true;
		else return false;
	}
	
	function checkRe() {
		var pw = $('input[id=password]').val();
		var re = $('input[id=pwchk]').val();
		if(pw==re)return true;
		else return false;
	}
	
	function checkKor() {
		name = $('input[id=name]').val();
		for(i=0; i<=name.length; i++){
			if(!((name.charCodeAt(i) > 0x3130 && name.charCodeAt(i) < 0x318F) ||
					(name.charCodeAt(i) >= 0xAC00 && name.charCodeAt(i) <= 0xD7A3))) {
				alert("이름을 한글로 작성해주세요.");
				name.value="";
				return false;
			}else return true;
		}
	}
	
	$(document).ready(function() {
		$('form input').first().focus();
		$('form input').blur(function(e){
			var i=$('form input').index(this);
			$('.err').remove();
			var param=$(this).val();
			var err=$('<span/>').addClass('err');
			var msg;
			
			if(param==''){
				msg='값이비었음';
			}else{
				if(i==0 && !checkId()) msg='영문, 숫자만가능(첫글자 영문)';
				if(i==1 && !checkPw()) msg='영소,영대,숫자조합</span>';
				if(i==2 && !checkRe()) msg='동일하지 않음';
				if(i==3 && !checkKor()) msg='한글만 가능';
			}
			err.text(msg);
			param=$(this).after(err);
		});
		
		$('form').submit(function(e){
			e.preventDefault();
			console.log(e);
			$('.err').remove();
			var id=$('input[id=id]').val();
			if(id=='') {
				id=$('input[id=id]').after('<span class="err">값이비었음</span>');
			}else if(!checkId()){
				id=$('input[id=id]').after('<span class="err">영문, 숫자만가능(첫글자 영문)</span>');
			}
			var pw=$('input[id=password]').val();
			if(pw==''){
				pw=$('input[id=password]').after('<span class="err">값이비었음</span>');
			}else if(!checkPw()){
				pw=$('input[id=password]').after('<span class="err">영소,영대,숫자 조합</span>');
			}
			var re=$('input[id=pwchk]').val();
			if(re==''){
				re=$('input[id=pwchk]').after('<span class="err">값이비었음</span>');
			}else if(!checkRe()){
				re=$('input[id=pwchk]').after('<span class="err">동일하지 않음</span>');
			}
			var name=$('input[id=name]').val();
			if(name=''){
				name=$('input[id=name]').after('<span class="err">값이비었음</span>');
			}else if(!checkKor()){
				name=$('input[id=name]').after('<span class="err">한글만 입력가능</span>');
			}
			if($('.err')==null){
				$(this).submit();
			}
			
		});
	});
	// 해당요소의 값 초기화
	function clear(elem) {
		//elem.$('input').value="";
		elem.document.getElementById("input").value="";
	}
	// 아이디 중복 여부 확인
	function openConfirmid() {
		// 아이디 입력여부 확인
		var inputid=$('input[id=id]').val();
		if(inputid=="") {
			alert("아이디를 입력하세요");
			return;
		}
		// url과 사용자 입력 id 조합
		url = "?mode=joinChk&id=" + inputid;
		
		// 새로운 윈도우 오픈
		open(url, "confirm",
				"toobar=no,location=no,status=no,menubar=no,scrollbars=no,resizeable=no,width=310,height=180");
	}
</script>
<body>
	<h1>회원가입</h1>
	<form method="post" >
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="아이디를 입력해주세요"/>
			
		</div>
			<button type="button" id="overapId" onclick="openConfirmid()">ID중복확인</button>
		<div>
			<label for="password">비밀번호</label>
			<input type="password" name="password" id="password" />
			<label for="password2">비밀번호를 입력해주세요</label>
		</div>
		<div>
			<label for="pwchk">비밀번호재입력</label>
			<input type="password" name="pwchk" id="pwchk" />
			<label for="pwchk2">비밀번호를 재입력해주세요</label>
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" maxlength="9"/>
			<label for="name2">공백없이 한글만 입력 가능</label>
		</div>
		<div>
			<label for="phone">휴대폰번호</label>
			<input type="tel" name="phone" id="phone" />
			<label for="phone2">'-'없이 입력해주세요</label>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" />
			<label for="email2">이메일을 입력해주세요</label>
		</div>
		<div>
			<button type="submit">가입</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>