<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <h3>OO월 발송 리스트</h3>    
    <table class="table">
        <thead class="thead-light">
            <tr>
                <th scope="col">번호</th>
                <th scope="col">부서명</th>
                <th scope="col">직급명</th>
                <th scope="col">사원명</th>
                <th scope="col">전화번호</th>
                <th scope="col">생일날짜</th>
                <th scope="col">발송예정일</th>
            </tr>            
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="sendList">
        	<c:set var="num" value="${num+1 }"/>
            <tr>
                <td>${num }</td>
                <td>${sendList.cempDept }</td>
                <td>${sendList.cempJob }</td>
                <td>${sendList.cempName }</td>
                <td>${sendList.cempPhone }</td>
                <td>${sendList.cempBirth }</td>
                <td>${sendList.sendMsgDate }</td>
            </tr>
            </c:forEach>   
        </tbody>
    </table>
</body>
</html>