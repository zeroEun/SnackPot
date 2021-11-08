<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>SnackPot</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  <!--스타일 cdn?-->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!--jQuery연결하는 CDN-->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="resources/css/productView.css">
    </head>

<body>
 <jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- 메뉴바 아래  큰 드롭 카테고리-->
 <nav class="navbar navbar-expand-xl bg-light wi " >
  <ul class="navbar-nav mr-auto justify-content-center ">
      <li class="nav-item dropdown"> 
      <label><a class="nav-link wish-nav-link" data-toggle="dropdown" href="#" role="button" >스낵류</a></label>
    <label class="ctg">
        <div class="dropdown-menu wish-menu"> 
          <a class="dropdown-item" href="list.pro?dtc=1">스낵</a> 
          <a class="dropdown-item" href="list.pro?dtc=2">파이/비스켓</a> 
          <a class="dropdown-item" href="list.pro?dtc=3">젤리</a>
          <a class="dropdown-item" href="list.pro?dtc=4">사탕</a>
          <a class="dropdown-item" href="list.pro?dtc=5">초콜릿</a>
          <a class="dropdown-item" href="list.pro?dtc=6">껌</a>
          <a class="dropdown-item" href="list.pro?dtc=7">시리얼바</a>
      </div>
  </label>  
    </li>
    <li class="nav-item dropdown"> <!-- 큰카테고리 : 2 -->
     <label><a class="nav-link wish-nav-link" data-toggle="dropdown" href="#" role="button" >음료</a></label>
  <label class="ctg">
      <div class="dropdown-menu wish-menu "> 
          <a class="dropdown-item" href="list.drink?dtc=8">탄산음료</a> 
          <a class="dropdown-item" href="list.drink?dtc=9">이온음료</a> 
          <a class="dropdown-item" href="list.drink?dtc=10">과일음료수</a>
          <a class="dropdown-item" href="list.drink?dtc=11">에너지음료</a>
          <a class="dropdown-item" href="list.drink?dtc=12">유산균</a>
          <a class="dropdown-item" href="list.drink?dtc=13">커피</a>
      </div>
  </label>
    </li>
    <li class="nav-item dropdown">  <!-- 큰카테고리 : 3 -->
      <label><a class="nav-link wish-nav-link" data-toggle="dropdown" href="#" role="button" >간편식</a></label>
  <label class="ctg">
      <div class="dropdown-menu wish-menu"> 
          <a class="dropdown-item" href="list.food?dtc=14">컵라면</a> 
          <a class="dropdown-item" href="list.food?dtc=15">핫도그/소시지</a> 
          <a class="dropdown-item" href="list.food?dtc=16">계란</a>
          <a class="dropdown-item" href="list.food?dtc=17">시리얼</a>
          <a class="dropdown-item" href="list.food?dtc=18">컵밥</a>
      </div>
  </label>
    </li>
  </ul>
</nav>
<br>
<br>
 <!-- 세부 카테고리 버튼 -->
    <!-- 스낵 -->
    <c:if test="${ctdNo eq '1'}">
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
    </c:if>
    
      <!-- 음료 -->
      <c:if test="${ctdNo eq '2'}">
      <div class="detail-menu">
        <div class="btn-group">
          <button type="button" class="btn btn-outline">탄산음료</button>
          <button type="button" class="btn btn-outline">이온음료</button>
          <button type="button" class="btn btn-outline">과일음료</button>
          <button type="button" class="btn btn-outline">에너지음료</button>
          <button type="button" class="btn btn-outline">유산균음료</button>
          <button type="button" class="btn btn-outline">커피</button>
        </div>
      </div>
      </c:if>
      
      <!-- 간편식 -->
      <c:if test="${ctdNo eq '3'}">
      <div class="detail-menu">
        <div class="btn-group">
          <button type="button" class="btn btn-outline">컵라면</button>
          <button type="button" class="btn btn-outline">핫도그/소시지</button>
          <button type="button" class="btn btn-outline">계란</button>
          <button type="button" class="btn btn-outline">시리얼</button>
          <button type="button" class="btn btn-outline">컵밥</button>
        </div>
      </div>
      </c:if>
   
      <!-- 랭킹순위 -->
     <ul class="rank">
        <li><a>판매인기순</a></li>
        <li><a>높은가격순</a></li>
        <li><a>낮은가격순</a></li>
      </ul>

  <br><br>
 <!-- 상품정렬 -->
 <div class="container-fluid">
  <div class="row row-cols-xl-5">
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
  