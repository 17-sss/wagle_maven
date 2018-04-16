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
  	
	<title>Insert title here</title>
</head>
<body>
<div class="w3-container w3-display-middle">

	<div class="w3-round w3-card-4 w3-bar w3-amber">
		<div class="w3-bar w3-orange">
		<a class="w3-bar-item"><b>비밀번호</b>&nbsp;찾기</a>
		</div>
	<form class="w3-white" method="post" name="findPwd" action="${pageContext.request.contextPath}/member/findPro">
		<div class="w3-container w3-border">
		<table>
		<tr>
		<td>이메일&nbsp;</td>
		<td><input type="text" name="email" class="w3-input" style="display: inline-block; "></td>
		</tr>
		
		<tr>
		<td>질문&nbsp;</td>
		<td><select class="w3-select w3-border" style="width:70%; display: inline-block; width:100%;" name="pwdQ" >
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
      		</select></td>
		</tr>
		
		<tr>
		<td>답&nbsp;</td>
		<td><input class="w3-input w3-border" style="width:62%; display: inline-block; width:100%;" name="pwdA">
		</tr>
		
		<tr>
		
		<td colspan="2"><input type="submit" value="확인" class="w3-button w3-yellow w3-round w3-right"></td>
		</tr>
		
		
		</table>
	
	    </div>
	    </form>
		
	</div>
	

</div> 
</body>
</html>