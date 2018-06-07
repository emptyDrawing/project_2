<%@page import="java.util.ArrayList"%>
<%@page import="com.gurobit5.model.bbs.entity.DtoConsult"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript" src="${rootPath }js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h1>상담게시판 입력페이지</h1>
	<form method="post">
	<div>
		<label for="title">제목</label>
		<input type="text" name="title" id="title">
	</div>
	<div>
		<label for="name">이름</label>
		<input type="text" name="name" id="name">
	</div>
	<div>
		<label for="gen">성별</label>
		<input type="radio" name="gen" id="gen" value="남"> 남성
		<input type="radio" name="gen" id="gen" value="여"> 여성
	</div>
	<div>
		<label for="email">이메일</label>
		<input type="email" name="email" id="email">
	</div>
	<div>
		<label for="purpose">수강목적</label>
		<input type="radio" name="purpose" id="purpose" value="job"> 취업특강
		<input type="radio" name="purpose" id="purpose" value="vacation"> 방학특강
	</div>
	<div>
		<label for="phone">휴대폰</label>
		<input type="text" name="phone" id="phone" value=" - 없이 입력해주세요.">
	</div>
	<div>
		<label for="contents">내용</label>
		<textarea name="contents" id="contents"></textarea>
	</div>
	<div>
		<button type="submit">상담신청</button>
		<button type="reset">취소</button>
	</div>
	</form>
</body>
</html>