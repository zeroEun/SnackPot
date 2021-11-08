<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wishList</title>
<!--Bootstrap4 를 시작할때 필요한 CDN들-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
/*회사명 , 마감시간*/
.header{
	text-align: center;
	font-weight: bold;
	margin-bottom: 10px;
}
.companyName {
	font-size: 20px;
}
/*위시리스트 기본정보*/
.row {
	padding: 0 40px;
}

.col {
	padding: 5px;
}

.card {
	border: none;
	position: relative;
}
/*위시리스트 나열*/
.countTxt {
	width: 40px;
	height: 30px;
	outline: none;
	border-radius: 4px;
}

.card-img-top {
	width: 100px;
	height: 200px;
	padding-left: 30px;
	padding-right: 30px;
	padding-top: 20px;
}

.minus, .plus {
	outline: none;
	box-shadow: none;
	border-style: none;
	border-radius: 4px;
	background-color: rgb(245, 208, 66);
}

.minus:focus, .plus:focus {
	outline: none;
}
/*위시리스트 각 제목*/
.snackTitle, .drinkTitle, .foodTitle {
	font-weight: bold;
	font-size: 15px;
	margin-left: 50px;
	margin-bottom: 10px;
}

/*삭제 버튼*/
.close {
	position: relative;
	display: inline-block;
	*display: inline;
	width: 0px;
	height: 0px;
	text-align: center;
	margin-right: 20px;
	opacity: 0;
	transition: opacity .35e ease;
}

.close:after {
	content: "\00d7"; /*\00d7 : css만으로 x버튼 만들기 가능*/
	font-size: 20pt; /*폰트 사이즈로 크기조절 가능*/
	line-height: 5px;
}

.card:hover .close {
	opacity: 1;
}
/*마감 버튼*/
.endBtn {
	display: block;
	margin: auto;
	margin-top: 5%;
	width: 100px;
	height: 30px;
	border-radius: 5px;
	border-style: none;
	background-color: rgb(10, 23, 78);
	color: white;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<br>
	<br>
	<br>
	<div class="header">
		<span class="companyName">${list[0].comName}</span><br>
		<span class="time">주문마감까지</span>
	</div>
	<div class="container-fluid">
		<div class="snackTitle">Snack</div>
		<div class="row row-cols-xl-5">
			<c:forEach items="${list}" var="w">
				<c:if test="${w.categoryNo eq '1' }">
					<div class="col">
						<div class="card">
							<div class="close"></div>
							<img class="card-img-top"
								src="${ pageContext.servletContext.contextPath }/resources/images/${w.changeName}">
							<div class="card-body">
								<p class="card-text">${w.snackName}</p>
								<div class="countBtn">
									<a>${w.purchasePrice}원</a> &nbsp;&nbsp;
									<button class="minus">
										<span>−</span>
									</button>
									<input type="text" class="countTxt" value="${w.count}" disabled></input>
									<button class="plus" value="${w.snackNo}" onclick="plusCount(this.value)">
										<span>+</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<hr>
		<!--음료  -->
		<div class="drinkTitle">Drink</div>
		<div class="row row-cols-xl-5">
			<c:forEach items="${list}" var="w">
				<c:if test="${w.categoryNo eq '2' }">
					<div class="col">
						<div class="card">
							<div class="close"></div>
							<img class="card-img-top"
								src="${ pageContext.servletContext.contextPath }/resources/images/${w.changeName}">
							<div class="card-body">
								<p class="card-text">${w.snackName}</p>
								<div class="countBtn">
									<a>${w.purchasePrice}원</a> &nbsp;&nbsp;
									<button class="minus">
										<span>−</span>
									</button>
									<input type="text" class="countTxt" value="${w.count}"></input>
									<button class="plus">
										<span>+</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<hr>
		<!--간편식  -->
		<div class="foodTitle">Convenience food</div>
		<div class="row row-cols-xl-5">
			<c:forEach items="${list}" var="w">
				<c:if test="${w.categoryNo eq '3' }">
					<div class="col">
						<div class="card">
							<div class="close"></div>
							<img class="card-img-top"
								src="${ pageContext.servletContext.contextPath }/resources/images/${w.changeName}">
							<div class="card-body">
								<p class="card-text">${w.snackName}</p>
								<div class="countBtn">
									<a>${w.purchasePrice}원</a> &nbsp;&nbsp;
									<button class="minus">
										<span>−</span>
									</button>
									<input type="text" class="countTxt" value="${w.count}"></input>
									<button class="plus">
										<span>+</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<button type="submit" class="endBtn">마감</button>
</body>
<script>
	function plusCount(val){
		var snackCountUp = val;
			alert(snackCountUp)
		$.ajax({
			url : "updateCount.wish",
			data : {
				snackCountUp : snackCountUp
			},
			type : "post",
			success : alert('수량 업데이트 성공')
		})
	}


</script>
</html>