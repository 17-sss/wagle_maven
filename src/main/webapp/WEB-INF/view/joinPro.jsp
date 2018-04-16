<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<c:if test="${!result}">
 		<script language="JavaScript">
		alert("Wagle의 회원이 되신걸 환영합니다!! 로그인해주세요 !")
		</script>
		<meta http-equiv="Refresh" content="0;url=${pageContext.request.contextPath}/member/joinForm">
	</c:if> 
	<c:if test="${result}">
		<script>
		alert("이메일이 중복됩니다. 다른 이메일을 입력해주세요.")
		history.go(-1);
		</script>
	</c:if>

</body>
</html>