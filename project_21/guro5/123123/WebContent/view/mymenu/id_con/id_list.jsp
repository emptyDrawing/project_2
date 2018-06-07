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
		$("#test").click( function(){
			if($("input:checked").length){
				// 실제 보낼 데이터용			
				var list = new Array();
				// 보여줄 데이터용
				var showM ='### 변경될 내용 [아이디/이름] --> [변경유형] ###';
				var parent;
				$("input:checked").each(function(idx){
		            var data = new Object() ;
		            parent = $(this).parent().attr("change","on")
					selv = parent.find('option:selected').attr("value");
					seln = parent.find('option:selected').text();
					id = parent.find('span.id').text();
					name = parent.find('span.name').text();
					idV = $(this).val();
					// 데이터 담기용
					data.id = id;
					data.memtype = selv;
					list.push(data);
					
					showM = showM
						+'\n'
						+'#'+(idx+1)+' ['+id+'/'+name+']'+' --> '+'['+seln+']';
				});
				showM = showM+'\n'+'#### 위의 내용으로 변경하시겠습니까? ####';
				// ajax
		        var jsonData = JSON.stringify(list) ;
		        /*
		            출력결과 : [{"number":1,"name":"Tester #1"},{"number":2,"name":"Tester #2"}]
		        */
		        if(confirm(showM)){
					$.post('${rootPath}ajax.bit?mode=ch_mem_t',{'data':jsonData},function(){
						window.location.href='?pageid=id_con&mode=list';
					});
				}
			}else{
				alert("선택된 항목이 없습니다.");
			}
		});
	});// 


</script>
<title>Insert title here</title>
</head>
<% 
	String conOn = (String) request.getAttribute("acceptOn");
	if("on".equals(conOn))pageContext.setAttribute("conOn", "OK");
%>
<body>
	<div class ="search_bar ">
		<!-- 서치바 넣을거임 -->
	</div>
	<div class ="con" target="on">
		<c:forEach var="item" items="${dtoMemberList }"> 
			<div class="row" change="no" >
			<!--  1로우 -->
				<span class="id"><a href="?pageid=id_con&mode=detail&idx=${item.id }">${item.id }</a></span>			
				<span class="name"><a href="?pageid=id_con&mode=detail&idx=${item.id }">${item.name }</a></span>
				<select>
					<c:forEach var="itemN" items="${memTypeListN }" varStatus="statusN" >
					<c:forEach var="itemV" items="${memTypeListV }" varStatus="statusV">
						<c:choose>
						<c:when test="${statusN.index eq statusV.index }">
							<c:choose>
							<c:when test="${ item.memType eq itemV }">
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
				<input type="checkbox" value="${item.id}">
			</div>
		</c:forEach>	
	</div>
	<button id="test">확정하기</button>

</body>
</html>