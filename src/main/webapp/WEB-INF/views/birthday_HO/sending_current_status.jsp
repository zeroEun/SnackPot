<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>    
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

        /*
        $(function(){
            $("#sending_expected").css("background","black")
            $("#sending_complete").css("background","darkgray")
                
            $("#sending_expected_table").show();
            $("#sending_complete_table").hide();
        });
		*/
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
            <tr>
                <td scope="row">1</td>
                <td>인사과</td>
                <td>부장</td>
                <td>김OO</td>
                <td>010-1111-2222</td>
                <td>1962-10-28</td>
                <td>2021-10-25</td>
            </tr>
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
            <tr>
                <td scope="row">1</td>
                <td>영업부</td>
                <td>대리</td>
                <td>차OO</td>
                <td>010-3333-4444</td>
                <td>1985-10-03</td>
                <td>2021-10-01</td>
            </tr>
        </tbody>
    </table>
    <button class="btn btn-dark">이전으로</button>
</body>
</html>