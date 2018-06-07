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
		$('#edit').click(function(){
			window.location.href='${urlThis}?mode=edit&idx='+idx;
		});
		$('#remove').click(function(){
			if(confirm('해당 게시물을 삭제하시겠습니까?')){
				$.post('${urlThis}?mode=del',{'idx':idx},function(){
					window.location.href='${urlThis}?mode=list';
				});
			}
		});
		
	});
</script>
</head>
<body>
	<h1>수강후기 detail</h1>
	<div>
		<div>
			<%-- <span>글번호</span><span>${dtoLecAf.num }</span> --%>
			<span>제목</span><span>${dtoLecAf.title }</span>
		</div>
		<div>
			<span>글쓴이(ID)</span><span>${dtoLecAf.id }</span>
			<span>작성일</span><span>${dtoLecAf.nalja }</span>
			<span>조회수</span><span>${dtoLecAf.viewNum }</span>
			<span>강의명</span><span>${dtoLecAf.className }</span>
		</div>
		<div>
			<span>${dtoLecAf.contents }</span>
		</div>			
	</div>
	<div>
		<button type="button">목록</button>
		<button type="button">수정</button>
		<button type="button">삭제</button>
	</div>
</body>
</html>