<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
li{display:inline;}
</style>
</head>
<body>
<%@include file="/common/header.jsp"%>
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%; margin-top:80px;">
	<form method="post" action="cmessagedelete?num=${article.num}&group=${group}">
	<div>
	<ul>
	<li><input type="submit"class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-red w3-white w3-border w3-border-red" value="삭제"></li>
	<li><a href="sendmessageForm?userinfo2=${article.userinfo}" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow" >답장</a></li>
	<c:if test="${group=='1'}">
	<li><a href="messagelist" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow">목록</a></li>
	</c:if>
	<c:if test="${group=='2'}">
	<li><a href="messagelist2" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow">목록</a></li>
	</c:if>
	<c:if test="${group=='3'}">
	<li><a href="messagelist3" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow">목록</a></li>
	</c:if>
<!-- 	<li><button class="w3-button">◀이전</button></li>
	<li><button class="w3-button">다음▶</button></li> -->
	</ul>
	</div>
	</form>
	<hr>
<div>
	&nbsp;&nbsp;&nbsp;<b>보낸 사람</b> ${article.userinfo} <br> 
	&nbsp;&nbsp;&nbsp;<b>받는 시간</b> ${article.regdate}
</div>
	<hr>
	<div style="margin-left:20px;">
	<c:if test="${group !='3'}">
	${article.receivemessage}
	</c:if>
	<c:if test="${group =='3'}">
	${article.sendmessage}
	</c:if>
	</div>
</div>
</body>
</html>