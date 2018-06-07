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
	<!-- 로고 try - 05-28 sskim -->
	
	<!-- 메뉴 -->

	<!-- 본문 -->
	
	<h1>취업정보 상세보기</h1>
	<div class="testcon">
		<div class ="">		
			<!-- num은 나중에 천천히 -->
			<span class="lab">공고제목</span><span class="inp"></span>
		</div>	
		<div class ="">
			<span class="lab">업체명</span><span class="inp"></span>
		</div>
		<div class ="">
			<span class="lab">모집인원</span><span class="lab">고용형태</span>
		</div>
		<div class ="">
			<span class="lab">근무지</span><span class="lab">마감일</span>
		</div>
		<div class ="">
			<span class="lab">급여</span><span class="lab">모집자격</span>
		</div>
		<div class ="">
			<span class="lab">접수처메일</span>
		</div>
		<div>
			<textarea name="contents" rows="" cols=""></textarea>
		</div>	
		<div class ="action">
			<button type="submit">입력</button>		
			<button type="reset">리셋</button>		
			<button type="button">뒤로</button>		
		</div>	
	</div>
	


</body>
</html>