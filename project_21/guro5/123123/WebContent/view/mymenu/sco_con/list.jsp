<%@page import="com.gurobit5.model.entity.DtoLecInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		//수정 버튼을 누를때 
		$('#edit').click(function(){
			//체크된 학생의 아이디를 배열에 저장
			var str='';
			$('input[type=checkbox]').each(function(idx){
				if($(this).prop('checked')){
					if(idx==0) str=$(this).val();
					else{str=$(this).val()+','+str};
				}
			});
			window.location.href='?pageid=score_con&mode=edit&ids='+str;
			
		});
	});
	
</script>
</head>
<body>
	<h1>성적 관리</h1>
	<div>
		<div>
			<span>학생목록</span>
			<span>JAVA</span>
			<span>WEB</span>
			<span>DB</span>
			<span>총점</span>
		</div>
		<c:forEach items="${requestScope.list }" var="dtoScore">
		<div>
			<input type="checkbox" name="id" value="${dtoScore.id }">
			<span>${dtoScore.name }</span>
			<span>${dtoScore.java }</span>
			<span>${dtoScore.web}</span>
			<span>${dtoScore.db }</span>
			<span>${dtoScore.tot }</span>
		</div>
		</c:forEach>
	</div>
	<div>
		<button id="edit">수정</button>
	</div>





</body>
</html>