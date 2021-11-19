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
    #birthContainer{
    	margin-top: 30px;
    }
    #birthSubOuter{
    	margin: auto;
    	width: 100%;
    	/*border: 1px solid black;*/
    	/*padding: 3rem;*/
    }
    #subsBirthService{
    	margin: auto;
    	width: 80%;
    }
    .per_amount, .sending_time{
    	
    }
    .per_amount input[name="per_amount"], .sending_time input[name="sending_time"]{
		display:none;
	}
	.per_amount input[name="per_amount"] + span, .sending_time input[name="sending_time"] + span{
		display:inline-block;
		background:none;
		border:1px solid #dfdfdf;  
		padding:0px 10px;
		text-align:center;
		height:35px;
		line-height:33px;
		font-weight:500;
		cursor:pointer;
	}
	.per_amount input[name="per_amount"]:checked + span, .sending_time input[name="sending_time"]:checked + span{
		border:1px solid #23a3a7;
		background:#23a3a7;
		color:#fff;
	}
	.per_amount_div, .sending_time_div{
		width: 15%;
	}
	#modalBtn{
		float: right;
		background: rgb(10, 23, 78);
		color: rgb(245, 208, 66);
		font-weight: bolder;
	}
	#modalBtn:hover{
		float: right;
		transition-duration: 0.7s;
		background: rgb(245, 208, 66);
		color: rgb(10, 23, 78);

	}
</style>
<body>

