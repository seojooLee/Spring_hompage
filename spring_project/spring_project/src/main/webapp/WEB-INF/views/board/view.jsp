<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function() {
	$("#btnList").click(function(){
		location.href="${path}/project/board/list?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
		alert(location.href);
	});


//수정하기
$("#btnUpdate").click(function(){
/*	var title=$("#title").val();
	var contente=$("#content").val();
	var writer=$("#writer").val();
	if(title==""){
		alert("제목입력하세요");
		document.form1.title.focus();
		return;
	} */
	document.form1.action="${path}/project/board/update";
	document.form1.submit(); 
});

//삭제하기
$("#btnDelete").click(function(){
	if(confirm("삭제하시겠습니까?")){
	//document.form1.action="${path}/project/board/delete?bno=${dto.bno}";
	document.form1.action="${path}/project/board/delete";

	document.form1.submit();
	alert("성공");
	} else {
	 alert("실패");
	}
});


//함수 호출 둘중에 하나만 listReply(), listReply2()
listReply2();//listReply2() 변경 

$("#btnReply").click(function(){
	var replytext = $("#replytext").val();
	var bno = "${dto.bno}";
	var param = "replytext="+replytext+"&bno="+bno;
	console.log(param);
	
	$.ajax({
		type : "post",
		url : "${path}/project/reply/insert",
		data : param, 
		success : function(){
			alert("댓글 등록되었음");
			listReply2();//listReply2() 중에 하나  	
			},
		error : function() {
			alert("실패");
		}
		
	});
	 
	
});
  
 
function listReply() {
	
	$.ajax({
		type:"get",
		url : "${path}/project/reply/list?bno=${dto.bno}",
		success : function (result){
			$("#listReply").html(result);
		}
	}); 
}
//RestController: 이용할 경우 호출하는 함수 ==> 결과파일을 Json으로 작성
  function listReply2() {
	$.ajax({
		type: "get",
		url : "${path}/project/reply/listjson?bno=${dto.bno}",
				success:function(result){
					console.log(result);
					var output = "<table>";
					for(var i in result){
						output += "<tr>";
						output += "<td>" + result[i].replyer;
						output +="(" + changeDate(result[i].regdate)+")<br>";
						output += result[i].replytext + "</td>";
						output += "</tr>"
					}
					output += "</table>";
					$("#listReply").html(output);
				}
	}); 
} 
//날짜 형식 표현 함수
function changeDate(date){
	var date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth()+1;
	day = date.getDate();
	hour = date.getHours();
	minute = date.getMinutes();
	second = date.getSeconds();
	var strDate = year+"-"+month+"-"+day+" "+hour + ":" + minute + ":" + second;
	return strDate;
	
}

});

</script>
</head>
<body>
<%@include file="../include/header.jsp"%>
	<h2>게시글 상세 보기</h2>
	<hr>
	<form name="form1" method="post">
		게시글번호 : ${dto.bno} 작성날짜 :
		<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss" />
		조회수 : ${dto.viewcnt} <br> 제목 : <input type="text" name="title"
			id="title" size="80" value="${dto.title}"> <br> 내용 :
		<textarea name="content" id="content" rows="5" cols="100">${dto.content}</textarea>
		<br> 작성자: <input type="text" name="writer" id="writer"
			value="${dto.writer}"> <br>

		<c:if test="${sessionScope.userId==dto.writer}">
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete">
		</c:if>

		<input type="hidden" value="${dto.bno}" name="bno"> <input
			type="button" value="목록보기" id="btnList">

	</form>
	<!-- 댓글 작성 공간 -->
	<div>
		<c:if test="${sessionScope.userId != null}">
			<textarea name="replytext" id="replytext" rows="5" cols="80"
				placeholder="댓글작성해주세요">
 
</textarea>
			<br>
			<input type="button" value="댓글작성" id="btnReply">
		</c:if>

	</div>

	<!-- 댓글 출력 -->
	<div id="listReply">
	
	</div>
  

</body>
</html>