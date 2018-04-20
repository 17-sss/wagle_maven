<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

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
  text-align: center;
}

.row .cell:nth-child(1) {
  width: 300px;
  text-align: center;
  padding-left:40px;
}

.row .cell:nth-child(2) {
  width: 500px;
  padding-right:40px;
}

.table, .row {
  width: 800px !important;
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
<script>
	//confirm pwd
 function checkPwd(){
        var f1 = document.forms[0];
        var pw1 = f1.pwd.value;
        var pw2 = f1.confirmPwd.value;
        if(pw1!=pw2){
         document.getElementById('checkPwd').style.color = "red";
         document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
        }else{
         document.getElementById('checkPwd').style.color = "black";
         document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
         
        }
        
       }

</script>

<body>
<%@include file="/common/header.jsp" %>

<!-- signup Form -->
		
		<div class="w3-display-middle">
			<div style="color:grey; text-align:center;">
				<h3><b>회원 정보 수정</b></h3>
			</div>
			<br>
			<div class="wrap-table100 w3-card" >
			 <form  method="post" name="updateForm" onSubmit="return check()" action="${pageContext.request.contextPath}/member/updatePro">
				<div class="table">
						 <input type="hidden" name="email" value="${member.email}"/>	
						<div class="row header">
							<div class="cell">
								<b>${member.name}님 !</b>
							</div>
							<div class="cell" >
								<b>정보를 수정해주세요 !</b>	
							</div>

						</div>
	
						<div class="row">
							<div class="cell">
								이름
							</div>
							<div class="cell">
								${member.name}
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								이메일
							</div>
							<div class="cell">
								${member.email}
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								비밀번호
							</div>
							<div class="cell">
								<c:if test="${sessionEmail ne 'admin'}">
								<input class="w3-input w3-animate-input" style="width:50%;" type="password" name="pwd" size="20" value="${member.pwd}" required="required">
								</c:if>
								<c:if test="${sessionEmail eq 'admin'}">
								<input class="w3-input w3-animate-input" style="width:50%;" type="text" name="pwd" size="20" value="${member.pwd}" required="required">
								</c:if>
							</div>
						</div>
						
						<c:if test="${sessionEmail ne 'admin'}">
							<div class="row">
								<div class="cell">
									비밀번호 확인
								</div>
								<div class="cell">
									<input class="w3-input w3-animate-input" style="width:50%;"  type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required">
									<div id="checkPwd"></div>
								</div>
							</div>
						</c:if>
						
						<div class="row">
							<div class="cell">
								성별
							</div>
							<div class="cell">
								${member.gender}
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								나이
							</div>
							<div class="cell">
								 <input type="radio" name="age" value="10대" required="required" <c:if test="${member.age eq '10대'}">checked </c:if>>10대
								 <input type="radio" name="age" value="20대" required="required" <c:if test="${member.age eq '20대'}">checked </c:if>>20대
								 <input type="radio" name="age" value="30대" required="required" <c:if test="${member.age eq '30대'}">checked </c:if>>30대
								 <input type="radio" name="age" value="40대" required="required" <c:if test="${member.age eq '40대'}">checked </c:if>>40대
								 <input type="radio" name="age" value="50대" required="required" <c:if test="${member.age eq '50대'}">checked </c:if>>50대
								 <input type="radio" name="age" value="60대" required="required" <c:if test="${member.age eq '60대'}">checked </c:if>>60대
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								거주지
							</div>
							<div class="cell">
								<input class="w3-input w3-animate-input" style="width:50%;" type="text" name="loc" size="10" value="${member.loc}" required="required">	
							</div>
						</div>
						
						
						<div class="row" >
							<div class="cell">
							</div>
							<div class="cell" >
								<input class="w3-btn w3-amber w3-round-xlarge" type="submit" value="정보수정">
								<c:if test="${sessionEmail ne 'admin'}">
								<input class="w3-btn w3-red w3-round-xlarge" type="button" value="탈퇴하기" onclick="window.location.href='deleteForm?email=${member.email}'">
								<input class="w3-btn w3-amber w3-round-xlarge" type="button" value="취소" onclick="window.location.href='${pageContext.request.contextPath}/index'">
								</c:if>
								<c:if test="${sessionEmail eq 'admin'}">
								<input class="w3-btn w3-amber w3-round-xlarge" type="button" value="목록" onclick="window.location.href='${pageContext.request.contextPath}/admin/memberlist'">
								</c:if>
							</div>

						</div>
				</div>
			 </form>
			</div>
		</div>				

</body>
</html>