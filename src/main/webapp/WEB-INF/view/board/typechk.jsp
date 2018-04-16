<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${chk==1}">

<script>
	alert("이미지 확장자는 jpg,png,jpeg,gif만 가능합니다 !");
	history.go(-1);
</script>
</c:if>
<c:if test="${chk==0}">
<script>
	alert("오픈 되었습니다 !");
	location.href="mylist";
</script>
</c:if>

</body>
</html>