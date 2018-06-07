<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
	String urlThis = (String)request.getAttribute("urlThis");
	pageContext.setAttribute("urlThis", urlThis);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	try - 05-28 sskim
	
	
	로고 -->
	
	<!-- 메뉴 -->

	<!-- 본문 -->
	
	<h1>취업정보 글쓰기</h1>
	<div class="testcon">
	
	<form method="post">
		<div class ="">		
			<!-- num은 나중에 천천히 -->
			<label for="title">공고제목</label>
			<input type="text" name="title" id="title">
		</div>	
		<div class ="">
			<label for="company">업체명</label>
			<input type="text" name="company" id="company">	
		</div>
		<div class ="">
			<label for="company">모집인원</label>
			<input type="text" name="company" id="company">	
			<label for="company">고용형태</label>
			<input type="text" name="company" id="company">	
		</div>
		<div class ="">
			<label for="region">근무지</label>
			<input type="text" name="region" id="region">	
			<label for="due_date">마감일</label>
			<input type="text" name="due_date" id="due_date">	
		</div>
		<div class ="">
			<label for="sal">급여</label>
			<input type="text" name="sal" id="sal">	
			<label for="qualify">모집자격</label>
			<input type="text" name="qualify" id="qualify">	
		</div>
		<div class ="">
			<label for="email">접수처메일</label>
			<input type="text" name="email" id="email">	
		</div>
		<div>
			<textarea name="contents" rows="" cols=""></textarea>
		</div>	
		<div class ="action">
			<button type="submit">입력</button>		
			<button type="reset">리셋</button>		
			<button type="button">뒤로</button>		
		</div>	
	</form>
	</div>
	
	
	


</body>
</html>