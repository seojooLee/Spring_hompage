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
<body>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<a href="${path}/member/list"> 회원목록보기</a>
<a href="${path}/member/insert"> 회원등록히기</a>
<a href="${path}/member/list"> 게시판</a>
</body>
</html>