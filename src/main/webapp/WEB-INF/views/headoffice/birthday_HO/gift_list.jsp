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
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteGift">선택 삭제</button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateGift">선택 수정</button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertGift">추가하기</button>

	<div class="modal fade" id="deleteGift" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title" id="deleteGiftHead">선택 삭제</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>총 <b>2</b>개 상품을 선택하셨습니다. 해당 상품들을 삭제하시겠습니까?</h5>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><b>1.</b>네이버</h5>
                            <p class="card-text">네이버페이 포인트 50,000원</p>                    
                        </div>                        
                    </div>
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title"><b>2.</b>롯데</h5>
                            <p class="card-text">롯데마트모바일금액권5만원권</p>                    
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">삭제</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateGift" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title" id="updateGiftHead">선택 수정</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card h-100">
                        <div id="updateGiftImgDiv">
                            <img src="../resources/image/네이버페이포인트50000원.jpg" class="card-img-top" id="updateGiftImg" alt="...">
                        </div>
                        
                        <div class="card-body">
                          <label for="giftTitle">브랜드명 : </label><input class="card-title" id="giftTitle" type="text" value="네이버"><br>
                          <label for="giftContent">내용 : </label><input class="card-text" id="giftContent" type="text" value="네이버페이 포인트 50,000원"><br>
                          <label for="giftPrice">가격 : </label><input type="text" id="giftPrice" value="50,000">원
                        </div>
                        <div id="updateFileArea">
                            <input type="file" name="updateImgFile" id="updateImgFile" accept="image/*" >
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">수정</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="insertGift" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title" id="updateGiftHead">추가하기</div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card h-100">
                        <div id="insertGiftImgDiv">
                            <img src="" class="card-img-top" id="insertGiftImg" alt="이미지를 등록하세요">
                            <button type="button" id="insertGiftBtn">이미지등록</button>
                        </div>
                        
                        <div class="card-body">
                            <label for="giftTitle">브랜드명 : </label><input class="card-title" id="giftTitle" type="text" value=""><br>
                            <label for="giftContent">내용 : </label><input class="card-text" id="giftContent" type="text" value=""><br>
                            <label for="giftPrice">가격 : </label><input type="text" id="giftPrice" value="">원
                        </div>
                        <div id="insertFileArea">
                            <input type="file" name="insertImgFile" id="insertImgFile" accept="image/*" >
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">추가</button>
                </div>
            </div>
        </div>
    </div>

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
	 &emsp;&emsp;
    <div class="giftListTop">
        <span><i class="fas fa-search"></i></span>
        <input type="text" id="search">        
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
	<script>
	    $(function(){
	        $("#wholeChk").click(function(){
	            var checkYN = $("#wholeChk").is(":checked")
	
	            if(checkYN == true){
	                $("input[name='giftChk']").attr("checked",true);
	            }else{
	                $("input[name='giftChk']").attr("checked",false);
	            }
	        });
	
	    });
	
	    $(function(){
	        $("#updateFileArea").hide();
	        $("#insertFileArea").hide();
	    });
	    
	    $("#updateGiftImgDiv").click(function(){
	        $("#updateImgFile").click();
	    });
	
	    $("#insertGiftBtn").click(function(){
	        $("#insertImgFile").click();
	    });
	
	    $(function(){       
	
	        $("#search").keyup(function(){
	
	            $(".gift").hide();
	
	            var searchText = $(this).val();
	            
	            var giftBrand = $(".card-body>h5:contains('"+searchText+"')");
	            var giftTitle = $(".card-body>p:contains('"+searchText+"')");
	            var giftPrice = $(".card-body>h6:contains('"+searchText+"')");
	
	            $(giftBrand).parent().parent().parent().show();
	            $(giftTitle).parent().parent().parent().show();
	            $(giftPrice).parent().parent().parent().show();
	
	        })
	    });
	</script>
</body>
</html>