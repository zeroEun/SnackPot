<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
<style>

        /*본문 부분*/
        .content{
            height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
        }

        .company-name{
            background: rgb(245, 208, 66);
            padding: 10px 15px;
            border-radius: 0.25rem;
            text-align: center;
        }

        .btn-primary{
            float: right;
            margin-left: 5px;
        }

        .search-list{
            max-height: 300px;
            padding: 20px;
            background: seashell;
            overflow-y: auto;
            
        }

        .search-sub{
            display: inline-flex;
            margin-bottom: 10px;
            padding: 0px;
        }

        .search-table{
            background: white;
            margin: auto;
            
        }

        .search-select{
            margin-right: 10px;
        }

        .amount, .searchAmount{
            width: 50px;
        }

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>


    <section class="snacklist-view">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <div class="content col-10">
                    <h5>간식 리스트 조회</h5>
                    <hr>

					<!--  화면에 항상 있어야 할 정보 
						    회사명, 예산, 주문 마감일, 리스트 번호      
					 -->
					<c:if test="${ empty o }">
						<p>주문 가능한 간식 리스트가 없습니다.</p>
					</c:if>
					
					<c:if test="${ !empty o }">
					
                    <span class="company-name">${o.comName}</span>
                    <br><br>
                    <span class="">예산 : ${o.budget}원</span>&nbsp;&nbsp;&nbsp;
                    <span class="" id="totalPrice"></span>&nbsp;&nbsp;&nbsp;
                 	<span class="">주문 마감일 : ${o.orderDeadline}</span>&nbsp;&nbsp;&nbsp;
					<span class="">배송 예정일 : ${o.deliveryDate}</span>
					
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#wishModal" id="wishBtn">위시리스트 조회</button>
                    
					<!-- The Modal -->
					<div class="modal" id="wishModal">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">위시 리스트</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					      
					        <table class="table table-bordered wish-table" id="wish-table">
	                            <thead class="thead-light">
	                                <tr>
	                                    <th>카테고리</th>
	                                    <th>상세 카테고리</th>
	                                    <th>이미지</th>
	                                    <th>품목명</th>
	                                    <th>공급가</th>
	                                    <th>수량</th>
	                                    <th>금액</th>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                            </tbody>
					        </table>
					        
					      </div>
					
					      <!-- Modal footer -->
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					      </div>
					
					    </div>
					  </div>
					</div>
                   <!-- Modal end -->      
                                
                    <hr>
                 
                    <div class="search-list">
      
						<!-- 검색 부분 -->
                        <div class="search-sub ">
                            <form action="comSearchSnack.sn" method="post">    
	                            <select class="search-select category" name="category" id="category">
	                                <option value="0">카테고리</option>
	                                <option value="1">스낵</option>
	                                <option value="2">음료</option>
	                                <option value="3">간편식</option>
	                            </select>
	
	                            <select class="search-select subCategory" name="subCategory" id="subCategory">
	                                <option value="0">상세 카테고리</option>
	                            </select>
	
	                            <div class="input-group search-input">
	                                <input type="text" class="" placeholder="검색어 입력" name="search" aria-describedby="searchBtn">
	                                <button class="btn btn-warning" type="submit" id="searchBtn">검색</button>
	                            </div>
							</form>
                        </div>
                        
                        <!-- 검색 결과  리스트 -->
                        <table class="table table-bordered search-table">
                            <thead class="thead-light">
                                <tr>
                                    <th>카테고리</th>
                                    <th>상세 카테고리</th>
                                    <th>이미지</th>
                                    <th>품목명</th>
                                    <th>공급가</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th>리스트 추가</th>
                                </tr>
                            </thead>
    
                            <tbody>
                            
                            	<!-- 추가 버튼 클릭 시 회사 코드, 리스트번호, 해당 스낵 번호, 수량 넘기기 -->
                            	<c:forEach items="${searchList}" var="list">
                            		
                            		<form action="addOrderDList.sn" method="post" id="searchSubmitForm${list.snackNo}">
                            			<input type="hidden" name="comCode" value="${o.comCode}">
										<input type="hidden" name="orderNo" value="${o.orderNo}">
										<input type="hidden" name="snackNo" value="${list.snackNo}">
										<input type="hidden" name="amount" id="addDListAmount${list.snackNo}">
                            		</form>
                            		
                            		<input type="hidden" id="searchStock" value="${list.stock}">
                            		
                            		<tr>
	                                	<td>${list.categoryName}</td>
	                                    <td>${list.subCategoryName}</td>
	                                    <td></td>
	                                    <td>${list.snackName}</td>
	                                    <td class="searchPrice" id="searchPrice${list.snackNo}">${list.releasePrice}</td>
	                                    <td><input type="number" class="searchAmount" id="${list.snackNo}" min=1 max="${list.stock}" required></td>
	                                    <td class="searchTotalPrice" id="searchTotalPrice${list.snackNo}">${list.releasePrice * list.amount}</td>
	                                    <td><button type="button" class="addBtn" value="${list.snackNo}">추가</button></td>
                                	</tr>
                            	</c:forEach>
                            	
                            </tbody>
    
                        </table>

                    </div>

                    <!-- search end-->

                    <hr>
                    
                    <!-- 간식 리스트 부분 -->
                    <form action="deleteOrderDNo.sn" method="post" id="dListForm">
	                    <input type="hidden" name="orderNo" value="${o.orderNo}">
	                    
	                    <table class="table table-bordered list-table">
	                        <thead class="thead-light">
	                            <tr>
	                                <th>선택</th>
	                                <th>카테고리</th>
	                                <th>상세 카테고리</th>
	                                <th>이미지</th>
	                                <th>품목명</th>
	                                <th>공급가</th>
	                                <th>수량</th>
	                                <th>금액</th>
	                            </tr>
	                        </thead>
							
	                        <tbody>
	                            <c:forEach items="${dList}" var="dList">
	                            	<input type="hidden" id="dListStock" value="${dList.stock}">
	                            	
	                            	<tr>
		                            	<td>
		                                    <div class="form-check form-check-inline" style='zoom:1.5;'>
		                                        <input class="form-check-input" type="checkbox" name="orderDNoCheck" id="inlineCheckbox${dList.orderDNo}" value="${dList.orderDNo}">
		                                    </div>
		                                </td>
		                            	<td>${dList.categoryName}</td>
		                                <td>${dList.subCategoryName}</td>
		                                <td></td>
		                                <td>${dList.snackName}</td>
		                                <td>${dList.releasePrice}</td>
		                                <td><input type="number" class="amount" id="${dList.orderDNo}" value="${dList.amount}" min=1 max="${dList.stock}"></td>
		                                <td>${dList.releasePrice * dList.amount}</td>
	                                </tr>
	                                
	                            </c:forEach>
	                        </tbody>
	                    </table>
                    </form>
                    
                    <form action="updateOrderAmount.sn" method="post" id="updateOrderAmount">
		                <input type="hidden" name="amount" id="snackAmount">
		                <input type="hidden" name="orderDNo" id="orderDNo">
		            </form>
		            
		             <form action="snackOrder.sn" method="post" id="snackOrder">
		                <input type="hidden" name="orderNo" value="${o.orderNo}">
		            </form>
		            
		            
                    <!-- list end-->

                    <button type="button" class="btn btn-primary" id="orderBtn">주문 하기</button>
                    <button type="button" class="btn btn-primary" id="deleteBtn" >선택 항목 삭제</button>
					</c:if>
					
                </div>
            </div>
        </div>
    
    </section>
    
