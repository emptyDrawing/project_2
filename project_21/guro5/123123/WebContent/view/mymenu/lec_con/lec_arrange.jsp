<%@page import="jdk.nashorn.internal.runtime.RewriteException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%
	String idx = request.getParameter("idx");
	pageContext.setAttribute("idx", idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${rootPath }js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">


function remarker(){
	var remark = $("div[chck=yes]");

	if(remark.length!=0){
		remark.each(function(){
			$(this).find("input:checked").parent().css('border','red 1px soild');
		});
	}
}// remarker();

function minusArrange(){
	var orgin = $("div#nowlistForm");
	var target = $("div#nonelistForm");
	arrange(orgin,target,false);
}
function plusArrange(){
	var orgin = $("div#nonelistForm");
	var target = $("div#nowlistForm");
	arrange(orgin,target,true);
}
function arrange(orgin,target,flag){
	var lecCodeidx = $("#findidx").val();
	test = orgin.find("input:checked").parent().each(function(){
		if(flag){
			$(this).find("input").attr('afmt',lecCodeidx);
		}else{
			$(this).find("input").attr('afmt','11111');
		}
		$(target).append(this);
	});
}

$(function(){
	$("input[type=checkbox]").on("click",function(){
		$(this).parent().attr("chck","yes");
	});
	
	$("#minus").on("click",minusArrange);
	$("#plus").on("click",plusArrange);	
	$("#confirm").click( function(){
			var list = new Array();
		if($("input:checked").length ){
			// 실제 보낼 데이터용			
			// 보여줄 데이터용
			var showM ='### 변경될 내용 [학생/연락처/이메일] : [ 변경사항(코드) ] ###';
				showM =showM+'\n 배정없음 : 11111 / 배정됨 : 11111 이외 숫자 ';
			var parent; var idx = 0;
			$("input:checked").each(function(idx){
	            var data = new Object();		parent = $(this).parent();
				id = $(this).val();				msg = parent.find('label').text();
				memt = $(this).attr("memt");	afmt = $(this).attr("afmt");
				// 데이터 담기용
				if(afmt=="no")afmt = memt;
				if(memt!=afmt){
					data.id = id;
					data.lec_code = afmt;
					list.push(data);
					showM = showM
						+'\n'
						+'#'+(++idx)+' '+msg +' : '+'[ '+memt+ ' --> '+afmt+' ]';
				}
			});
			showM = showM+'\n'+'#### 위의 내용으로 변경하시겠습니까? ####';
			// ajax
	        var jsonData = JSON.stringify(list) ;
	        if(list.length==0){	 alert("변경사항이 없습니다."); }
	        else{
	        	if(confirm(showM)){
	        		var lecidx = $("findidx").val();
	        		console.log(lecidx);
					$.post('${rootPath}ajax.bit?mode=ch_lec_code',{'data':jsonData},function(){
	        			console.log(lecidx);
					    window.location.href='?pageid=lec_con&mode=list&next=arrange';
					});
				}
	        }
		}else{
			alert("체크된 항목이 없습니다.");
			remarker();
		}
	});
});// 제이쿼리 로딩 끝


</script>
<title>Insert title here</title>
</head>
<body>
	<H1>${lecName}</H1>
	<H2>학생배정</H2>

	<label>수강중인 학생</label>
	<input id="findidx" type="hidden" value="${idx}"/>
	<div id="nowlistForm">
		<c:forEach items="${nowlist }" var="nowitem" varStatus="status">
		<div chck="no" class="row">
			<input class="" type="checkbox" id="now${status.index+1 }" memt="${idx}" afmt="no" value="${nowitem.id}"/>
			<label class="val" for="now${status.index+1 }">
			[${nowitem.name} / ${nowitem.phone} / ${nowitem.email }]
			</label>
		</div>	
		</c:forEach>
	</div>
	<button id="minus">[-]</button>
	<div></div>
	<label>미배정 학생</label>
	<div id="nonelistForm">
		<c:forEach items="${nonelist }" var="noneitem" varStatus="status">
		<div chck="no" class="row">
			<input class="" type="checkbox" id="now${status.index+1 }" memt="11111" afmt="no" value="${noneitem.id}"/>
			<label class="val" for="now${status.index+1 }">
				${noneitem.name} / ${noneitem.phone} / ${noneitem.email }
			</label>
		</div>	
		</c:forEach>
	</div>
	<button id="plus">[+]</button>
	<div>
		<button id="confirm">배정완료</button>
	</div>

</body>
</html>