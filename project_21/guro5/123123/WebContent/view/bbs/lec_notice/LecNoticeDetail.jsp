<%@page import="com.gurobit5.model.bbs.entity.DtoLecAf"%>
<%@page import="java.util.ArrayList"%>
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
	$(function(){
		$('#num').css('display','none');
		var idx=$('#num').text();
		$('#list').click(function(){
			window.location.href='?mode=list';
		});
		$('#edit').click(function(){
			window.location.href='?mode=edit&idx='+idx;
		});
		$('#remove').click(function(){
			if(confirm('해당 게시물을 삭제하시겠습니까?')){
				$.post('?mode=del',{'idx':idx},function(){
					window.location.href='?mode=list';
				});
			}
		});
		
		
		
	});
</script>
</head>
<body>
	<h1>강의게시판 detail</h1>
	<div>
		<div>
			<span>제목</span><span>${dtoLecNotice.title }</span>
			<span id="num">${dtoLecNotice.num }</span>
		</div>
		<div>
			<span>글쓴이(ID)</span><span>${dtoLecNotice.id }</span>
			<span>작성일</span><span>${dtoLecNotice.nalja }</span>
			<span>조회수</span><span>${dtoLecNotice.viewNum }</span>
		</div>
		<div>
			<span>${dtoLecNotice.contents}</span>
		</div>
		<div>
			<button id="list">목록</button>
			<!-- 강사만 -->
			<button id="edit">수정</button>
			<button id="remove">삭제</button>
		</div>			
	</div>
	
</body>
</html>