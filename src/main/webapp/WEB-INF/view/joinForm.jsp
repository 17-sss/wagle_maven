<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  	
  	
  	<style>
  		body{
  			background-color: rgb(252, 176, 67, 0.9);			
  		}
  		
  	</style>
</head>
<body>

<div class="w3-container w3-display-middle">
	 <!-- leftside -->
<!-- 	 <div class="w3-card-4" style="float: left; width:50%; ">
    <img class=" w3-round" src="https://www.w3schools.com/w3css/img_fjords.jpg" style="width:100%">
  	</div> -->
  
  
  
  	<!-- rightside => change to center -->
  <div class="w3-round w3-card-4 w3-bar w3-amber" >	
		<div class="w3-bar w3-amber">
    <button class="w3-bar-item w3-button tablink w3-orange"onclick="openCity(event,'Login')">Login</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Sign_Up')">Sign Up</button>
  </div>
  
  <form class="w3-white" action="${pageContext.request.contextPath}/member/login" method="post">
  <div id="Login" class="w3-container w3-border city">
    <h2>Login</h2>
    <p>
	<input class="w3-input" type="text" name="email" style="width:100%" required>
	<label>EMAIL</label></p>
	<p>
	<input class="w3-input" type="password" name="pwd" style="width:100%" required>
	<label>PASSWORD</label></p>
	

	<p>
	<a href="${pageContext.request.contextPath}/member/findPwd">Forgot Password?</a>
	</p>
	
	
	<p class="w3-center">
	<button class="w3-button w3-section w3-amber  w3-round w3-ripple" type="submit"> Login </button>
	
	<button class="w3-button w3-section w3-amber w3-round w3-ripple" type="button" 
			onclick="window.location.href='${pageContext.request.contextPath}/index'"> Cancel </button>
	</p></div>
	</form>


	<form class="w3-white" method="post" name="joinForm" onSubmit="return check()"
	action="${pageContext.request.contextPath}/member/joinPro">
	  <div id="Sign_Up" class="w3-container w3-border city" style="display:none">
    <h2>Sign Up</h2>
    <p>
			<label class="w3-text-grey">
			이름 :<br><input class="w3-border w3-padding w3-light-grey" type="text" name="name" size="20" style="width:100%" required="required">
			</label><br><br>
			<label class="w3-text-grey">
			이메일 :<br>
			<input class="w3-border w3-padding w3-light-grey" type="email" name="email" size="10" style="width:75%;" onkeydown="inputIdChk()" required="required">&nbsp;
			<input class="w3-button w3-yellow w3-round w3-padding-small" type="button" value="중복확인" name="confirm_id" onClick="confirmId(this.form)"/></label>
			<br><br> <input type="hidden" name="idDuplication" value="idUncheck">
			<label class="w3-text-grey">
			비밀번호 :<br><input class="w3-border w3-padding w3-light-grey" style="width:100%" type="password" name="pwd" size="20" required="required"></label><br><br>
			<label class="w3-text-grey">
			비밀번호 확인 :<br><input class="w3-border w3-padding w3-light-grey" style="width:100%" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required"></label>
			<div id="checkPwd"></div>
			<label class="w3-text-grey">
			성별 : <input type="radio" name="gender" value="male" required="required">남
				 <input type="radio" name="gender" value="female" required="required">여</label><br><br>
			<label class="w3-text-grey">
			나이 : <input type="radio" name="age" value="10대" required="required">10대
				 <input type="radio" name="age" value="20대" required="required">20대
				 <input type="radio" name="age" value="30대" required="required">30대
				 <input type="radio" name="age" value="40대" required="required">40대
				 <input type="radio" name="age" value="50대" required="required">50대
				 <input type="radio" name="age" value="60대" required="required">60대</label><br><br>
			
			<label class="w3-text-grey">
			거주지 :<br><input class="w3-border w3-padding w3-light-grey" style="width:100%" type="text" name="loc" size="20" required="required"></label>
						<p>
			<label class="w3-text-grey">
			비밀번호 찾기 질문 :
			<select class="w3-select w3-border" style="width:100%; display: inline-block;" name="pwdQ" >
				<option value="" disabled selected>비밀번호 질문을 선택하세요.</option>
	   			<option value="1">당신이 태어난 고향은?</option>
	   			<option value="2">당신이 졸업한 초등학교는?</option>
	   			<option value="3">당신의 졸업한 중학교는?</option>
	   			<option value="4">당신의 졸업한 고등학교는?</option>
	     		<option value="5">당신의 어머니의 성함은?</option>
	      		<option value="6">당신의 아버지의 성함은?</option>
	      		<option value="7">당신의 친할아버지의 성함은?</option>
	      		<option value="8">당신의 친할아버지의 성함은?</option>
	      		<option value="9">당신의 외할아버지의 성함은?</option>
	      		<option value="10">당신의 외할머니의 성함은?</option>
      		</select>
      		</label>
      		
      		<br><br>
      	
      		<label class="w3-text-grey">
      			질문 답: <br><input class="w3-border w3-padding w3-light-grey" type="text" name="pwdA" style="width: 100%; display: inline-block;" required="required">
      		</label>
      		
      		<br><br>
      		
			<label>
			<input type="hidden" name="num" value="${num}">
			<input class="w3-button w3-yellow w3-round" type="submit" value="작성완료"/><!-- &nbsp;&nbsp; -->
			<input class="w3-button w3-yellow w3-round" type="reset" value="다시작성"/>
			<input class="w3-button w3-yellow w3-round" type="button" value="취소" onclick="window.location.href='${pageContext.request.contextPath}/index'"/>
			</label></p>
		</div></form>
  
  	</div>
  </div>
  </div>



<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-orange", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-orange";
}

 


</script>


<script type="text/javascript">
	
	function check()
	{
		
	if(document.joinForm.pwd.value!=document.joinForm.confirmPwd.value){
		alert("비밀번호를 동일하게 입력하세요."); 
	return false;
	}
	
	if(document.joinForm.idDuplication.value!= "idCheck"){
		alert("이메일 중복체크를 해주세요.");
		return false;
	}

	
	}
	
	function confirmId() {
		
		if (document.joinForm.email.value=="") {
			alert("ID를 입력하세요.");
			return;
		}
		url = "confirmId?email="+document.joinForm.email.value;
		open(url,"confirm","toobar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
		document.joinForm.idDuplication.value="idCheck";
	}
 	

	function inputIdChk() {
 		document.JoinForm.idDuplication.value="idUncheck";
 	}
 	
	
	
	function checkPwd(){
		  var f1 = document.forms[1];
		  var pw1 = f1.pwd.value;
		  var pw2 = f1.confirmPwd.value;
		  if(pw1!=pw2){
		   document.getElementById('checkPwd').style.color = "red";
		   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
		  }else{
		   document.getElementById('checkPwd').style.color = "black";
		   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
		  }
	}
</script>

</body>
</html>