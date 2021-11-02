<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사 관리자 정보변경</title>
  <style>
        #outer{
            text-align: center;
        }
        #inner{
            display: inline-block;
        }
        #title{
            color: rgb(245, 208, 66);
        }
        .input{
            background-color: rgb(246, 242, 225);
            border: none;
            width: 300px;
            height: 40px;
            margin: 10px;
        }
        #btn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }
        #ck{
            font-size: 12px;
        }
    </style>
</head>
<body>
 <form action="insertComMem.co" method="POST">
        <div id="outer">
            <div id="inner">
                <h1 id="title">MODIFY</h1><br>
                <div id="modify"><a href="">비밀번호 변경</a><label> &ensp; </label><a href="">회원 탈퇴</a><br><br></div>
                <input type="text" class="input" id="memId" name="memId" placeholder=" 아이디" minlength="4" maxlength="16"><br>
                <input type="password" class="input" id="memPw" name="memPw" placeholder=" 비밀번호" minlength="10" maxlength="16"><br>
                <input type="password" class="input" id="memPwCheck" name="memPwCheck" placeholder=" 비밀번호 확인" minlength="10" maxlength="16"><br>
                <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" maxlength="4"><br>
                <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" maxlength="11"><br>
                <input type="text" class="input" name="memEmail" placeholder=" 이메일"><br>
                <div id="adminForm">
                    <input type="text" class="input" name="comName" placeholder=" 회사명"><br>
                    <input type="text" class="input" name="comAddress" placeholder=" 회사주소"><br>
                </div>
                <button type="submit" id="btn">정보수정</button>
            </div>
        </div>
    </form>
<script>

    //휴대폰 번호 
    $("#phone").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));
    });
    
    //비밀번호 
    $("#memPw").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    });

    //비밀번호 확인
    $("#memPwCheck").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    });

    //이름 
    $(document).ready(function(){

    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;    

        $("#memName").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
       });

    });       

</script>
</body>
</html>