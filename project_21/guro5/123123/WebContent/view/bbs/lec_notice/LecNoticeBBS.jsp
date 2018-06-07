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
		$('button').click(function(){
			window.location.href='?mode=add';
		});
		
	});
</script>
</head>
<body>
	<h1>강의공지 게시판</h1>
	<div>
		<div>
			<span>글번호</span>
			<span>제목</span>
			<span>글쓴이(ID)</span>
			<span>작성일</span>
			<span>조회수</span>
		</div>
		<c:forEach items="${requestScope.alist }" var="dtoLecNotice">
		<div>
			<span>${dtoLecNotice.rn }</span>
			<span><a href="?mode=detail&idx=${dtoLecNotice.num}&click=on">${dtoLecNotice.title }</a></span>
			<span>${dtoLecNotice.id }</span>
			<span>${dtoLecNotice.nalja }</span>
			<span>${dtoLecNotice.viewNum }</span>
		</div>
		</c:forEach>
	</div>
	<div>
		<!-- 강사만 -->
		<button>글쓰기</button>
	</div>
	
</body>
</html>