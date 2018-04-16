<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Insert title here</title>
</head>
<body>
	<c:if test="${chk == 1}">
 		<script language="JavaScript">
		alert("회원님의 비밀번호는 ${member.pwd}입니다.")
		</script>
		<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/board/index">
	</c:if> 
	<c:if test="${chk != 1}">
		<script>
		alert("이메일이 없거나 질문을 잘못 입력하셨습니다.")
		history.go(-1);</script>
	</c:if>
 
</body>
</html>