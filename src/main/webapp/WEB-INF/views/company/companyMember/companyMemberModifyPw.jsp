<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사 멤버 비밀번호 변경</title>
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
        #modifyBtn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }
        #exitBtn{
            background-color: rgb(255, 255, 255);
            border-color: rgb(245, 208, 66);
            border-style: solid;
            width: 300px;
            height: 58px;
            margin: 10px;
            font-size: 15px;
            font-weight: bold;
        }

    </style>
</head>
<body>
 <form method="POST">
        <div id="outer">
            <div id="inner">
                <h1 id="title">MODIFY</h1><br>
                <input type="password" class="input" id="originPw" name="originPw" placeholder=" 현재 비밀번호" minlength="10" maxlength="16"><br>
                <input type="password" class="input" id="MemPw" name="MemPw" placeholder=" 새 비밀번호 (영문, 숫자 조합 10~16자)" minlength="10" maxlength="16"><br>
                <input type="password" class="input" id="memPwCheck" name="memPwCheck" placeholder=" 새 비밀번호 확인" minlength="10" maxlength="16"><br>
                <button type="submit" id="modifyBtn" formaction="findIdBtn.co">비밀번호 변경하기</button><br>
                <button type="submit" id="exitBtn" formaction="insertComMem.co">다음에 변경하기</button>
            </div>
        </div>
    </form>
</body>
</html>