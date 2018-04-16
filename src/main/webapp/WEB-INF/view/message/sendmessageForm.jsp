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
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%">
<form autocomplete="off" method="post" action="sendPro">
	<input type="hidden" name="userinfo" value="${name}">
	<input class="w3-button" type="submit" value="보내기">
	<hr>
	<div>

	<c:if test="${userinfo == 'mysend'}">
	 받는사람&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userinfo2" size="40" value="${name}"/>
	</c:if>
	<c:if test="${userinfo !='mysend'}"> 
	받는사람 <input class="w3-check" type="checkbox" name="check" onclick="mysend()">내게쓰기
	<input type="text" name="userinfo2" size="32"/>
	</c:if>
	</div><br/>  
	<textarea class="w3-border w3-margin-bottom" name="sendmessage" rows="10" cols="50"></textarea>
</form>
</body>
</html>