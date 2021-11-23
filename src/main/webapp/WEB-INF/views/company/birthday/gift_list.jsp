<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script> --%>
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
.cardInner{
	width: 40%;
	height: 20%;
	
	border-radius: 1.7rem;
	background-color: whitesmoke;

	display: flex;
    justify-content: center;
    align-items: center;
}
.cardInner i{
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
.delFolderDetail:hover{
	color: red;
}
.folderGiftImg:hover{
	-webkit-transform: scale(2.0);
}
</style>
<body id="giftListBody">

	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

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
					<span><a id="giftCtgry1">인기상품순</a></span>&nbsp;|&nbsp;
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
								<div class="cardInner">
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
		                    	<%-- 선물 폴더 리스트 ajax로 출력되는 부분 --%>
		                    </ul>
		                </div><hr>   
		            </div>
		        </div>
		    </div>
		</div>
	</section>

	<script>
		<%-- # modal에 폴더 리스트 출력 --%>
		function selectFolderList(){
			
			$.ajax({
				url: "selectFolderList.birth",
				type: "POST",
				data :"",
				success: function(list){
					
					var result = '';
					
					$.each(list, function(index, item){
						result += '<li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">';
						result += '<div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">';
						result += '<button class="giftIcon" type="button" value="' + (index+1) + '" data-toggle="collapse" data-target="#giftCollapse' + (index+1) + '" aria-expanded="false" style="outline: none; border: none; background: white;">';
						result += '<input class="glistNo" type="hidden" value="' + item.glistNo + '"/>';
						result += '<i class="fas fa-folder" id="GIFT' + (index+1) + '" style="color: gold; cursor: pointer;"></i></button>';
						result += '<span>&ensp;' + item.glistName + '</span></div>';
						
						result += '<div class="folderRight">';
						result += '<input class="folderNo" type="hidden" value="' + item.glistNo + '"/>';
						result += '<input class="folderRowNum" type="hidden" value="' + (index+1) + '"/>';
						result += '<span class="badge badge-primary badge-pill folderBadge" style="cursor: pointer; width: 28px; margin-right: 7px;">' + item.folderGiftCount + '</span>';
						result += '<i class="fas fa-times folderTimes" style="cursor: pointer;"></i></div></li>';
						result += '<li id="giftCollapse' + (index+1) + '" class="collapse" data-parent="#giftAccordion">';
						result += '<div style="padding: 1.5rem;">';
						result += '<table class="table folderTable">';
						result += '<thead class="thead-dark">';
						result += '<tr>';
						result += '<th scope="col" style="width: 10%;">번호</th>';
						result += '<th scope="col" style="width: 20%;">이미지</th>';
						result += '<th scope="col" style="width: 18%;">브랜드명</th>';
						result += '<th scope="col" style="width: 40%;">상품명</th>';
						result += '<th scope="col" style="width: 12%;">가격(원)</th>';
						result += '</tr>';
						result += '</thead>';
						result += '<tbody class="folderInfoBody" id="folderInfoBody' + (index+1) + '">';
						result += '</tbody>';
						result += '</table>';
						result += '</div>';
						result += '</li>';
					});
					$("#folderUlTag").html(result);
						
				},
				error: function(error){
					alert(error);
				}
			});
		}
		<%-- # 각 폴더에 속한 상품 리스트 출력 --%>
		function selectFolderInfo(rowNumVal){
			
			console.log("value2 : " + rowNumVal);
			
			$.ajax({
				url: "selectFolderInfo.birth",
				type: "POST",
				data:{
					rowNum : rowNumVal
				},
				success: function(list){
					//console.log("폴더info성공");
					//console.log(list);
					//console.log(list.length);
					
					var result='';
					
					if(list.length != 0){
						$.each(list, function(index, item){
							var price = (item.giftPrice).toLocaleString();
							//console.log("price:"+price)

							result += '<tr>';
							result += '<th scope="row" style="text-align:center;">';
							result += '<input class="delGiftNo" type="hidden" value="' + item.giftNo + '"/>';
							result += '<i class="fas fa-times delFolderDetail" style="cursor: pointer; float:left;"></i>' + (index+1) + '</th>'
							result += '<td><img class="folderGiftImg" width="50%" height="50%" src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '"></td>';
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
			
			
		}
		
		<%-- 4. 선택한 폴더 내 리스트 조회 기능 --%>
		$(function(){
			
			selectFolderList();
			
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
				
				
				//console.log("rowNumVal : "+rowNumVal);
				//console.log($("#dddd"));
				<%-- 폴더 내 상품 삭제를 위해 glistNo을 먼저 구한 후 함수로 값을 넘겨줌 --%>
				console.log("GLIST_NO22 : "+$(this).children().eq(0).val());
				
				var glistNo = $(this).children().eq(0).val();
				selectFolderInfo(rowNumVal);
				
				//deleteFolderDetail(glistNo, rowNumVal);
			});
		});
	
		$(function(){
			$(".delFolderDetail").hover(function(){
				console.log("hover실행");
				$(".delFolderDetail").css("color","red");
				$(".delFolderDetail").css("background","red");
			})
		});
		
		$(function(){
			$(document).on('click','.delFolderDetail', function(){
				
				var thisBadge = $(this).parents("li").prev().find("span:eq(1)");
				//console.log($(this).parents("li").prev().find("button[class='giftIcon']").children().eq(0).val());
				//console.log($(this).parents("li").prev().find("input[class='folderRowNum']").val());
				
				var delGlistNo = $(this).parents("li").prev().find("button[class='giftIcon']").children().eq(0).val();
				var delRowNumVal = $(this).parents("li").prev().find("input[class='folderRowNum']").val();
				var delGiftNo = $(this).siblings(".delGiftNo").val();
				
				var delGiftArr = new Array();
				delGiftArr.push(delGlistNo);
				delGiftArr.push(delGiftNo);
				
				//console.log("delGlistNo: " + delGlistNo);
				//console.log("delRowNumVal: " + delRowNumVal);
				//console.log("delGiftNo: " + delGiftNo);
				
				$.ajax({
					url: "delFolderDetail.birth",
					type: "POST",
					traditional: true,
					data : {
						delGiftArr : delGiftArr
					},
					success: function(result){						
						var badgeCount = thisBadge.html();
						//console.log("badgeCount : " + badgeCount);
						thisBadge.html(badgeCount-1);
						selectFolderInfo(delRowNumVal);
					},
					error: function(error){
						alert(error);
					}
				});
			});
		});

		<%--2. 선택한 제품 원하는 폴더에 추가 기능 (뱃지 클릭해서 추가) --%>
		$(function(){
	    	
	    	<%-- (1) 각 상품 클릭하면 해당 GIFT_NO 값을 giftNo에 삽입 --%>
	    	var giftNo;
	    	$(document).on('click', '.addGift', function(e){
	    		//console.log(e.currentTarget);
	    		
	            console.log("GIFT_NO : "+e.currentTarget.value);
	            giftNo = e.currentTarget.value;
 
	    	});
	    	
	    	<%-- (2) 뱃지 클릭 시 중복체크 후 뱃지 숫자 증가시킴 --%>
            $(document).on('click','.folderBadge', function(e2){

            	//console.log(typeof($(this).html())+1)
            	//console.log(typeof($(this).text())+1)
            	//console.log(parseInt($(this).html())+1)
            	//console.log(parseInt($(this).text())+1)
            	
            	<%-- thisTag : 태그를 ajax로 가지고 들어가기 위해 변수로 선언(여기서는 span 태그를 의미)
            		 folderGiftCnt : 뱃지(span태그)를 클릭하면 상품이 들어가 +1이 되어야 하므로 기존 값에 +1을 한 값을 이 변수에 대입
            	--%>
            	var thisTag = $(this);
            	var folderGiftCnt = parseInt($(this).html()) + 1;
            	
            	<%-- 선택한 폴더의 glistNo을 가져오기위해 siblings() 활용해 input[type='hidden']의 val값을 가져옴 --%>
            	//console.log($(this).siblings(".folderNo").val());
            	console.log("GLIST_NO : "+$(this).siblings(".folderNo").val());
            	console.log("FOLDER_ROWNUM : "+$(this).siblings(".folderRowNum").val());
            	var glistNo = $(this).siblings(".folderNo").val();
            	var folderRowNum = $(this).siblings(".folderRowNum").val();
            	var detailArr = new Array();
            	detailArr.push(glistNo);
            	detailArr.push(giftNo);
            	
            	<%-- (2-1) 중복 데이터가 들어가지 못하게 먼저 체크 --%>
            	$.ajax({
            		url: "checkDuplicate.birth",
            		type: "POST",
            		traditional: true,
            		data:{
            			detailArr : detailArr
            		},
            		success: function(result){
            			console.log("중복체크 결과 : " + result);
            			if(result > 0){
            				alert("이미 해당 기프티콘 정보가 존재합니다.");
            				return false;
            			}else{
            				<%-- (2-2) 폴더에 데이터 추가와 뱃지 숫자 증가 처리 --%>
        	            	$.ajax({
        	            		url: "addGiftDetail.birth",
        	            		type: "POST",
        	            		traditional: true,
        	            		data:{
        	            			detailArr : detailArr
        	            		},
        	            		success: function(result){
        	            			//console.log(result);
        	            			console.log("success!!!");
        	            			thisTag.html(''+folderGiftCnt);
        	            			//selectFolderList();
        	            			selectFolderInfo(folderRowNum);
        	            		},
        	            		error: function(error){
        	            			alert(error);
        	            		}
        	            	});
            			}
            		},
            		error: function(error){
            			alert(error);
            		}
            	});	
	    	});
            
            $(document).on('click','.folderTimes', function(e3){
            	var folderNo = $(this).siblings(".folderNo").val();
            	console.log("folderNo : "+folderNo);
            	var confirmVal = confirm("정말 삭제하시겠습니까?");
            	if(confirmVal == true){
            		$.ajax({
                		url: "delGiftFolder.birth",
                		type: "POST",
                		data: {
                			glistNo : folderNo
                		},
                		success: function(result){
                			console.log("폴더 삭제 성공!!!");
                			console.log(result);
                			selectFolderList();
                		},
                		error: function(error){
                			alert(error);
                		}
                	});
            	}else{
            		alert("삭제가 취소되었습니다.")
            	}
            });
	    });

	    <%-- 1. 폴더 추가 기능 --%>
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
	    				var result = '';
	    				if(data != ""){
	    					selectFolderList();
		    				selectFolderInfo(liCount);
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
			$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;인기상품순');
			$("#giftCtgry2").css("font-weight", "normal");
			$("#giftCtgry2").html('높은가격순');
			$("#giftCtgry3").css("font-weight", "normal");
			$("#giftCtgry3").html('낮은가격순');
			
			<%-- 카테고리별 상품 리스트 출력 함수 --%>
			function selectCategory(categoryNum){
				
				console.log("categoryNum : " + categoryNum);
				$.ajax({
					url: "selectCtgry.birth",
					type: "POST",
					data: {
						ctgryNum : categoryNum
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
							result += '<div class="cardInner">';
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
			}

			var ctgryNum;
			<%-- (1) 추천상품순 --%>
			$("#giftCtgry1").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "bolder");
				$("#giftCtgry2").css("font-weight", "normal");
				$("#giftCtgry3").css("font-weight", "normal");
				
				$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;인기상품순');
				$("#giftCtgry2").html('높은가격순');
				$("#giftCtgry3").html('낮은가격순');
				
				$("#giftListArea").children().hide();
				ctgryNum = 1;
				
				console.log($("#giftListArea").children());
				console.log(typeof(ctgryNum));
				
				selectCategory(ctgryNum);
			});
			<%-- (2) 높은가격순 --%>
			$("#giftCtgry2").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "normal");
				$("#giftCtgry2").css("font-weight", "bolder");
				$("#giftCtgry3").css("font-weight", "normal");
				
				$("#giftCtgry1").html('인기상품순');
				$("#giftCtgry2").html('<i class="fas fa-check"></i>&nbsp;높은가격순');
				$("#giftCtgry3").html('낮은가격순');
				
				$("#giftListArea").children().hide();
				ctgryNum = 2;
				
				console.log($("#giftListArea").children());
				console.log(typeof(ctgryNum));
				
				selectCategory(ctgryNum);
			});
			<%-- (3) 낮은가격순 --%>
			$("#giftCtgry3").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "normal");
				$("#giftCtgry2").css("font-weight", "normal");
				$("#giftCtgry3").css("font-weight", "bolder");
				
				$("#giftCtgry1").html('인기상품순');
				$("#giftCtgry2").html('높은가격순');
				$("#giftCtgry3").html('<i class="fas fa-check"></i>&nbsp;낮은가격순');
				
				$("#giftListArea").children().hide();
				ctgryNum = 3;
				
				console.log($("#giftListArea").children());
				console.log(typeof(ctgryNum));
				
				//location.href="giftSortList.birth";				
				
				selectCategory(ctgryNum);
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