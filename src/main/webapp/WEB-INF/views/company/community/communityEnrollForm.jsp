<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>커뮤니티 게시글 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- smarteditor  
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath}/resources/static/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script> 
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath}/resources/static/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
</head>
<style>
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

 <form action="insert.cm" method="post" id="frm" style="text-align:center;" enctype="multipart/form-data" >
        <h4>(회사이름)글쓰기</h4>
        <hr>
        <input type="text" class="title" name="title"  placeholder="제목을 입력해주세요." >
     <div class="tarea">
      <textarea name="seContent" id="smarteditor" rows="100" cols="100" style="width:1250px; height:450px;" placeholder="내용을 입력해주세요."></textarea>
    </div>
      <div>
      <input type="file" name="uploadFile">
      </div>
       <div class="btn">
           <input type="button" onclick="save()" value="등록">&nbsp;&nbsp;
           <input type="button" onclick="back()" value="취소">
      </div>
    </form>
   
 
</body>
<!--  -->
 <script type="text/javascript">
 		//전역변수선언 , 
	    var oEditors = [];
	     
 		//스마트 에디터 프레임 생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "smarteditor",
	      	sSkinURI: "${ pageContext.servletContext.contextPath }/resources/static/smarteditor/SmartEditor2Skin.html",
	      	 // sSkinURI: "${ pageContext.servletContext.contextPath }/resources/static/smarteditor2/SmartEditor2Skin.html", 
	        htParams : {
	            bUseToolbar : true,             // 툴바 사용 여부 (true:사용/ false:사용하지 않음)        
	            bUseVerticalResizer : true,    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : false         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	        }
	    });
 		
	    function save(){
	    
	    	oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD" ,[]);	
	    	
	    //	var content = $('#smarteditor').val().replace(/<p><br><\/p>/gi , "<br>"); // <p><\p> -> <br>
	    	
	    	frm.submit(); 
	    	return;
	    }
	    
 </script>  
 	
</html>

    	