<!-- sample (현재 index에 합침) include file 아님 / 안씀. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- <title>Insert title here</title> -->	
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
	 
	 // [원본] 테스트용
	 /* function makeData(){
	  var i, n,
	   chartData = [],
	   data = ["PRAY","NEW","DO","DESIGN","CONCENTRATE","GREAT","LEAD","MOMENT","LOVE","DO","NEW","PRAY","GREAT","DESIGN","CREATIVE","LOVE","STUNNING","PRAY","BABY","LOVELY","DESIGN","GET","GOOD","NEW","COMMUNICATE","LOVE","NEW",
	            "SUCCESS","LOVELY","LOVE","LEARN","PRAY","LOVE","COOL","DO","LOVE","GORGEOUS","HAPPY","GOAL","STORY","LOVE","STUNNING","COMMUNICATE","PRAY","GREAT","HAVE","LOVE","PEOPLE","MIRACLE","COMMUNICATE","WALK","LOVE","DO","COOL","WALK","PRAY","LIKE","LOVELY","NEW","DESIGN","TEACH","LOVE","DO"];
	  
	  for(i = 0, n = data.length ; i < n ; i += 1){
	   chartData.push({
	    text : data[i],
	    weight : Math.floor(Math.random(10) * 100)
	   });
	  }
	  return chartData;
	 }; */
	 
	// [테스트용] alert창으로 wname 받아오는지..
	/*  var list1 = new Array();
	 <c:forEach items="${imgslide}" var="word">
		 list1.push("${word.wname}");
	 </c:forEach>
	 for ( var i = 0; i < list1.length; i++) {
	     alert(list1[i]);
	 } */
	 
	 
	 
	 
	</script>
</head>
<body>
<div id="chartHolder" style="height:1000px; width:100%;"></div>

</body>
</html>