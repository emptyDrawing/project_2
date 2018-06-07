<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${rootPath }js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.edit').click(function(){
		window.location.href='?pageid=id_con&mode=edit&idx=${dtoMember.id}';
	});
});


</script>


<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<span class="lab">id</span><span class="val">${dtoMember.id}</span>
			<span class="lab">이름</span><span class="val">${dtoMember.name}</span>
			</br> <span class="lab">휴대폰</span><span class="val">${dtoMember.phone}</span>
			<span class="lab">이메일</span><span class="val">${dtoMember.email}</span> </br> 
			<span class="lab">계정유형</span><span class="val">${dtoMember.memTypeName}</span> 
			<span class="lab">강의코드</span><span class="val">${dtoMember.lecCode}</span>
			</br>
		</div>
		<div>
			<button class="edit">수정하기</button>
		</div>
	</div>



</body>
</html>