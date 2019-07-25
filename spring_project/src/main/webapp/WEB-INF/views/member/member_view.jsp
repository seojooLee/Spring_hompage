<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function() {
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/project/member/delete";
			document.form1.submit(); 
		} 
	});
	
	$("#btnUpdate").click(function(){
		if(confirm("수정하시겠습니까?")){
			document.form1.action="${path}/project/member/update";
			document.form1.submit(); 
		} 
	});	
	
})
 
</script>
 

</head>
<body>
<%@ include file="../include/menu.jsp" %>

<h2>회원상세보기</h2>
<hr>
<form name="form1" method="post" action="#">
아이디 : <input type="text" name="userId" value="${dto.userId}" readonly><br>
비밀번호 : <input type="password" name="userPw" value=""><br>
이름 : <input type="text" name="userName" value="${dto.userName}"><br>
이메일 : <input type="email" name="userEmail" value="${dto.userEmail}"><br>
회원가입날짜 : <fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss" /><br>
수정날짜 : <fmt:formatDate value="${dto.userUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss" /><br>
<input type="button" value="수정" id="btnUpdate">
<input type="button" value="삭제" id="btnDelete"><br>
</form>
<div style="color:red; font-size:24px;">
${message}
</div>

<!-- 테스트 1)member/write==> 입력 => 등록 => 리스트 뜨는지 확인 -->










</body>
</html>