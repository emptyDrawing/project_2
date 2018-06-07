<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>성적확인 detail</h1>
	<div>
		<span>${dtoScore.name } 님의 출결 </span>
	</div>
	<div>
		<div>
			<span>강의명</span>
			<span>JAVA</span>
			<span>DB</span>
			<span>WEB</span>
			<span>총점</span>
		</div>
		<div>
			<span>${dtoScore.class_name }</span>
			<span>${dtoScore.java }</span>
			<span>${dtoScore.db }</span>
			<span>${dtoScore.web}</span>
			<span>${dtoScore.tot }</span>
		</div>
	</div>
		
	
</body>
</html>