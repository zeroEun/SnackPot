<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사 멤버 비밀번호 찾기</title>
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
        #findPwBtn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
 <form method="POST">
        <div id="outer">
            <div id="inner">
                <h1 id="title">FIND PW</h1><br>
                <input type="text" class="input" id="memId" name="memId" placeholder=" 아이디" minlength="4" maxlength="16"><br>
                <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" maxlength="4"><br>
                <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" maxlength="11"><br>
                <button type="submit" id="findPwBtn" formaction="findPwBtn.co">비밀번호 찾기</button><br>
            </div>
        </div>
    </form>
</body>
</html>