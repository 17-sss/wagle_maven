<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" >

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.koolchart.com/demo/KoolChart/Assets/Css/KoolChart.css"/>
	<link rel="stylesheet" href="https://www.koolchart.com/demo/Samples/Web/sample.css"/>
	<script src="https://www.koolchart.com/demo/LicenseKey/codepen/KoolChartLicense.js"></script>
	<script src="https://www.koolchart.com/demo/KoolChart/JS/KoolIntegration.js"></script>
	<script type="text/javascript">
	var chartVars = "KoolOnLoadCallFunction=chartReadyHandler";

	KoolChart.create("chart1", "chartHolder", chartVars, "100%", "100%");

	function chartReadyHandler(id) {
	  document.getElementById(id).setLayout(layoutStr);
	  document.getElementById(id).setData(makeData());
	  setTimeout(changeData, 5000);
	}

	var layoutStr =
	  '<KoolChart backgroundColor="#FFFFFF"  borderStyle="none" fontFamily="Noto Sans">'
	   +'<WordCloudChart showDataTips="true">'
	    +'<series>'
	     +'<WordCloudSeries textField="text" weightField="weight">'
	      +'<showDataEffect>'
	       +'<SeriesInterpolate duration="1000"/>'
	      +'</showDataEffect>'
	      +'<fills>'
	       +'<SolidColor color="#5586a4"/>'
	       +'<SolidColor color="#40b2e6"/>'
	       +'<SolidColor color="#ffa123"/>'
	       +'<SolidColor color="#595c7b"/>'
	       +'<SolidColor color="#ef8075"/>'
	       +'<SolidColor color="#f8ba03"/>'
	       +'<SolidColor color="#03b79a"/>'
	       +'<SolidColor color="#a5d4e6"/>'
	       +'<SolidColor color="#b79d7c"/>'
	       +'<SolidColor color="#9e589e"/>'
	      +'</fills>'
	     +'</WordCloudSeries>'
	    +'</series>'
	   +'</WordCloudChart>'
	  +'</KoolChart>';

	function changeData(){
	  document.getElementById("chart1").setData(makeData());
	  setTimeout(changeData, 5000);
	 }
	
	 // [수정] 프로젝트용
	 function makeData(){
	  var i, n,
	   chartData = [];
	   var data = [];
	   <c:forEach items="${imgslide}" var="word">
	   		data.push("${word.wname}");
	   </c:forEach>
	  
	  for(i = 0, n = data.length ; i < n ; i += 1){
	   chartData.push({
	    text : data[i],
	    weight : Math.floor(Math.random(10) * 100)
	   });
	  }
	  return chartData;
	 }
	 </script>
  <!-- sidebar-->
  	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- parallax effect -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/parallax.css">
  
  <!-- wordeffect -->
  	<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/letter.css">

  <!-- image slide -->
  	<link href='https://fonts.googleapis.com/css?family=Roboto:100,400,300,500,700' rel='stylesheet' type='text/css'>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slide.css">  
   
