<%@page import="com.gurobit5.model.entity.DtoLecRoom"%>
<%@page import="com.gurobit5.model.entity.DtoMember"%>
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
<title>강의 수정</title>
<script src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script>
	function calcDate(start, end) {
		var date1 = new Date(start);
		var date2 = new Date(end);
		var count = 0;
		while (true) {
			var temp_date = date1;
			if (temp_date.getTime() > date2.getTime()) {
				console.log("count : " + count);
				break;
			}else{
				var tmp = temp_date.getDay();
				if (tmp == 0 || tmp == 6) {
					// console.log("주말");
				}else{
					// console.log("평일");
					count++;
				}
				temp_date.setDate(date1.getDate() + 1);
			}// if- else end
		}// while end */
		return count;
	}// calcDate();
	
	function checkBeforeSubmit() {
		// 유효성검사에 성공하면 true / 실패하면 false
		// 강의제목
		var className = $('#className').val();
		var teacher;
		$('#teacher>option').each(function() {
			if ($(this).prop('selected'))
				teacher = $(this).val();
		});
		var classno;
		$('#classno>option').each(function() {
			if ($(this).prop('selected'))
				classno = $(this).val();
		});
		var openDate = $('#openDate').val();
		var endDate = $('#endDate').val();
		var maxAB = calcDate(openDate, endDate);
		var keyword;
		$('#keyword>option').each(function() {
			if ($(this).prop('selected'))
				keyword = $(this).val();
		});
		console.log(maxAB);
		// 일단 값만 받았음 유효성 검사해야됨
		// 검사해야될것 : className 
		if(maxAB<1){
			return false
		}
		$('#maxAB').val( Math.ceil(maxAB*0.2) );
		
		return true;
	}//

	$(function() {
		form = document.querySelector('form');
		$('form').submit(function(e){
			e.preventDefault();
			if(checkBeforeSubmit()){
				// 참일때 submit
				form.submit();
			}
		});
	});
</script>
<style>
 .column2_1 {
 	witdh: 200px;
 	float : left;
 }
</style>
</head>
<body>
	<div class ="con ">
		<h1>강의 수정</h1>
		<form method="post">
		<div class="column2_1">
			<label for="className" class="lab">강의명</label>
			<input id="className" name="className" type="text" class="val" value="${dtoJobInfo.className }"/>
			<br/>
			<label  class="lab" for="teacher" >강사명</label>
			<select id="teacher" class="val" name="teacher"> 
			<c:set var="beanTea" value="<%=new DtoMember() %>"></c:set>
			<c:forEach items="${requestScope.tealist }" var="beanTea">
				<c:if test="${beanTea.name eq dtoJobInfo.teacher}" >
					<option selected="selected" >${beanTea.name}</option> 
				</c:if>
				<c:if test="${beanTea.name ne dtoJobInfo.teacher}" >
					<option>${beanTea.name}</option> 
				</c:if>
			</c:forEach>
			</select>
			<br/>
			<label for="classno" class="lab">강의실</label>
			<select id="classno" name="classno" class="val" >  
			<c:set var="beanRoom" value="<%=new DtoLecRoom() %>"></c:set>
			<c:forEach items="${requestScope.roomlist }" var="beanRoom">
				<c:if test="${beanRoom.classno eq dtoJobInfo.classno}" >
					<option selected="selected">${beanRoom.classno}</option> 
				</c:if>
				<c:if test="${beanRoom.classno ne dtoJobInfo.classno}" >
					<option>${beanRoom.classno}</option> 
				</c:if>
			
			</c:forEach>
			</select>
			<br/>
			<label for="lecCode" class="lab">강의코드</label><span class="val auto">${dtoJobInfo.lecCode }</span>
			<input id="lecCode" name="lecCode" type="hidden" value="${dtoJobInfo.lecCode }"/>
		</div>
		<div class="column_2_1">
			<label for="openDate" class="lab">개강일</label><input id="openDate" type="date" name="openDate" class="val" value="${dtoJobInfo.openDate }"/> 
			<br/>
			<label for="endDate" class="lab">종강일</label><input id="endDate" type="date" name="endDate" class="val" value="${dtoJobInfo.endDate }"/>
			<br/>
			<label for="maxAB" class="lab">최대결석일</label><span class="val auto">자동계산</span>
			<input id="maxAB" type="hidden" name="maxAB" value="null">
			<br/>
			<label for="keyword" class="lab">키워드</label>
			<select id="keyword" name="keyword" class="val">
				<option selected="selected">Java</option>
				<option>Web</option>
				<option>DB</option>
			</select>
		</div>
		<div class=""> 
			<label for="preview" class="lab">강의미리보기 링크</label>
			<input type="text" id="preview" class="val long" name="preview" value="${dtoJobInfo.preView }" />
		</div>
		<div class=""> 
			<label for="status" class="lab">공개여부</label>
			<c:if test="${dtoJobInfo.status eq 2}">
				<input type="checkbox" id="status" class="val" name="status" value="2" checked />
			</c:if>
			<c:if test="${dtoJobInfo.status eq 1 or dtoJobInfo.status eq 3}">
				<input type="checkbox" id="status" class="val" name="status"/>
			</c:if>
		</div>
		<div class=""> 
			<textarea class="" name="contents"></textarea>
		</div>
		<div class="btnline" style="clear:both;">
			<button type="submit">전송</button>
			<button type="reset">리셋</button>
		</div>
		</form>
	</div>

</body>
</html>
