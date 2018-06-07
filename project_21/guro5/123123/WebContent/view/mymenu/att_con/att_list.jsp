<%@page import="com.gurobit5.model.bbs.entity.DtoLecAf"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('button[type="button"]').click(function(){
			window.location.href='?mode=list';
		});
	});
</script>
</head>
<body>
	<h1>출결확인</h1>
	<div>
		<div>
			<span>학생이름/연락처</span>
			<span>강의명</span>
			<span>출결상태</span>
		</div>
		<c:forEach items="${daoMemberlist}" var="daoMember">
		<div>
			<span>
				<a href="?pageid=att_con&mode=detail&idx=${dtoMember.id}">
				${dtoMember.name}/${dtoMember.phone}</a>
			</span>
			<span>${dtoMember.id }</span>
		</div>
		</c:forEach>
	</div>
	<div>
		<!-- 강사만 -->
		<button>글쓰기</button>
	</div>
</body>
</html>