<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사 사원 관리</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    th{
        text-align: center;
        background-color: lightgray
    }
    td{
        text-align: center;
    }
    #tdiv{
    	height: 500px;
        overflow-y: auto;
    }
    #outer{
        margin-top: 10px;
    }
    #search{
    	width: 25px;
    	border: none;
    	background: none;
    }
    #icon{
   		width: 25px;
    }
    #searchdiv{
    	margin-left: 880px;
    	margin-bottom: 30px;
    }
    #enrollBtn{
    	margin-left: 1010px;
    	padding: 10px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    	margin-top: 10px;
    }
    #title{
    	font-weight: bold;
    }
    .modifyBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    .deleteBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    #btnDiv{
    	margin-top: 20px;
    }
 
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

<div class="container" id="outer">
<h5 id="title">사원 계정 현황</h5><br>
<div id="searchdiv">
<input type="text" placeholder="검색어 입력"><button type="button" id="search"><img id="icon" src="${ pageContext.servletContext.contextPath }/resources/images/search.png"></button>
</div>
<div id="tdiv">
<table class="table table-hover" id="empList">
    <thead>
        <tr>
            <th>&emsp;No.</th>
            <th>&emsp;이름</th>
            <th>&emsp;사원번호</th>
            <th>&emsp;부서</th>
            <th>&emsp;직급</th>
            <th>&emsp;&ensp;휴대폰 번호</th>
            <th>&emsp;&emsp;&emsp;이메일</th>
            <th>&emsp;생일</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
    <%-- <c:forEach items="${list}" var="emp" varStatus="st">--%>
        <tr>
            <td>1</td>
            <td>유재석</td>
            <td>20100512</td>
            <td>인사팀</td>
            <td>부장</td>
            <td>01011112222</td>
            <td>wotjr@naver.com</td>
            <td>701020</td>
            <td><input type="button" class="modifyBtn" value="수정"></td>
            <td><input type="button" class="deleteBtn" value="삭제"></td>
        </tr>
     <%-- </c:forEach>--%>
    </tbody>
</table>
</div>
<div id="btnDiv">
<input type="button" id="enrollBtn" value="사원등록" onclick="location.href='enrollEmp.sn'">
</div>
</div>

<script>
//클릭한 행의 사원번호 가져오기
<%-- 
$(".modifyBtn").click(function(){ 
      var modifyBtn = $(this);
       
      var tr = modifyBtn.parent().parent();
      var td = tr.children();
       
      var sempNum = td.eq(1).text();
      
      $.ajax({
  		url: "modifyEmp.sn",
  		type:"post",
  		data:{sempNum : sempNum},
  		success:function(result){
  			if(result == "ok"){
  				location.href="<%=request.getContextPath()%>/modify.sn"
  			}
  		},
  		error:function(){
  			console.log("서버통신실패");
  		}
  	})
     
});

$(".deleteBtn").click(function(){  
    var modifyBtn = $(this);
     
    var tr = modifyBtn.parent().parent();
    var td = tr.children();
     
    var sempNum = td.eq(1).text();
    
    if(confirm('정말 삭제하시겠습니까?')){
    	$.ajax({
		url: "deleteEmp.sn",
		type:"post",
		data:{sempNum : sempNum},
		success:function(result){
			if(result > 0){
				alert("삭제되었습니다.")
				location.reload();
			}else{
				alert("삭제에 실패하였습니다.")
			}
		},
		error:function(){
			console.log("서버통신실패");
		}
	})
	  }else{
		 return; 
	  } 
});
--%>
</script>
</body>
</html>