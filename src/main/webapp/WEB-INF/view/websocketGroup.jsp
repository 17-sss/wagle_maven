<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Testing websockets</title>
</head>
<style>

</style>
<body>
<!-- <form method="post" enctype="multipart/form-data" action="upload">	 -->
<div>
<div class="w3-container w3-threequarter" style="height:600px; width:600px;">
		<div class="w3-sand" id="messageWindow" style="width: 600px; height: 600px; border: 1px solid grey; overflow: auto; word-wrap: break-word;">
		</div>
	<br>
<div class="w3-container w3-margin-top" style="width:600px;">
	<br/>
	<div class="w3-threequarter"><input class="w3-input w3-border"id="inputMessage"style="display: inline-block;" type="text" onKeypress="javascript:if(event.keyCode==13) {send()}"/></div>
	<div class="w3-quarter w3-right-align"><input type="submit" class="w3-btn w3-yellow" style="display: inline-block;" value="전송" onclick="send()"/></div>
	<input type="file" name="file">

</div>
</div>
<div class="w3-center w3-quarter">우리 와글원
		</div>
</div>
</form>
</body>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	
	var webSocket = new WebSocket(
			'ws://211.238.142.29:8080${pageContext.request.contextPath}/webGroup?name='
					+ encodeURIComponent('${name}') + '&group='
					+ encodeURIComponent('${group}'));
	var inputMessage = document.getElementById('inputMessage');

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	function onMessage(event) {
		textarea.innerHTML += "<div  id='you'  class='w3-white "
				+ "w3-border w3-round-large w3-padding-small' "
				+ "style='width:" + (event.data.length * 12) + "px;'>"
				+ event.data + "</div><br>";

		textarea.scrollTop = textarea.scrollHeight;
	}
	function onOpen(event) {
		textarea.innerHTML += "등장!<br>";

	}
	function onError(event) {
		alert(event.data);
	}
	/* ((inputMessage.value.length*12)+45) <- 원본 채팅사이간격....어찌해야 원하는대로..?*/
	function send() {
	 	if(inputMessage.value.length == 0){
	 		
	 	}else{
		textarea.innerHTML += "<div  class='w3-yellow w3-panel "
			+ "w3-round-xlarge w3-padding-small'"
			+ " id='me' style='float:right';'width:"
			+ ((inputMessage.value.length * 1) + 30) + "px;margin-left: 50%;'>"
			+ inputMessage.value
			+ "&nbsp;&nbsp;</div><br><br>";
	textarea.scrollTop = textarea.scrollHeight;
	webSocket.send(inputMessage.value);
	inputMessage.value = "";
	 	}
	 }
</script>
</html>
