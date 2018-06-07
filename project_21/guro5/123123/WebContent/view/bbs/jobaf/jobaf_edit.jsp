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
<script type="text/javascript">
	function returnList(){
		window.location.href='?mode=list';
	}
</script>
</head>
<body>
	<h1>취업현황게시판 수정페이지</h1>
	<form method="post">
	<div>
		<input type="hidden" value="${dtoJobAf.num }" name="num" />
	</div>
	<div>
		<label for="company">취업업체명</label>
		<input type="text" name="company" id="company" value="${dtoJobAf.company }">
	</div>
	<div>
		<label for="lec_code">교육과정</label>
		<select name="lec_code" id="lec_code">
			<c:forEach items="${clist}" var="item">
				<c:choose>
				<c:when test="${dtoJobAf.class_name eq item.className }">
				<option value="${item.lecCode}" selected>${item.className}</option>
				</c:when>
				<c:otherwise>
				<option value="${item.lecCode}">${item.className}</option>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<div>
		<label for="title">제목</label>
		<input type="text" name="title" id="title" value="${dtoJobAf.title }">
	</div>
	<div>
		<label for="name">취업자명</label>
		<input type="text" name="name" id="name" value="${dtoJobAf.name }">
	</div>
	<div>
		<label for="field">취업분야</label>
		<input type="text" name="field" id="field" value="${dtoJobAf.field }">
	</div>
	<div>
		<label for="contents">내용</label>
		<input type="text" name="contents" id="contents" value="${dtoJobAf.contents }">
	</div>
	<div>
		<button type="button" onclick="returnList()">목록</button>
		<button type="submit">수정</button>
		<button type="button" onclick="returnList()">취소</button>
	</div>
	</form>	
</body>
</html>