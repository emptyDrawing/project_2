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
<body>
	<h1>직원 공지사항 게시판</h1>
	<div>
		<div>
			<span>글번호</span>
			<span>제목</span>
			<span>아이디</span>
			<span>날짜</span>
			<span>조회수</span>
		</div>
		<c:forEach items="${requestScope.alist}" var="DtoEmpNotice">
		<div>
			<span>${DtoEmpNotice.rn }</span>
			<span><a href="?mode=detail&idx=${DtoEmpNotice.num}">${DtoEmpNotice.title }</a></span>
			<span>${DtoEmpNotice.id }</span>
			<span>${DtoEmpNotice.nalja }</span>
			<span>${DtoEmpNotice.view_num }</span>
		</div>
		</c:forEach>
		<div>
			<button onclick="moveAdd()">글쓰기</button>
		</div>
	</div>
</body>
</html>