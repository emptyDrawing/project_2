<%@page import="com.gurobit5.model.entity.DtoLecInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class ="con ">
		<h1>강의개설</h1>
		<div class="column2_1">
			<span class="lab">강의명</span><span class="val">${bean.className }</span>
			<span class="lab">강사명</span><span class="val">${bean.teacher }</span>
			<span class="lab">강의실</span><span class="val">${bean.classno }</span>
			<span class="lab">강의코드</span><span class="val">${bean.lecCode }</span>
		</div>
		<div class="column_2_1">
			<span class="lab">개강일</span><span class="val">${bean.openDate }</span>
			<span class="lab">종강일</span><span class="val">${bean.endDate }</span>
			<span class="lab">최대결석일</span><span class="val">${bean.maxAB }</span>
			<span class="lab">키워드</span><span class="val">${bean.keyword }</span>
		</div>
	</div>





</body>
</html>