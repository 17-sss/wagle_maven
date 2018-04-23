<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE>
<html lang="en">
<head>
   <title>Table V02</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
</head>

<style>
li{
	display:inline;
}
.row {
  display: table-row;
  background: #fff;
}
.row.header {
  color: #ffffff;
  background: #FCB043;
}
@media screen and (max-width: 768px) {
  .row {
    display: block;
  }
  .row.header .cell {
    display: none;
  }
  .row .cell:before {
    line-height: 1.2;
    text-transform: uppercase;
    font-weight: unset !important;
    margin-bottom: 13px;
    content: attr(data-title);
    min-width: 98px;
    display: block;
  }
}
.cell {
  display: table-cell;
}
.row .cell {
  color: #666666;
  line-height: 1.2;
  padding-top: 15px;
  padding-bottom: 15px;
  border-bottom: 1px solid #f2f2f2;
}
.row.header .cell {
  color: #fff;
  line-height: 1.2;
  text-align: left;
}
.row .cell:nth-child(1) {
  width: 100;
  text-align: center;
}
.row .cell:nth-child(2) {
  width: 150;
}
.row .cell:nth-child(3) {
  width: 250;
}
.row .cell:nth-child(4) {
  width: 100;
}
.row .cell:nth-child(5) {
  width: 150;
}
.row .cell:nth-child(6) {
  width: 50;

}
.row .cell:nth-child(7) {
  width: 100;
  text-align: center;
  padding-right:30px;
  
}

