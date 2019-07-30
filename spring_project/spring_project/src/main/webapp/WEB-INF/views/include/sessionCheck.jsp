<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Insert title here</title>
<c:if test="${sessionScope.userId==null}">
<script>
alert("로그인후에 사용하세요");
location.href = "${path}/project/login/login";
</script>
</c:if>

</head>
<body>
<!-- 프로젝트 실행 : login/login -->
</body>
</html>