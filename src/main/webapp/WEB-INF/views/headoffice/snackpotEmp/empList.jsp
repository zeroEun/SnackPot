<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사 사원 계정 현황</title>
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
        overflow-y: scroll;
    }
    #outer{
        margin-top: 70px;
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
    }
    #title{
    	font-weight: bold;
    }
    .empBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container" id="outer">
<h5 id="title">사원 계정 현황</h5><br>
<div id="searchdiv">
<input type="text" placeholder="검색어 입력"><button type="button" id="search"><img id="icon" src="${ pageContext.servletContext.contextPath }/resources/images/search.png"></button>
</div>
<div id="tdiv">
<table class="table table-hover">
    <thead>
        <tr>
            <th>No.</th>
            <th>사원번호</th>
            <th>이름</th>
            <th>부서</th>
            <th>직급</th>
            <th>이메일</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="emp" varStatus="st">
        <tr>
            <td>${st.index +1}</td>
            <td>${emp.sempNum}</td>
            <td>${emp.sempName}</td>
            <td>${emp.sempDept}</td>
            <td>${emp.sempJob}</td>
            <td>${emp.sempEmail}</td>
            <td><input type="button" class="empBtn" value="수정"></td>
            <td><input type="button" class="empBtn" value="삭제"></td>
        </tr>
     </c:forEach>
    </tbody>
</table>
</div>
<input type="button" id="enrollBtn" value="사원등록" onClick="location.href='enrollEmp.sn'">
</div>
</div>
</div>
</body>
</html>