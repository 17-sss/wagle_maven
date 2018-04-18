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
<div style="margin-left:11%">
	<form method="post" action="cmessagedelete?num=${article.num}&group=${group}">
	<div>
	<ul>
	<li><input type="submit"class="w3-button" value="삭제"></li>
	<c:if test="${group=='1'}">
	<li><a href="messagelist" class="w3-button">목록</a></li>
	</c:if>
	<c:if test="${group=='2'}">
	<li><a href="messagelist2" class="w3-button">목록</a></li>
	</c:if>
	<c:if test="${group=='3'}">
	<li><a href="messagelist3" class="w3-button">목록</a></li>
	</c:if>
	<li><button class="w3-button">◀이전</button></li>
	<li><button class="w3-button">다음▶</button></li>
	</ul>
	</div>
	</form>
	<hr>
<div>
	&nbsp;&nbsp;&nbsp;보낸사람 ${article.userinfo} <br> 
	&nbsp;&nbsp;&nbsp;받는시간 ${article.regdate}
</div>
	<hr>
	<c:if test="${group !='3'}">
	${article.receivemessage}
	</c:if>
	<c:if test="${group =='3'}">
	${article.sendmessage}
	</c:if>
</div>
</body>
</html>