<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String idx = request.getParameter("idx");
	pageContext.setAttribute("idx", idx);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("form").submit(function(e){
			e.preventDefault();
			var idx = $(this).find('input').val();
			var answer = $(this).find('textarea').val();
			$.post( "?mode=answer",{'idx':idx,'answer':answer}, function() {
				alert("입력을 완료 하였습니다.");
				opener.document.location.reload();
				window.close();
			});
		});
	});
</script>
</head>
<body>
<form method ="post">
	<input type="hidden"name="idx" value="${idx }"/>
	<h1>상담입력</h1>
	<textarea rows="15" cols="60" name="answer" id="answer"></textarea>
	<div>
		<button type="submit">입력</button>
		<button type="reset">취소</button>
	<div>
</form>
</body>
</html>