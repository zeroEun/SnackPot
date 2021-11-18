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
.folderRight{
	
}
.folderTable{
	text-align: center;
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
		<script>
			
		</script>
		<div class="modal fade" id="addGiftModal" tabindex="-1" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-scrollable modal-lg">
		        <div class="modal-content">
		            <div class="modal-header">
		                <div class="modal-title">선물 담기</div><!--텍스트 가운데로-->
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <div class="input-group" id="addGiftFolder">
			                <input type="text" class="form-control" name="folderName" size="12" maxlength="10" placeholder="새 폴더" required/>
		                    
		                    <div class="input-group-append"><!-- 왼쪽 div pointer로 바꾸고 클릭 이벤트 설정-->
		                        <span class="input-group-text" id="addFolder" style="cursor: pointer;">&emsp;생 성&emsp;</span>
		                    </div>
		                </div><hr>
		
		                <div class="accordion" id="giftAccordion">
		                    <ul class="list-group" id="folderUlTag" style="list-style: none;">
		                    
		                    	<c:forEach items="${folder }" var="folders" varStatus="status">
		                    	<c:set var="index" value="${status.count }"/>
		                        <li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">
		                            <div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">
		                                <button class="giftIcon" type="button" value="${index }" data-toggle="collapse" data-target="#giftCollapse${index }" aria-expanded="false" style="outline: none; border: none; background: white;">
		                                    <i class="fas fa-folder" id="GIFT${index }" style="color: gold; cursor: pointer;"></i>
		                                </button>
		                                <span>&ensp;${folders.glistName }</span>
		                            </div>
		                            <div class="folderRight">
		                                <span class="badge badge-primary badge-pill folderBadge" style="cursor: pointer; width: 28px; margin-right: 7px;">${folders.folderGiftCount }</span>
		                                <i class="fas fa-times" style="cursor: pointer;"></i>
		                            </div>
		                        </li>
		                        <li id="giftCollapse${index }" class="collapse" data-parent="#giftAccordion">
		                            <div style="padding: 1.5rem;">
			                            <table class="table folderTable">
			                            	<thead class="thead-dark">
				                            	<tr>
				                            		<th scope="col" style="width: 10%;">번호</th>
				                            		<th scope="col" style="width: 20%;">이미지</th>
				                            		<th scope="col" style="width: 18%;">브랜드명</th>
				                            		<th scope="col" style="width: 40%;">상품명</th>
				                            		<th scope="col" style="width: 12%;">가격(원)</th>
				                            	</tr>
			                            	</thead>
			                            	<tbody class="folderInfoBody" id="folderInfoBody${index }">
			                            	
			                            	<%-- ajax에서 불러온 데이터 출력 --%>
			                            	
			                            	</tbody>
			                            </table>
		                            </div>
		                        </li>
								</c:forEach>
		                    </ul>
		                </div><hr>   
		            </div>
		        </div>
		    </div>
		</div>
	</section>

	<script>

		<%-- (4) 선택한 폴더 내 리스트 조회 기능 --%>
		$(function(){
			$(document).on('click', '.giftIcon', function(e){
				
				<%-- 
	        	e.currentTarget : button 태그 -> value값 추출 가능
	        	e.target : i 태그
	        	--%>
	        	
	        	<%-- 
	        	var targetVal = e.currentTarget.value;
	        	var targetId = e.target.id;  
	        	--%>
	        	
	        	<%-- 폴더 아이콘 변경 코드 --%>
				var iconClickYN = $(this).attr("aria-expanded");

            	if(iconClickYN == "false"){
		            $(this).children().removeClass().addClass('fas fa-folder');
		        }else{
		        	<%-- collapse를 연 요소만 폴더 아이콘이 변하게 설정 --%>
		        	$(".giftIcon").children().removeClass().addClass('fas fa-folder');
		            $(this).children().removeClass().addClass('fas fa-folder-open');
		        }
				
            	<%-- ================================================================================== --%>
				
            	<%-- 폴더 클릭 시 기프티콘 목록 출력 코드 --%>
            	
				<%-- button value값을 status.count로 구해서 쿼리문에서 WHERE절의 ROWNUM 값으로 활용(GIFT_LIST 테이블)--%> 
				
				<%-- 폴더 새로 추가 시 e.currentTarget.value 값이 undefined가 되므로 
					length값으로 targetVal 설정 후 rowNumVal이 null일 때 targetVal에 + 1을 하면
					원하는 값을 얻을 수 있음
				--%>
				var targetVal = $(".giftIcon").length;
				
				var rowNumVal = e.currentTarget.value;
				
				if(rowNumVal == null){
					rowNumVal = targetVal + 1;
				}
				
				console.log("rowNumVal : "+rowNumVal);
				
				$.ajax({
					url: "selectFolderInfo.birth",
					type: "POST",
					data:{
						rowNum : rowNumVal
					},
					success: function(list){
						console.log("폴더info성공");
						//console.log(list);
						//console.log(list.length);
						
						var result='';
						
						if(list.length != 0){
							$.each(list, function(index, item){
								var price = (item.giftPrice).toLocaleString();
								console.log("price:"+price)

								result += '<tr>';
								result += '<th scope="row" style="text-align:center;">' + (index+1) + '</th>';
								result += '<td><img width="50%" height="50%" src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '"></td>';
								result += '<td>' + item.giftBrand + '</td>';
								result += '<td>' + item.giftName + '</td>';
								result += '<td>' + price + '</td>';
								result += '</tr>';
							});
							
						}else{
							<%-- 폴더에 내용 추가되면 아래 내용은 없어져야함 - 추후 수정 --%>
							result += '<tr><td colspan="5"><h5>추가된 상품이 존재하지 않습니다.</h5></td></tr>';
						}
						$("#folderInfoBody"+rowNumVal).html(result);
					},
					error: function(error){
						alert(error);
					}
				});
				
				
			});
		});
	
		<%-- 각 제품 영역에 나타나는 아이콘 클릭 시 실행되는 함수 - giftNo를 가져오므로 BIRTHDAY_GIFT 테이블에서 해당 정보를 SELECT --%>
	    $(function(){
	    	$(document).on('click', '.addGift', function(e){
	    		console.log(e.currentTarget);
	            console.log(e.currentTarget.value);
	            var aaa = e.currentTarget.value;
	            
	            //folderBadge
	            $(document).on('click','.folderBadge', function(e){
	            	console.log("aaa : "+aaa);

		    	});
	            
	            
	    	});
	    });
	    
	    <%-- 뱃지 클릭 시 함수
	    $(function(){
	    	$(document).on('click','.folderBadge', function(e){
	    		console.log(e.target);
	            console.log(e.target.value);	    		
	    		console.log(e.currentTarget);
	            console.log(e.currentTarget.value);
	    	});
	    }); --%>

	    <%-- (1) 폴더 추가 기능 --%>
	    $(function(){
	    	
	    	//$("#addFolder").click(function(){
	    	$(document).on('click','#addFolder',function(e){
	    		console.log("확인!");
	    		
	    		var fName= $("input[name='folderName']").val();
		    	console.log("fName : " + fName);
	    		
	    		$.ajax({
	    			url: "addGiftFolder.birth",
	    			type: "POST",
	    			data: {
	    				folderName : fName
	    			},
	    			success: function(data){
	    				console.log("성공!!!");
	    				console.log("data : " + data);
	    				
	    				<%-- 폴더 생성 후에는 text를 비워줌 --%>
	    				$("input[name='folderName']").val("");
	    				<%-- ul내부 li개수를 구해서 modal id뒤의 count를 지정 
	    				- 한 항목당 li태그가 두 개 들어있으므로 나누기 2한 후 다음 인덱스를 대입하기 위해 +1--%>
	    				var liCount = $("#folderUlTag").children().length/2 + 1;
	    				console.log("li 개수 : "+liCount);
	    				
	    				var html = '';
	    				if(data != ""){
	    					html += '<li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">';
		    				html += '<div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">';
		    				html += '<button type="button" value="${index }" data-toggle="collapse" data-target="#giftCollapse' + liCount + '" aria-expanded="false" style="outline: none; border: none; background: white;">';
		    				html += '<i class="fas fa-folder giftIcon" id="GIFT${index }" style="color: gold; cursor: pointer;"></i></button>';
		    				html += '<span>&ensp;' + data + '</span></div>';
		    				html += '<div><span class="badge badge-primary badge-pill folderBadge" style="cursor: pointer; width: 28px; margin-right: 10px;">0</span>';
		    				html += '<i class="fas fa-times" style="cursor: pointer;"></i></div></li>';
		    				html += '<li id="giftCollapse' + liCount + '" class="collapse" data-parent="#giftAccordion">';
		    				html += '<div style="padding: 2rem;">';
		    				html += '<table class="table">';
		    				html += '<thead class="thead-dark">';
		    				html += '<tr>';
		    				html += '<th scope="col">번호</th>';
		    				html += '<th scope="col">브랜드명</th>';
		    				html += '<th scope="col">상품명</th>';
		    				html += '<th scope="col">가격</th>';
		    				html += '</tr>';
		    				html += '</thead>';
		    				html += '<tbody>';
		    				html += '<tr><td colspan="5"><h5>추가된 상품이 존재하지 않습니다.</h5></td></tr>'
		    				html += '</tbody>';
		    				html += '</table></div></li>';
		    				
		    				console.log(html);
		    				//위에 주석에 있는 내용 append하자
		    				$("#folderUlTag").append(html);
		    				
	    				}else{
	    					alert("폴더명을 입력하세요.");
	    				}

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
	    
	</script>
</body>
</html>