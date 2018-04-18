<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/linkhover.css">
</head>

<body>
<div class="w3-top">
<div class="w3-bar">
	<div class="wrapper w3-display-topright" style="padding-top:2px; margin-top:5px;">
	    <a class="sixth before after w3-bar-item" href="${pageContext.request.contextPath}/index" style="color: black; font-size:1em;">Wagle</a>
	    <a class="sixth before after w3-bar-item" href="${pageContext.request.contextPath}/board/wagleOpen" style="color: black;font-size:1em;">와글열기</a>
	    <a class="sixth before after w3-bar-item" href="${pageContext.request.contextPath}/board/waglelist" style="color: black;font-size:1em;">와글와글</a>
	   <a class="sixth before after w3-bar-item" href="${pageContext.request.contextPath}/board/faqlist" style="color: black;font-size:1em;">FAQ</a>
	    
	    <div class="w3-dropdown-hover w3-right">
	    <button class="w3-button w3-bar-item" style="color: black; font-size:1em;">My Page</button>
	    <div class="w3-dropdown-content w3-bar-block w3-card-4" style="right:0.1em; top:2.2em;">
	      <c:if test="${sessionEmail == null}">
	      	<a href="${pageContext.request.contextPath}/member/joinForm" class="w3-bar-item">Login</a>
	      </c:if>
	      <c:if test="${sessionEmail != null}">
	      	<label class="w3-right w3-small" style="margin:10px 10px 0px 0px;"> <b>${name}</b> 님 환영합니다.</label>
				    
				    <c:if test="${count != 0 && count != null}"> 
			         <div class="w3-right w3-small" style="margin:10px 10px 0px 0px;">
			         	<a href="${pageContext.request.contextPath}/message/messagelist">쪽지&nbsp;${count}<strong><font color="red">N</font></strong></a></div>
			     	</c:if>
			        <c:if test="${count == 0 || count == null}">
			         <div class="w3-right w3-small" style="margin:10px 10px 0px 0px;">
			         	<a href="${pageContext.request.contextPath}/message/sendmessageForm">쪽지</a></div>
			        </c:if>
				   
				    <a href="${pageContext.request.contextPath}/board/mylist" class="w3-bar-item"><br><br>와글관리</a>
				    <a href="${pageContext.request.contextPath}/member/updateForm?email=${sessionEmail}" class="w3-bar-item">회원정보</a>
				   	
				   	<c:if test="${sessionEmail ne 'admin'}">
				   	<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item">Logout</a>
				   	</c:if>
	      </c:if>
	    </div>
	  </div>
	</div>
</div>
</div>
</body>
</html>

