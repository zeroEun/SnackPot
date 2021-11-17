<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>SnackPot</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       <!-- <link rel="stylesheet" href="resources/css/menubar.css"> --> 
</head>
<style>
/*마우스 오버*/
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
.navbar{
    background-color: rgb(10, 23, 78);

}
ul > h2 , .dropdown , .nav-link , .dropdown-item , .logOut{
    color: rgb(245, 208, 66);
}
ul>h2{
    margin-top: -5px;
}
.nav-menu , .name , .logOut{
    font-weight: bold;
    font-size: 17px;
}
/*메뉴들 사이 여백설정*/
.nav-link{
    margin-left: 50px;

    width: 100px;
}
/*드롭메뉴 hover*/
.dropdown-item:hover{
    background-color: rgb(245, 208, 66);
    color: black;
    font-weight: bold;
}
.navbar-nav{
    margin-left: 50px;
   
}
.dropdown-menu{
    background-color:rgba(10, 23, 78, 0.60);
    
}

/*로그인 후 div*/
.login-nav {
    list-style: none;
    width: 350px;
    margin-left: 300px;
    margin-top: -18px;
}
.name {
    margin-top: 11px;
    margin-right: 10px;

}
.logOut{
    margin-top: 14px;
    margin-left: 30px;
  
}

/*로그인 전 div*/
.loginDiv{
    margin-left: 280px;

}
.loginDiv>a{
    color: rgb(245, 208, 66);
    font-weight: bold;
    font-size: 15px;
}
.loginDiv>a>label{
    margin-top: 10px;
    margin-left: 30px;
}

</style>
<body>
<!--메뉴바("navbar navbar-expand-xl bg-light justify-content-center" : 가운데 정렬)-->
<header>
<nav class="navbar navbar-expand-xl ">
    <ul class="navbar-nav">
       <div  style="color:rgb(245, 208, 66); " onclick="location.href='${ pageContext.servletContext.contextPath }';"><h2>SnackPot</h2></div> 
        <!--스낵 팟-->
        <li class=" nav-link nav-item dropdown"> 
            <a class="dropdown nav-menu" data-toggle="dropdown">스낵팟</a>
            <div class="dropdown-menu"> 
                <a class="dropdown-item" href="subsForm.sn">간식 구독하기</a> 
                <c:if test="${ !empty sessionScope.loginUser}">
                <a class="dropdown-item" href="list.pro?dtc=1">간식 담기</a> 
                <a class="dropdown-item" href="wishList">간식 조회</a> 
                </c:if>
                <!--구독 회사 담당자-->
                <c:if test="${ !empty sessionScope.loginUser && loginUser.admin == 'Y' }">
                <a class="dropdown-item" href="subsInfo.sn">구독 정보</a> 
                <a class="dropdown-item" href="comSnackList.sn">리스트 조회</a>
                <a class="dropdown-item" href="#">주문내역</a>
                </c:if>
            </div>
        </li>
        <!--생일 팟-->
        <li class="nav-link nav-item dropdown">  
          <a class="dropdown nav-menu" data-toggle="dropdown">생일팟</a> 
            <div class="dropdown-menu"> 
                <a class="dropdown-item" href="subscribeForm.birth">선물 구독하기</a> 
                <c:if test="${ !empty sessionScope.loginUser && loginUser.admin == 'Y' }">
                <a class="dropdown-item" href="#">리스트 조회</a> 
                <a class="dropdown-item" href="subscribeInfo.birth">구독 정보</a> 
                <a class="dropdown-item" href="sendingcursts.birth">발송 및 진행</a>
                <a class="dropdown-item" href="#">주문내역</a>
                </c:if>
            </div>
        </li>
           <!--소통 , 랭킹 ,문의-->
           <li class="nav-item "><a class="nav-link nav-menu" href="list.cm">소통팟</a></li>
           <li class="nav-item "><a class="nav-link nav-menu" href="#">랭킹팟</a></li>
           <li class="nav-item "><a class="nav-link nav-menu" href="#">문의</a></li>
    </ul>  

   		 <!--로그인 / 로그아웃-->
        <div id="loginHeader"> 
            <div id="header_right">
                <!-- 로그인 전 -->
                <c:if test="${ empty sessionScope.loginUser}">
                <div class="loginDiv">
                    <a href="login.co"><label class="loginlb">로그인</label></a>
                    <a href="login.sn"><label class="loginlb">관리자 로그인</label></a>
                </div>
                </c:if>
       
               <!-- 로그인 후 (구독회사 관리자일때)  -->
			   <c:if test="${ !empty sessionScope.loginUser && loginUser.admin == 'Y' }">
						<div class="loginDiv1">
							<li class="nav-item dropdown login-nav"><a class="nav-link"data-toggle="dropdown"></a>${ sessionScope.loginUser.memName}님
							<a href="logout.co" class="logOut">로그아웃</a>
								<div class="dropdown-menu ">
									<a class="dropdown-item" href="modifyMember.co">회원정보 수정</a>
									<a class="dropdown-item" href="#">회원관리</a>
								</div>
							</li>
						</div>
				 </c:if>
				 <!-- 로그인 후 (구독회사 직원)-->
			 <c:if test="${ !empty sessionScope.loginUser && loginUser.admin == 'N' }">
                <div class="loginDiv1">
                    <li class="nav-item dropdown login-nav" >
                        <a class="nav-link" data-toggle="dropdown" ></a>${ sessionScope.loginUser.memName}님
                            <a href="logout.co" class = "logOut" >로그아웃</a>
                        </a>
                        <div class="dropdown-menu "> 
                            <a class="dropdown-item" href="modifyMember.co">회원정보 수정</a> 
                        </div>
                    </li>  
                </div>
		 	 </c:if>
			</div>
        </div>
</nav>
</header>
<br clear="both">
</body>

</html>