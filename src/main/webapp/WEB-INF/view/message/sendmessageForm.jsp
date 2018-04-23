<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function mysend(){
		location.href="sendmessageForm?userinfo=mysend"
	}
</script>
</head>
<body>
<%@include file="/common/header.jsp"%>
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%; margin-top:80px; padding-top:30px;">
<form autocomplete="off" method="post" action="sendPro" >
	

	<hr>
	<div style="margin-left:2%;">
		<input type="hidden" name="userinfo" value="${sessionEmail}">
	<c:if test="${userinfo == 'mysend'}">
	<b>받는 사람</b>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userinfo2" size="40" value="${sessionEmail}"/>
	</c:if>
	<c:if test="${userinfo !='mysend'}"> 
	<b>받는 사람</b> <input class="w3-check" type="checkbox" name="check" onclick="mysend()">&nbsp;내게 쓰기
	<input type="text" name="userinfo2" size="32" value="${userinfo2}"/>
	</c:if>
	&nbsp;<input class="w3-btn w3-hover w3-hover-white w3-round-large w3-padding-small" style="background-color:#FCB043;"type="submit" value="보내기">
	</div><br/>  
	<textarea style="margin-left:2%;" class="w3-border w3-margin-bottom" name="sendmessage" rows="10" cols="50"></textarea>
</form>
</div>
</body>
</html>