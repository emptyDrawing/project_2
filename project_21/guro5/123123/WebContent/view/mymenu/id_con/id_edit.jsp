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
</script>


<title>Insert title here</title>
</head>
<body>
	<div>
	<form method="post">
		<div>
			<span class="lab">id</span><span class="val">${dtoMember.id}</span>
			<span class="lab">이름</span><span class="val">${dtoMember.name}</span>
			</br> <span class="lab">휴대폰</span><span class="val">${dtoMember.phone}</span>
			<span class="lab">이메일</span><span class="val">${dtoMember.email}</span> </br> 
			<label class="lab" for = " memType">계정유형</label>
			<select name = memType class="val">
					<c:forEach var="itemN" items="${memTypeListN }" varStatus="statusN" >
					<c:forEach var="itemV" items="${memTypeListV }" varStatus="statusV">
						<c:choose>
						<c:when test="${statusN.index eq statusV.index }">
							<c:choose>
							<c:when test="${ dtoMember.memType eq itemV }">
								<option selected value="${itemV }">${itemN}</option>
							</c:when>
							<c:otherwise>
								<option value="${itemV }">${itemN}</option>
							</c:otherwise>
							</c:choose>
						</c:when>
						</c:choose>
					</c:forEach>
					</c:forEach>
				</select>
			<span class="lab">강의코드</span><span class="val">${dtoMember.lecCode}</span>
			</br>
			<input type="hidden" name="id" value="${dtoMember.id }"/>
			<label class="lab" for="pwInit">비밀번호초기화</label>
			<input class="chk" name="pwInit" type="checkbox" value="Y">
		</div>
		<div>
			<button type = "submit" class="edit">확정하기</button>
			<button type = "reset" >리셋하기</button>
		</div>
	</form>
	</div>



</body>
</html>