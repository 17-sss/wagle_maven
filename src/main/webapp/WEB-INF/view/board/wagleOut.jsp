<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${chk==1}">
	<script language="JavaScript">
	 alert("와글에서 나가셨습니다.");
	</script>
	</c:if>
	
	<c:if test="${chk==2}">
	<script>
	alert("와글에서 내보냈습니다.");
	</script>
	</c:if>
	
	<meta http-equiv="Refresh" content="0;url=mylist">
	
</body>
</html>