<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
html{
 font-family : 나눔고딕; 
text-decoration: none;

  }
  
 a{
 font-family : 나눔고딕; 
 }
 
.board_list{

color : white;
text-decoration: none;

padding : 10px;

}
.board_list:hover{
color : red;
font-family : 나눔고딕;
padding : 10px;

}
.board_div1{
	background-color : grey;
	height : 30px;

}


</style>


<body>
<div class = "board_div1">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<a class = "board_list" href="${path}/member/list"> 회원목록보기</a>
<a class = "board_list" href="${path}/member/write"> 회원등록하기</a>
<a class = "board_list" href="${path}/member/list"> 멤버 리스트</a>
<a class = "board_list" href="${path}/board/write"> 글쓰기</a>
<a class = "board_list" href="${path}/board/list"> 게시판 목록</a>

<c:choose>
<c:when test="${sessionScope.userId==null}">
<a href="${path}/login/login">로그인</a> 
</c:when>

<c:otherwise>
${sessionScope.userName}님이 로그인중 입니다.
<a href ="${path}/login/logout">로그아웃</a> 
</c:otherwise>
 
</c:choose>
</div>
</body>
</html>