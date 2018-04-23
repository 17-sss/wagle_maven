<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style type="text/css">
         section {
            height: 50vh !important;
              overflow: hidden;
              background-attachment: fixed;
              background-size: cover;
         }
         .div-sec1 {
            height: 20vh !important;
              overflow: hidden;
              background-attachment: fixed;
              background-size: cover;           
         }

         .custom-font {
            font-family: 'Coustard', serif;
         }

         
   </style>
<title>Insert title here</title>
</head>
<%@include file="/common/header.jsp" %>
<body class="w3-light-gray">

<!-- 그룹 배경 -->
<section class="section_img1" style="margin-top:100px;">
   <header class="w3-center w3-text-white">
   <img src="${pageContext.request.contextPath}/wagleimg/${wagle.filename}" style="height:400px;">
   </header>
</section>

<!-- 정보 -->
<div class="div-sec1">
   <div class="w3-center">
      <h1><b class="w3-border-amber w3-bottombar w3-text-black">${wagle.wname}</b></h1>
   </div>
   
   <div class="w3-center">
   
      <div class="w3-center w3-margin" style="display: inline-block;">
         <i class="fa fa-user fa-4x"></i>
         <br>
         <span class="w3-text-gray w3-medium">${wagle.all}/${wagle.wmax}명</span>
      </div>
      &nbsp;
      <div class="w3-center w3-margin" style="display: inline-block;">
         <i class="fa fa-sign-in fa-4x"></i>
         <br>
         <span class="w3-text-gray w3-small">상시 참여 가능</span>
      </div>
      <!-- &nbsp;
      <div class="w3-center w3-margin" style="display: inline-block;">
         <i class="fa fa-diamond fa-4x"></i>
         <br>
         <span class="w3-text-gray w3-small">재료비/예치금</span>
      </div> -->
      &nbsp;
      <div class="w3-center w3-margin" style="display: inline-block;">
         <i class="fa fa-align-justify fa-4x"></i>
         <br>
         <span class="w3-text-gray w3-small">${wagle.wcategory}</span>
      </div>
      
   </div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
   <div class="w3-card w3-white w3-margin">
      <div class="w3-container">
         <h4 class="w3-leftbar w3-border-amber">
            &nbsp;<b>Wagle 소개</b>
         </h4>
         <hr>
      </div>
      <div class="w3-container">
         <p>
         ${wagle.wintro}
         </p>
         <br>
      </div>
   </div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
   <div class="w3-card w3-white w3-margin">
      <div class="w3-container">
         <h4 class="w3-leftbar w3-border-amber">
            &nbsp;
            <b>와글 지기 소개</b>
         </h4>
         
         <hr>
      </div>
      <div class="w3-container">
         <p><b>와글 지기 :</b>${wagle.whost}
         <button onclick="document.location.href='${pageContext.request.contextPath}/message/sendmessageForm?userinfo2=${wagle.whostemail}'" class="w3-btn w3-padding-small w3-round-xlarge w3-amber w3-right">쪽지 보내기</button>
         </p>
         <p>${wagle.wprofile}</p>
         <br>
      </div>
   </div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
   <div class="w3-card w3-white w3-margin">
      <div class="w3-container" >
         <h4 class="w3-leftbar w3-border-amber">
            &nbsp;<b>Wagle 정보</b>
         </h4>
         <hr>
      </div>
      <div class="w3-container" style="height:41vh;">
         <p>
            <b>기간:</b>${wagle.wstart} ~ ${wagle.wend}
            <br>
            <b>지역:</b>
            <c:if test="${wagle.wloc eq '서울특별시 마포구 월드컵북로 21'}">
             <%@include file="/mapAPI/wagleN.jsp"%>
            </c:if>
            <c:if test="${wagle.wloc eq '서울특별시 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터'}">
             <%@include file="/mapAPI/wagleS.jsp"%>
            </c:if>
         </p>
         <br>
      </div>
   </div>
</div>

<div class="w3-container" style="margin: 0% 25% 0% 25%;">
   <div class="w3-card w3-white w3-margin">
      <div class="w3-container">
         <h3 class="w3-center">
            &nbsp;&nbsp;<b>Wagle 일정</b>
         </h3>
         <hr>         
      </div>
      
      <div class="w3-container w3-margin-bottom">
         <h5 class="w3-leftbar w3-border-amber">&nbsp;&nbsp;<b>다가오는 이벤트</b></h5>
         <img src="<%=request.getContextPath()%>/wagleimg/${wagle.filename}" alt="wagle-schedule" class="w3-left w3-circle w3-margin-right" style="width: 60px; height: 60px"> 
         <span class="w3-large">${wagle.weventdate1}</span>
         <br>
         <span class="w3-medium">${wagle.wevent1}</span>
      </div>
      
      
      <div class="w3-container w3-margin-bottom">
         <img src="<%=request.getContextPath()%>/wagleimg/${wagle.filename}" alt="wagle-schedule" class="w3-left w3-circle w3-margin-right" style="width: 60px; height: 60px"> 
         <span class="w3-large">${wagle.weventdate2}</span>
         <br>
         <span class="w3-medium">${wagle.wevent2} </span>
         <br><br>
      </div>
      
      
   </div>