<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<%-- 생일 구독을 이미 하고 있는지 체크 --%>
	<script>
		$(function(){
			
			console.log("${loginUser.comCode}");
			
			var chkResult = ${chkResult};
			console.log("chkResult : "+chkResult);
			
			$("#chkService").hide();
			
			if(chkResult>0){
				$("#subsBirthService").hide();
				$("#chkService").show();
			}
		});
	</script>
	<section>
		<div class="container-fluid" id="birthContainer">
			<div id="birthSubOuter">
				
			    <%-- 이미 구독 중일 때 나타내는 정보 --%>
			    <div id="chkService">
			    	<h4>생일 구독 신청</h4>
					<hr>
			    	<h5>생일 구독 정보가 이미 존재합니다.</h5>
			    </div>
			    
			    <%-- 구독 중이지 않을 때 나타내는 정보 --%>
			    <form class="" id="subsBirthService" action="subscribe.birth" method="post">
			    	<h4 style="text-align:center;">생일 구독 신청</h4>
					<hr>
			    	<input type="hidden" name="comCode" value="${loginUser.comCode }"/>
			        <div class="form-group row">
			        	<label class="col-md-3">1인당 최대 금액</label>
			        	<div class="col-md-9 row">
			        		<div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount1">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount1" value="10000">
				                <span>10,000원</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount2">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount2" value="30000">
				                <span>30,000원</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount3">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount3" value="50000">
				                <span>50,000원</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount4">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount4" value="100000">
				                <span>100,000원</span>
				                </label>
				            </div>
			        	</div>
			        </div>
			        <hr>
			        
			        <div class="form-group row">
			        	<label class="col-md-3">발송 시점</label>
			        	<div class="col-md-9 row">
			        		<div class="form-check form-check-inline sending_time_div">
				                <label class="form-check-label sending_time" for="sending_time1">
				                <input class="form-check-input" type="radio" name="sending_time" id="sending_time1" value="당일">
								<span>당일</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline sending_time_div">
				                <label class="form-check-label sending_time" for="sending_time2">
				                <input class="form-check-input" type="radio" name="sending_time" id="sending_time2" value="3일전">
				                <span>3일 전</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline sending_time_div">
				                <label class="form-check-label sending_time" for="sending_time3">
				                <input class="form-check-input" type="radio" name="sending_time" id="sending_time3" value="5일전">
				                <span>5일 전</span>
				                </label>
				            </div>
			        	</div>
			        </div>
			        <hr>
			        
			        <div class="form-group row">
			        	<label class="col-md-3">선물 선택 알림 메시지</label>
			        	<div class="col-md-9 row">
			        		<select class="custom-select custom-select-md" id="sendMsg">
				                <option value="0" selected>선택</option>
				                <option value="1">선택1 메시지에요~</option>
				                <option value="2">선택2 메시지에요~</option>
				                <option value="3">직접 입력</option>
				            </select>
				            <textarea class="form-control" id="sendMsgArea" name="notification_msg" cols="50" rows="5" style="resize: none;" placeholder="선택하세요." disabled></textarea>
			        	</div>
			        </div>
			        <hr>
			        
			        <div class="form-group row">
			        	<label class="col-md-3">수신자 정보</label><br>
			        	<div class="col-md-9 row">
			        		<button type="button" class="btn btn-dark" id="callEmpList">사원 리스트 불러오기</button>
					        <h6 id="countResult1">총 <b id="empCount">${countEmp }</b>명이 등록되었습니다.</h6>
					        <h6 id="countResult2">사원 정보가 존재하지 않습니다. <button type="button" id="moveRegisterPage" class="btn btn-primary">등록하러 가기</button></h6>
			        	</div>
			        </div>
					<hr>
					
			        <%-- 나중에 세션에 있는 로그인 유저 객체의 comCode를 form전송, name도 클래스 객체 필드에 맞게 수정--%>
			        <input type="hidden" name="com_code" value="${loginUser.comCode}">
			        
			        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
			        <button type="button" class="btn btn-outline-primary" id="modalBtn" data-toggle="modal" data-target="#subscribeBtn">구독 신청하기</button>
			        
			        <div class="modal fade" id="subscribeBtn" tabindex="-1" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">생일 구독</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					       <div class="modal-body">
							   <h5>생일 구독 서비스를 신청하시겠습니까?</h5>
				               <hr>
				               <h6>- 1인당 최대 금액 : <span id="modalInfo1"></span></h6>
				               <h6>- 발송 시점 : <span id="modalInfo2"></span></h6>
				               <h6>- 선택 알림 메시지 : <span id="modalInfo3"></span></h6>
				               <hr>
				               <h5>결제일은 매월 1일입니다.</h5>
						   </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="submit" id="subscribe" class="btn btn-primary">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
			    </form>
			</div>
		</div>
	</section>
	
	
    
	<script>
		<%-- 선택 알림 메시지 항목에서 메시지 내용을 선택하는 부분 --%>
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
		<%-- 구독신청 버튼을 눌렀을 때 모든 사항이 입력돼야 신청이 되도록 설정 --%>
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
	<script>
		<%-- 사원리스트 불러오기 버튼을 누른 후 나타나게될 두 가지 결과를 먼저 hide --%>
		$(function(){
			$("#countResult1").hide();
			$("#countResult2").hide();
		});
		<%-- 사원리스트 불러오기 버튼을 누르면 사원 유무에 따라 결과가 다르게 나타나게 설정 --%>
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
	    			return false;
	    		}
	    		
	    	});
		});
		<%-- 사원 등록이 아직 완료되지 않은 경우 사원 등록 페이지로 이동할 수 있게 설정 --%>
		$(function(){
			$("#moveRegisterPage").click(function(){
	    		location.href=""; /* 사원 등록 페이지로 이동 */
	    	})
		});
		<%-- 구독 신청 버튼을 누르면 신청 정보를 확인할 수 있는 모달창을 통해 submit을 수행 --%>
		$(function(){
			$("#modalBtn").click(function(){
				var perAmount = $("input[name='per_amount']:checked").val();
	            var sendingTime = $("input[name='sending_time']:checked").val();
	            var notificationMsg = $("textarea[name='notification_msg']").val();
	            
	    		$("#modalInfo1").html(perAmount);
	    		$("#modalInfo2").html(sendingTime);
	    		$("#modalInfo3").html(notificationMsg);
			})
			
		});
	</script>
</body>
</html>