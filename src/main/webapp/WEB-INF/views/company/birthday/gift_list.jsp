<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="shortcut icon" href="#">
<title>Insert title here</title>
</head>
<style>
#giftListBody{
	overflow: scroll;
}
#giftTitleArea h3{
	float:left;
}
#giftFuncArea{
	height: 2.2rem;
}
.giftListTop {
	display: inline-block;
	height: 100%;
}
#giftSearchArea{
	width: 35%;
}
#giftCount{
	color: red;
}
#searchDiv{
	display: inline-block;
	height: 100%;
	width: 60%;
}
#searchDiv>span{
	width: 20%;
}
#searchInput{
	border: 0;
	margin-left: 8px;
	height: 100%;
	width: 80%;
	font-size: small;
}
#searchInput:focus{
	outline: none;
}

#giftCategory{
	float: right;
}
#giftCategory a:link, #giftCategory a:visited{
	text-decoration: none;
	color: black;
}
#giftCategory a{
	cursor: pointer;
}

#cardWholeArea{
    position: relative;
}
#cardOuter{
    position: absolute;
    width: 100%;
    height: 100%;

	display: flex;
    justify-content: center;
    align-items: center;
}
#cardInner{
	width: 40%;
	height: 20%;
	
	border-radius: 1.7rem;
	background-color: whitesmoke;

	display: flex;
    justify-content: center;
    align-items: center;
}
#cardInner i{
	margin: auto;
    cursor: pointer;
}
.addGift{
    outline: none;
    border: none;
    background-color: whitesmoke;
}
</style>
<body id="giftListBody">

	<%-- <jsp:include page="/WEB-INF/views/common/menubar.jsp"/>--%>

	<section>
		<div class="container" id="giftContainer">
			<br><br>
			<div id="giftTitleArea">
				<h3>선물 리스트&nbsp;&nbsp;</h3>
			</div>
		
			<br>
			<br>
			<div id="giftFuncArea">
				<div class="giftListTop" id="giftSearchArea">
					<span>검색결과 <b id="giftCount"></b>개</span>&nbsp;&nbsp;&nbsp;
					<div class="searchDiv" id="searchDiv">
						<input type="text" id="searchInput" placeholder=" 결과 내 재검색">
						<%-- <span id="searchReset"><i class="fas fa-times-circle"></i></span>&nbsp;&nbsp;--%>
				        <span><i class="fas fa-search"></i></span>&nbsp;&nbsp;
					</div>
				</div>
				<div class="giftListTop" id="giftCategory">
				 	<%-- 스크립트에서 a태그 안에 값을 넣기 때문에 a태그에 텍스트를 빼도 되긴함 --%>
					<span><a id="giftCtgry1">추천상품순</a></span>&nbsp;|&nbsp;
					<span><a id="giftCtgry2">높은가격순</a></span>&nbsp;|&nbsp;
					<span><a id="giftCtgry3">낮은가격순</a></span>
				</div>
				 &emsp;&emsp;
			</div>
			<hr>
	
			<div class="row row-cols-1 row-cols-md-5" id="giftListArea">
				<c:forEach items="${list }" var="giftList">
					<div class="col mb-4 gift">
						<div class="card h-100 cardWholeArea">
							<img src="${ pageContext.servletContext.contextPath }/resources/images/${giftList.changeName}" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${giftList.giftBrand }</h5>
								<p class="card-text">${giftList.giftName }</p>
								<h6 class="card-text">${giftList.giftPrice }</h6>
							</div>
							<div class="cardOuter" id="cardOuter">
								<div id="cardInner">
									<div>
										<button type="button" class="addGift" value="${giftList.giftNo }" data-toggle="modal" data-target="#addGiftModal">
											<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="modal fade" id="addGiftModal" tabindex="-1" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-scrollable">
		        <div class="modal-content">
		            <div class="modal-header">
		                <div class="modal-title">선물 담기</div><!--텍스트 가운데로-->
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <div class="input-group" id="addGiftFolder">
		                    <input type="text" class="form-control" size="12" maxlength="10" placeholder="새 폴더"/>
		                    <div class="input-group-append"><!-- 왼쪽 div pointer로 바꾸고 클릭 이벤트 설정-->
		                        <span class="input-group-text" id="addFolder" style="cursor: pointer;">&emsp;생 성&emsp;</span>
		                    </div>
		                </div><hr>
		
		                <div class="accordion" id="giftAccordion">
		                    <ul class="list-group" style="list-style: none;">
		                    
		                    	<c:forEach items="${folder }" var="folders" varStatus="status">
		                    	<c:set var="index" value="${status.count }"/>
		                        <li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">
		                            <div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">
		                                <button type="button" value="GIFT1" style="outline: none; border: none; cursor: default; background: white;">
		                                    <i class="fas fa-folder" id="GIFT1" style="color: gold; cursor: pointer;" data-toggle="collapse" data-target="#giftCollapse${index }" aria-expanded="false"></i>
		                                </button>
		                                <span>&ensp;${folders.glistName }</span>
		                            </div>
		                            <div>
		                                <span class="badge badge-primary badge-pill" style="cursor: pointer;">14</span>
		                                &ensp;
		                                <i class="fas fa-times" style="cursor: pointer;"></i>
		                            </div>
		                        </li>
		                        <li id="giftCollapse${index }" class="collapse" data-parent="#giftAccordion" style="border: 1px solid black;">
		                            <table>
		                            	<tr>
		                            		<th>브랜드명</th>
		                            		<th>상품명</th>
		                            		<th>가격</th>
		                            	</tr>
		                            </table>
		                        </li>
								</c:forEach>
			
			
			<%-- 
		                        <li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">
		                            <div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">
		                                <button type="button" value="GIFT2" style="outline: none; border: none; cursor: default; background: white;">
		                                    <i class="fas fa-folder" id="GIFT2" style="color: gold; cursor: pointer;" data-toggle="collapse" data-target="#giftCollapse2" aria-expanded="false"></i>
		                                    
		                                </button>
		                                <span>&ensp;기본2</span>
		                            </div>
		                            <div>
		                                <span class="badge badge-primary badge-pill" style="cursor: pointer;">14</span>
		                                &ensp;
		                                <i class="fas fa-times" style="cursor: pointer;"></i>
		                            </div>
		                        </li>
		                        <li id="giftCollapse2" class="collapse" data-parent="#giftAccordion" style="border: 1px solid black;">
		                            <div class="card-body">
		                                Some placeholder content for the second accordion panel. This panel is hidden by default.
		                            </div>
		                        </li>
		
		                        <li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">
		                            <div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">
		                                <button type="button" value="GIFT3" style="outline: none; border: none; cursor: default; background: white;">
		                                    <i class="fas fa-folder" id="GIFT3" style="color: gold; cursor: pointer;" data-toggle="collapse" data-target="#giftCollapse3" aria-expanded="false"></i>
		                                    
		                                </button>
		                                <span>&ensp;기본3</span>
		                            </div>
		                            <div>
		                                <span class="badge badge-primary badge-pill" style="cursor: pointer;">14</span>
		                                &ensp;
		                                <i class="fas fa-times" style="cursor: pointer;"></i>
		                            </div>
		                        </li>
		                        <li id="giftCollapse3" class="collapse" data-parent="#giftAccordion" style="border: 1px solid black;">
		                            <div class="card-body">
		                                Some placeholder content for the second accordion panel. This panel is hidden by default.
		                            </div>
		                        </li>
		      --%>
		                    </ul>
		                </div><hr>   
		            </div>
		        </div>
		    </div>
		</div>
	</section>

	<script>
	    $(function(){
	        $(document).on('click', '.giftListFolder>button', function(e){
	            
	        	<%-- 
	        	e.currentTarget : button 태그 -> value값 추출 가능
	        	e.target : i 태그
	        	--%>
	        	console.log(e.target);
	        	console.log(e.currentTarget);
	        	
	            var targetVal = e.currentTarget.value;
	            var targetId = e.target.id;

	            console.log(targetVal);
	            console.log(targetId);	            
	            
	            var iconClickYN = $(this).children().attr("aria-expanded");
	            console.log(iconClickYN);

	            <%-- i태그가 아닌 button 클릭 시 함수이므로 button 범위를 클릭했을 때 targetId 값이 비는 경우를 조건으로 처리 --%>
	            if(targetId != ""){
	            	if(iconClickYN == "false"){
		                $("#" + targetId).removeClass('fa-folder-open').addClass('fa-folder');
		            }else{
		                $("#" + targetId).removeClass('fa-folder').addClass('fa-folder-open');
		            }
	            }
	        })
	    });
	    
	    $(function(){
	    	$("#addFolder").click(function(){
	    		console.log("확인!");
	    		
	    		$.ajax({
	    			url: "addGiftFolder.birth",
	    			type: "POST",
	    			data: "",
	    			success: function(data){
	    				console.log("성공!!!");
	    			},
	    			error: function(e){
	    				console.log("에러!!!");
	    			}
	    		});
	    		
	    	});
	    });
	</script>

	<script type="text/javascript">
		<%-- 상품 정렬 --%>
		$(function(){
			
			$("#giftCtgry1").css("font-weight", "bolder");
			$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;추천상품순');
			$("#giftCtgry2").css("font-weight", "normal");
			$("#giftCtgry2").html('높은가격순');
			$("#giftCtgry3").css("font-weight", "normal");
			$("#giftCtgry3").html('낮은가격순');
			
			var ctgryNum;
			<%-- 추천상품순 --%>
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
						/*
						<div class="cardOuter" id="cardOuter">
								<div id="cardInner">
									<div>
										<button type="button" class="addGift" value="${giftList.giftNo }">
											<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>
										</button>
									</div>
								</div>
							</div>
						*/
						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '<div class="card-body">';
							result += '<h5 class="card-title">' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p>';
							result += '<h6 class="card-text">' + item.giftPrice + '</h6>';
							result += '</div>';
							
							result += '<div class="cardOuter" id="cardOuter">';
							result += '<div id="cardInner">';
							result += '<div><button type="button" class="addGift" value="' + item.giftNo + '" data-toggle="modal" data-target="#addGiftModal">';
							result += '<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>';
							result += '</button></div>';
							result += '</div></div>';
							
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$(".cardOuter").css("opacity","0");
						
						$(".gift").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(2).css("opacity","1.0");
							}, function(){
								$(this).children(index).children(index).eq(2).css("opacity","0");
							});
						});
					},
					error: function(error){
						alert(error);
					}
				});
			});
			<%-- 높은가격순 --%>
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
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '<div class="card-body">';
							result += '<h5 class="card-title">' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p>';
							result += '<h6 class="card-text">' + item.giftPrice + '</h6>';
							result += '</div>';
							
							result += '<div class="cardOuter" id="cardOuter">';
							result += '<div id="cardInner">';
							result += '<div><button type="button" class="addGift" value="' + item.giftNo + '" data-toggle="modal" data-target="#addGiftModal">';
							result += '<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>';
							result += '</button></div>';
							result += '</div></div>';
							
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$(".cardOuter").css("opacity","0");
						
						$(".gift").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(2).css("opacity","1.0");
							}, function(){
								$(this).children(index).children(index).eq(2).css("opacity","0");
							});
						});
					},
					error: function(error){
						alert(error);
					}
				});
			});
			<%-- 낮은가격순 --%>
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
				
				//location.href="giftSortList.birth";				
				
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
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '<div class="card-body">';
							result += '<h5 class="card-title">' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p>';
							result += '<h6 class="card-text">' + item.giftPrice + '</h6>';
							result += '</div>';
							
							result += '<div class="cardOuter" id="cardOuter">';
							result += '<div id="cardInner">';
							result += '<div><button type="button" class="addGift" value="' + item.giftNo + '" data-toggle="modal" data-target="#addGiftModal">';
							result += '<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>';
							result += '</button></div>';
							result += '</div></div>';
							
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$(".cardOuter").css("opacity","0");
						
						$(".gift").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(2).css("opacity","1.0");
							}, function(){
								$(this).children(index).children(index).eq(2).css("opacity","0");
							});
						});
					},
					error: function(error){
						alert(error);
					}
				});
			});
		});
	
		<%-- 검색창 아이콘 가시 여부 설정 --%>
		$(function(){
			<%--$("#searchReset>i").css("opacity","0"); //일단 자리 채우기용으로 사용--%>
			$("#searchDiv").css("border", "1px solid gray");
		});
		
	    <%-- 선물 검색 관련 --%>
	    $(function(){     
	    	<%-- 상품 총 개수 출력용 --%>
			var rowCount = $("#giftListArea").children().length;
			$("#giftCount").html(rowCount);
			
	    	
	        $("#searchInput").keyup(function(){

	            $(".gift").hide();
	
	            var searchText = $(this).val();
	            searchText = searchText.toUpperCase(); //등록되는 상품 정보에 포함된 알파벳은 전부 대문자이므로 대문자로 검색
	            
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
	    
	    <%-- 각 제품 영역에 마우스를 올리면 아이콘이 각각 뜨도록 설정--%>
	    $(function(){
			$(".cardOuter").css("opacity","0");
			
			$(".gift").each(function(index){
				$(this).hover(function(){
					$(this).children(index).children(index).eq(2).css("opacity","1.0");
				}, function(){
					$(this).children(index).children(index).eq(2).css("opacity","0");
				});
			});
		});
	    
	    <%-- 각 제품 영역에 나타나는 아이콘 클릭 시 실행되는 함수 - giftNo를 가져오므로 BIRTHDAY_GIFT 테이블에서 해당 정보를 SELECT --%>
	    $(function(){
	    	$(document).on('click', '.addGift', function(e){
	    		console.log(e.currentTarget);
                console.log(e.currentTarget.value);
                
                
                
                
                
	    	});
	    });
	</script>
</body>
</html>