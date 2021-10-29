<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <link rel="stylesheet" href="resources/css/companyMemberEnrollForm.css?afterww">
<title>구독회사 멤버 회원가입</title>
</head>
<body>
	<form id="enrollForm" action="insertComMem.co" method="POST" autocomplete="off">
        <div id="outer">
        <div id="inner">
        <h1 id="title">SIGN UP</h1><br>
        <input type="radio" class="radioVal" id="member" value="member" name="memType" checked><label for="member">사원</label>
        <input type="radio" class="radioVal" id="admin" value="admin" name="memType"><label for="admin">관리자</label><br>
        <input type="text" class="input" name="comCodeMem" placeholder=" 회사코드" autocomplete="off"><br>
        &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<input type="text" class="input" id="memId" name="memId" placeholder=" 아이디 (영문, 숫자 조합 4~16자리)" minlength="4" maxlength="16">
        <button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button><br>
        <input type="password" class="input" id="memPw" name="memPw" placeholder=" 비밀번호 (영문, 숫자 조합 10~16자)" minlength="10" maxlength="16" autocomplete="new-password"><br>
        <input type="password" class="input" id="memPwCheck" name="memPwCheck" placeholder=" 비밀번호 확인" minlength="10" maxlength="16"><br>
        <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" maxlength="4"><br>
        <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" maxlength="11"><br>
        <input type="text" class="input" name="memEmail" placeholder=" 이메일"><br>
        <div id="adminForm" style="display: none;">
        <input type="text" class="input" name="comName" placeholder=" 회사명"><br>
        <input type="text" class="input" name="comAddress" placeholder=" 회사주소"><br>
        </div>
        <input type="checkbox"><label id="ck">개인정보 수집 및 이용에 동의합니다.</label><br>
        <button type="submit" id="joinBtn" disabled="disabled">회원가입 하기</button>
        </div>
        </div>
    </form>
<script>

    //휴대폰 번호 
    $("#phone").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/g,''));
    });
    
    //아이디 
    $("#memId").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
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
    
    //멤버 관리자 체크
    $(".radioVal").on('click', function() {
        var valueCheck = $('input[name="memType"]:checked').val();
        if ( valueCheck == "member" ) {
            $("#adminForm").hide();
        } else {
            $("#adminForm").show(); 
        }
    });
    
    //아이디 중복체크
    function checkId(){
		var memId = $("#enrollForm input[name=memId]");
		if(memId.val()==""){
			alert("아이디를 입력해주세요");
			return false;
		}
		$.ajax({
			url: "idCheck.co",
			type:"post",
			data:{memId : memId.val()},
			success:function(result){
				if(result > 0){
					alert("사용할 수 없는 아이디 입니다.");
					memId.focus();
				}else{
					if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
						memId.attr("readonly","true");
						$("#joinBtn").removeAttr("disabled");
					}else{
						memId.focus();
					}
				}
			},
			error:function(){
				console.log("서버통신실패");
			}
		})
	}

</script>
</body>
</html>