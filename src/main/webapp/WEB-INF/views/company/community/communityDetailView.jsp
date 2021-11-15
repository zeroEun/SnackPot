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
    <!-- smarteditor 
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath}/resources/static/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
</head>
<style>
    .title{
        width:1250px;
        height : 30px;
        margin : 20px 0px 10px 0px;
    }
    #smarteditor{
         border : 1px solid;
         height:450px;
         width: 1250px; 
         margin: 0 auto;
    }
    .title{
        width:1250px;
        height : 30px;
        margin : 20px 0px 10px 0px;
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
        margin-bottom: -10px;
        height: 0.1px;
        background-color: black;
    }
    .btn{
        float: left;
        margin-left: 150px;
    }
 
 </style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<br>

  <form action="insert.cm" method="post" id="frm" style="text-align:center;" enctype="multipart/form-data"  >
		<button class="update" onclick="back()">취소</button>
		<hr>
		<input type="text" class="title" name="title" value="${dlist.title}" >
		<div class="tarea">
			<div name="seContent" id="smarteditor">${dlist.content}</div>
		</div>
		<div>
			<input type="file" name="uploadFile">
		</div>
	</form>
		<c:if test="${ loginUser.memId eq dlist.writer }">
			<div class="btn">
				<button class="update" value="${dlist.communityNo }" onclick="update(this.value)">수정</button>
			</div>
		</c:if>
	
</body>	
<script>
 	function update(val){
 		const cno = val;
 		//alert(cno)
 		location.href="updateForm.cm?cno=" + cno;
 	}

</script>

</html>

    	