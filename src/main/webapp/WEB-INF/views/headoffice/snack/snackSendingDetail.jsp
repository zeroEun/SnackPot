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


</style>
</head>
<body>

    <section class="snack-d-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">


                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
                <div class="content col-8">
                    <h5>간식 리스트 발송 내역</h5>
                    <hr>

                    <div class="company">
                       
                        <div class="company-name">${sList.comName}</div>

                        <span class="">리스트 발송일: ${sList.transDate}</span>
                        <span class="">예산: ${sList.budget} </span>
                        <span class="">총 금액: ${sList.totalPrice}</span>


                    </div>

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
	                                <td></td>
	                                <td>${d.snackName}</td>
	                                <td>${d.releasePrice}</td>
	                                <td>${d.amount}</td>
	                                <td>${d.releasePrice*d.amount}</td>
                           		</tr>
                        	</c:forEach>

                        </tbody>

                    </table>

                    <button type="button" class="btn btn-primary" onclick="location.href='sendingList.sn'">목록으로</button>

                </div>
            </div>
        </div>
    
    </section>



</body>
</html>