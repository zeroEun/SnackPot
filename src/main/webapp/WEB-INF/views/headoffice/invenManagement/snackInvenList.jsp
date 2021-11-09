<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>

  <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    	<div class="row flex-nowrap">

		<jsp:include page="../../common/sidebar.jsp"/>
	
    <div id="arrivalWrap">

        <h3>재고 관리</h3>

        <input type="date">
        <br>
        <form name="search">
        <select name="searchType">
            <option value="1">상품코드</option>
            <option value="2">상품명</option>
            <option value="3">입고번호</option>
        </select>
        <input type="text" name="searchInput">
        <input type="submit" name="searchBtn">
        </form>
        <br>
        <br>
        <table id="arrivalList" border="1">


            <tr>  
                <th>상품코드</th>  
                <th>상품명</th>   
                <th>카테고리</th>   
                <th>세부카테고리</th>   
                <th>재고량</th>              
                <th>단위</th>   
                <th>상세조회</th>   
            </tr>

        </table>
        

    </div>
      </div>
        </div>
</body>
</html>