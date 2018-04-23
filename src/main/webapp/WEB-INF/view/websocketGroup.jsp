<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Testing websockets</title>
</head>
<style>
#img{
	max-height:280px;
	width:auto;
}
#img2{
	max-height:380px;
	width:auto;
}
#photo{
	max-height:380px;
	width:auto;
}
#file{
	text-align:center;
}
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
    <div >
    <input type="file" id = "upload_file"  name="upload_file" style='display:none;' onchange="uploadImg()">
    <br><br><img src="/wagle_maven/img/file.png" onclick="document.getElementById('upload_file').click();"/>
    </div>
 	
</div>
</div>
<div class="w3-center w3-quarter">
	<br>
	<h3><b>${group}</b></h3>
	<hr style="width:100%;">
	 <b style="color:#FCB043; font-size:13pt;">와글 지기</b><br>
	 <b>${host}</b><br><br>
	 <b style="font-size:13pt;">와글러</b><br>
	 <c:forEach var="member" items="${member}">
	 	${member.wagler}<br>
	 </c:forEach>		
</div>
</div>


</body>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var fileInput = document.getElementById("upload_file");
    var file = fileInput.files[0];
    var filename = fileInput.value.substring(fileInput.value.lastIndexOf('\\')+1);
	
	var webSocket = new WebSocket(
			'ws://211.238.142.24:8080${pageContext.request.contextPath}/webGroup?name='
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
		var eventmessage = event.data.substring(10,14);
		var eventmessageimg = event.data.substring(12,14);
		if(eventmessage =='href'){
		textarea.innerHTML += "<div  id='file'  class='w3-white "
				+ "w3-border w3-round-large w3-padding-small' "
				+ "style='width: 200px;'>"
				+ event.data + "</div><br>";

		textarea.scrollTop = textarea.scrollHeight;
		}else if(eventmessageimg == 'id'){
		textarea.innerHTML += "<div  id='photo'  class='w3-white "
				+ "w3-border w3-round-large w3-padding-small' "
				+ "style='width:auto;'>"
				+ event.data + "</div><br>";

		textarea.scrollTop = textarea.scrollHeight;	
		}
		else{
		textarea.innerHTML += "<div  id='you'  class='w3-white "
				+ "w3-border w3-round-large w3-padding-small' "
				+ "style='width:" + (event.data.length * 12) + "px;'>"
				+ event.data + "</div><br>";

		textarea.scrollTop = textarea.scrollHeight;
		}

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
			+ "&nbsp;&nbsp;</div><br><br><br>";
	textarea.scrollTop = textarea.scrollHeight;
	webSocket.send(inputMessage.value);
	inputMessage.value = "";
	 	}
	 }
	
	function uploadImg() {
	    var fileInput = document.getElementById("upload_file");
	    var file = fileInput.files[0];
	    var filename = fileInput.value.substring(fileInput.value.lastIndexOf('\\')+1);
	    var formData = new FormData();
	    formData.append("upload_file" , file);
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST" , "/wagle_maven/chat/upload" , true);
	    xhr.send(formData);
	    inputMessage.value="<img id='img'src='/wagle_maven/img/"+filename+"'>";
	    sendimg();
	}
	function sendimg() {
	    var fileInput = document.getElementById("upload_file");
	    var file = fileInput.files[0];
	    var filename = fileInput.value.substring(fileInput.value.lastIndexOf('\\')+1);
	    var extension = fileInput.value.substring(fileInput.value.lastIndexOf('.')+1);
	 	if(filename.length == 0){
	 inputMessage.value = "";
	 	}else{
	 		if(extension == 'PNG' || extension =='jpg' || extension =='gif' || extension == 'png'){
		textarea.innerHTML += "<div  class='w3-yellow w3-panel "
			+ "w3-round-xlarge w3-padding-small'"
			+ " id='img2' style='float:right';'width:"
			+ ((inputMessage.value.length * 1) + 30) + "px;margin-left: 50%;'>"
			+ inputMessage.value
			+ "&nbsp;&nbsp;</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>";
	textarea.scrollTop = textarea.scrollHeight;
	webSocket.send(inputMessage.value);
	inputMessage.value = "";
	 		
	 	}else{
	 		inputMessage.value = "<a href='/wagle_maven/img/"+filename+"'><img src='/wagle_maven/img/docu.png'/><br>저장&nbsp;</a>"+filename;
	 		textarea.innerHTML += "<div  class='w3-yellow w3-panel "
				+ "w3-round-xlarge w3-padding-small'"
				+ " id='file' style='float:right';'width:"
				+ ((inputMessage.value.length * 1) + 30) + "px;margin-left: 50%;'>"
				+ inputMessage.value
				+ "&nbsp;&nbsp;</div><br><br><br><br>" 
				+"<br><br>";
		textarea.scrollTop = textarea.scrollHeight;
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
	 		}	
	 	}
	}

	
</script>
</html>
