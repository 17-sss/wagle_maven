<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctx = request.getContextPath(); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Wagle 탈퇴</title>
	<script type="text/javascript">
		function Acheck() {
			if (document.deleteFormA.pwd.value != document.deleteFormA.sessionPwd.value) {
				alert("관리자 비밀번호를 확인하세요.");
				return false;
			}
		}
	</script>
	
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
  width: 800px;
  text-align: center;
}

.table, .row {
  width: 800px !important;
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

</head>
<body>
<%@include file="/common/header.jsp" %>
		<div class="w3-display-topmiddle" style="margin-top:250px;">
			<div style="color:grey; text-align:center;">
				<h3><b>회원 탈퇴</b></h3>
			</div>
			<br>
			<div class="wrap-table100 w3-card" >
				<div class="table">
						<div class="row header">
							<c:if test="${sessionEmail ne 'admin'}">
								<div class="cell">
									<b>${name}님! 정말로 탈퇴하실건가요?</b>
								</div>
							</c:if>
							<c:if test="${sessionEmail eq 'admin'}">
								<div class="cell">
									<b>${email} 멤버를 삭제하시겠습니까?</b>
								</div>
							</c:if>
						</div>
				
						<c:if test="${sessionEmail ne 'admin'}">
						<form method="post" name="deleteForm" action="deletePro?email=${sessionEmail}" onsubmit="return deleteSave()">
						</c:if>
						<c:if test="${sessionEmail eq 'admin'}">
						<form method="post" name="deleteFormA" action="deletePro?email=${email}" onSubmit="return Acheck()">
						</c:if>


						<div class="row">
							<div class="cell">
								비밀번호를 입력해 주세요.
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								<c:if test="${sessionEmail eq 'admin'}">
								관리자 비밀번호: <input type="password" name="pwd" size="8" maxlength="12" > 
											<input type="hidden" name="sessionPwd" value="${sessionPwd}">
											<input type="hidden" name="email" value="${email}">
								</c:if>
								<c:if test="${sessionEmail ne 'admin'}">
								비밀번호: 	<input type="password" name="pwd" size="8" maxlength="12"> 
									   	<input type="hidden" name="email" value="${sessionEmail}">
								</c:if>
							</div>
						</div>
						
						<div class="row">
							<div class="cell">
								<c:if test="${sessionEmail ne 'admin'}">
									<input type="submit" value="탈퇴" class="w3-btn w3-red w3-round-xlarge"> 
									<input type="button" value="취소" class="w3-btn w3-amber w3-round-xlarge" onclick="document.location.href='updateForm?email=${sessionEmail}'">
								</c:if>
								<c:if test="${sessionEmail eq 'admin'}">
									<input type="submit" value="삭제" class="w3-button w3-amber w3-round-xlarge"> 
									<input type="button" value="취소" class="w3-button w3-amber w3-round-xlarge" onclick="document.location.href='${pageContext.request.contextPath}/admin/memberlist'">
								</c:if>
							</div>
						</div>
					</form>	
				</div>
			</div>
		</div>
</body>
</html>