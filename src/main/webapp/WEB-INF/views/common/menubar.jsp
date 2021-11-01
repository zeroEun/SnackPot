<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<style>
    .dropdown:hover .dropdown-menu { 
        display: block;
        margin-top: 0;
    }
    #header{ 
        line-height:10px; 
    }
    .navbar{
        background-color: rgb(10, 23, 78);
        
    }
    .navbar-nav{
        margin-left: 50px;
    }
    .navbar-nav>h1{
        color:rgb(245, 208, 66)
    }
    .nav-link{
        color: rgb(245, 208, 66);
        margin-right: 0px;
        margin-left: 50px;
        font-size: 18px;
        font-weight: bold;
    }
    .dropdown-menu{
        background-color:rgba(10, 23, 78, 0.68);
    }
    .dropdown-item{
        color: rgb(245, 208, 66);
        font-weight: bold;
    }
     .login,.managerLogin{
        color: rgb(245, 208, 66);
    }

    </style>
<body class="container-fluid">
    <header>  
        <nav class="navbar navbar-expand-xl">
            <ul class="navbar-nav mr-auto">
                <h1>SnackPot</h1>
                <li class="nav-item dropdown"> 
                    <!--스낵팟-->
                    <a class="nav-link" data-toggle="dropdown" href="#" role="button" >스낵팟</a>
                    <div class="dropdown-menu"> 
                        <!--구독회사 직원-->
                        <a class="dropdown-item" href="subsForm.sn">간식 구독하기</a>
                        <a class="dropdown-item" href="list.pro">간식 고르기</a> 
                        <a class="dropdown-item" href="#">간식 조회</a> 
                        <!--구독회사 담당자-->
                        <a class="dropdown-item" href="#">구독 정보</a>
                        <a class="dropdown-item" href="#">리스트 조회</a>
                        <a class="dropdown-item" href="#">주문내역</a>
                    </div>
                    
                </li>
                <li class="nav-item dropdown"> 
                    <!--생일팟-->
                    <a class="nav-link" data-toggle="dropdown" href="#" role="button"><label>생일팟</label></a>
                    <div class="dropdown-menu"> 
                        <!--구독회사 직원-->
                         <a class="dropdown-item" href="#">선물 구독하기</a> 
                        <a class="dropdown-item" href="#">선물 리스트 조회</a> 
                        <!--구독회사 담당자-->
                        <a class="dropdown-item" href="#">구독 정보</a> 
                        <a class="dropdown-item" href="#">발송 진행 현황</a>
                        <a class="dropdown-item" href="#">발송 및 공지</a>
                        <a class="dropdown-item" href="#">주문내역</a>
                    </div>
                </li>
                <!--소통,랭킹,문의-->
                 <li class="nav-item"><a class="nav-link" href="#">소통팟</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">랭킹팟</a></li>
                 <li class="nav-item"><a class="nav-link" href="#">문의</a></li>
            </ul>
            <!--로그인-->
            <div id="header">
                <div id="header_1">
                    <div id="header_1_left">
                    </div>
                    <div id="header_1_right">
                        <!-- 로그인 전 -->
                        <c:if test="${ empty sessionScope.loginUser }">
                            <a class="login" href="login.co">로그인</a>
                            <a class="managerLogin" href="#">관리자 로그인</a> 
                        </c:if>
                        
                        <!-- 로그인 후 (직원일때 , 본사직원일때) -->
                        <c:if test="${ !empty sessionScope.loginUser }">
                            <li class="nav-item dropdown" style="list-style: none;"> 
                                <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    <label>구독회사 직원  님</label></a>
                                <div class="dropdown-menu"> 
                                    <a class="dropdown-item" href="#">회원정보 수정</a> 
                                    <a class="dropdown-item" href="#">회원관리</a>
                                </div>
                            </li>      
                       </c:if>  
                      <!--<c:if test="${ !empty sessionScope.loginUser }">
                            <li class="nav-item dropdown" style="list-style: none;"> 
                                <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    <label> 본사 직원  님</label></a>
                                <div class="dropdown-menu"> 
                                    <a class="dropdown-item" href="#">회원정보 수정</a> 
                                    <a class="dropdown-item" href="#">회원관리</a>
                                </div>
                            </li>      
                        </c:if>   	 --> 
                    </div>
                </div>
        </nav>
    </header>

    <br clear="both">

</body>
</html>