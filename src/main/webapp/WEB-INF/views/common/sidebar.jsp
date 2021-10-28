<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	/*사이드바 기본 설정*/
	.sidebar {
		height: 100vh;
		background-color: rgb(10, 23, 78);
		min-width: 200px;
		overflow-y: scroll;
	}
	
	/*사이트바 높이가 화면을 넘어갈 경우 스크롤바 안보이게*/
	::-webkit-scrollbar {
		width: 0px; /* Remove scrollbar space */
		background: transparent; /* Optional: just make scrollbar invisible */
	}
	
	/*로고 & 유저 부분*/
	.sidebar-header {
		text-align: center;
		margin-top: 20px;
	}
	
	/*텍스트 색*/
	.sidebar a, h2, h5, li {
		color: rgb(245, 208, 66);
	}
	
	/*SnackPot 로고 부분*/
	.navbar-brand {
		margin-bottom: 20px;
		font-size: 35px;
		font-weight: 500;
	}
	
	/*메뉴 부분*/
	.nav {
		display: block;
		margin-top: 50px;
	}
	
	/*메뉴 사이 간격*/
	.sidebar .nav:not (.sub-menu ) >.nav-item {
		margin-top: .2rem;
	}
	
	/*메뉴에 마우스 올릴 때*/
	.sidebar .nav:not (.sub-menu ) >.nav-item:hover>.nav-link {
		background: rgb(35, 46, 95);
		border-radius: 0.437rem;
	}
	
	/*토글 있는 메뉴 클릭시*/
	.sidebar .nav:not (.sub-menu ) >.nav-item>.nav-link[aria-expanded="true"]
		{
		border-radius: 0.437rem 0.437rem 0 0;
		background: rgb(35, 46, 95);
	}
	
	/*상세 메뉴*/
	.sidebar .nav.sub-menu {
		margin-bottom: 0;
		margin-top: 0;
		list-style: none;
		padding: 0.3rem 0 0.3rem 0.7rem;
		background: rgb(35, 46, 95);
	}
	
	/*토클 없는 메뉴 클릭시,  클래스에 link-a 추가*/
	.sidebar .nav:not (.sub-menu ) >.nav-item>.link-a:focus {
		background: rgb(35, 46, 95);
		border-radius: 0.437rem;
}
</style>
</head>
<body>

    <div class="container-fluid">
        <div class="row">

         
            <!-- Sidebar -->

            <nav id="sidebar" class="sidebar col-2">
                <div class="sidebar-header">
                    <a class="navbar-brand" href="#"><h2>SnackPot</h2></a>

                    <div id="user">
                        <h5>UserName</h5>
                        <a href="#">logout</a>
                    </div>
                </div>

                <ul class="nav">

                    <!-- 사원관리 : 본사 마스터 계정으로 로그인시에만 보여주기-->
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#member-management" aria-expanded="false" aria-controls="member-management">
                        <span class="menu-title">사원 관리</span>
                        <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="member-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">사원 계정 관리</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">담당 거래처 관리</a></li>
                        </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#com-management" aria-expanded="false" aria-controls="com-management">
                        <span class="menu-title">구독회사 정보</span>
                        <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="com-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">구독정보 조회</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">사원 조회</a></li>
                        </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#birth-management" aria-expanded="false" aria-controls="birth-management">
                        <span class="menu-title">생일선물 관리</span>
                        <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="birth-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">발송 진행 현황</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">발송 리스트 관리</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">선물 리스트 관리</a></li>
                        </ul>
                        </div>
                    </li>
                
                  
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#order-management" aria-expanded="false" aria-controls="order-management">
                        <span class="menu-title">간식 주문 관리</span>
                        <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="order-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">리스트 발송</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">리스트 발송 내역</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">주문 내역</a></li>
                        </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#snack-management" aria-expanded="false" aria-controls="snack-management">
                        <span class="menu-title">간식 상품 관리</span>
                        <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="snack-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">품목 등록</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">입고 등록</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">출고 등록</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">재고 조회</a></li>
                        </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#chart" aria-expanded="false" aria-controls="chart">
                        <span class="menu-title">통계 조회</span>
                        <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="chart">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">품목 등록</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">입고 등록</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">출고 등록</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">재고 조회</a></li>
                        </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link link-a" href="#">
                          <span class="menu-title">문의 사항</span>
                        </a>
                    </li>
                
                </ul>
            </nav>
      
        </div>
    </div>

</body>
</html>