<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
    .per_amount{
        display: inline;
    }
    .sending_time{
        display: inline;
    }
</style>
<body>
    <h3>생일 구독 신청</h3>
    <form class="" action="subscribe.birth" method="post">
        <label for="">1인당 최대 금액</label>
        <div class="form-group">            
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount1" value="10000">
                <label class="form-check-label" for="per_amount1">10,000원</label>
            </div>
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount2" value="30000">
                <label class="form-check-label" for="per_amount2">30,000원</label>
            </div>
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount3" value="50000">
                <label class="form-check-label" for="per_amount3">50,000원</label>
            </div>
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount4" value="100000">
                <label class="form-check-label" for="per_amount4">100,000원</label>
            </div>
        </div>
        <hr>
        <label for="">발송 시점</label>
        <div class="form-group">            
            <div class="form-check sending_time">
                <input class="form-check-input" type="radio" name="sending_time" id="sending_time1" value="당일">
                <label class="form-check-label" for="per_amount1">당일</label>
            </div>
            <div class="form-check sending_time">
                <input class="form-check-input" type="radio" name="sending_time" id="sending_time2" value="3일전">
                <label class="form-check-label" for="per_amount2">3일 전</label>
            </div>
            <div class="form-check sending_time">
                <input class="form-check-input" type="radio" name="sending_time" id="sending_time3" value="5일전">
                <label class="form-check-label" for="per_amount2">5일 전</label>
            </div>
        </div>
        <hr>
        <label for="">선물 선택 알림 메시지</label>
        <div class="form-group">
            <select class="custom-select custom-select-md" id="sendMsg">
                <option value="0" selected>선택</option>
                <option value="1">선택1 메시지에요~</option>
                <option value="2">선택2 메시지에요~</option>
                <option value="3">직접 입력</option>
            </select>
            <textarea class="form-control" id="sendMsgArea" name="notification_msg" cols="50" rows="5" style="resize: none;" placeholder="선택하세요." disabled></textarea>
        </div>
        <script>
            $(function(){
                $("#sendMsg").on('change', function(){
                    //console.log($("#sendMsg").val());
                    var sendMsgNum = $("#sendMsg").val();
                    var sendMsg = $("#sendMsg option:checked").text();
                    
                    switch(sendMsgNum){
                    case "0" :
                        $("#sendMsgArea").attr("disabled", true);
                        $("#sendMsgArea").attr("readonly", false);
                        $("#sendMsgArea").attr("placeholder", "선택하세요.");
                        $("#sendMsgArea").val("");                        
                        break;
                    case "1" :
                        $("#sendMsgArea").attr("disabled",false);
                        $("#sendMsgArea").attr("readonly",true);
                        $("#sendMsgArea").val(sendMsg);
                        break;
                    case "2" :
                        $("#sendMsgArea").attr("disabled",false);
                        $("#sendMsgArea").attr("readonly",true);
                        $("#sendMsgArea").val(sendMsg);                       
                        break;
                    case "3" :
                        $("#sendMsgArea").attr("disabled", false);
                        $("#sendMsgArea").attr("readonly", false);
                        $("#sendMsgArea").attr("placeholder", "이곳에 메시지를 입력하세요.");
                        $("#sendMsgArea").val("");                        
                        break;
                    
                    }
                });
            });
            
            $(function(){
                $("#subscribe").click(function(){
                	var perAmount = $("input[name='per_amount']:checked").val();
                    var sendingTime = $("input[name='sending_time']:checked").val();
                    var notificationMsg = $("textarea[name='notification_msg']").val();

                    //console.log(perAmount);
                    //console.log(sendingTime);
                    //console.log(notificationMsg);

                    if(perAmount == null){
                        alert("1인당 최대 금액을 설정해주세요.")
                        return false;            
                    }else{
                        if(sendingTime == null){
                            alert("발송 시점을 선택해주세요.")
                            return false;
                        }else{
                            if(notificationMsg == "" || notificationMsg == null){
                                alert("선물 선택 알림 메시지를 설정해주세요.")
                                return false;
                            }
                        }
                    }
                })
                
            })
        </script>
        <hr>
        <label for="">수신자 정보</label><br>
        <button type="button" class="btn btn-dark" id="callEmpList">사원 리스트 불러오기</button>
        
        <h6 id="countResult1">총 <b id="empCount">${countEmp }</b>명이 등록되었습니다.</h6>
		
        <h6 id="countResult2">사원 정보가 존재하지 않습니다. <button type="button" id="moveRegisterPage" class="btn btn-primary">등록하러 가기</button></h6>
        <script>
        	$(function(){
        		$("#countResult1").hide();
    			$("#countResult2").hide();
        	});
        	$(function(){
        		$("#callEmpList").click(function(){
            		var countEmp = ${countEmp};
            		//console.log(countEmp);
            		//console.log(typeof(countEmp));
            		
            		if(countEmp > 0){
            			$("#countResult1").show();
            			$("#countResult2").hide();
            		}else{
            			$("#countResult1").hide();
            			$("#countResult2").show();
            		}
            		
            	});
        	});
        	
        	$(function(){
        		$("#moveRegisterPage").click(function(){
            		location.href=""; /* 사원 등록 페이지로 이동 */
            	})
        	})
        </script>
        
        <hr>
        
        <input type="hidden" name="com_code" value="${comCode}">
        
        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button><button type="submit" id="subscribe" class="btn btn-outline-primary">구독 신청하기</button>
    </form>
</body>
</html>