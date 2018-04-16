<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<%@include file="../message/messageside.jsp"%>
<div style="margin-left:11%">
	<div>
<form method="post" action="#">
<select style="width:200px" class="w3-border" name="option2">
    <option value="0" selected>아이디</option>
    <option value="1">내용</option>
  </select> 
<input style="width:100px"type="text" placeholder="쪽지검색"/><i class="fa fa-search w3-button w3-border"></i>

</form>
	</div>
	
<hr>
	<form method="post" action="messagedelete" name="ch">
	<div>
	<ul>
	<li><input type="submit"class="w3-button" value="삭제"></li>
	<li><button class="w3-button">답장</button></li>
	<c:if test="${group =='1'}">
	<li><a href="orderby" class="w3-button">안읽은 쪽지</a></li>
	</c:if>
	<c:if test="${group =='2'}">
	<li><a href="orderby2" class="w3-button">안읽은 쪽지</a></li>
	</c:if>
	<c:if test="${group =='3'}">
	<li><a href="orderby3?group=${group}" class="w3-button">안읽은 쪽지</a></li>
	</c:if>
	</ul>
	</div>
	<center>
	<div class="w3-row">
		
		<table class="w3-table">
			
				<tr class="w3-yellow">
					<td><input class="w3-check" type="checkbox" name="ch" onclick="clickAll();"></td>
					<c:if test="${group !='3'}">
					<td>보낸사람</td>
					</c:if>
					<c:if test="${group =='3'}">
					<td>받는사람</td>
					</c:if>
					<td>내용</td>
					<td>날짜</td>
				</tr>

			<c:forEach var="article" items="${messagelist}">
				<c:if test="${article.confirm=='2'}">	
				<tr>
					<td><input class="w3-check" type="checkbox" name="check" value="${article.num}"></td>
					
					<c:if test="${group !='3'}">
					<td><font color="#A6A6A6">${article.userinfo}</font></td>
					</c:if>
				
					<c:if test="${group =='3'}">
					<td><font color="#A6A6A6">${article.userinfo2}</font></td>
					</c:if>
					
					<c:if test="${group !='3'}">
					<td><a href="messagecontent?num=${article.num}"><font color="#A6A6A6">${article.receivemessage}</font></a></td>
					</c:if>
					<c:if test="${group =='3'}">
					<td><a href="messagecontent?num=${article.num}&group=${group}"><font color="#A6A6A6">${article.sendmessage}</font></a></td>
					</c:if>
					
					
					<td><font color="#A6A6A6">${article.regdate}</font></td>
				</tr>
				</c:if>
				<c:if test="${article.confirm!='2'}">	
				<tr>
					<td><input class="w3-check" type="checkbox" name="check" value="${article.num}"></td>
					<td>${article.userinfo}</td>
					<c:if test="${group !='3'}">
					<td><a href="messagecontent?num=${article.num}">${article.receivemessage}</a></td>
					</c:if>
					<c:if test="${group =='3'}">
					<td><a href="messagecontent?num=${article.num}&group=${group}">${article.sendmessage}</a></td>
					</c:if>
					<td>${article.regdate}</td>
				</tr>
				</c:if>
			</c:forEach>		
		</table>
		</form>
	</div>
	</div>
	</center>
</div>
</body>
</html>