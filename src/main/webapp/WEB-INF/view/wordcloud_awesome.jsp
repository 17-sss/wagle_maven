<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
1. <% String ctx = request.getContextPath(); %>
2. ${pageContext.request.contextPath} 
둘다 같은 기능!! 
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="description" content="A Word Cloud plugin for jQuery.">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.awesomeCloud-0.2.js"></script>
	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>WordCloud</title>
	<style type="text/css">
		.wordcloud{
			height: 100vh;
        	overflow: hidden;
        	background-attachment: fixed;
        	background-size: cover;
			background-color: lightgrey;
		}
	</style>
</head>

<body>

	<div id="wordcloud" class="wordcloud">
			<c:forEach var="word" items="${imgslide}">
				<span data-weight="${Math.random() * 100}">${word.wname}</span>
			</c:forEach>		
	</div>
<div>
	<script>
      $(document).ready(function() {
         $("#wordcloud").awesomeCloud({
            "size" : {
               "grid" : 16,
               "factor" : 1
            },
            "options" : {
               "color" : "random-dark",
               "rotationRatio" : 0.35
            },
            "font" : "'Helvetica Neue', Times, sans-serif",
            "shape" : "circle"
         });
      });
   </script>
   
   <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push([ '_setAccount', 'UA-36251023-1' ]);
      _gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
      _gaq.push([ '_trackPageview' ]);

      (function() {
         var ga = document.createElement('script');
         ga.type = 'text/javascript';
         ga.async = true;
         ga.src = ('https:' == document.location.protocol ? 'https://ssl'
               : 'http://www')
               + '.google-analytics.com/ga.js';
         var s = document.getElementsByTagName('script')[0];
         s.parentNode.insertBefore(ga, s);
      })();
   </script>
	
</div>
</body>
</html>