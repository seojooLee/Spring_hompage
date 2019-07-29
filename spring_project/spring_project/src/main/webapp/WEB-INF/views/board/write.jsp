<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
<%-- <%@ include file = "../include/sessionCheck.jsp" %>
 --%>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시글 작성</h2>
<hr>
<form name="form1" method="post" action="${path}/board/insert">
제목:<input type="text" name="title" id="title" size="80" placeholder="제목을 입력하세요"> <br>
내용 : <textarea name="content" id="content" rows="5" cols="100"></textarea> <br>
이름 : <input type="text" name="writer" id="writer" placeholder="이름을 입력하세요"> <br>
<input type="submit" value="확인">
<input type="reset" value="취소">




</form>
</body>
</html>