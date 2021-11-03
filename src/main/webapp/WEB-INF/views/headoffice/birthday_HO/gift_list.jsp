<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<title>Insert title here</title>
</head>
<style>
.giftListTop {
	display: inline-block;
}
</style>
<script>
    $(function(){
        $("#wholeChk").click(function(){
            var checkYN = $("#wholeChk").is(":checked")

            if(checkYN == true){
                $("input[name='giftChk']").attr("checked",true);
            }else{
                $("input[name='giftChk']").attr("checked",false);
            }
        })

    })
</script>
<body>
	<h3>선물 리스트</h3>
	<button type="button" class="btn btn-primary">선택 삭제</button>
	<button type="button" class="btn btn-primary">선택 수정</button>
	<button type="button" class="btn btn-primary">추가하기</button>

	<br>
	<br>
	<div class="form-check giftListTop">
		<input type="checkbox" class="form-check-input" id="wholeChk"
			name="wholeChk"> <label class="form-check-label"
			for="wholeChk">전체 선택</label>
	</div>
	&nbsp;|&nbsp;
	<div class="giftListTop">
		<span>총 OOO개</span>&nbsp;|&nbsp; <span>추천상품순</span>&nbsp;|&nbsp; <span>높은가격순</span>&nbsp;|&nbsp;
		<span>낮은가격순</span>
	</div>
	<div class="giftListTop">
		<input type="text" id="search">
		<button type="button">
			<i class="fas fa-search"></i>
		</button>
	</div>
	<br>
	<br>

	<div class="row row-cols-1 row-cols-md-5">
		<c:forEach items="${list }" var="giftList">
			<div class="col mb-4">
				<div class="card h-100">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" name="giftChk">
					</div>
					<img src="${ pageContext.request.contextPath }/resources/images/${giftList.changeName}.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">${giftList.giftBrand }</h5>
						<p class="card-text">${giftList.giftName }</p>
						<p class="card-text">${giftList.giftPrice }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>