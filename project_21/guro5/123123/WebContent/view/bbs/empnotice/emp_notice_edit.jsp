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
	function moveList(){
		window.location.href="?mode=list";
	}
</script>
</head>
<body>
	<h1>직원공지사항게시글 수정페이지</h1>
	<form method="post">
		<div>
			<input type="hidden" value="${dtoEmpNotice.num }" name="num" />
		</div>
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title" value="${dtoEmpNotice.title }">
		</div>
		<div>
			<label for="contents">내용</label>
			<input type="text" name="contents" id="contents" value="${dtoEmpNotice.contents }">
		</div>
		<div>
			<button type="submit">수정</button>
			<button onclick="moveList()">취소</button>
		</div>
	</form>
</body>
</html>