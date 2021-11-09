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

        .amount{
            width: 50px;
        }

</style>
</head>
<body>

    <section class="list-trans">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
				
                <div class="content col-8">
                    <h5>간식 리스트 발송</h5>
                    <hr>

					<!--  화면에 항상 있어야 할 정보 
						    회사명, 예산, 주문 마감일, 리스트 번호      
					 -->
					 
					<form action="createList.sn" method="post" id="submitForm">
						<input type="hidden" name="comCode" value="${s.comCode}">
						<input type="hidden" name="listNo" value="${listNo}">
					</form> 
					
                    <span class="company-name">${s.comName}</span>
                    <br><br>
                    <span class="">예산 : ${s.budget}원</span>&nbsp;&nbsp;&nbsp;
                    <span class="">총 금액 : 500,000원</span>&nbsp;&nbsp;&nbsp;
                 	<span class="">주문 마감일 : ${s.orderDeadline}</span>

                    <button type="button" class="btn btn-primary">위시리스트 조회</button>
                  	<button type="button" class="btn btn-primary" onclick="$('#submitForm').submit();">리스트 생성</button>
                   
                    <hr>
                 
                    <div class="search-list">
      
						<!-- 검색 부분 -->
                        <div class="search-sub ">
                            <form action="searchSnack.sn">    
                            	<input type="hidden" name="comCode" value="${s.comCode}">
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
                        
                        <!-- 검색 결과 -->
                        <table class="table table-bordered search-table">
                            <thead class="thead-light">
                                <tr>
                                    <th>카테고리</th>
                                    <th>상세 카테고리</th>
                                    <th>이미지</th>
                                    <th>품목명</th>
                                    <th>공급가</th>
                                    <th>수량</th>
                                    <th>재고</th>
                                    <th>리스트 추가</th>
                                </tr>
                            </thead>
    
                            <tbody>
                            
                            	<!-- 추가 버튼 클릭 시 리스트번호, 해당 스낵 번호, 수량 넘기기 -->
                            	<c:forEach items="${searchList}" var="list">
                            		<tr>
	                                	<td>${list.categoryName}</td>
	                                    <td>${list.subCategoryName}</td>
	                                    <td></td>
	                                    <td>${list.snackName}</td>
	                                    <td>${list.releasePrice}원</td>
	                                    <td><input type="number" class="amount" value=1 min=1></td>
	                                    <td>${list.stock}</td>
	                                    <td><button type="button" class="addBtn" >추가</button></td>
                                	</tr>
                            	</c:forEach>
                            	
                            </tbody>
    
                        </table>

                    </div>

                    <!-- search end-->

                    <hr>
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
                                <th>재고</th>
                                
                            </tr>
                        </thead>

                        <tbody>
                            
                            <c:forEach items="${dList}" var="dList">
                            	<tr>
	                            	<td>
	                                    <div class="form-check form-check-inline" style='zoom:1.5;'>
	                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="${dList.snackDNo }">
	                                    </div>
	                                </td>
	                            	<td>${dList.categoryName}</td>
	                                <td>${dList.subCategoryName}</td>
	                                <td></td>
	                                <td>${dList.snackName}</td>
	                                <td>${dList.releasePrice}원</td>
	                                <td><input type="number" class="amount" value="${dList.amount}" min=1></td>
	                                <td>${dList.stock}</td>
                                </tr>
                            </c:forEach>


                        </tbody>

                    </table>
                    <!-- list end-->

                    <button type="button" class="btn btn-primary">리스트 발송</button>
                    <button type="button" class="btn btn-primary">선택 항목 삭제</button>

                </div>

               


            </div>
        </div>
    
    </section>
    
<script type="text/javascript">

	$(function(){
		
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
		
		
		
		
		
	});

</script>

</body>
</html>