.table, .row {
  width: 900px !important;
}
.row:hover {
  background-color: lightyellow;
}
@media (max-width: 768px) {
  .row {
    border-bottom: 1px solid #f2f2f2;
    padding-bottom: 18px;
    padding-top: 30px;
    padding-right: 15px;
    margin: 0;
  }
  
  .row .cell {
    color: #555555;
    line-height: 1.2;
  }
}
</style>
<body>
   <%@include file="/common/header.jsp" %>
   


      <div style="margin-top:200px;" class="w3-display-topmiddle">
         <span class="w3-center w3-large">
            <h3>내가 <b>오픈한</b> 와글</h3>
         </span>
         <br>
         <div class="wrap-table100" >
         
            <!-- 오픈한 와글이 존재하지 않을 때 -->
            <c:if test="${count==0}">
            <div class="table w3-center">
               <div class="row header">
               <div class="cell" style="width:900px;">
               <b style="cursor:pointer;" onclick="document.location.href='${pageContext.request.contextPath}/board/wagleOpen'">오픈한 와글이 없습니다. 와글을 열어보세요 !</b>
               </div>
               </div>
            </div>
            </c:if>
            
            <!-- 오픈한 와글이 존재할 때 -->   
            <c:if test="${count!=0}">
               <div class="table">

                  <div class="row header">
                     <div class="cell">
                        번 호
                     </div>
                     <div class="cell">
                        카테고리
                     </div>
                     <div class="cell">
                        와 글
                     </div>
                     <div class="cell">
                        와글 지기
                     </div>
                     <div class="cell">
                        와글러 (/)
                     </div>
                     <div class="cell">
                        수정
                     </div>
                     <div class="cell">
                        그룹채팅
                     </div>
                  </div>
   
                  <c:forEach var="mylist" items="${mylist}">
                  
                 
                 
                  <div class="row">
             
                     <div class="cell" <c:if test="${today > mylist.wend}"> style="color:red;"</c:if>>
                        ${count}
                     </div>
                     <c:set var="count" value="${count-1}"/>
                     
                     <div class="cell" <c:if test="${today > mylist.wend}"> style="color:red;"</c:if>>
                        ${mylist.wcategory}
                     </div>
                     <div class="cell" <c:if test="${today > mylist.wend}"> style="color:red;"</c:if>>
                        <a <c:if test="${today <= mylist.wend}"> style="cursor:pointer;" onclick="document.location.href='${pageContext.request.contextPath}/board/wagleContent?wboardid=${mylist.wboardid}&wname='+encodeURI('${mylist.wname}')" </c:if>>
                        ${mylist.wname}</a>
                     </div>
                     <div class="cell" <c:if test="${today > mylist.wend}"> style="color:red;"</c:if>>
                        ${mylist.whost}
                     </div>

                  
                     <div class="cell" <c:if test="${today > mylist.wend}"> style="color:red;"</c:if>>                  
                         <div class="w3-dropdown-hover">
                            <button class="w3-btn w3-padding-small w3-white">
                            <i class="fa fa-user" style="font-size:20px"></i>
                           ${mylist.all}/${mylist.wmax}</button>
                            <div class="w3-dropdown-content w3-bar-block w3-border" style="width:300px;">
                               <i href="host" class="w3-bar-item w3-button" style="color:red;"><b>${mylist.whost}</b></i> 
                               <c:forEach var="mylist3" items="${mylist.member}">
                                 <i class="w3-bar-item w3-button">${mylist3.wagler}
                                 
                                 <button onclick="document.location.href='${pageContext.request.contextPath}/board/wagleOut2?wboardid=${mylist.wboardid}&wagleremail=${mylist3.wagleremail}'" class="w3-btn w3-round w3-small  w3-red w3-right">탈퇴</button>
                                 
                                 <button onclick="document.location.href='${pageContext.request.contextPath}/message/sendmessageForm?userinfo2=${mylist3.wagleremail}'" class="w3-btn fa fa-envelope-o w3-round w3-yellow w3-right" style="margin-right:5px;"></button>
                                 
                                 </i>
                              </c:forEach>
                            </div>
                          </div>
                     </div>
                     
                     <div class="cell" <c:if test="${today > mylist.wend}"> style="color:red;"</c:if>>
                           <button class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey"
                           onclick="document.location.href='${pageContext.request.contextPath}/board/wagleUpdate?wboardid=${mylist.wboardid}'">수정</button>
                     </div>
 <div class="cell">
        <a  href="${pageContext.request.contextPath}/chat/GroupChat?wboardid=${mylist.wboardid}&wname=${mylist.wname}" class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey"
         onclick="window.open(this.href,'','resizable=no, width=900, height=750, left=800, top=200'); return false;">채팅</a>    
 </div>      
                  </div>
                  </c:forEach>
                  </div>
               </c:if>
               
               <div style="margin-top:100px;margin-bottom:100px;">
               	<hr style="border:0.5px dashed lightgrey;">
               </div>
               
            
               
            <span class="w3-center w3-large" >
                  <h3>내가 <b>가입한</b> 와글</h3>
            </span><br>
            <div class="wrap-table100" style="margin-bottom:100px;" >
         
            <!-- 가입한 와글이 존재하지 않을 때 -->
            <c:if test="${count2==0}">
            <div class="table w3-center">
               <div class="row header">
               <div class="cell" style="width:900px;">
               <b style="cursor:pointer;" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist'">가입한 와글이 없습니다. 와글에 가입해보세요!</b>
               </div>
               </div>
            </div>
            </c:if>
            
            <c:if test="${count2!=0}">
               <div class="table">
                  <div class="row header">
                     <div class="cell">
                        번 호
                     </div>
                     <div class="cell">
                        카테고리
                     </div>
                     <div class="cell">
                        와 글
                     </div>
                     <div class="cell">
                        와글 지기
                     </div>
                     <div class="cell">
                        탈퇴 / 후기
                     </div>
                     <div class="cell">
                        쪽지
                     </div>
                     <div class="cell">
                        그룹채팅
                     </div>
                     
                  </div>
                  
                  <c:forEach var="mylist" items="${mylist2}">   
                  <div class="row">
                     <div class="cell">
                        ${count2}
                     </div>
                     <c:set var="count2" value="${count2-1}"/>
                     
                     <div class="cell">
                        ${mylist.wcategory}
                     </div>
                     
                     <div class="cell">
                        <a style="cursor:pointer" onclick="document.location.href='${pageContext.request.contextPath}/board/wagleContent?wboardid=${mylist.wboardid}&wname='+encodeURI('${mylist.wname}')">
                        ${mylist.wname}</a>
                     </div>
                     <div class="cell">
                        ${mylist.host}
                     </div>
                     <div class="cell">
                        <button onclick="document.location.href='${pageContext.request.contextPath}/board/wagleOut?wboardid=${mylist.wboardid}'" class="w3-btn w3-padding-small w3-round w3-red">탈퇴</button>
                        <button  onclick="document.getElementById('reviewForm${count2}').style.display='block'"
                        class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey">후기</button>
                        <%@include file="/WEB-INF/view/board/reviewForm.jsp" %>
                     </div>
                     
                     <div class="cell">
                      <div class="w3-dropdown-hover">
                         <button class="w3-btn fa fa-envelope-o w3-border w3-border-yellow w3-white"></button>
                         <div class="w3-dropdown-content w3-bar-block w3-border" style="width:250px;">
                            <i class="w3-bar-item w3-button" style="color:red;"><b>${mylist.host}</b>
                            &nbsp;&nbsp;
                            <button onclick="document.location.href='${pageContext.request.contextPath}/message/sendmessageForm?userinfo2=${mylist.hostemail}'" class="w3-btn fa fa-envelope-o w3-round w3-yellow w3-right"></button>
                            </i> 
                            <c:forEach var="mylist3" items="${mylist.member}">
                              <i class="w3-bar-item w3-button">${mylist3.wagler}
                              &nbsp;&nbsp;
                              <button onclick="document.location.href='${pageContext.request.contextPath}/message/sendmessageForm?userinfo2=${mylist3.wagleremail}'" class="w3-btn fa fa-envelope-o w3-round w3-yellow w3-right"></button>
                              </i>
                           </c:forEach>
                     
                         </div>
                       </div>
                     </div>
                      <div class="cell">
        <a  href="${pageContext.request.contextPath}/chat/GroupChat?wboardid=${mylist.wboardid}&wname=${mylist.wname}" class="w3-btn w3-padding-small w3-round w3-white w3-border w3-hover-light-grey"
         onclick="window.open(this.href,'','resizable=no, width=900, height=750, left=800, top=200'); return false;">채팅</a>    
 </div>       
                  </div>
                  </c:forEach>
            </c:if>
            </div>
            
</body>
<script> 
$(function(){ 
$('.forweb').click(function(){ 
myFunction(); 
return false; 
}); 
function myFunction() { 
window.open("${pageContext.request.contextPath}/chat/GroupChat", "_blank", "toolbar=no,scrollbars=no,resizable=no,top=0,left=0,width=370,height=620"); 
} 
}); 
</script>

</html>