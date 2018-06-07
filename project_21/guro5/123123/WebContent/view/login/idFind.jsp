<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디찾기</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
</script>

</head>
<body>
	<form method="post">
	<div>
		<label for=name>이름</label>
		<input type="text" name="name" value="이름을 입력해주세요"/>
	</div>
	<div>
		<label for="phone">연락처</label>
		<input type="tel" name="phone" value="연락처를 입력해주세요"/>
	</div>
	<button type="submit">찾기</button>
	</form>
</body>
</html>