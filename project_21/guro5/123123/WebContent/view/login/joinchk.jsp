<%@page import="com.gurobit5.model.DaoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복확인</title>
</head>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<body>
	<%
	String id = request.getParameter("id");
	DaoMember daojoin = new DaoMember();
	int check = daojoin.confirmId(id);
	
	if(check==1) { %>
	<b><font color="red"><%=id%></font>는 이미 사용중인 아이디입니다.</b>
	<form action="?mode=joinChk" method="POST">
	<b>다른 아이디를 선택하세요.</b><br /><br />
	<input type="text" name="id" />
	<input type="submit" value="ID중복확인" />
	</form>
	
	<%
	} else {
	%><center>
	<b>입력하신 <font color="red"><%=id%></font>는<br /> 사용하실 수 있는 ID입니다. </b><br /><br />
	<input type="button" value="닫기" onclick="setid()"/></center>
	<%} %>
	
<script type="text/javascript">
	function setid() {
		opener.document.getElementById("id").value="<%=id%>";
		self.close();
	}
</script>
</body>
</html>