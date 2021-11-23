<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사 로그인</title>
<style>
#outer{
            text-align: center;
        }
        #inner{
            display: inline-block;
            margin-top: 120px;
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
        #loginBtn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }
        a{
            font-size: 15px;
        }
        #mainBtn{
        	font-size: 25px;
        	font-weight: bold;
        	background: none;
        	border: none;
        	cursor: pointer;
        }
        #icon{
   		width: 20px;
   		}
</style>
</head>
<body>
<input type="button" value="MAIN" id="mainBtn" onclick="location='<%=request.getContextPath()%>/'">
<img id="icon" src="${ pageContext.servletContext.contextPath }/resources/images/common/back.png">
		<div id="outer">
            <div id="inner">
            
            	<form id="loginForm" method="POST">
                <h1 id="title">LOGIN</h1><br>
                <input type="text" class="input" id="sempNum" name="sempNum" placeholder=" 사원번호" minlength="1" maxlength="8"><br>
                <input type="password" class="input" id="sempPw" name="sempPw" placeholder=" 비밀번호" minlength="4" maxlength="10" autocomplete="new-password"><br>
                <div id="find"><a href="findPw.co">비밀번호 찾기</a><br><br></div>
                <button type="submit" id="loginBtn" formaction="loginEmp.sn">로그인</button><br>
                </form>
            </div>
        </div>
</body>
</html>