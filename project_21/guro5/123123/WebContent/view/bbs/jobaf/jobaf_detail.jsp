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
<script type="text/javascript" src="${rootPath }/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function returnList(){
		window.location.href="?mode=list";
	}
	function edit(num){
		window.location.href=("?mode=edit&idx="+num);
	}
	function deleteon(num){
		if(confirm("해당 게시글을 삭제하시겠습니까?")){
			$.post('?mode=del',{'idx':num},function(){
				window.location.href='?mode=list';
			});
		}
	}
</script>
</head>
<body>
	<h1>취업현황게시판 상세페이지</h1>
	<div>
		<div>
			<span>글번호</span>
			<span>${dtoJobAf.num }</span>
		</div>
		<div>
			<span>취업업체명</span>
			<span>${dtoJobAf.company }</span>
		</div>
		<div>
			<span>교육과정</span>
			<span>${dtoJobAf.class_name}</span>
		</div>
		<div>
			<span>제목</span>
			<span>${dtoJobAf.title }</span>
		</div>
		<div>
			<span>취업자명</span>
			<span>${dtoJobAf.name }</span>
		</div>
		<div>
			<span>취업분야</span>
			<span>${dtoJobAf.field }</span>
		</div>
		<div>
			<span>내용</span>
			<span>${dtoJobAf.contents }</span>
		</div>
		<div>
			<button type="button" onclick="returnList()">목록</button>
			<button type="button" onclick="edit(${dtoJobAf.num })">수정</button>
			<button type="button" onclick="deleteon(${dtoJobAf.num })">삭제</button>
		</div>
	</div>
</body>
</html>