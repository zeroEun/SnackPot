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

        .search{
            margin: 15px 0px;
        }

</style>

</head>
<body>

    <section class="snack-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
                <div class="content col-8">
                    <h5>간식 리스트 발송 내역</h5>
                    <hr>

                    <div class="search">
                        <select class="search-select" id="sel1">
                            <option>카테고리</option>
                            <option>회사명</option>
                            <option>발송 내역</option>
                        </select>

                        <input type="text" class="" placeholder="검색어 입력">

                        <input type="date" >
                        <input type="date" >

                        <button class="" type="button">검색</button>
                    </div>

                    <table class="table table-bordered ">
                        <thead class="thead-light">
                            <tr>
                                <th>회사명</th>
                                <th>리스트 발송일</th>
                                <th>발송 내역</th>
                            </tr>
                        </thead>

                        <tbody>
                        	<c:forEach items="${sendingList}" var="s">
                        		<tr>
	                                <td>${s.comName}</td>
	                                <td>${s.transDate}</td>
	                                <td>꼬북칩 외...</td>
                            	</tr>
                        	
                        	</c:forEach>
                        </tbody>

                    </table>

                </div>
            </div>
        </div>
    
    </section>

</body>
</html>