<%@page import="com.gurobit5.model.bbs.entity.DtoLecAf"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>수강후기 Edit</h1>
	<form method="post">
	<div>
		<div>
			<span>작성일</span>
			<span>${dtoLecAf.nalja }</span>
			<span>조회수</span>
			<span>${dtoLecAf.viewNum }</span>
		</div>
		<div>
			<span>강의코드</span>
			<input type="text" name="lec_code" id="lec_code" value="${dtoLecAf.lec_code }">
		</div>
		<div>
			<span>제목</span>
			<input type="text" name="title" id="title" value="${dtoLecAf.title }">
		</div>
		<div>
			<span>내용</span>
			<input type="text" name="contents" id="contents" value="${dtoLecAf.contents }">
		</div>			
	</div>
	<div>
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</div>
	</form>
</body>
</html>