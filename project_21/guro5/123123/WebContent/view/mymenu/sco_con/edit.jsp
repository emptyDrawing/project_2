<%@page import="com.gurobit5.model.entity.DtoLecInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		//취소버튼 누를때
		$('button[type="button"]').click(function(){
			window.location.href='?pageid=score_con&mode=list';
		});
		
		
	});
	
</script>
</head>
<body>
	<h1>성적 관리(수정)</h1>
	<form method="POST">
		<div>
			<div>
				<span>학생목록</span>
				<span>JAVA</span>
				<span>WEB</span>
				<span>DB</span>
				<span>총점</span>
			</div>
			<div>
					<!-- 고쳐야함 -->
				<c:forEach items="${requestScope.list }" var="dtoScore">
				<c:set var="chk1" value="${requestScope.chk }"></c:set>
					<c:choose>
					<c:when test="${ fn:contains(chk1,dtoScore.id)}">
						<div target="on">
						<input type="hidden" value="${dtoScore.id }" name="id" id="id" />
						<span>${dtoScore.name }</span>
						<input type="text" value="${dtoScore.java }" name="java" id="java"/>
						<input type="text" value="${dtoScore.web }" name="web" id="web"/>
						<input type="text" value="${dtoScore.db }" name="db" id="db"/>
						<input type="text" value="${dtoScore.tot }" name="tot" id="tot"/>
						</div>
					</c:when>
					<c:otherwise>
						<div>
						<span>${dtoScore.name }</span>
						<span>${dtoScore.java }</span>
						<span>${dtoScore.web}</span>
						<span>${dtoScore.db }</span>
						<span>${dtoScore.tot }</span>
						</div>
					</c:otherwise>
					</c:choose>
					
				</c:forEach>
			</div>
		</div>
		<div>
			<button type="submit">완료</button>
			<button type="button">취소</button>
		</div>
	</form>

</body>
</html>