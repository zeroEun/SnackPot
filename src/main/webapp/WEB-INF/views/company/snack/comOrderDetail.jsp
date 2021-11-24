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

        .company{
            background-color: seashell;
            margin: 15px 0px;
            padding: 15px;
        }

		.btn-primary{
            float: right;
            margin: 10px 5px;
        }
        .image{
			width: 50px;
			height: 50px;
		}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

    <section class="order-d-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">
            
                <div class="content col-8">
                    <h5>주문 상세 내역</h5>
                    <hr>

                    <div class="company">
                       
                        <div class="company-name">${orders.comName}</div>

						<span class="">주문 번호: ${orders.orderNo}</span>
                        <span class="">예산: ${orders.budget} </span>
                        <span class="">총 금액: ${orders.totalPrice}</span>
                        <br>
                        <span class="">주문일: ${orders.orderDate}</span>
                        <span class="">발송 예정일: ${orders.deliveryDate}</span>
                        <span class="">발송일: ${orders.releaseDate}</span>

                    </div>
                    
                    <button type="button" class="btn btn-primary" id="orderCancelBtn">주문 취소</button>
                    
                    <hr>
					
                    <table class="table table-bordered ">
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
                        	<c:forEach items="${dList}" var="d">
                        		<tr>
	                                <td>${d.categoryName}</td>
	                                <td>${d.subCategoryName}</td>
	                                <td><img class="image" src="${ pageContext.servletContext.contextPath }/resources/images/${d.imageName}"></td>
	                                <td>${d.snackName}</td>
	                                <td>${d.releasePrice}</td>
	                                <td>${d.amount}</td>
	                                <td>${d.releasePrice * d.amount}</td>
                           		</tr>
                        	</c:forEach>
                        </tbody>

                    </table>

                    <button type="button" class="btn btn-primary" onclick="location.href='comOrderList.sn'">목록으로</button>
                    
                </div>
            </div>
        </div>
    
    </section>

<script type="text/javascript">

$(function(){
	
	var status = '${orders.orderStatus}'
		
	if(status != 'Y'){
		$('#orderCancelBtn').attr('disabled', true);
	}
	
	<%-- 주문 취소 버튼 클릭 시 --%>
	$('#orderCancelBtn').on('click', function(){
		
		var orderNo = ${orders.orderNo}
		var result = confirm("정말 취소하시겠습니까?")
		if(result){
			
			$.ajax({
				
				url:"comOrderCancel.sn",
				type:'POST',
				data: {orderNo:orderNo},
				success: function(result){
					
					console.log(result);
					if(result == 'success'){
						alert("주문이 취소되었습니다.");
						$('#orderCancelBtn').attr('disabled', true);
					}
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
			
		}
		
	})
	
	
})


</script>

</body>
</html>