<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SnackPot</title>
<!--Bootstrap4 를 시작할때 필요한 CDN들-->
    <!-- Latest compiled and minified CSS --> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  <!--스타일 cdn?-->
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!--jQuery연결하는 CDN-->
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   </head>
    <style>
    .dropdown:hover .dropdown-menu { 
        display: block;
        margin-top: 0;
    }
   .nav-link {
       color: black;
   }
   .navbar{
       justify-content: center;
   }
   .detail-menu{
       background-color: aquamarine;
       text-align: center;
   }
   .btn-outline{
     background-color: pink;
     padding : 5px 70px;
   }
   .btn-outline:hover{
     background-color: purple;
   }
   .card-outer{
     display: inline;
     width: 100%;
     height: 100%;
   }
   .card-outer .card{
     width: 260px;
     height: 260px;
     margin-left: 40px;
   }
   .snack_img{
     width: 260px;
     height: 230px;
     background-color: chocolate;
   }
   .snack_name{
     font-weight: bolder;
     background-color: goldenrod;
     width: 260px;
     height: 40px;
   }

    </style>
<body>
    <nav class="navbar navbar-expand-sm bg-light ">
        <ul class="navbar-nav mr-auto ">
            <li class="nav-item dropdown"> 
            <a class="nav-link" data-toggle="dropdown" href="#" role="button"  >스낵류</a>
            <div class="dropdown-menu"> 
                <a class="dropdown-item" href="#">스낵</a> 
                <a class="dropdown-item" href="#">파이/비스켓</a> 
                <a class="dropdown-item" href="#">젤리</a>
                <a class="dropdown-item" href="#">사탕</a>
                <a class="dropdown-item" href="#">초콜릿</a>
                <a class="dropdown-item" href="#">껌</a>
                <a class="dropdown-item" href="#">시리얼바</a>
            </div>
          </li>
          <li class="nav-item dropdown"> 
            <a class="nav-link" data-toggle="dropdown" href="#" role="button" >음료</a>
            <div class="dropdown-menu"> 
                <a class="dropdown-item" href="#">탄산음료</a> 
                <a class="dropdown-item" href="#">이온음료</a> 
                <a class="dropdown-item" href="#">과일음료수</a>
                <a class="dropdown-item" href="#">에너지음료</a>
                <a class="dropdown-item" href="#">커피</a>
                <a class="dropdown-item" href="#">유산균</a>
            </div>
          </li>
          <li class="nav-item dropdown"> 
            <a class="nav-link" data-toggle="dropdown" href="#" role="button" >간편식</a>
            <div class="dropdown-menu"> 
                <a class="dropdown-item" href="#">컵라면</a> 
                <a class="dropdown-item" href="#">핫도그/소세지</a> 
                <a class="dropdown-item" href="#">계란</a>
                <a class="dropdown-item" href="#">시리얼</a>
                <a class="dropdown-item" href="#">컵밥</a>
            </div>
          </li>
        </ul>
      </nav>
    <br>
    <br>
    <div class="detail-menu">
      <div class="btn-group">
        <button type="button" class="btn btn-outline">스낵</button>
        <button type="button" class="btn btn-outline">파이/비스켓</button>
        <button type="button" class="btn btn-outline">젤리</button>
        <button type="button" class="btn btn-outline">사탕</button>
        <button type="button" class="btn btn-outline">초콜릿</button>
        <button type="button" class="btn btn-outline">껌</button>
        <button type="button" class="btn btn-outline">시리얼바</button>
      </div>
    </div>

    <br><br>
    <c:forEach items="${list}" var="p">
  <div class="card-outer">
    <div class="card">
      <img src="${ pageContext.servletContext.contextPath }/resources/images/${p.changeName}"  width="200px" height="230px">
      <div class="snack_name">${p.snackName}</div>
      <div class="snack_price">${p.purchasePrice }원</div>
    </div>
  </div>
  </c:forEach>
</body>
</html>