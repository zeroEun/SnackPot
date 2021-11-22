<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>communityDetail</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
					<button class="back" onclick="javascript:history.go(-1);">취소</button>
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
	<!-- 댓글!! -->
	<button class="far fa-comment-dots" onclick="selectReplyList()">댓글(<span id="rcount">0</span>)</button>
 		<table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
	                        <th colspan="4" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="1" style="resize:none; width:100%"></textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply" onclick="addReply()">등록하기</button></th>
                    </tr>
                </thead>
                <tbody>  
                	
                            
                </tbody>
         </table>

	</div>
	</div>
</div>
	<br><br><br><br>

</body>
<script>
	/*수정폼으로*/
	function update(val) {
		const cno = val;
		//alert(cno)
		location.href = "updateForm.cm?cno=" + cno;
	}
	/*게시글 삭제하기*/
	function deleteCmnt(val) {
		const cno = val;
		if(comfirm("정말 삭제하시겠습니가?")){
			location.href = "delete.cm?cno=" + cno;
		}else{
			return;
		}
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
	
	//댓글
	function selectReplyList(){
		var cno = ${dlist.communityNo};
		$.ajax({
			url:"reList.cm",
			data:{cno:cno},
			type:"get",
			success:function(list){
				console.log(list)
				$("#rcount").text(list.length);
				
				var value="";
				$.each(list, function(index, obj){
					
					if("${loginUser.memId}" == obj.reWriter && obj.reGroups == 0){
						value += "<tr>";
					    value += "<th>" + '익명' + "</th>" + 
								 "<td>" + obj.reContent + "</td>" + 
								 "<td>" + obj.reDate + "</td>" + 
								 "<td><input type='button' value='수정' class='updateReply' data_num="+obj.reNo+" data_text="+obj.reContent+" data_index="+index+">"+
								 "<input type='button' value='삭제' class='deleteReply' data_num="+obj.reNo+">"+
								 "<input type='button' value='답글' class='reReplyAdd' data_num="+obj.reNo+"+>"+"</td>"+
								 //"<td><div id='updateCommentFormDiv' ></div></td>"+
								 "<td><div id='updateCommentFormDiv "+index+"' ></div></td>"+
						 	  	 "</tr>";
				 		 //value += "<tr>";
					     //value += "<td><div class='updateCommentFormDiv "+index+"'></div></td>"+
				 	  	 //		  "</tr>";
				
					}else if(obj.reGroups == 1){
						value += "<tr  style='background-color: pink;'>";
					    value += "<th>" + '익명' + "</th>" + 
								 "<td>"+'->' + obj.reContent + "</td>" + 
								 "<td>" + obj.reDate + "</td>" + 
								 " <button class='write_recomeent_btn' value="+ obj.reNo+" onclick='deleteReply(this);'>삭제하기</button>"+"</td>" +
						 	  	 "</tr>";
					}
					
				});
				$("#replyArea tbody").html(value);
				//비동기식 방법에서는 ajax에서 한번에 해결해야한다
				//댓글 삭제
				 $('.deleteReply').on('click', function(){
					 var reNo = $(this).attr('data_num'); 
					 console.log(reNo)
					 
					   $.ajax({
		                    
		                    url : "deleteReply.cm",
		                    type : "POST",
		                        
		                    data :{
		                    	reNo : reNo
		                    },
		                    success : function(){
		                        alert("삭제되었습니다.");
		                        selectReplyList();
		                    },
		                    error : function(error){
		                        console.log(error);
		                    }
		                    
		                });
		            
		            });//댓글삭제 function끝

		            
				// 댓글 수정
				//$(".updateReply").on('click', function(){
					$(document).on('click', '.updateReply', function(){
				
					 var num = $(this).attr('data_num');
		             var text = $(this).attr('data_text');
		             var index = $(this).attr('data_index');
					 console.log("수정할 번호 : " + num); // 잘 가져옴
					 console.log("수정할 내용 : " + text);
					 console.log("수정할 댓글 인덱스 : " + index);
			
						value = '<input type="hidden" id ="num"  value="'+num+'">';
		                value += '<input type="text" id ="text2"  value="'+text+'" >';
		                value += '<input type="button" value="수정완료" id="updateComment" > ';
		
					  		   
		            	 $('#updateCommentFormDiv'+index).html(value);
		             		console.log("value값 : " + value)
		            	  

				})//댓글수정 function끝


			},error:function(){
				console.log("댓글 리스트 가져오기 실패");
			}
		});
	}
     
	//댓글달기
	function addReply(){
		var  cno = ${dlist.communityNo};

			if($("#replyContent").val().trim().length != 0){
				
				$.ajax({
					url:"reinsert.cm",
					type:"post",
					data:{
						  reContent:$("#replyContent").val(),
						  cno: cno,
						  reWriter:"${loginUser.memId}"
						  },
					success:function(result){
						if(result > 0){
							$("#replyContent").val("");
							selectReplyList();
							
						}else{
							alert("댓글등록실패");
						}
					},error:function(){
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
				
			}else{
				alert("댓글을 입력해주세요");
			}
		}
	
	
</script>

</html>

    	