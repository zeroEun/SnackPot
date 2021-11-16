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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<title>Insert title here</title>
</head>
<style>
#giftListBody{
	overflow: scroll;
}
#giftCount{
	color: red;
}
.giftListTop {
	display: inline-block;
}
#searchGiftArea{
	float: right;
	margin-right: 10px;
}
#giftBtnArea button{
	float: left;
	margin-left: 2px;
    margin-right: 2px;
}
#giftBtnArea h3{
	float:left;
}
.giftCardHeader{
	clear: both;
	padding: 0;
	background: white;
	text-decoration: none;
	border:0;
}
.checkArea{
	float:left;
	display: inline-block;
}
.updateGiftBtnDiv{
	float:right;
	display: inline-block;
	width:25%;
}
.updateGiftBtn{
	clear: both;
	width:100%;
}
#chosenGiftArea>div>div{
	border : 1px solid gray;
	margin : 1px;
}
#insertGift .input-group-prepend, #updateGift .input-group-prepend{
	width: 20%;
}
#insertGift .input-group-prepend>span, #updateGift .input-group-prepend>span{
	width: 100%;	
}
#insertGiftImgDiv, #updateGiftImgDiv{
	cursor: pointer;
}
#giftCategory a:link, #giftCategory a:visited{
	text-decoration: none;
	color: black;
}
#giftCategory a{
	cursor: pointer;
}
.updateGiftBtn{
	
}
</style>
<body id="giftListBody">
	<section class="">
		<div class="container-fluid">
			<div class="row flex-nowrap">
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
				
				<div class="col-8">
				<br><br>
				<div id="giftBtnArea">
					<h3>선물 리스트&nbsp;&nbsp;</h3>
					<button type="button" class="btn btn-primary" id="delGiftBtn" onclick="deleteGift();">선택 삭제</button>
				    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertGift">추가하기</button>
				</div>
			
				<br>
				<br>
				<div>
					<div class="form-check giftListTop">
						<input type="checkbox" class="form-check-input" id="giftChk">
						<label class="form-check-label"	for="giftChk">전체 선택</label>
					</div>
					&nbsp;|&nbsp;
					<div class="giftListTop" id="giftCategory">
						<span>검색결과 <b id="giftCount"></b>개	</span>&nbsp;|&nbsp;
						<span><a id="giftCtgry1">추천상품순</a></span>&nbsp;|&nbsp;
						<span><a id="giftCtgry2">높은가격순</a></span>&nbsp;|&nbsp;
						<span><a id="giftCtgry3">낮은가격순</a></span>
					</div>
					 &emsp;&emsp;
				    <div class="giftListTop" id="searchGiftArea">
				        <span><i class="fas fa-search"></i></span>
				        <input type="text" id="search">        
				    </div>
				</div>
				<hr>
				<%-- 선택 삭제 modal --%>
				<div class="modal fade" id="deleteGift" tabindex="-1" aria-hidden="true">
			        <div class="modal-dialog modal-dialog-scrollable">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <div class="modal-title" id="deleteGiftHead">선택 삭제</div>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                        <span aria-hidden="true">&times;</span>
			                    </button>
			                </div>
			                <div class="modal-body" id="chosenGiftArea">
			                	<div class="card h-100">
			                	<%-- 이곳에 ajax로 가져온 리스트 출력(선택 삭제하기 위해 체크한 품목들 정보) --%>
			                	</div>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                    <button type="submit" class="btn btn-primary" onclick="realDelGift();">삭제</button>
			                </div>
			            </div>
			        </div>
			    </div>
				<%-- 수정하기 modal --%>
			    <div class="modal fade" id="updateGift" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
			        <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <div class="modal-title" id="updateGiftHead">선택 수정</div>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                        <span aria-hidden="true">&times;</span>
			                    </button>
			                </div>
			                <form id="updateGiftForm" method="post" action="updateGift.ho" enctype="multipart/form-data">
			                	<input type="hidden" name="giftNo" id="updateGiftNo"/>
			                	<div class="modal-body">
				                	<div class="card h-100">
				                        <div id="updateGiftImgDiv">
				                            <img class="card-img-top" id="updateGiftImg" alt="이미지를 등록하세요">
				                        </div>
				                        <div id="updateFileArea">
				                            <input type="file" name="updateImgFile" id="updateImgFile" accept="image/*" onchange="loadImg(this);">
				                        </div>
				                    </div>
				                    <hr>
				                    <div class="mb-3">
									  <div class="input-group is-invalid">
									    <div class="input-group-prepend">
									      <span class="input-group-text">브랜드명</span>
									    </div>
									    <input type="text" class="form-control" id="giftBrand" name="giftBrand" required>
									  </div>
									</div>
									<div class="mb-3">
									  <div class="input-group is-invalid">
									    <div class="input-group-prepend">
									      <span class="input-group-text">상품명</span>
									    </div>
									    <input type="text" class="form-control" id="giftName" name="giftName" required>
									  </div>
									</div>
									<div class="mb-3">
									  <div class="input-group is-invalid">
									    <div class="input-group-prepend">
									      <span class="input-group-text">가격</span>
									    </div>
									    <input type="text" class="form-control" id="giftPrice" name="giftPrice" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
									  </div>
									</div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				                    <button type="submit" class="btn btn-primary">수정</button>
				                </div>
			                </form>
			            </div>
			        </div>
			    </div>
			    
				<%-- 추가하기 modal --%>
			    <div class="modal fade" id="insertGift" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
			        <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <div class="modal-title" id="updateGiftHead">추가하기</div>
			                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                        <span aria-hidden="true">&times;</span>
			                    </button>
			                </div>
			                <form id="insertGiftForm" method="post" action="insertGift.ho" enctype="multipart/form-data">
				                <div class="modal-body">
				                    <div class="card h-100">
				                        <div id="insertGiftImgDiv">
				                            <img class="card-img-top" id="insertGiftImg" alt="이미지를 등록하세요">
				                        </div>
				                        <div id="insertFileArea">
				                            <input type="file" name="insertImgFile" id="insertImgFile" accept="image/*" onchange="loadImg(this);">
				                        </div>
				                    </div>
				                    <hr>
				                    <div class="mb-3">
									  <div class="input-group is-invalid">
									    <div class="input-group-prepend">
									      <span class="input-group-text">브랜드명</span>
									    </div>
									    <input type="text" class="form-control" id="giftBrand" name="giftBrand" required>
									  </div>
									</div>
									<div class="mb-3">
									  <div class="input-group is-invalid">
									    <div class="input-group-prepend">
									      <span class="input-group-text">상품명</span>
									    </div>
									    <input type="text" class="form-control" id="giftName" name="giftName" required>
									  </div>
									</div>
									<div class="mb-3">
									  <div class="input-group is-invalid">
									    <div class="input-group-prepend">
									      <span class="input-group-text">가격</span>
									    </div>
									    <input type="text" class="form-control" id="giftPrice" name="giftPrice" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
									  </div>
									</div>
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				                    <button type="submit" class="btn btn-primary" id="insertGiftBtn">추가</button>
				                </div>
			                </form>
			            </div>
			        </div>
			    </div>
				
				<script>
					$(function(){
						<%-- 각 제품 영역에 마우스를 올리면 각 제품마다의 수정 버튼이 나타나도록 설정 --%>
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
								//console.log($(this).children(index).children(index).eq(1).children());
								
								
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});
					});
				</script>
				<div class="row row-cols-1 row-cols-md-5" id="giftListArea">
					<c:forEach items="${list }" var="giftList">
						<div class="col mb-4 gift">
							<div class="card h-100 cardWholeArea">
								<div class="card-header giftCardHeader">
								<div class="form-check checkArea">
									<input type="checkbox" class="form-check-input" name="giftChk" value="${giftList.giftNo }">
								</div>
								<div class="updateGiftBtnDiv">
									<button type="button" class="btn btn-primary updateGiftBtn" name="updateGiftBtn" value="${giftList.giftNo }" data-toggle="modal" data-target="#updateGift">수정</button>
								</div>
								</div>
								<img src="${ pageContext.servletContext.contextPath }/resources/images/${giftList.changeName}" class="card-img-top" alt="...">
								<div class="card-body">
									<h5 class="card-title">${giftList.giftBrand }</h5>
									<p class="card-text">${giftList.giftName }</p>
									<h6 class="card-text">${giftList.giftPrice }</h6>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		<%-- 각 상품에 존재하는 수정 버튼 클릭 시 나타나는 modal에 출력할 정보 가져오기 --%>
		$(function(){
		<%--$(".updateGiftBtn").on('click', function(e){--%>
			$(document).on('click','.updateGiftBtn', function(e){
				console.log(e.target.value);
				
				var clickVal = e.target.value;
				$("#updateGiftNo").val(clickVal);
				
				$.ajax({
					url : "selectGiftOne.ho",
					type : "POST",
					data : {
						giftNo : clickVal
					},
					success : function(result){
						console.log("result:" + result);
						console.log(result);
						var fileRoute = "${ pageContext.servletContext.contextPath }" + "/resources/images/" + result.changeName;
						console.log(fileRoute);
						
						//$("#updateImgFile").val(result.changeName); //DOM 오류 발생
						$("#updateGiftImg").attr("src", fileRoute)
						$("#giftBrand").val(result.giftBrand);
						$("#giftName").val(result.giftName);
						$("#giftPrice").val(result.giftPrice);
					},
					error : function(error){
						alert("에러발생 : " + error);
					}
				});
			});
		});

		<%-- 전체 체크 설정 --%>
		$(function(){
	    	var chkRow = $("input[name='giftChk']");
	    	var rowCount = chkRow.length;
	    	console.log(rowCount);
	    	
	    	<%-- 전체 선택하면 모든 체크박스가 checked --%>
	        $("#giftChk").click(function(){
	            var chkList = $("input[name='giftChk']");
	            for(var i=0; i<chkList.length; i++){
	                chkList[i].checked = this.checked;
	            }
	        });
	
	        $("input[name='giftChk']").click(function(){
	             if($("input[name='giftChk']:checked").length == rowCount){ /*각각 체크해서 전체를 다 체크했을 때*/
	                 $("#giftChk")[0].checked = true;
	             }else{
	                 $("#giftChk")[0].checked = false;
	             }
	        });
	    });
		
		var delArr = new Array();
		<%-- 선택 삭제한 항목 데이터list modal에 불러오기 --%>
		function deleteGift(){

			var chkArr = new Array();
			var chkCount = $("input[name='giftChk']");

			for(var i=0; i<chkCount.length; i++){
				if(chkCount[i].checked){
					chkArr.push(chkCount[i].value);
				}
			}
			
			if(chkArr.length == 0){
				$("#delGiftBtn").removeAttr("data-toggle").removeAttr("data-target");
				alert("선택된 항목이 없습니다.");
			}else{
				$("#delGiftBtn").attr("data-toggle","modal").attr("data-target","#deleteGift");
				//$("#checkedGiftNum").html(chkArr.length);
				console.log("선택된 상품 개수 : "+chkArr.length);
				$.ajax({
					url : "checkedGiftList.ho",
					type: "POST",
					traditional : true,
					data: {
						chkArr : chkArr
					},
					success : function(data){
						console.log("data : " + data);
						console.log("data길이 : " + data.length);
						var result = '';
						
						result += '<h5>총 <span id="checkedGiftNum">' + data.length + '</span>개 상품을 선택하셨습니다. 해당 상품들을 삭제하시겠습니까?</h5>';
						$.each(data, function(index, item){
							delArr.push(item.giftNo);
							
							result += '<input type="hidden" name="delGiftNo" value="' + item.giftNo + '"/>';
							result += '<div>';
							result += '<div class="card-body">';
							result += '<h5 class="card-title"><b>' + (index+1) + '. </b>' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p> ';
							result += '</div>';
							result += '</div>';
						});
						$("#chosenGiftArea").html(result);
					},
					error : function(error){
						alert(error);
					}
				});
			}
		}
		
		<%-- modal 데이터를 바탕으로 선택한 선물 항목 삭제하기 --%>
		function realDelGift(){
			<%-- input 히든으로 준 거 가져와볼 것!!! --%>
			console.log("realDelGift!!");
			console.log(delArr);
			
			$.ajax({
				url : "deleteGift.ho",
				type : "POST",
				traditional : true,
				data : {
					delArr : delArr
				},
				success : function(data){
					console.log(data);
					console.log("삭제 성공!");
					location.replace("giftList.ho");
				},
				error : function(error){
					alert(error);
				}
			});
			
		}
		
		<%-- 선물 사진 관련 --%>
	    $(function(){
	        $("#updateFileArea").hide();
	        $("#insertFileArea").hide();
	    });
	    
	    $("#updateGiftImgDiv").click(function(){
	        $("#updateImgFile").click();
	    });
	
	    $("#insertGiftImgDiv").click(function(){
	        $("#insertImgFile").click();
	    });
		
	    <%-- 이미지 영역을 눌러서 파일 등록하면 해당 이미지를 출력하는 함수설정 --%>
	    function loadImg(imgFile) {
			if (imgFile.files.length == 1) {
				var reader = new FileReader();
				
				reader.readAsDataURL(imgFile.files[0]);
				
				reader.onload = function(e) {
					console.log(e);
					$("#insertGiftImg").attr("src", e.target.result);
					$("#updateGiftImg").attr("src", e.target.result);
				}
			}
	    }
	    
	    <%-- 선물 검색 관련 --%>
	    $(function(){       
	
	    	<%-- 상품 총 개수 출력용 --%>
			var rowCount = $("#giftListArea").children().length;
			$("#giftCount").html(rowCount);
	    	
	        $("#search").keyup(function(){
	
	            $(".gift").hide();
	
	            var searchText = $(this).val();
	            searchText = searchText.toUpperCase();
	            
	            var giftBrand = $(".card-body>h5:contains('"+searchText+"')");
	            var giftName = $(".card-body>p:contains('"+searchText+"')");
	            var giftPrice = $(".card-body>h6:contains('"+searchText+"')");
	
	            $(giftBrand).parent().parent().parent().show();
	            $(giftName).parent().parent().parent().show();
	            $(giftPrice).parent().parent().parent().show();
	
				var newCount = 0;
	            
	            for(var i=0; i<rowCount; i++){
					visibleYN = $("#giftListArea").children().eq(i).is(":visible");
					
					if(visibleYN == true){
						newCount += 1;
					}
				}
		    	
		    	$("#giftCount").html(newCount);
	        });
	    });
	    
	    <%-- 상품 정렬 --%>
		$(function(){
			
			$("#giftCtgry1").css("font-weight", "bolder");
			$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;추천상품순');
			$("#giftCtgry2").css("font-weight", "normal");
			$("#giftCtgry2").html('높은가격순');
			$("#giftCtgry3").css("font-weight", "normal");
			$("#giftCtgry3").html('낮은가격순');
			
			var ctgryNum;
			
			$("#giftCtgry1").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "bolder");
				$("#giftCtgry2").css("font-weight", "normal");
				$("#giftCtgry3").css("font-weight", "normal");
				
				$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;추천상품순');
				$("#giftCtgry2").html('높은가격순');
				$("#giftCtgry3").html('낮은가격순');
				
				$("#giftListArea").children().hide();
				ctgryNum = 1;
				
				console.log($("#giftListArea").children());
				console.log(typeof(ctgryNum));
				
				$.ajax({
					url: "selectCtgry.birth",
					type: "POST",
					data: {
						ctgryNum : ctgryNum
					},
					success: function(data){

						var result = '';

						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							
							result += '<div class="card-header giftCardHeader">';
							result += '<div class="form-check checkArea">';
							result += '<input type="checkbox" class="form-check-input" name="giftChk" value="' + item.giftNo + '">';
							result += '</div>';
							result += '<div class="updateGiftBtnDiv">';
							result += '<button type="button" class="btn btn-primary updateGiftBtn" name="updateGiftBtn" value="' + item.giftNo + '" data-toggle="modal" data-target="#updateGift">수정</button>';
							result += '</div>';
							result += '</div>';
							
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '<div class="card-body">';
							result += '<h5 class="card-title">' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p>';
							result += '<h6 class="card-text">' + item.giftPrice + '</h6>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});	
					},
					error: function(error){
						alert(error);
					}
				});
			});

			$("#giftCtgry2").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "normal");
				$("#giftCtgry2").css("font-weight", "bolder");
				$("#giftCtgry3").css("font-weight", "normal");
				
				$("#giftCtgry1").html('추천상품순');
				$("#giftCtgry2").html('<i class="fas fa-check"></i>&nbsp;높은가격순');
				$("#giftCtgry3").html('낮은가격순');
				
				$("#giftListArea").children().hide();
				ctgryNum = 2;
				
				console.log($("#giftListArea").children());
				console.log(typeof(ctgryNum));
				
				$.ajax({
					url: "selectCtgry.birth",
					type: "POST",
					data: {
						ctgryNum : ctgryNum
					},
					success: function(data){
						var result = '';
						
						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							
							result += '<div class="card-header giftCardHeader">';
							result += '<div class="form-check checkArea">';
							result += '<input type="checkbox" class="form-check-input" name="giftChk" value="' + item.giftNo + '">';
							result += '</div>';
							result += '<div class="updateGiftBtnDiv">';
							result += '<button type="button" class="btn btn-primary updateGiftBtn" name="updateGiftBtn" value="' + item.giftNo + '" data-toggle="modal" data-target="#updateGift">수정</button>';
							result += '</div>';
							result += '</div>';
							
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '<div class="card-body">';
							result += '<h5 class="card-title">' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p>';
							result += '<h6 class="card-text">' + item.giftPrice + '</h6>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
								
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});	
					},
					error: function(error){
						alert(error);
					}
				});
			});
			
			$("#giftCtgry3").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "normal");
				$("#giftCtgry2").css("font-weight", "normal");
				$("#giftCtgry3").css("font-weight", "bolder");
				
				$("#giftCtgry1").html('추천상품순');
				$("#giftCtgry2").html('높은가격순');
				$("#giftCtgry3").html('<i class="fas fa-check"></i>&nbsp;낮은가격순');
				
				$("#giftListArea").children().hide();
				ctgryNum = 3;
				
				console.log($("#giftListArea").children());
				console.log(typeof(ctgryNum));
				
				$.ajax({
					url: "selectCtgry.birth",
					type: "POST",
					data: {
						ctgryNum : ctgryNum
					},
					success: function(data){
						var result = '';
						
						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							
							result += '<div class="card-header giftCardHeader">';
							result += '<div class="form-check checkArea">';
							result += '<input type="checkbox" class="form-check-input" name="giftChk" value="' + item.giftNo + '">';
							result += '</div>';
							result += '<div class="updateGiftBtnDiv">';
							result += '<button type="button" class="btn btn-primary updateGiftBtn" name="updateGiftBtn" value="' + item.giftNo + '" data-toggle="modal" data-target="#updateGift">수정</button>';
							result += '</div>';
							result += '</div>';
							
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '<div class="card-body">';
							result += '<h5 class="card-title">' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p>';
							result += '<h6 class="card-text">' + item.giftPrice + '</h6>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
								
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});	
					},
					error: function(error){
						alert(error);
					}
				});
			});
		});
	</script>
</body>
</html>