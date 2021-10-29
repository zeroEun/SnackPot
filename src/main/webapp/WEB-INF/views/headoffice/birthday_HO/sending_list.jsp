<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
    $(function(){
        $("#sending_list1").click(function(){
            var checkYN = $("#sending_list1").is(":checked")

            if(checkYN == true){
                $("input[name='sending_check']").attr("checked",true);
            }else{
                $("input[name='sending_check']").attr("checked",false);
            }
        })

    })
</script>
<body>
    <h3>OO월 발송 리스트</h3>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" name="sending_check" id="sending_list1">
        <label class="form-check-label" for="sending_list1">전체 선택</label>
    </div>
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
            <tr>
                <td><input name="sending_check" type="checkbox">1</td>
                <td>기획1팀</td>
                <td>부장</td>
                <td>하OO</td>
                <td>010-1234-5454</td>
                <td>1968-11-02</td>
                <td>2021-10-30</td>
            </tr>
            <tr>
                <td><input name="sending_check" type="checkbox">2</td>
                <td>기획1팀</td>
                <td>부장</td>
                <td>하OO</td>
                <td>010-1234-5454</td>
                <td>1968-11-02</td>
                <td>2021-10-30</td>
            </tr>
        </tbody>
    </table>
</body>
</html>