<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>
<div class="w3-sidebar w3-bar-block w3-border" style="width:11%; margin-top:50px;">
	<div class="w3-center" style="margin-bottom:30px; margin-top:20px;">
	<button onclick="document.location.href='${pageContext.request.contextPath}/message/sendmessageForm'" class="w3-btn w3-round-large w3-hover w3-hover-white " style="background-color:#FCB043;">쪽지쓰기</button>
  	<button onclick="document.location.href='${pageContext.request.contextPath}/message/sendmessageForm?userinfo=mysend'" class="w3-btn w3-round-large w3-hover w3-hover-white" style="background-color:#FCB043;">내게쓰기</button>
  	</div>	
  <button onclick="document.location.href='${pageContext.request.contextPath}/message/messagelist'" class="w3-bar-item w3-button" style="border-top:1px solid lightgrey; border-bottom:1px solid lightgrey;">받은 쪽지함</button>
  <button onclick="document.location.href='${pageContext.request.contextPath}/message/messagelist2'" class="w3-bar-item w3-button" style="border-bottom:1px solid lightgrey;">내게 쓴 쪽지함</button>
  <button onclick="document.location.href='${pageContext.request.contextPath}/message/messagelist3'" class="w3-bar-item w3-button" style="border-bottom:1px solid lightgrey;">보낸쪽지함</button>
</div>
</body>
</html>