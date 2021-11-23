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
     <div class="reReplyModal">
     
     </div>
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
								 "<input type='button' value='답글' class='reReplyAdd' data_num="+obj.reNo+" data_index="+index+" data_text="+obj.reContent+" data_reGroup="+obj.reGroup+" data_reGroupDept="+obj.reGroupDept+" data-toggle='modal' data-target='#myModal"+index+"'></td>"+
						 	  	 "</tr>";
						 	  	 
								 value += "<tr>";
								 value += "<td colspan='4'><div id='updateCommentFormDiv"+index+"'></div></td>";
								 console.log(value)
					}else if(obj.reGroups == 1){
						value += "<tr  style='background-color: pink;'>";
					    value += "<th>" + '익명' + "</th>" + 
								 "<td>"+'->' + obj.reContent + "</td>" + 
								 "<td>" + obj.reDate + "</td>"+ 
								 "<td><input type='button' value='삭제' class='deleteReReplyBtn' data_num="+obj.reNo+"></td>" + 
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
		                    type : "post",
		                        
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
					$(document).on('click', '.updateReply', function(){
				
					 var reNo = $(this).attr('data_num');
		             var reContent = $(this).attr('data_text');
		             var index = $(this).attr('data_index');
					 console.log("수정할 번호 : " + reNo); 
					 console.log("수정할 내용 : " + reContent);
					 console.log("수정할 댓글 인덱스 : " + index);
			
						value = '<input type="hidden" id ="reNo"  value="'+reNo+'">';
		                value += '<input type="text" id ="reContent2"  value="'+reContent+'" style="width: 850px;">';
		                value += '<input type="button" value="수정완료" id="updateComment" > ';
		
		                 		   
		            	 $('#updateCommentFormDiv'+index).html(value);
		             	console.log("value값 : " + '#updateCommentFormDiv'+index)
		             		
		            $('#updateComment').on('click', function(){
		            		var reNo = $('#reNo').val();
		            		var reContent = $('#reContent2').val();
		            		
		            	console.log("reNo ==>" + reNo);
		            	console.log("reContent ==>" + reContent);
		            	
		            	$.ajax({
		            		
		            		url : "reupdate.cm",
		            		data :{ 
		            			reNo : reNo,
		            			reContent : reContent
		            		},
		            		type : "get",
		            		success : function(){
		            			alert("수정이 완료되었습니다.")
		            			selectReplyList();
	
		            		}
		            		
		            	})
		            
		            })
	 
				});//댓글수정 function끝
				
				//답글 달기
				$(document).on('click', '.reReplyAdd', function(){
					
					 var index = $(this).attr('data_index');
					 var reNo = $(this).attr('data_num');
					 var reContent = $(this).attr('data_text');
					 var reGroup = $(this).attr('data_reGroup');
					 console.log("답글달 댓글 번호 : " + reNo);
					 console.log("답글달 댓글 인덱스 : " + index);
					 console.log("답글달 댓글 reGroup : " + reGroup);
					
					 
					    <!-- 답글 모달 -->
						value  =  "<div class='modal fade' id='myModal"+index+"'>"
						value +=  "<div class='modal-dialog'>" +
					         	 "<div class='modal-content'>";
					          
					   
					    value += "<div class='modal-header'>"+
					    		 '<input type="hidden" id ="reNo"  value="'+reNo+'">'+
					    		 '<input type="hidden" id ="reGroup"  value="'+reGroup+'">'+
					             '<label>댓글 </label><input type="text" id ="reContent2"  value="'+reContent+'" style="width: 400px;">'+
					              "<button type='button' class='close' data-dismiss='modal'>×</button>"+
					             "</div>";
					            
					            
					   value += "<div class='modal-body'>"+
					              "<label>답글 </label><br><input type='text' id='reReContent2'>"+
					            "</div>";
					            
					           
					  value += "<div class='modal-footer'>"+
					              "<button type='button' data-dismiss='modal' id='reReplyBtn'>작성</button>"+
					            "</div>"+
					         "</div></div></div>";
				      
				          	$('.reReplyModal').html(value);
				        	$("#myModal"+index).modal();
				        	//console.log(value);
				        
				      	$('#reReplyBtn').on('click', function(){
				      			var reRecontent = document.getElementById('reReContent2').value;
				      			var reGroup = $('#reGroup').val();
				      			var cmntNo = list[0].communityNo
				      			console.log('답글 내용 : '  +  reRecontent);
				      			console.log('답글달 reGroup : '  +  reGroup);
				      			console.log('답글달 cmntNo : '  +  cmntNo);
				      			
				      			$.ajax({
				      				
				      				url:"insertReReply.cm",
				      				data:{
				      					reRecontent : reRecontent,
				      					reGroup : reGroup,
				      					cmntNo : cmntNo
				      					
				      				},
				      				type : "get",
				      				success : function(){
				      					alert("답글작성 성공")
				            			selectReplyList();
				      				}
				      				
				      			});
				      			
				      	});//답글 작성하기 끝
				        	
				})//답글달기function 끝
				
							//답글 삭제
							$(document).on('click', '.deleteReReplyBtn', function(){
								 var reNo = $(this).attr('data_num');
									console.log("삭제할 답글번호 : "  + reNo);
								if(confirm("삭제하시겠습니까?")){
									
									$.ajax({
										url : "deleteReReply.cm",
										data :{
											reNo : reNo
										},
										type: "post",
										success:function(){
											alert("삭제되었습니다.")
											selectReplyList();
										}
									})
									
									
								}else{
									alert("삭제를 취소하였습니다.")
								}
									
								
							});//답글 삭제function끝
				
				
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
							//$("#replyContent").val("");
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

    	