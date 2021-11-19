<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>communityDetail</title>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
   
    <!-- smarteditor 
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath}/resources/static/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
</head>
<style>
    #smarteditor{
         border : 1px solid;
         height:450px;
         width: 1250px; 
         margin: 0 auto;
    }
     .title{
        width:900px;
        height : 30px;
        margin : 20px 90px 10px 0px;
    }
    ::placeholder{
        padding-left: 20px;
        padding-top: 40px;
    }
    .btn{
        margin-left: 80px;
        text-align: center;
    }
    h4{
        text-align: left;
        margin-left: 150px;
    }
    hr{
        width: 1250px;
        margin-bottom: -20px;
        height: 0.1px;
        background-color: black;
    }
    .btn{
        float: left;
        margin-left: 150px;
    }
    .topLine{
        margin-bottom: -12px;
        text-align: right;
        margin-right: 145px;
    }
    /*조회수*/
    .views{
        margin-top: 15px;
        margin-bottom: -20px;
        text-align: right;
        margin-right: 180px;

    }
     /*추천,비추천 버튼*/
    .recommendBtn{

        text-align: center;
        margin-top: 60px;
    }
    .reBtn{
        margin-right: 30px;
        border-radius: 50%;
        border-style: none;
        font-size: 20px;
        color: red;
    }
    .nreBtn{
        border-radius: 50%;
        border-style: none;
        font-size: 20px;
    }
     /*첨부파일*/
    .attachmentfile{
       margin-left: 10px;
       width: 200px;

    }
     /*댓글*/
    .replyIcon{
        margin-left: 130px;
        background-color: lightgreen;
    }
    .fa-comment-dots{
        font-size: 20px;
        padding-right: 5px;
      
    }
    
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<br>

	<form action="insert.cm" method="post" id="frm" style="text-align: center;" enctype="multipart/form-data">
	
		<div class="views" >
			<label>조회</label>&nbsp;&nbsp;<label>${dlist.views}</label>
		</div>
		<hr>
		<div>
			<input type="text" class="title" name="title" value="${dlist.title}">
			 	<c:if test="${ !empty dlist.originName }">
                    <label class="attachmentfile">
                     <lable>[파일]</lable>
                     <a href="${ pageContext.servletContext.contextPath }/resources/upload_files/cmntAttachment/${dlist.changeName}" download="${ dlist.originName }" class="attachmentfile">${ dlist.originName }</a>
                  </label> 
                 </c:if>
		<!-- <input type="file" name="uploadFile" class="attachmentfile"> -->	
		</div>
		<div class="tarea">
			<div name="seContent" id="smarteditor">${dlist.content}</div>
		</div>
		</form>
		<div>
			<c:if test="${ loginUser.memId eq dlist.writer }">
				<div class="btn"><!-- form에다 넣으면 안된다 inser.cm탐 -->
					<button class="update" value="${dlist.communityNo }" onclick="update(this.value)">수정</button>
					<button class="deleteCmnt" value="${dlist.communityNo }" onclick="deleteCmnt(this.value)">삭제</button>
				</div>
			</c:if>
				<div class="topLine">
					<button class="back" onclick="back()">취소</button>
				</div>
		</div>
	
	<br>
	<!--추천 비추천 버튼-->
	<div class="recommendBtn">
		<label>${dlist.recommend}</label>
		<button class="reBtn" onclick="recommend(this.value)" value="${dlist.communityNo}">
			<i class="far fa-thumbs-up"></i>
		</button>
		<button class="nreBtn" onclick="n_recommend(this.value)" value="${dlist.communityNo}">
			<i class="far fa-thumbs-down"></i>
		</button>
		<label>${dlist.n_recommend}</label>
	</div>
	<br>
	<br>
	<!--댓글 창 -->
	<div class="container">
		<i class="far fa-comment-dots" data-toggle="collapse" data-target="#demo" onclick="getReplyList(${dlist.communityNo})"></i>
		<label data-toggle="collapse" data-target="#demo" onclick="getReplyList(${dlist.communityNo})">댓글</label>
		
		<!-- replyBox안에 댓글리스트가 보여짐 -->
		<div id="demo" class="collapse">
		<div class="replyBox" id="replyBoxDiv" style="background-color: pink;">
		
		</div>
		<!-- 댓글 작성 부분 -->
		<div class="replyWrite">
			<table>
				<tr>
					<td class="write_td"><input type="text" class="write_content" id="write_content" placeholder="댓글을 작성해주세요."></td>
					<td class="write_btn_td"><button class="reply_write_btn" onclick="insertReply();">등록</button></td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<br><br><br><br>

</body>
<script>
	//댓글리스트 가져오기
	function getReplyList(val){
		var cno = val;
		
		$.ajax({
			url : "reList.cm",
			type : "get",
			data : { cno : cno },
			success : function(list){
				console.log(list)
				
				var reply = "";
				for(i=0 ; list.length ; i++){
					
					if(list[i].reGroups == 0){
						var reply = "<li class='replyItem'>"
						+"<div class='reply_area showDiv'>"
						+"<div class='reply_comment_box'>"+list[i].reContent+"</div>"
						console.log(reply)
				}
					$('#replyBoxDiv').html(reply)	
			}
				
		}
		});
		
	}

















	/*수정폼으로*/
	function update(val) {
		const cno = val;
		//alert(cno)
		location.href = "updateForm.cm?cno=" + cno;
	}
	/*게시글 삭제하기*/
	function deleteCmnt(val){
		const cno = val;
		location.href = "delete.cm?cno=" + cno;
	}
	
	/*게시글 조회수 , 추천수*/
	function recommend(val) {
		const cno = val;
		console.log(cno)

		$.ajax({
			url : "plusCount.recommend",
			data : {
				cno : cno
			},
			type : "post",
			success : location.reload()
		})

	}

	function n_recommend(val) {
		const cno = val;

		$.ajax({
			url : "plusCount.n_recommend",
			data : {
				cno : cno
			},
			type : "post",
			success : location.reload()
		})
	}
</script>

</html>

    	