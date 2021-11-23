<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
#contentArea {
	width: 100%
}

#contentArea * {
	margin: 5px
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>게시글 상세보기</h2>
			<br> <br>
			<br>
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${q.QTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ q.writer }</td>
					<th>작성일</th>
					<td>${ q.createDate }</td>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
				<c:if test="${ !empty q.changeName }">
				
				<tr>
				<td>
				
					<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/qnaAttachment/${q.changeName}" width="500px">
				</td>
				
				</tr>
							</c:if>
							<c:if test="${ empty q.changeName }">
									
							</c:if>
				<tr>
					<td colspan="4"><p style="height: 150px">
							
					
							<br>
							${ q.QContent }
						</p></td>
				</tr>
			</table>
			<br>

			<c:if test="${ loginUser.memId eq q.writer }">
				<div align="center">
					<button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
					<button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
				</div>

				<form id="postForm" action="" method="post">
					<input type="hidden" name="qno" value="${ q.QNo }"> 
					<input type="hidden" name="fileName" value="${ q.changeName }">
				</form>
				<script>
					function postFormSubmit(num) {
						var postForm = $("#postForm");
						if (num == 1) {
							postForm.attr("action", "updateForm.qna");
						} else {
							postForm.attr("action", "delete.qna");
						}
						postForm.submit();
					}
				</script>
			</c:if>
			
			<c:if test="${!empty loginEmp} ">
			
				<div align="center">
					<button class="btn btn-primary" onclick="answerFormSubmit();">수정하기</button>
				</div>

				<form id="answerForm" action="" method="post">
					<input type="hidden" name="qno" value="${ q.QNo }"> 
				</form>
				<script>
					function answerFormSubmit(num) {
						var answerForm = $("#answerForm");
						answerForm.attr("action", "answerForm.qna");
					
						answerForm.submit();
					}
				</script>
			
			</c:if>
			<br>
			<br>

			<table id="replyArea" class="table" align="center">
				<thead>
					<tr>
						<c:if test="${ !empty loginUser }">
							<th colspan="2" style="width: 75%"><textarea
									class="form-control" id="replyContent" rows="2"
									style="resize: none; width: 100%"></textarea></th>
							<th style="vertical-align: middle"><button
									class="btn btn-secondary" id="addReply">등록하기</button></th>
						</c:if>
						<c:if test="${ empty loginUser }">
							<th colspan="2" style="width: 75%"><textarea
									class="form-control" readonly rows="2"
									style="resize: none; width: 100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
							</th>
							<th style="vertical-align: middle"><button
									class="btn btn-secondary" disabled>등록하기</button></th>
						</c:if>
					</tr>
					<tr>
						<td colspan="3">댓글 (<span id="rcount">0</span>)
						</td>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<br>
		<br>
	</div>
	<script>
		$(function() {
			selectReplyList();

			$("#addReply").click(function() {
				var bno = $
				{
					b.boardNo
				}
				;

				if ($("#replyContent").val().trim().length != 0) {

					$.ajax({
						url : "rinsert.bo",
						type : "post",
						data : {
							replyContent : $("#replyContent").val(),
							refBoardNo : bno,
							replyWriter : "${loginUser.memId}"
						},
						success : function(result) {
							if (result > 0) {
								$("#replyContent").val("");
								selectReplyList();

							} else {
								alert("댓글등록실패");
							}
						},
						error : function() {
							console.log("댓글 작성 ajax 통신 실패");
						}
					});

				} else {
					alert("댓글등록하셈");
				}

			});
		});

		function selectReplyList() {
			var bno = $
			{
				b.boardNo
			}
			;
			$.ajax({
				url : "rlist.bo",
				data : {
					bno : bno
				},
				type : "get",
				success : function(list) {
					$("#rcount").text(list.length);

					var value = "";
					$.each(list, function(i, obj) {

						if ("${loginUser.memId}" == obj.replyWriter) {
							value += "<tr style='background:#EAFAF1'>";
						} else {
							value += "<tr>";
						}

						value += "<th>" + obj.replyWriter + "</th>" + "<td>"
								+ obj.replyContent + "</td>" + "<td>"
								+ obj.createDate + "</td>" + "</tr>";
					});
					$("#replyArea tbody").html(value);
				},
				error : function() {
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>