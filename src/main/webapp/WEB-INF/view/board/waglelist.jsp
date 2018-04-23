<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js" style="background-color:#fff;">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
		
		<link href="https://fonts.googleapis.com/css?family=Nunito:400,700|Playfair+Display:900" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/magneto.css" />
		
		
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>		

		<style type="text/css">
		
			/* 이미지 반응형으로 처리.  */
			.autoimg {
				display: inline-block;
				width: auto !important;
				max-width: 100%;
				height: 300px !important;
			}
			
			/* 검색 설정 */
			.search1 {
				padding: 8px;
				display: block;
				border: none;
				border-bottom: 1px solid #ccc;
				width: 52%
			}
		
	</style>
	
	</head>
	<%@include file="/common/header.jsp" %>
	<body class="demo-magneto">
		
		<main>
			<section class="content content--layout" style="height: 30vh;">
				<h2 class="word word--magneto" style="font-size: 9vw;">wagle</h2>
			</section>
		</main>
		
		<div class="w3-container"  style="margin-left: 30%; margin-right: 30%;" >
		<div class="w3-row w3-section w3-center">
		    <div class="w3-rest">
		      
		      
		      <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="전체" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('전체')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="스포츠" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('스포츠')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="여행" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('여행')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="요리/음식" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('요리/음식')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="인문학/책" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('인문학/책')">
	          <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="문화/예술" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('문화/예술')">
              <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="사교/인맥" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('사교/인맥')">
              <input class="w3-btn w3-small" type="button" style="background-color:#FCB043;" value="외국/언어" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist?wcategory='+encodeURI('외국/언어')">
		      <br><br>
		      <c:if test="${wcategory eq '전체' || wcategory == null}">
		      <form class="w3-white" method="post" name="waglelist">
		     	 <input class="w3-input w3-small search1"  name="search" type="text" placeholder="Search" style="display: inline-block;">
		         <input class="w3-button w3-small" type="submit" style="background-color:#FCB043; display: inline-block;" value="Search">
		      </form>
		      </c:if>
		    </div>
		</div>
	</div>

<div class="w3-container w3-margin-top " style="margin-left: 10%; margin-right: 10%;">
	<c:if test="${wcategory eq '전체' || wcategory == null}">
	<c:forEach var="waglelist" items="${waglelist}">
		<!-- 기간이 지난 와글은 표시하지 않도록 해준다. -->
	 	<c:if test="${today <= waglelist.wend}">
		 <div class="w3-third w3-container w3-margin-bottom">
			<div class="w3-container w3-white w3-padding w3-center w3-round w3-button w3-border" 	onclick="document.location.href='wagleContent?wboardid=${waglelist.wboardid}&wname='+encodeURI('${waglelist.wname}')" style="height:100%; width:100%;">
				<img src="<%=request.getContextPath()%>/wagleimg/${waglelist.filename}" alt="Test" class="autoimg">
				<h4><b>${waglelist.wname}</b></h4>
				<span class="w3-text-gray"><b>와글 지기&nbsp;&nbsp;&nbsp;</b>${waglelist.whost}</span>
				<div onclick="document.location.href='wagleContent?wboardid=${waglelist.wboardid}&wname='+encodeURI('${waglelist.wname}')">
					<hr>
					<span class="w3-left">
						<b>기간&nbsp;&nbsp;</b>
						<span>${waglelist.wstart} ~ ${waglelist.wend}</span>
					</span>
					<i class="fa fa-user w3-right" style="font-size: 13pt;">&nbsp;<span>${waglelist.all}/${waglelist.wmax}</span></i>
				</div>
			</div>
		</div>
		</c:if>
	 </c:forEach>
	 </c:if>
	 
		<c:if test="${wcategory ne '전체'}">
		 <c:forEach var="waglelist" items="${searchwaglelist}">
			<!-- 기간이 지난 와글은 표시하지 않도록 해준다. -->
		 	<c:if test="${today <= waglelist.wend}">
			 <div class="w3-third w3-container w3-margin-bottom">
				<div class="w3-container w3-white w3-padding w3-center w3-round w3-button w3-border"  style="height:100%; width:100%;" onclick="document.location.href='wagleContent?wboardid=${waglelist.wboardid}&wname='+encodeURI('${waglelist.wname}')">
					<img src="<%=request.getContextPath()%>/wagleimg/${waglelist.filename}" alt="Test" class="autoimg">
					<h4><b>${waglelist.wname}</b></h4>
					<span class="w3-text-gray">와글 지기 : ${waglelist.whost}</span>
					<div>
						<hr>
						<span class="w3-left">
							<b>기간:&nbsp;</b>
							<span>${waglelist.wstart} ~ ${waglelist.wend}</span>
						</span>
						<i class="fa fa-user w3-right" style="font-size: 13pt;">&nbsp;<span>${waglelist.all}/${waglelist.wmax}</span></i>
					</div>
				</div>
			</div>
			</c:if>
		 </c:forEach>
		 </c:if>
		</div>

		
		
		<script src="${pageContext.request.contextPath}/js/charming.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/anime.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/demo.js"></script>
		<script src="${pageContext.request.contextPath}/js/demo1.js"></script>
		
		
	</body>
</html>