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
   /*상세보기 메뉴바*/
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
   /*상품 card*/
   .row{
     padding: 0 40px;
   }
   .col{
     padding: 0%;
   }
   .card{
     border: none;
     position: relative;
   }
   
   .card-img-top{
     width: 260px;
     height: 230px;
   }
   .card-body{
     width: 260px;
     height: 80px;
     background-color: skyblue;
     padding: 0%;
   }
  .card-title{
     background-color: pink;
     height: 40px;
     font-weight: bold;
   }
   .wishBtn{
     position: absolute;
     width: 200px;
  	 left: 30px;
     top: 30%;
     text-align: center;
     opacity: 0;
     transition: opacity .35e ease;
   }

   .card:hover .wishBtn{
     opacity: 1;
   
   }
 
   /*메뉴 랭크*/
   .rank li{
     float: right;
     margin: 20px 20px 0px;
     list-style: none;
     text-align: right;
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
	 <ul class="rank">
	    <li><a>판매인기순</a></li>
	    <li><a>높은가격순</a></li>
	    <li><a>낮은가격순</a></li>
	  </ul>
     <br><br><br><br>
   
   <div class="container-fluid">
    <div class="row">
     <c:forEach items="${list}" var="p">
        <div class="col">
          <div class="card">
            <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/${p.changeName}">
            <div class="card-body">
              <P class="card-title">${p.snackName }</P>
              <p class="card-text">${p.purchasePrice}원</p>
            </div>
             <span class="wishButton">
              <button class="wishBtn" value="${p.snackNo}" onclick="wishAdd(this.value)">위시</button>
            </span>
          </div>
        </div>
        </c:forEach>
    </div>
  </div>
</body>
<script type="text/javascript">
 	function wishAdd(val){
 		var wishSnackNo = val;
 		alert(wishSnackNo)
 		//간식번호를 보내서 wishlist에 저장하기
 		$.ajax({
 			url : "insert.wish",
 			data : {
 				wishSnackNo : wishSnackNo
 			},
 			type : "post",
 			success : alert('ajax성공')
 		})
 	} 	
 	
 	
</script>
</html>