</head>
<body>
  
  <section class="background">
     <div class="content-wrapper">
 
	<!-- side nav -->
	
		<div class="w3-container w3-display-left" style="margin-top: 0px;top: 180px;">
		  <div class="w3-dropdown-hover">
		    <button class="w3-button" style="background-color:#FCB043;">
		    	<i class="fa fa-reorder" style="font-size:36px" onclick="document.location.href='#about'"></i>
		    </button>
		    <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-opacity">
		      <a href="#about" class="w3-bar-item w3-button">About Wagle</a>
		      <a href="${pageContext.request.contextPath}/board/wagleOpen" class="w3-bar-item w3-button">와글열기</a>
		      <a href="${pageContext.request.contextPath}/board/waglelist" class="w3-bar-item w3-button">와글와글</a>
		      
		    <div class="w3-bar-item w3-button" onclick="myAccFunc()">
				  My Page <i class="fa fa-caret-down"></i></div>
				  <div id="mypage" class="w3-hide w3-white w3-card-4">
				  <c:if test="${sessionEmail == null}">  
				    <a href="${pageContext.request.contextPath}/member/joinForm" class="w3-bar-item w3-button">Login</a>
				  </c:if>
				  <c:if test="${sessionEmail != null}">
				    
				    <label class="w3-right w3-small" style="margin:10px 10px 0px 0px;"> <b>${name}</b> 님 환영합니다.</label>
				    <c:if test="${count != 0 && count != null}"> 
			         <div class="w3-right w3-small" style="margin:10px 10px 0px 0px;"><a href="${pageContext.request.contextPath}/message/messagelist">쪽지&nbsp;${count}<strong><font color="red">N</font></strong></a></div>
			     	 </c:if>
			         <c:if test="${count == 0 || count == null}">
			         <div class="w3-right w3-small" style="margin:10px 10px 0px 0px;"><a href="${pageContext.request.contextPath}/message/sendmessageForm">쪽지</a></div>
			         </c:if>
				   
				    <a href="${pageContext.request.contextPath}/board/mylist" class="w3-bar-item w3-button">와글관리</a>
				    <a href="${pageContext.request.contextPath}/member/updateForm?email=${sessionEmail}" class="w3-bar-item w3-button">회원정보</a>
				   	<c:if test="${sessionEmail ne 'admin'}">
				   	<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">Logout</a>
				   	</c:if>
				  </c:if>
			</div>
			
			<!-- 관리자 추가  -->
				<c:if test="${sessionEmail eq 'admin'}">
				<div class="w3-bar-item w3-button" onclick="myAdminFunc()">
					Admin Page <i class="fa fa-caret-down"></i></div>
				<div id="adminpage" class="w3-hide w3-white w3-card-4">
				  	<a href="${pageContext.request.contextPath}/admin/memberlist" class="w3-bar-item w3-button">회원관리</a>
				  	<a href="${pageContext.request.contextPath}/admin/waglelist_ad" class="w3-bar-item w3-button">그룹관리</a>
				  	<a href="${pageContext.request.contextPath}/member/logout" class="w3-bar-item w3-button">Logout</a>
				</div>
				</c:if>
				<!--  -->
		      <a href="${pageContext.request.contextPath}/board/faqlist" class="w3-bar-item w3-button">FAQ</a>
		      
		      
		    </div>
		  </div>
		</div>

      <h1>
      	<br>Wagle
		  <br>&nbsp;Wagle
	  </h1>
		<i class="fa fa-angle-double-down" style="font-size:48px; color:#eb4a2c;"></i>
		
    </div>
  </section>
  
  
  <section class="background">
    <div class="content-wrapper" id="about">
      <p class="content-title w3-display-topmiddle" style="margin-top: 200px;font-size: 7vh;">together is better</p>
		     <div class="w3-display-middle" style="width:40%; max-width:500px; margin-top:80px;">
		    	<img src="${pageContext.request.contextPath}/img/together.jpg" alt="Norway" style="width:100%;">
			 </div>
	  	   <p class="content-subtitle w3-display-bottommiddle" style="margin-bottom:100px;">
	  	   		비슷한 관심사와 가치관을 나눌 수 있는 소통의 공간<br/>
	  	   		원하는 것을 배울 수 있는 자유<br/>
	  	   		함께 만들어가는 커뮤니티 </p>
	      <button class="w3-btn w3-display-bottommiddle" onclick="document.location.href='${pageContext.request.contextPath}/member/joinForm'"
	      style="width: 20%;">와글과 함께 하실래요?</button>

    </div>
  </section>
  
  <section class="background">
    <div class="content-wrapper">
      <p class="content-title">&nbsp;</p>
      <p class="content-subtitle" style="font-size: 15pt; margin-top: 64px;">관심사 <b>카테고리</b></p>
      <div id="chartHolder" style="height:650px; width:100%; margin-top: 80px;"></div>
      <div class="w3-center">
     	 <button class="w3-btn" onclick="document.location.href='${pageContext.request.contextPath}/board/wagleOpen'"
     	 style="width: 20%; margin-top: 240px;">와글지기가 되어주세요!</button>
      </div>
    </div>
  </section>
  

  
  
  <section class="background">
    <div class="content-wrapper">
    
      <!-- image slide-  -->
      <div align="center" class="fond">
          <div class="contener_slideshow" style="margin-top: 200px;">
          <div class="contener_slide" 
          		style="animation-duration: 10s;-moz-animation-duration: 10s; -webkit-animation-duration: 10s;-ms-animation-duration: 10s;">
           <c:forEach var="imgslide" items="${imgslide}">
                       <div class="slid_${number}"><a style="cursor:pointer;" onclick="document.location.href='wagleContent?wboardid=${imgslide.wboardid}&wname='+encodeURI('${imgslide.wname}')">
              <c:set var="number" value="${number-1}"/>
              <img src="${pageContext.request.contextPath}/wagleimg/${imgslide.filename}" style="width:610px; height:400px;">
              <div  class="w3-display-topleft w3-large w3-container w3-padding-16 w3-black">${imgslide.wname}</div>
              </a></div>
          </c:forEach> 
          </div>
        </div>                                                                                                                                     
      </div>
     
      <button class="w3-btn w3-display-middle" onclick="document.location.href='${pageContext.request.contextPath}/board/waglelist'" 
      	style="width: 20%; margin-top: 240px;">와글리스트 더보기</button>
    </div>
  </section>



  	<script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js'></script>
	<script src='https://code.jquery.com/jquery-2.1.4.min.js'></script>
    <script  src="${pageContext.request.contextPath}/js/parallax.js"></script>
	<script>
	function myAccFunc() {
	    var x = document.getElementById("mypage");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	        x.previousElementSibling.className += " w3-green";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace(" w3-green", "");
	    }
	}
	
	/* 관리자 버튼 */
	function myAdminFunc() {
	    var x = document.getElementById("adminpage");
	    if (x.className.indexOf("w3-show") == -1) {
	        x.className += " w3-show";
	        x.previousElementSibling.className += " w3-green";
	    } else { 
	        x.className = x.className.replace(" w3-show", "");
	        x.previousElementSibling.className = 
	        x.previousElementSibling.className.replace(" w3-green", "");
	    }
	}
	</script>
</body>

</html>