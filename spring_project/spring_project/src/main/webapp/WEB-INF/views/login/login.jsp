<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>

<script>
$(function(){
	$("#btnLogin").click(function(){ 
		var userId=$("#userId").val();
		var userPw=$("#userPw").val();
		if(userId=" "){
			alert("아이디를 입력하세요")
			$("#userId").focus();
			return;
		}
		if(userPw=" "){
			alert("비밀번호를 입력하세요")
			$("#userPw").focus();
			return;
		}
		 
		document.form1.action="${path}/project/login/loginCheck";
		document.form1.submit();
	});
});

function list(page){
	location.href="${path}/board/list?curPage=" + page + "&searchOption=${map.searchOption}" + "&keyword=${map.keyword}";
}
 
</script>
<link rel="stylesheet" type = "text/css" href="../resources/css/login.css">
<!-- 블루비웹스토어 -->

</head>
<body>

<h3>로그인</h3>
<hr>
<form name="form1" method="get" action="${path}/project/login/loginCheck">
아이디 : <input type="text" name="userId" id="userId"> <br>
비밀번호 : <input type="password" name="userPw" id="userPw"> <br>
<input type="submit" value="로그인" id="btnLogin" class = "btn1">
<input type="reset" value="로그인 취소">
</form>
<c:if test="${msg=='실패'}">
<div>아이디와 비밀번호가 일치하지 않습니다.</div>
</c:if>
<c:if test="${msg=='logout'}">
<div>로그아웃되었습니다.</div>
</c:if>
 
</body>
</html>