<script type="text/javascript">

	$(function(){
		
		selectTotalPrice();
		
		<%-- select option 값 선택시 이벤트 : on change  --%>
		$('#category').on('change', function(){
			
			var c = $('select[name=category]').val();
			console.log(c)
			
			$.ajax({
				
				url:'selectSubCate.sn',
				data: {cNo : c},
				success: function(category){
					
					$('#subCategory').html('');
					var $default = $(document.createElement('option')).val(0).text('상세 카테고리');
					$('#subCategory').append($default);
					
					$.each(category, function(index, value){
						
						var $opt = $(document.createElement('option')).val(value.detailNo).text(value.detailCategory);
						$('#subCategory').append($opt);
					})
					
				},error:function(){
					console.log("댓글 작성 ajax 통신 실패");
				}
				
			});

		})
		
		
		<%-- 선택항목 삭제 버튼 클릭 시--%>
		$('#deleteBtn').on('click', function(){
			
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result) $('#dListForm').submit();
			
		})
		
		<%-- 검색 부분 수량 변경 시 --%>
		$('.searchAmount').on('change', function(){
			var amount = $(this).val();
			var snackNo = $(this).attr('id');
			var stock = Number($('#searchStock').val());
			var price = $('#searchPrice' + snackNo).text();
			
			if(amount < 1){
				alert("최소 수량은 1입니다.");
				$(this).val(1);
			}
			
			if(amount > stock){
				alert("주문 가능한 수량을 초과하였습니다.");
				$(this).val(stock);
			}
			
			$('#searchTotalPrice' + snackNo).text($(this).val()*price);
			
		})
		
		<%-- 추가 버튼 클릭 시--%>
		$('.addBtn').on('click', function(){
			
			var orderNo = ${o.orderNo};
			var snackNo = $(this).val();
			var amount = $('#' + snackNo).val();
			
			if(amount < 1){
				alert("수량을 입력해 주세요.")
				$('#' + snackNo).focus();
			}else{
				$('#addDListAmount' + snackNo).attr('value', amount);
				
				<%-- snack중복 체크 --%>
				$.ajax({
					url:'checkOrderSnackDup.sn',
					data:{
						orderNo : orderNo,
						snackNo : snackNo
					},
					success: function(result){
						
						if(result > 0){
							alert("이미 리스트에 해당 항목이 존재합니다.");
						}else{
							$('#searchSubmitForm' + snackNo).submit();
							alert("추가되었습니다.");
						}
					},error:function(){
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
			}
		})
		
		<%-- 리스트에 있는 수량  변경 시--%>
		$('.amount').on('change', function(){
			
			var amount = $(this).val();
			var stock = Number($('#dListStock').val());
			var orderDNo = $(this).attr('id');
			
			if(amount < 1){
				alert("최소 수량은 1입니다.")
				$(this).val(1);
			}
			
			if(amount > stock){
				alert("주문 가능한 수량을 초과하였습니다.");
				$(this).val(stock);
			}
			
			$('#snackAmount').val($(this).val());
			$('#orderDNo').val(orderDNo);
				
			$('#updateOrderAmount').submit();
			
		})
		
		<%-- 리스트 발송 버튼 클릭 시--%>
		$('#orderBtn').on('click', function(){
			
			var result = confirm("주문하시겠습니까?");
			if(result){
				
				var orderNo =  ${o.orderNo};
				
				$.ajax({
					
					url:'checkOrderStock.sn',
					data:{orderNo:orderNo},
					success: function(list){
						
						console.log(list);
						
						if(list.length == 0){
							 $('#snackOrder').submit();
						}else{
							
							var snack = '';
							$.each(list, function(index, obj){
								snack += '품명 : ' + obj.snackName + ', 주문 가능 수량: ' + obj.stock + '\n'
							})
							
							alert('주문 수량을 초과한 제품이 있습니다.\n' +snack);
						}
						
					},error:function(){
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
				
			}
			
		});
	
		$('#wishBtn').on('click', function(){
			$('#wish-table tbody').empty();
			
			var wishNo = '${o.wishNo}';
			
			$.ajax({
				
				url:'selectComWishList.sn',
				type:'POST',
				data: {wishNo : wishNo},
				success: function(wishList){
					
					console.log(wishList);
					
					$.each(wishList, function(index, obj){
						
						console.log(obj);
						
						var category = $("<td>").text(obj.categoryName);
						var subCategory = $("<td>").text(obj.subCategoryName);
						var image = $("<td>").text(obj.changeName);
						var name = $("<td>").text(obj.snackName);
						var price = $("<td>").text(obj.releasePrice);
						var count = $("<td>").text(obj.count);
						var totalPrice = $("<td>").text(obj.releasePrice*obj.count);
						var tr = $("<tr>").append(category, subCategory, image, name, price, count, totalPrice);
						
						$('#wish-table tbody').append(tr);
					})
					
					
				},error:function(){
					console.log("댓글 작성 ajax 통신 실패");
				}
				
			});
			
		})
	
	})
	
	function selectTotalPrice(){
		var orderNo =  ${o.orderNo};
		
		$.ajax({
			
			url:'totalPrice.sn',
			data:{orderNo:orderNo},
			success: function(totalPrice){
				
				$('#totalPrice').text('총 금액 : ' + totalPrice + '원');
				
			},error:function(){
				console.log("댓글 작성 ajax 통신 실패");
			}
		});
			
	}	
	

</script>

</body>
</html>