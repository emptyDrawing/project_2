<%@page import="com.gurobit5.model.entity.DtoLecInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호확인</title>
</head>
<body>
	<c:choose>
	<c:when test="${findM eq '없음' }">
		<div>
			<label>잘못된 정보를 입력하셨습니다.</label>
			<button type="button" onclick="window.history.back()">뒤로가기</button>
		</div>
	</c:when>
	<c:otherwise>	
		<div>
			<label>PW : ${findM}</label>
		</div>
		 <button type="button" onclick="location.href='?mode=list'">로그인</button>
	</c:otherwise>
	</c:choose>
</body>
</html>