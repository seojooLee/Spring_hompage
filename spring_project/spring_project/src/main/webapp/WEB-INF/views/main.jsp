<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
html{
	font-family : 나눔고딕;

}
.board_div2{ 
	background-color : grey 
	
}

.board_div2 a{  
	color: white;
	text-decoration: none; 
}
.board_div2 a : hover{  
	color: blue;
	text-decoration: none; 
}

</style>

<body>
메인 페이지 입니다.

${msg} <br>
<div class = "board_div2">

<a href="http://localhost:8088/project/member/list"> 회원가입</a><br>
<a href="http://localhost:8088/project/login/login"> 로그인</a><br>
<a href="http://localhost:8088/project/board/list"> 게시판</a><br>


</div>
 

</body>
</html>