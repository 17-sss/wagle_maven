<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
 <link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
	$(function(){
	    $('#datepicker').appendDtpicker({
	    	'locale':'ko',
	    	"dateOnly": true,
			"dateFormat": "YYYY-MM-DD",
			"futureOnly":true
	    	});
	});
	$(function(){
		$('#datepicker2').appendDtpicker({
			'locale':'ko',
	    	"dateOnly": true,
			"dateFormat": "YYYY-MM-DD",
			"futureOnly":true
	    	});
	});
	$(function(){
		$('#datepicker3').appendDtpicker({
			'locale':'ko',
			"dateFormat": "YYYY-MM-DD h:m",
			"futureOnly":true
			});
	});
	$(function(){
		$('#datepicker4').appendDtpicker({
				'locale':'ko',
				"dateFormat": "YYYY-MM-DD h:m",
				"futureOnly":true
			});
	});
</script>
<style>
	section.openIntro{
		height: 80vh;
		margin-bottom:20vh;
	}
	hr{
		border-bottom: 1px solid #FCB043;
		width: 50%;
	}
</style>
</head>
<body>
	<section class="openIntro">
	 <div class="w3-display-middle">blahblah</div>
		<hr class="w3-display-bottommiddle"></hr>
	</section>

	
	<c:if test="${sessionEmail==null}">
		<section style="height: 30vh;">
			<center>
			<button class="w3-btn" onclick="document.location.href='${pageContext.request.contextPath}/member/joinForm'"
			      style="width: 10%; margin-top:10vh;">Login</button>
			</center>
		</section>
	</c:if>
	

	<c:if test="${sessionEmail!=null}">
	<section class="openForm">
		<center>
	<form method="post" enctype="multipart/form-data" action="wagleOpenPro">
		<input type="hidden" name="whost" value="${whost}"/>
		<input type="hidden" name="whostemail" value="${whostemail}"/>
		<h4>Wagle Open</h4>
	
			<table class="w3-table-w3-border" cellspacing="10" style="margin-bottom:100px;">
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 이름</td>
				<td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text"></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 지기</td>
				<td>${whost}</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 지기 소개</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wprofile" rows="4" cols="10"></textarea></td>
				</tr> 
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">카테고리</td>
				<td>	
					<select  name="wcategory">
					  <option  value="스포츠">스포츠</option>
					  <option  value="여행">여행</option>
					  <option  value="요리/음식">요리/음식</option>
					  <option  value="인문학/책">인문학/책</option>
					</select> 		
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">최대 인원</td>
				<td>
					<select name="wmax">
					  <option  value="15">15명</option>
					  <option  value="16">16명</option>
					  <option  value="17">17명</option>
					  <option  value="18">18명</option>
					  <option  value="19">19명</option>
					  <option  value="20">20명</option>
					</select>
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">지역</td>
				<td>
					<input type="radio" class="w3-radio" name="wloc" value="서울특별시 마포구 월드컵북로 21">&nbsp;강북 &nbsp;&nbsp;
  					<input type="radio" class="w3-radio" name="wloc" value="서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터">&nbsp;강남
				</td>
				</tr>
				<tr>
				
				<td class="w3-panel w3-leftbar w3-border-yellow">기간</td>
				<td>
				<input type="text" name="wstart" id="datepicker" value="">&nbsp;&nbsp;~&nbsp;&nbsp;
				<input type="text" name="wend" id="datepicker2" value="">

				</td>
				</tr>
				
				<tr>
				
				<td class="w3-panel w3-leftbar w3-border-yellow">다가오는 일정</td>
				<td>
				일정1:
				<input type="text" name="wevent1">
				<input type="text" name="weventdate1" id="datepicker3" value=""><br>
				일정2:
				<input type="text" name="wevent2">
				<input type="text" name="weventdate2" id="datepicker4" value="">
				</td>
				</tr>
				
				
				<tr style="width:200px; height:200px">
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 소개</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="10"></textarea></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">그룹이미지<br/>업로드</td>
				<td><input class="w3-input w3-border" name="uploadfile" type="file"></td>
				</tr>
				<tr>
				<td colspan="2" class="w3-center">
				<input class="w3-button w3-yellow w3-border" type="submit" value="Open">
				</td>
				</tr>
			</table>
	</form>	
	</center>
	</section></c:if>

</body>
</html>
