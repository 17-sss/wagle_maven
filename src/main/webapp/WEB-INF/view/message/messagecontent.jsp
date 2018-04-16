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
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%">
	<div>
<form method="post" action="#">
<select class="w3-border" name="option">
    <option value="0" selected>전체쪽지</option>
    <option value="1">받은쪽지</option>
    <option value="2">보낸쪽지</option>
    <option value="3">보관쪽지</option>
    <option value="3">내게쓴쪽지</option>
  </select>
<select style="width:200px" class="w3-border" name="option2">
    <option value="0" selected>아이디</option>
    <option value="1">내용</option>
  </select> 
<input style="width:100px"type="text" placeholder="쪽지검색"/><i class="fa fa-search w3-button w3-border"></i>

</form>
	</div>
<hr>
	<form method="post" action="cmessagedelete?num=${article.num}">
	<div>
	<ul>
	<li><input type="submit"class="w3-button" value="삭제"></li>
	<li><button class="w3-button">보관</button></li>
	<li><button class="w3-button">답장</button></li>
	<li><a href="messagelist" class="w3-button">목록</a></li>
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