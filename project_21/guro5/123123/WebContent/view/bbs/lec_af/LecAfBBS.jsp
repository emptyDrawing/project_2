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
	<h1>수강후기 게시판</h1>
	<div>
		<div>
			<span>글번호</span>
			<span>제목</span>
			<span>글쓴이(ID)</span>
			<span>작성일</span>
			<span>조회수</span>
		</div>
		<c:forEach items="${requestScope.alist }" var="dtoLecAf">
		<div>
			<span>${dtoLecAf.rn }</span>
			<span><a href="&{urlThis}?mode=detail&idx=${dtoLecAf.num}">${dtoLecAf.title }</a></span>
			<span>${dtoLecAf.id }</span>
			<span>${dtoLecAf.nalja }</span>
			<span>${dtoLecAf.viewNum }</span>
		</div>
		</c:forEach>
	</div>
	<div>
		<button>글씨기</button>
	</div>
	
</body>
</html>