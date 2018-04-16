<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
	$(function(){
	    $('#datepicker').appendDtpicker({
	    	'locale':'ko',
	    	"dateOnly": true,
			"dateFormat": "YYYY-MM-DD",
	    	});
	});

	$(function(){
		$('#datepicker2').appendDtpicker({
			'locale':'ko',
	    	"dateOnly": true,
			"dateFormat": "YYYY-MM-DD"/* ,
			"futureOnly":true */
	    	});
	});

	$(function(){
		$('#datepicker3').appendDtpicker({
			'locale':'ko',
			"dateFormat": "YYYY-MM-DD h:m"/* ,
			"futureOnly":true */
			});
	});

	$(function(){
		$('#datepicker4').appendDtpicker({
			'locale':'ko',
			"dateFormat": "YYYY-MM-DD h:m"/* ,
			"futureOnly":true */
			});
	});
</script>

<title>Insert title here</title>
</head>
<body>
	<center>
	<form method="post" enctype="multipart/form-data" action="wagleUpdatePro">
		<h4>Wagle Update</h4>
	
		<input type="hidden" name="whost" value="${wagle.whost}"/>
		<input type="hidden" name="wboardid" value="${wagle.wboardid}"/>
		<input type="hidden" name="name" value="${wagle.filename}"/>
		<input type="hidden" name="size" value="${wagle.filesize}"/>
		<input type="hidden" name="pageNum"	value="${pageNum}"/>
			<table class="w3-table-w3-border" cellspacing="10" style="margin-bottom:100px;">
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 이름</td>
				<td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text" value="${wagle.wname}"></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글장</td>
				<td>${wagle.whost}</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">와글장 소개</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wprofile" rows="4" cols="10">${wagle.wprofile}</textarea></td>
				</tr> 
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">카테고리</td>
				<td>
				
					<select name="wcategory">
					  <option  value="스포츠" <c:if test="${wagle.wcategory eq '스포츠'}"> selected </c:if>> 스포츠</option>
					  <option  value="여행" <c:if test="${wagle.wcategory eq '여행'}"> selected </c:if>>여행</option>
					  <option  value="요리/음식" <c:if test="${wagle.wcategory eq '요리/음식'}"> selected </c:if>>요리/음식</option>
					  <option  value="인문학/책" <c:if test="${wagle.wcategory eq '인문학/책'}"> selected </c:if>>인문학/책</option>
					</select>
					
				 <!-- 
				  <td class="btn-group">
				  <button type="button" name="wcategory" value="스포츠">스포츠</button>
				  <button type="button" name="wcategory" value="여행">여행</button>
				  <button type="button" name="wcategory" value="요리/음식">요리/음식</button>
				  <button type="button" name="wcategory" value="인문학/책">인문학/책</button>
				  <br><br>
				  <button type="button" name="wcategory" value="문화/공연">문화/공연</button>
				  <button type="button" name="wcategory" value="음악/악기">음악/악기</button>
				  <button type="button" name="wcategory" value="사교/인맥">사교/인맥</button>
				  <button type="button" name="wcategory" value="봉사활동">봉사활동</button> -->
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">최대 인원</td>
				<td>
					현재 회원수 ${all}명 /
					<select name="wmax">
					  <option  value="15" <c:if test="${wagle.wmax==15}"> selected </c:if>>15명</option>
					  <option  value="16" <c:if test="${wagle.wmax==16}"> selected </c:if>>16명</option>
					  <option  value="17" <c:if test="${wagle.wmax==17}"> selected </c:if>>17명</option>
					  <option  value="18" <c:if test="${wagle.wmax==18}"> selected </c:if>>18명</option>
					  <option  value="19" <c:if test="${wagle.wmax==19}"> selected </c:if>>19명</option>
					  <option  value="20" <c:if test="${wagle.wmax==20}"> selected </c:if>>20명</option>
					</select>
				</td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">지역</td>
				<td>
					<input type="radio" class="w3-radio" name="wloc" value="서울특별시 마포구 월드컵북로 21"
					<c:if test="${wagle.wloc eq '서울특별시 마포구 월드컵북로 21'}">checked</c:if>>&nbsp;강북 &nbsp;&nbsp;
  					<input type="radio" class="w3-radio" name="wloc" value="서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터"
  					<c:if test="${wagle.wloc eq '서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터'}">checked</c:if>>&nbsp;강남
				</td>
				</tr>
				<tr>

				
				<c:if test="${today > wagle.wend}">
				<td class="w3-panel w3-leftbar w3-border-yellow" style="color:red"><b>기간</b></td>
				</c:if>
				<c:if test="${today <= wagle.wend}">
				<td class="w3-panel w3-leftbar w3-border-yellow">기간</td>
				</c:if>
				<td>
				<input type="text" name="wstart" id="datepicker" value="${wagle.wstart}">&nbsp;&nbsp;~&nbsp;&nbsp;
				<input type="text" name="wend" id="datepicker2" value="${wagle.wend}">
				</td>
				</tr>
				
				<c:if test="${today > wagle.wend}">
				<tr>
				<td></td>
				<td style="color:red">기간을 늘려주세요 !</td>
				</tr>
				</c:if>
					
				<tr>
				<c:if test="${today > wagle.weventdate1 || today > wagle.weventdate2}">
				<td class="w3-panel w3-leftbar w3-border-yellow" style="color:red;"><b>다가오는 일정</b></td></c:if>
				
				<c:if test="${today <= wagle.weventdate1 && today <= wagle.weventdate2}">
				<td class="w3-panel w3-leftbar w3-border-yellow">다가오는 일정</td></c:if>
				<td>
				<c:if test="${today > wagle.weventdate1}"><a style="color:red;"></c:if>
				<c:if test="${today <= wagle.weventdate1}"><a></c:if>
				일정1:</a>
				<input type="text" name="wevent1" value="${wagle.wevent1}">
				<input type="text" name="weventdate1" id="datepicker3" value="${wagle.weventdate1}"><br>
				
				<c:if test="${today > wagle.weventdate2}"><a style="color:red;"></c:if>
				<c:if test="${today <= wagle.weventdate2}"><a></c:if>
				일정2:</a>
				<input type="text" name="wevent2" value="${wagle.wevent2}">
				<input type="text" name="weventdate2" id="datepicker4" value="${wagle.weventdate2}">
				</td>
				</tr>
				
				<c:if test="${today > wagle.weventdate1 || today > wagle.weventdate2}">
				<tr>
				<td></td>
				<td style="color:red">일정을 바꿔주세요 !</td>
				</tr>
				</c:if>
				
				
				
				<tr style="width:200px; height:200px">
				<td class="w3-panel w3-leftbar w3-border-yellow">와글 소개</td>
				<td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="10">${wagle.wintro}</textarea></td>
				</tr>
				<tr>
				<td class="w3-panel w3-leftbar w3-border-yellow">그룹이미지<br/>업로드</td>
				<td>
				<img src="${pageContext.request.contextPath}/wagleimg/${wagle.filename}" style="height:300px; width:300px;">
				<br><br>
				<input class="w3-input w3-border" name="uploadfile" type="file"></td>
				</tr>
				<tr>
				<td colspan="2" class="w3-center">
				<button class="w3-button w3-yellow w3-border" type="submit">수정</button>
				<a class="w3-button w3-red w3-border" onclick="document.location.href='wagleDelete?wboardid=${wagle.wboardid}'">삭제</a>
				</td>
				</tr>
			</table>
	</form>	
	</center>
</body>
</html>