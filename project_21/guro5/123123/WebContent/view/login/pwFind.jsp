<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
</head>
<body>
	<h1>비밀번호찾기</h1>
	<form method="post">
	<div>
		<label for=id>아이디</label>
		<input type="text" name="id" value="아이디를 입력해주세요"/>
	</div>
	<div>
		<label for="name">이름</label>
		<input type="text" name="name" value="이름을 입력해주세요"/>
	</div>
	<div>
		<label for="phone">연락처</label>
		<input type="text" name="phone" value="'-'을 제외한 휴대폰번호를 입력해 주세요"/>
	</div>
	<button type="submit">찾기</button>
	</form>
</body>
</html>