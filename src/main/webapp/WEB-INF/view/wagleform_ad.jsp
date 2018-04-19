<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Insert title here</title>
	<style type="text/css">
		.orangee {
				color: #000 !important;
				background-color: #FCB043 !important
		}
	</style>
</head>
<%@include file="/common/header.jsp" %>
<body>
<div class="w3-container w3-half w3-display-middle" style="width:40%;">
    <form class="w3-container w3-transparent" method="post" name="updateForm" action="${pageContext.request.contextPath}/admin/wagleDelete_ad">
    <input type="hidden" name="wboardid" value="${wagle.wboardid}">
		<ul class="w3-ul w3-hover-shadow">
			<li class="orangee w3-xlarge w3-center w3-padding-32" style="width:100%;">와글 정보</li>
			
				<table class="w3-table w3-bordered" style="width:100%;">
					<tr height="30">
						<td width="30">와글명 :</td>
						<td width="70">${wagle.wname}</td>
					</tr>
					<tr height="30">
						<td width="30">와글장 :</td>
						<td width="70">${wagle.whost}</td>
					</tr>
					<tr height="30">
						<td width="30">와글러 :</td>
						<td width="70">
						<c:forEach var="wagle" items="${wagle.member}">
						${wagle.wagler}&nbsp;&nbsp;
						</c:forEach>
						</td>
					</tr>
					<tr height="30">
						<td width="30">카테고리 :</td>
						<td width="70">${wagle.wcategory}
						</td>
					</tr>
					<tr height="30">
						<td width="30">장소 :</td>
						<td width="70">${wagle.wloc}
						</td>
					</tr>
					<tr height="30">
						<td width="30">기간 :</td>
						<td width="70">${wagle.wstart} ~ ${wagle.wend}
						</td>
					</tr>
				
				
					<tr height="30">
						<td width="30" colspan="2">
						<c:if test="${sessionEmail eq 'admin'}">
						<input class="w3-button orangee w3-round" type="submit" value="삭제">
						<input class="w3-button orangee w3-round" type="button" value="목록" onclick="window.location.href='${pageContext.request.contextPath}/admin/waglelist_ad'">
						</c:if>
						</td>
					</tr>
				</table>
		</ul>
 	</form>
  


</div>
</body>
</html>