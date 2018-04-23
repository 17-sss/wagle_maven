<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
   section.R{
       /* font-family: 'Yeon Sung', cursive; */
       
   }
   section.openIntro{
      height: 40vh;
      margin-bottom:8vh;
      font-family: 'Yeon Sung', cursive;
   }
   section.bottom{
        height: 20vh;
        margin-bottom:20vh;
        font-family: 'Yeon Sung', cursive;
   }
</style>
</head>
<body>
   <section class="openIntro">
    <div class="w3-display-topmiddle w3-container" style="top:150px;">
   <a style="font-size:3.4rem;"> 
    와글 지기가 되려면 ?</a><br>
    <a style="font-size:2.5rem;">
    1. 약속을 잘 지켜야 해요  - <br>
    2. 부적절한 컨텐츠는 안돼요 - <br>
    3. 두 가지만 지켜주시면 할 수 있어요 :)
    </a>
    </div>
    </section>
    
    <section class="R" style="height:40vh;">
    <hr style="border-top:1px dotted #FCB043; width: 60%; margin-left:300px;">
    <p style="font-size:1.5rem; text-align:center;">연령별 카테고리별 인기있는 와글 가입현황</p><br>
     <%@include file="RScript.jsp" %>
   </section>
    
    <section class="bottom">
       <div class="w3-display-bottommiddle" style="top:950px;">
       <p style="font-size:2.8rem; text-align:center;">와글 지기가 될 준비가 되셨나요 ?</p><br>
       <a class="fa fa-angle-double-down w3-display-bottommiddle" style="font-size:48px;color:#eb4a2c;top:100px;"></a>
      </div>
   </section>

   
   <c:if test="${sessionEmail==null}">
      <section style="height: 40vh;background-color:#FCB043;">
         <center>
         <button class="w3-btn w3-yellow w3-round w3-hover w3-hover-white" onclick="document.location.href='${pageContext.request.contextPath}/member/joinForm'"
               style="margin-top:10vh;">Login</button>
         </center>
      </section>
   </c:if>
   

   <c:if test="${sessionEmail!=null}">
   <section class="openForm" style="background-color:#FCB043; padding-top:100px; padding-bottom:50px;">
      <center>
      <div class="w3-round w3-card-4 w3-padding-large w3-white" style="width:40%;">
         <form method="post" enctype="multipart/form-data" action="wagleOpenPro">
         <input type="hidden" name="whost" value="${whost}"/>
         <input type="hidden" name="whostemail" value="${whostemail}"/>
         <br>
         <h2><b>WAGLE OPEN</b></h2><br>
         <table class="w3-table " cellspacing="20">
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">와글 이름</td>
         <td><input class="w3-input w3-animate-input" style="width:50%" name="wname" type="text"></td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">와글 지기</td>
         <td>${whost}</td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">와글 지기 소개</td>
         <td><textarea class="w3-input w3-border" name="wprofile" rows="4" cols="15"></textarea></td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">카테고리</td>
         <td>
            <select  name="wcategory">
                 <option  value="스포츠">스포츠</option>
                 <option  value="여행">여행</option>
                 <option  value="요리/음식">요리/음식</option>
                 <option  value="인문학/책">인문학/책</option>
                 <option  value="문화/예술">문화/예술</option>
                 <option  value="사교/인맥">사교/인맥</option>
                 <option  value="외국/언어">외국/언어</option>
            </select>       
         </td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">최대 인원</td>
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
         <td class="w3-leftbar w3-border-yellow">지역</td>
         <td>
            <input type="radio" class="w3-radio" name="wloc" value="서울특별시 마포구 월드컵북로 21" checked>&nbsp;강북 &nbsp;&nbsp;
              <input type="radio" class="w3-radio" name="wloc" value="서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터">&nbsp;강남
         </td>
         </tr>
         
         <tr>
         <td class="w3-leftbar w3-border-yellow">와글 기간</td>
         <td>
            <input type="text" name="wstart" id="datepicker" value="">&nbsp;&nbsp;~&nbsp;&nbsp;
            <input type="text" name="wend" id="datepicker2" value="">
         </td>
         </tr>   
         
         
         <tr>
            
            <td class="w3-leftbar w3-border-yellow">다가오는 일정</td>
            <td>
            <input style="width:50%; border-top:0; border-left:0; border-right:0;" type="text" name="wevent1" placeholder="일정 1 : 이 날의 주제를 정해주세요!">
            <input type="text" name="weventdate1" id="datepicker3" value=""><br><br>
            <input style="width:50%; border-top:0; border-left:0; border-right:0;" type="text" name="wevent2" placeholder="일정 2 : 이 날의 주제를 정해주세요!">
            <input type="text" name="weventdate2" id="datepicker4" value="">
            </td>
         </tr>
         
         <tr>
            <td class="w3-leftbar w3-border-yellow">와글 소개</td>
            <td><textarea class="w3-input w3-border w3-margin-bottom" name="wintro" rows="4" cols="15"></textarea></td>
         </tr>
         
         <tr>
            <td class="w3-leftbar w3-border-yellow">그룹이미지<br/>업로드</td>
            <td><input class="w3-input w3-border" name="uploadfile" type="file"></td>
         </tr>
         
         <tr>
            <td colspan="2" class="w3-center">
            <br>
            <input class="w3-btn w3-round w3-yellow" type="submit" value="Open">
            <br><br>
            </td>
         </tr>
         
         </table>
         </form>
      </div>
   
      
   </center>
   </section></c:if>

</body>
</html>