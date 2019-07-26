<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시글 목록</h2>
<hr>

<form name="form1" method="post" action="${path}/board/list">

<select name="searchOption">

<option value ="all" <c:out value="${map.searchOption == 'all'? 'selected':''}"/>>
전체(작성자+내용+제목)</option>

<option value ="writer" <c:out value="${map.searchOption == 'writer'? 'selected':''}"/>>
작성자</option>

<option value ="content" <c:out value="${map.searchOption == 'content'? 'selected':''}"/>>
내용</option>

<option value ="title" <c:out value="${map.searchOption == 'title'? 'selected':''}"/>>
제목</option>  

</select>
<input type="text" name="keyword" value="${map.keyword}">
<input type="submit" value="조회">  

</form>
<br>
${map.count} 개의 게시글이 존재합니다. 
<br>

 
<table border="1" width="600px">
<tr>
<th> 번호 </th> <th> 제목 </th> <th> 작성자 </th> <th> 작성일 </th> <th> 조회수 </th>
</tr>
<c:forEach var="row" items="${map.list}">
<tr>
<td>${row.bno}</td>
<td><a href="${path}/board/view?bno=${row.bno}">${row.title}</a></td>

<td>${row.writer}</td>
<td><fmt:formatDate value="${row.regdate}" pattern = "yyyy-MM-dd" /></td>
<td>${row.viewcnt}</td>
</tr>
</c:forEach>
</table>
<form>
<input type="button" value="글쓰기" id="btnWrite">
</form>













</body>
</html>