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
	<h1>취업현황게시판 작성페이지</h1>
	<form method="post">
	<div>
		<label for="company">취업업체명</label>
		<input type="text" name="company" id="company">
	</div>
	<div>
		<label for="lec_code">강의코드</label>
		<select size="5" name="lec_code" id="lec_code">
			<c:forEach items="${requestScope.lecinfo_list}" var="lecinfo_list">
				<option>${lecinfo_list.className}</option>	
			</c:forEach>
		</select>
	</div>
	<div>
		<label for="title">제목</label>
		<input type="text" name="title" id="title">
	</div>
	<div>
		<label for="name">취업자명</label>
		<input type="text" name="name" id="name">
	</div>
	<div>
		<label for="field">취업분야</label>
		<input type="text" name="field" id="field">
	</div>
	<div>
		<label for="contents">내용</label>
		<textarea name="contents" id="contents"></textarea>
	</div>
	<div>
		<button type="submit">완료</button>
		<button type="reset">취소</button>
	</div>
	</form>
</body>
</html>