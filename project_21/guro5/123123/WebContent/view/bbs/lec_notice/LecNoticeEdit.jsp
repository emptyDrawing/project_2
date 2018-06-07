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
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('button[type="button"]').click(function(){
			window.location.href='?mode=list';
		});
	});
</script>
</head>
<body>
	<h1>강의게시판 수정</h1>
	<div>
		<!-- title, contents 필수 -->
		<form method="post">
			<div>
				<span>제목</span><input type="text" value="${dtoLecNotice.title }" name="title" id="title"/>
				<input type="hidden" value="${dtoLecNotice.num }" name="num" />
			</div>
			<div>
				<span>글쓴이(ID)</span><span>${dtoLecNotice.id }</span>
				<span>작성일</span><span>${dtoLecNotice.nalja }</span>
				<span>조회수</span><span>${dtoLecNotice.viewNum }</span>
			</div>
			<div>
				<input type="text" value="${dtoLecNotice.contents}" name="contents" id="contents"/>
			</div>	
			<div>
				<button type="submit">수정</button>
				<button type="button">취소</button>
			</div>		
		</form>
	</div>
	
</body>
</html>