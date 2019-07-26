<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<!-- 글쓰기 기능 부여(list.jsp) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#btnWrite").click(function() {
			location.href = "${path}/project/board/write";
		});
	});

	function list(page) {
		location.href = "${path}/board/list?curPage=" + page
				+ "$searchOption=${map.searchOption}"
				+ "&keyword=${map.keyword}";
	}
</script>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>게시글 목록</h2>
	<hr>

	<form name="form1" method="post" action="${path}/board/list">

		<select name="searchOption">

			<option value="all"
				<c:out value="${map.searchOption == 'all'? 'selected':''}"/>>
				전체(작성자+내용+제목)</option>

			<option value="writer"
				<c:out value="${map.searchOption == 'writer'? 'selected':''}"/>>
				작성자</option>

			<option value="content"
				<c:out value="${map.searchOption == 'content'? 'selected':''}"/>>
				내용</option>

			<option value="title"
				<c:out value="${map.searchOption == 'title'? 'selected':''}"/>>
				제목</option>

		</select> <input type="text" name="keyword" value="${map.keyword}"> <input
			type="submit" value="조회">

	</form>
	<br> ${map.count} 개의 게시글이 존재합니다.
	<br>


	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.bno}</td>
				<td><a href="${path}/board/view?bno=${row.bno}">${row.title}</a></td>

				<td>${row.writer}</td>
				<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd" /></td>
				<td>${row.viewcnt}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><c:if test="${map.boardPager.curBlock>1 }">
					<a href="javascript:list('1')"> [처음]</a>
					<!--페이지가 1이면 처음이라는 글을 보여줌  -->
				</c:if> <c:if test="${map.boardPager.curBlock>1 }">
					<a href="javascript:list('${map.boardPager.prevPage}')"> [이전]</a>
					<!--페이지가 1이면 처음이라는 글을 보여줌  -->
				</c:if> <!--처음, 이전, 번호들 나열, 다음, 끝  --> <c:forEach var="num"
					begin="${map.boardPager.blockBegin}"
					end="${map.boardPager.blockEnd}">
					<c:choose>
						<c:when test="${num==map.boardPager.curPage}">
							<span style="color: red"> ${num} </span>
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${map.boardPager.curBlock<=map.boardPager.totBlock}">
				<a href="javascript:list('${map.boardPager.nextPage }')">다음</a> 
				</c:if>
				
					<c:if test="${map.boardPager.curBlock<=map.boardPager.totPage}">
				<a href="javascript:list('${map.boardPager.totPage }')">끝</a> 
				</c:if>
			 
				
				</td>

		</tr>
	</table>
	<form>
		<input type="button" value="글쓰기" id="btnWrite">
	</form>

</body>
</html>