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
	function movelist(){
		window.location.href="?mode=list";
	}
	
	function edit(num){
		window.location.href="?mode=edit&idx="+num;
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
	<h1>직원공지사항 게시글</h1>
	<form method="post">
		<div>
			<input type="hidden" value="${dtoEmpNotice.num }" name="num" />
		</div>
		<div>
			<span>제목</span>
			<span>${dtoEmpNotice.title }</span>
		</div>
		<div>
			<span>조회수</span>
			<span>${dtoEmpNotice.view_num }</span>
		</div>
		<div>
			<span>날짜</span>
			<span>${dtoEmpNotice.nalja }</span>
		</div>
		<div>
			<span>내용</span>
			<span>${dtoEmpNotice.contents }</span>
		</div>
		<div>
			<button onclick="movelist()">목록</button>
			<button onclick="edit(${dtoEmpNotice.num })">수정</button>
			<button onclick="deleteon(${dtoEmpNotice.num })">삭제</button>
		</div>
	</form>
</body>
</html>