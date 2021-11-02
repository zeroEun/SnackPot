<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <script>
        window.onload=function(){
            $("#sending_expected").css("background","black")
            $("#sending_complete").css("background","darkgray")
                        
            $("#sending_expected_table").show();
            $("#sending_complete_table").hide();
        }

        $(document).ready(function(){
            $("#sending_expected").click(function(){
                $("#sending_expected").css("background","black")
                $("#sending_complete").css("background","darkgray")
                
                $("#sending_expected_table").show();
                $("#sending_complete_table").hide();
            });
        });
        $(document).ready(function(){
            $("#sending_complete").click(function(){
                $("#sending_expected").css("background","darkgray")
                $("#sending_complete").css("background","black")
                
                $("#sending_expected_table").hide();
                $("#sending_complete_table").show();
            });
        });
    </script>
    <button type="button" class="btn btn-secondary" id="sending_expected">발송 예정</button>
    <button type="button" class="btn btn-secondary" id="sending_complete">발송 완료</button>
    
    <table class="table" id="sending_expected_table">
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
	        <c:forEach items="${ list }" var="curSts" varStatus="status">
	        <c:if test="${ curSts.selectDate == null }">
	        <c:set var="num1" value="${ num1+1 }"/>
	            <tr>
	                <td scope="row">${ num1 }</td>
	                <td>${ curSts.cempDept }</td>
	                <td>${ curSts.cempJob }</td>
	                <td>${ curSts.cempName }</td>
	                <td>${ curSts.cempPhone }</td>
	                <td>${ curSts.cempBirth }</td>
	                <td>${ curSts.sendingMsgDate }</td>
	            </tr>
	        </c:if>
	        </c:forEach>
        </tbody>
    </table>
	
	
    <table class="table" id="sending_complete_table">
        <thead class="thead-light">
            <tr>
                <th scope="col">번호</th>
                <th scope="col">부서명</th>
                <th scope="col">직급명</th>
                <th scope="col">사원명</th>
                <th scope="col">전화번호</th>
                <th scope="col">생일날짜</th>
                <th scope="col">선택완료일</th>
            </tr>
        </thead>
        <tbody>
        	
            <c:forEach items="${ list }" var="curSts" varStatus="status">         
	        <c:if test="${ curSts.selectDate != null }">
	        <c:set var="num2" value="${ num2+1 }"/>
	            <tr>
	                <td scope="row">${ num2 }</td>
	                <td>${ curSts.cempDept }</td>
	                <td>${ curSts.cempJob }</td>
	                <td>${ curSts.cempName }</td>
	                <td>${ curSts.cempPhone }</td>
	                <td>${ curSts.cempBirth }</td>
	                <td>${ curSts.sendingMsgDate }</td>
	            </tr>
	        </c:if>
	        </c:forEach>
        </tbody>
    </table>
    <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
</body>
</html>