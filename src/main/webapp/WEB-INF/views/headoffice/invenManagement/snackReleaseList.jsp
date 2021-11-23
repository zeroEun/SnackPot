<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 목록 조회</title>

<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: lightgray;
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	color: rgb(10, 23, 78);
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	color: rgb(10, 23, 78);
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	color: white;
}

.inputLabel {
	display: flex;
}

.btn {
	width: 50px;
	background-color: rgb(245, 208, 66);
	color: rgb(10, 23, 78);
}
</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">

			<jsp:include page="../../common/sidebar.jsp" />

			<div id="modal" class="modal-overlay">
				<div class="modal-window">
					<div class="title">
						<h2>출고등록</h2>
					</div>
					<div class="close-area">X</div>
					<form id="arrivalEnroll" action="releaseInsert.im" method="post">
						<div class="content">
							<p>
								<label class="inputLabel">제품코드</label> <input type="number"
									name="snackNo">
							</p>
							<p>
								<label class="inputLabel">수량</label> <input type="number"
									name="amount">
							</p>
							<p>
								<label class="inputLabel">비고</label> <input type="text"
									name="remark">
							</p>
							<br> <br> <input type="submit" value="등록하기" class="btn">
						</div>
					</form>
				</div>
			</div>

			<div id="arrivalWrap">


				<h3>출고목록</h3>

				 <input type="text" id="datepicker" name="datepicker" class="datepicker">
	
    <script>
    
    $.datepicker.setDefaults({
    	  dateFormat: 'yy-mm-dd',
    	  currentText: '오늘',
    	  prevText: '이전 달',
    	  nextText: '다음 달',
    	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	  showMonthAfterYear: true,
    	  yearSuffix: '년'
    	});
    
    $(function() { $("#datepicker").datepicker({  maxDate: '0',
    	  onSelect: function (dateText, inst) {
    	      
          	var date = $( "#datepicker" ).datepicker( "getDate" );
          	topList();
          	
          }
    	
    
    
    }); });
    
        $(function () {
	
        	$("#datepicker").datepicker();
        	$("#datepicker").datepicker('setDate', new Date);

        });
    </script>
 <br>
				<form name="search">
					<select name="searchType">
						<option value="1">상품코드</option>
						<option value="2">상품명</option>
						<option value="3">출고번호</option>
					</select> <input type="text" name="searchInput"> <input
						type="submit" name="searchBtn">
				</form>
				<br> <br>


				<table id="boardList" class="table table-hover" align="center">
					<thead>
						<tr>
							<th>출고번호</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>출고수량</th>
							<th>재고량</th>
							<th>단위</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>


				<script>

				$("document").ready(function() {

					var date = $( "#datepicker" ).datepicker( "getDate" );
					console.log(date);
					
				})
				
				
		function topList(){
			$.ajax({
				url: 'releaseListAjax.im',
				data: {'date' : $( "#datepicker" ).datepicker( "getDate" )},
				success: function(list){
					$tableBody = $('#boardList tbody');
					$tableBody.html('');
					
    				$.each(list, function(i, obj){
						var $tr = $('<tr>');
						var $releaseNo = $('<td>').text(obj.releaseNo);
						var $snackNo = $('<td>').text(obj.snackNo);
						var $snackName = $('<td>').text(obj.snackName);
						var $amount = $('<td>').text(obj.amount);
						var $stock = $('<td>').text(obj.stock);
						var $unit = $('<td>').text(obj.unit);
						var $remark = $('<td>').text(obj.remark);
						
				
						
						$tr.append($releaseNo);
						$tr.append($snackNo);
						$tr.append($snackName);
						$tr.append($amount);
						$tr.append($stock);
						$tr.append($unit);
						$tr.append($remark);
						$tableBody.append($tr);
					});
				}
			});
		}
		
		$(function(){
			topList();
			<%--setInterval(function(){
				topList();
			}, 5000);--%>
		})
	</script>

				<div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="list.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item"><a class="page-link"
										href="list.bo?currentPage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link"
										href="">${ p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item"><a class="page-link"
									href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<button id="addBtn">출고 등록</button>

			</div>


		</div>


	</div>

	<script>
       
    
                const modal = document.getElementById("modal")
    const btnModal = document.getElementById("addBtn")
    btnModal.addEventListener("click", e => {
        modal.style.display = "flex"
    })
    
    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modal.style.display = "none"
    })

    window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
    }
})

// document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
        </script>
</body>


</html>