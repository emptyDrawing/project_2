<%@page import="java.util.ArrayList"%>
<%@page import="com.gurobit5.model.bbs.entity.DtoJobAf"%>
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
	function moveAdd(){
		window.location.href="?mode=add";
	}
</script>
</head>
</head>
<body>
	<h1>취업현황게시판</h1>
	<div>
		<div>
			<span>글번호</span>
			<span>취업자명</span>
			<span>제목</span>
			<span>교육과정</span>
			<span>취업업체명</span>
			<span>취업분야</span>
			<span>등록일</span>
		</div>
		<c:forEach items="${requestScope.alist}" var="dtoJobAf">
		<div>
			<span>${dtoJobAf.rn}</span>
			<span>${dtoJobAf.name}</span>
			<span><a href="?mode=detail&idx=${dtoJobAf.num}">${dtoJobAf.title}</a></span>
			<span>${dtoJobAf.lec_code}</span>
			<span>${dtoJobAf.company}</span>
			<span>${dtoJobAf.field}</span>
			<span>${dtoJobAf.nalja}</span>
		</div>
		</c:forEach>
		<div>
			<button onclick="moveAdd()">글쓰기</button>
		</div>
	</div>
</body>
</html>