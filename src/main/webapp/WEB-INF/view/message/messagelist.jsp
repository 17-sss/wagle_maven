<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
li{display:inline;}
</style>
<script type="text/javascript">

	function clickAll(){
		
		var chk = document.ch.check;
		
		for(var i = 0;i<chk.length;i++){
			chk[i].checked = !chk[i].checked;
		}
		
		
	}
</script>
</head>
<body>
<%@include file="/common/header.jsp"%>
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%; margin-top:80px;">
	<form method="post" action="messagedelete?group=${group}" name="ch">
	<div>
	<ul>
	<li><input type="submit" class="w3-btn w3-round-xlarge w3-hover w3-hover-red w3-white w3-border w3-border-red w3-padding-small" value="삭제"></li>
	<c:if test="${group =='1'}">
	<li><a href="orderby" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow">안읽은 쪽지</a></li>
	</c:if>
	<c:if test="${group =='2'}">
	<li><a href="orderby2" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow">안읽은 쪽지</a></li>
	</c:if>
	<c:if test="${group =='3'}">
	<li><a href="orderby3?group=${group}" class="w3-padding-small w3-btn w3-round-xlarge w3-hover w3-hover-yellow w3-white w3-border w3-border-yellow">안읽은 쪽지</a></li>
	</c:if>
	</ul>
	</div>
	<center>
	<div class="w3-row">
		<table class="w3-table">
				<tr style="background-color:#FCB043;">
					<td style="padding-bottom:15px;"><input class="w3-check" type="checkbox" name="ch" onclick="clickAll();"></td>
					<c:if test="${group !='3'}">
					<td style="padding-top:15px; padding-bottom:15px;">보낸 사람</td>
					</c:if>
					<c:if test="${group =='3'}">
					<td style="padding-top:15px; padding-bottom:15px;">받는 사람</td>
					</c:if>
					<td style="width:1150px; padding-top:15px; padding-bottom:15px;">내용</td>
					<td style="width:300px; padding-top:15px; padding-bottom:15px;">날짜</td>
				</tr>

			<c:forEach var="article" items="${messagelist}">
				<c:if test="${article.confirm=='2'}">	
				<tr>
					<td><input class="w3-check" type="checkbox" name="check" value="${article.num}"></td>
					<c:if test="${group !='3'}">
					<td style="padding-top:15px;"><font color="#A6A6A6">${article.userinfo}</font></td>
					</c:if>
					<c:if test="${group =='3'}">
					<td style="padding-top:15px;"><font color="#A6A6A6">${article.userinfo2}</font></td>
					</c:if>
					
					<c:if test="${group !='3'}">
					<td style="padding-top:15px;"><a href="messagecontent?num=${article.num}&group=${group}"><font color="#A6A6A6">${article.receivemessage}</font></a></td>
					</c:if>
					<c:if test="${group =='3'}">
					<td style="padding-top:15px;"><a href="messagecontent?num=${article.num}&group=${group}"><font color="#A6A6A6">${article.sendmessage}</font></a></td>
					</c:if>
					
					
					<td style="padding-top:15px;"><font color="#A6A6A6">${article.regdate}</font></td>
				</tr>
				</c:if>
				<c:if test="${article.confirm!='2'}">	
				<tr>
					<td><input class="w3-check" type="checkbox" name="check" value="${article.num}"></td>
					<c:if test="${group !='3'}">
					<td style="padding-top:15px;">${article.userinfo}</td>
					</c:if>
					<c:if test="${group =='3'}">
					<td style="padding-top:15px;">${article.userinfo2}</td>
					</c:if>
					<c:if test="${group !='3'}">
					<td style="padding-top:15px;"><a href="messagecontent?num=${article.num}&group=${group}">${article.receivemessage}</a></td>
					</c:if>
					<c:if test="${group =='3'}">
					<td style="padding-top:15px;"><a href="messagecontent?num=${article.num}&group=${group}">${article.sendmessage}</a></td>
					</c:if>
					<td style="padding-top:15px;">${article.regdate}</td>
				</tr>
				</c:if>
			</c:forEach>		
		</table>
		</div>
		</center>
		</form>
	</div>
</body>
</html>