</div>


<!-- 후기 -->
<div class="w3-container" style="margin: 0% 25% 0% 25%;" >
   <div class="w3-card w3-white w3-margin" style="padding-bottom:30px;" >
      <div class="w3-container">
         <h3 class="w3-center">
            &nbsp;&nbsp;<b>와글 후기</b>
         </h3>
         <hr>         
      </div>
<c:if test="${count==0}">
<center>

<table class="w3-border w3-border-amber" id="customers" style="width:800px;">
  <thead>
    <tr >
       <td colspan="2" style="text-align:center; padding-top: 15px; padding-bottom:15px;"><a><b>후기가 없습니다.</b></a></td>
     </tr>
</thead>
  
</table>
</center>
</c:if>   
<c:if test="${count!=0}">
<center>

<table  id="customers" style="width:800px">
    <thead >
    <tr>
    <td class="w3-amber" style="width:100px; padding-top: 10px; padding-bottom:10px; text-align:center;"><b>작성자</b></td>
    <td class="w3-amber" style="width:250px; padding-top: 10px; padding-bottom:10px; text-align:center;" colspan="3"><b>내용</b></td>
     </tr>
     </thead>
     <c:forEach var="article" items="${articleList}">
     <tr>
     <td style="text-align:center;  padding-top: 10px; padding-bottom:10px;">${article.writer}</td>
     <c:if test="${article.writer==name}">
     <form method="post" action="reviewupdate">
         <input type="hidden" name="num" value="${article.num}"/>
         <input type="hidden" name="boardid" value="${wagle.wboardid}"/>

     <td style="padding-top: 10px; padding-bottom:10px;"><input class="w3-input" type="text" placeholder="${article.content}" name="content"></td>
     <td style="width:10px;  padding-top: 10px; padding-bottom:10px;"><input class="w3-btn w3-white w3-border w3-border-amber w3-round-xlarge w3-padding-small" type="submit" value="수정"/></td>
     </form>
     <td style="width:10px; padding-top: 10px; padding-bottom:10px; "><button onclick="document.location.href='reviewdelete?num=${article.num}&boardid=${wagle.wboardid}'"class="w3-btn w3-white w3-border w3-border-red w3-round-xlarge w3-padding-small">삭제</button></td>
     </c:if>
     <c:if test="${article.writer!=name}">
     <td style=" padding-top: 10px; padding-bottom:10px;">${article.content}</td>
     </c:if>
  </tr>
     </c:forEach>
  </table>
</center>
<div class="w3-center">
      <c:if test="${count>0}">
         <c:if test="${startPage > bottomLine}">
            <a href="wagleContent?wboardid=${wagle.wboardid}&wname=${wagle.wname}&pageNum=${startPage - bottomLine}">[이전]</a>
         </c:if>
      
         <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="wagleContent?wboardid=${wagle.wboardid}&wname=${wagle.wname}&pageNum=${i}">

         <c:if test="${i != currentPage}">[${i}]</c:if>
            <c:if test="${i == currentPage}">
               <font color='red'>[${i}]</font>
            </c:if>
            </a>
         </c:forEach>
      
         <c:if test="${endPage<pageCount}">
         <a href="wagleContent?wboardid=${wagle.wboardid}&wname=${wagle.wname}&pageNum=${startPage + bottomLine}">[다음]</a>
         </c:if>
   </c:if>   

</div>     
</c:if>   
</div>
</div>   
<br><br>

<c:if test="${wagleremail ne 'nosession'}"> 
<c:if test="${sessionScope.name ne wagle.whost}">
   <c:if test="${!chk}">
      <c:if test="${all < wagle.wmax}">
      <div class="w3-center w3-margin-bottom">
      <button class="w3-btn w3-center w3-amber w3-large w3-round-xxlarge" onclick="document.location.href='wagleJoin?wboardid=${wagle.wboardid}&wname='+encodeURI('${wagle.wname}')+'&wcategory='+encodeURI('${wagle.wcategory}')"><b>와글</b> 할래요 !</button>
      <br><br>
      </div>
      </c:if>
      
      <c:if test="${all >= wagle.wmax}">
      <div class="w3-center w3-margin-bottom">
      <a class="w3-padding-large w3-center w3-amber w3-large w3-round-xxlarge"><b>정원 초과</b>된 와글입니다.</a>
      <br><br>
      </div>
      </c:if>
      
   </c:if>
   
   <c:if test="${chk}">
      <div class="w3-center w3-margin-bottom">
      <a class="w3-padding-large w3-center w3-white w3-border w3-border-amber w3-large w3-round-xxlarge">이미 <b>가입한 와글</b>이에요 !</a>
      
      <br><br>
      </div>
   </c:if>
</c:if>
</c:if>


</body>
</html>