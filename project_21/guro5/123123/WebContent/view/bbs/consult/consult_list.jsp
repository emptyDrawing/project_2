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
</head>
<body>
	<h1>상담게시판</h1>
	<div>
		<div>
			<span>글번호</span>
			<span>제목</span>
			<span>신청자</span>
			<span>등록일</span>
		</div>
		<c:forEach items="${requestScope.alist}" var="dtoConsult">
		<div>
			<span>${dtoConsult.rn}</span>
			<span><a href="?mode=detail&idx=${dtoConsult.num}">${dtoConsult.title}</a></td>
			<span>${dtoConsult.name}</span>
			<span>${dtoConsult.nalja}</span>
		</div>
		</c:forEach>
		<!-- 상담게시판에는 글쓰기 버튼 없음 -->
	</div>
</body>
</html>