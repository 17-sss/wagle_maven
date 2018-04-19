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
<div>&nbsp;
	<div class="w3-container w3-card w3-center" style="margin: 2% 20% 0 20%; background-color:white;">
	       <span class="w3-center w3-large">
				<h3>관리자 <b>와글</b> 관리</h3>
		  </span>
	       
	       <c:if test="${count==0}">
	       <div class="w3-container w3-white w3-round w3-margin">
	       		 <div class="w3-center w3-container">
	       			<h4 class="orangee">오픈된 와글이 없습니다</h4>
	       		</div>
	       		
	       		<form class="w3-white" method="post" name="waglelist_ad">
		       <div class="w3-center w3-margin-top w3-margin-bottom">
		       		<select class="w3-border" style="display: inline-block;" name="opt" >
						<option class="w3-text-gray" value="" disabled>Search</option>
			   			<option value="1" selected>WAGLE</option>
			   			<option value="2">WHOST</option>
	      			</select>
		       		<input type="text" class="w3-border" placeholder="검색..." name="condition">
		       		<input type="submit" class="orangee w3-small w3-button" value="Search" style="display: inline-block;">
		       </div>
	      </form>		
	       </div>
	       </c:if>
	       
	       <c:if test="${count!=0}">
	       <div class="w3-container w3-margin w3-white w3-round">
	       		<h6 class="w3-right">전체 와글 수:${count}</h6>
	       
	       <table class="w3-table w3-bordered" width="175">
	       <tr class="orangee w3-center">
	       <td align="center" width="25" class="w3-center w3-text-white">NUM</td>
	       <td align="center" width="50" class="w3-center w3-text-white">WAGLE</td>
	       <td align="center" width="50" class="w3-center w3-text-white">WHOST</td>
	       <td align="center" width="50" class="w3-center w3-text-white">CATEGORY</td>
	       <td align="center" width="50" class="w3-center w3-text-white">READCOUNT</td>
	       <td align="center" width="50" class="w3-center w3-text-white">Modified</td>
	       </tr>
	 
	        <c:forEach var="wagle" items="${waglelist}">
	          <tr height="15">
	          <td align="center" width="25" class="w3-center">${number}</td>
	          <c:set var="number" value="${number-1}" />
	        	    <td align="center" width="50" class="w3-center">${wagle.wname}</td>
	        	    <td align="center" width="50" class="w3-center">${wagle.whost}</td>
	        	    <td align="center" width="50" class="w3-center">${wagle.wcategory}</td>
	        	    <td align="center" width="50" class="w3-center">${wagle.wreadcount}</td>
	               	<td align="center" width="50" class="w3-center">
	               		
	               		<!-- 와글 수정 -->
	               		<form method="post" action="${pageContext.request.contextPath}/admin/wagleform_ad" style="display: inline-block;">
		  					<input type="submit" class="w3-button w3-light-gray w3-hover-white" value="수정">
		  					<input type="hidden" name="wboardid" value="${wagle.wboardid}">
						</form>
						
	               	</td>
	          </tr>
	          </c:forEach>
	           
	       </table>
	       
	       <form class="w3-white" method="post" name="waglelist_ad">
		       <div class="w3-center w3-margin-top w3-margin-bottom">
		       		<select class="w3-border" style="display: inline-block;" name="opt" >
						<option class="w3-text-gray" value="" disabled>Search</option>
			   			<option value="1" selected>WAGLE</option>
			   			<option value="2">WHOST</option>
	      			</select>
		       		<input type="text" class="w3-border" placeholder="검색..." name="condition">
		       		<input type="submit" class="orangee w3-small w3-button " value="Search" style="display: inline-block;">
		       </div>
	      </form>	
	       
	       <div class = "w3-center w3-white w3-margin">
	       		<c:if test="${count>0}"> 
					<c:if test="${startPage > bottomLine}">
						<a href="waglelist_ad?pageNum=${startPage - bottomLine}">[이전]</a>
					</c:if>
		
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="waglelist_ad?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
							<c:if test="${i == currentPage}">
								<font color='orange'>[${i}]</font>
							</c:if>
						</a>
					</c:forEach>
		
					<c:if test="${endPage < pageCount}">
						<a href="waglelist_ad?pageNum=${startPage + bottomLine}">[다음]</a>
					</c:if>
				</c:if>
			</div>
			
	     </div>
	     </c:if>
	           
	</div>
</div>

</body>
</html>