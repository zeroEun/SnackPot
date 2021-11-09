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

        .month{
            background: rgb(245, 208, 66);
            padding: 10px 15px;
            border-radius: 0.25rem;
            
        }

</style>
</head>
<body>

    <section class="list-schedule">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
                <div class="content col-8">
                    <h5>간식 리스트 발송</h5>
                    <hr>

                    <label class="month"></label>

                    <table class="table table-bordered ">
                        <thead class="thead-light">
                            <tr>
                                <th>회사명</th>
                                <th>리스트 발송 예정일</th>
                                <th>주문 마감일</th>
                                <th>간식 배송 예정일</th>
                                <th>리스트 발송 여부</th>
                            </tr>
                        </thead>

                        <tbody>
	                        <c:forEach items="${schedule}" var="s">
	                        
	                        	<form action="createListForm.sn" method="post"  class="postForm" id="postForm${s.subsNo}">
	                        		<input type="hidden" name="subsNo" value="${s.subsNo}">
	                        		<input type="hidden" name="comCode" value="${s.comCode}">
	                        		<input type="hidden" name="comName" value="${s.comName}">
	                        		<input type="hidden" name="orderDeadline" value="${s.orderDeadline}">
	                        		<input type="hidden" name="deliveryDate" value="${s.deliveryDate}">
	                        		<input type="hidden" name="budget" value="${s.budget}">
	                        	</form>
	                        
	                            <tr>
	                                <td><button type="button"  class="btn comBtn" id="comBtn" value="postForm${s.subsNo}">${s.comName}</button></td>
	                                <td>${s.listTransDate}</td>
	                                <td>${s.orderDeadline}</td>
	                                <td>${s.deliveryDate}</td>
	                                <td>${s.status}</td>
	                            </tr>
							</c:forEach>
                        </tbody>

                    </table>

                </div>
                
            </div>
        </div>
    
    </section>
    
    
<script type="text/javascript">
	$(function(){
		var today = new Date();
		var month = today.getMonth()+1+'월';
		$('.month').text(month);
	
		
		$('.comBtn').click(function(){
			
			var no = '#' + $(this).val();
			$(no).submit();
		});
		
		
	});
</script>

</body>
</html>