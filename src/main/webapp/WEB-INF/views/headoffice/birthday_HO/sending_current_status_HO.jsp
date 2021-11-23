<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
</head>
<style>
	#birthCard{
		margin-top: 1rem;
    	height: 90%;
    	overflow: scroll;
    	margin-bottom: 5px;
    }
	#sendingTab{
        float: left;
        width: 30%;
    }
    #sendingTab>li>p {
        cursor: pointer;
        margin-left: 0;
        
    }
    #sendingTab>li{
    	width: 40%;
    }
    #sendingTab p {
    	border: none;
    	margin: 1px;
    }
    #sending_expected, #sending_complete{
		display: inline-block;
        margin-right: 10px;
    }
    #tabArea{
    	padding-top: 20px;
    	padding-left: 10px;
    }
     #birthCard > .card-body{
        background: rgb(218, 215, 208);
    }
    .tableHead{
    	background: rgb(255, 227, 114);
    }
    .tableBody{
    	background: rgb(252, 248, 238);
    }
    #prevBtn{
    	margin-top: 6px;
    	float: right;
    }
</style>
<body>

	<script>
		window.onload = function() {
			$("#sending_expected").css("background", "rgb(218, 215, 208)")
            $("#sending_complete").css("background", "rgb(124, 123, 121)")
            $("#sending_expected").css("font-weight", "bold");
            $("#sending_complete").css("font-weight", "normal");
            $("#sending_expected").css("color", "black");
            $("#sending_complete").css("color", "white");

			$("#sending_expected_table").show();
			$("#sending_complete_table").hide();
		}

		$(document).ready(function() {
			$("#sending_expected").click(function() {
				$("#sending_expected").css("background", "rgb(218, 215, 208)")
                $("#sending_complete").css("background", "rgb(124, 123, 121)")
                $("#sending_expected").css("font-weight", "bold");
                $("#sending_complete").css("font-weight", "normal");
                $("#sending_expected").css("color", "black");
                $("#sending_complete").css("color", "white");

				$("#sending_expected_table").show();
				$("#sending_complete_table").hide();
			});
		});
		$(document).ready(function() {
			$("#sending_complete").click(function() {
				$("#sending_complete").css("background", "rgb(218, 215, 208)")
                $("#sending_expected").css("background", "rgb(124, 123, 121)")
                $("#sending_complete").css("font-weight", "bold");
                $("#sending_expected").css("font-weight", "normal");
                $("#sending_complete").css("color", "black");
                $("#sending_expected").css("color", "white");

				$("#sending_expected_table").hide();
				$("#sending_complete_table").show();
			});
		});
	</script>
	<section class="birthSection">
		<div class="container-fluid" id="birthContainer">
			<div class="row flex-nowrap">
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
				
				<div class="col-10">
					<div class="card text-center" id="birthCard">
						<div class="card-header" id="tabArea">
							<ul class="nav nav-tabs card-header-tabs" id="sendingTab">
								<li class="nav-item" id="sending_expected">
									<p class="nav-link">발송 예정</p>
								</li>
								<li class="nav-item" id="sending_complete">
									<p class="nav-link">발송 완료</p>
								</li>
							</ul>
						</div>
						<div class="card-body">
							<table class="table" id="sending_expected_table">
								<thead class="tableHead">
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
								<tbody class="tableBody">
				                   		<c:set var="sendListSts" value="${list }"/>
				                   		<c:set var="birthSubsChk" value="${birthSubsChk }"/>
				                   		<c:if test ="${birthSubsChk > 0}">
					                   		<c:choose>
					                   			<c:when test="${empty sendListSts }">
					                   				<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
					                   			</c:when>
					                   			<c:when test="${!empty sendListSts }">
					                   				<c:forEach items="${ list }" var="sendingSts" varStatus="status">
					                   					<c:if test="${ sendingSts.selectDate == null }">                  		
														<c:set var="num1" value="${ num1+1 }" />
								                        <tr>
								                           	<td>${ num1 }</td>
															<td>${ sendingSts.cempDept }</td>
															<td>${ sendingSts.cempJob }</td>
															<td>${ sendingSts.cempName }</td>
															<td>${ sendingSts.cempPhone }</td>
															<td>${ sendingSts.cempBirth }</td>
															<td>${ sendingSts.sendingMsgDate }</td>
								                        </tr>			                        
								                    	</c:if>			                    	
					                   				</c:forEach>
					                   				<c:if test="${empty num1 }">
					                   					<tr><td colspan="8">발송 예정인 사원이 없습니다.</td></tr>
					                   				</c:if>
					                   				</c:when>
					                   		</c:choose>
				                   		</c:if>
				                   		<c:if test ="${birthSubsChk <= 0}">
				                   			<tr><td colspan="8">구독 정보가 존재하지 않습니다.</td></tr>
				                   		</c:if>
								</tbody>
							</table>
				
				
							<table class="table" id="sending_complete_table">
								<thead class="tableHead">
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
								<tbody class="tableBody">
				                    	<c:set var="sendListSts" value="${list }"/>
				                    	<c:set var="birthSubsChk" value="${birthSubsChk }"/>
				                    	<c:if test ="${birthSubsChk > 0}">
					                   		<c:choose>
					                   			<c:when test="${empty sendListSts }">
					                   				<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
					                   			</c:when>
					                   			<c:when test="${!empty sendListSts }">
					                   				<c:forEach items="${ list }" var="sendingSts" varStatus="status">
														<c:if test="${ sendingSts.selectDate != null }">
															<c:set var="num2" value="${ num2+1 }" />
																<tr>
																	<td>${ num2 }</td>
																	<td>${ sendingSts.cempDept }</td>
																	<td>${ sendingSts.cempJob }</td>
																	<td>${ sendingSts.cempName }</td>
																	<td>${ sendingSts.cempPhone }</td>
																	<td>${ sendingSts.cempBirth }</td>
																	<td>${ sendingSts.sendingMsgDate }</td>
																</tr>
														</c:if>
													</c:forEach>
					                   				<c:if test="${empty num1 }">
					                   					<tr><td colspan="8">발송 완료인 사원이 없습니다.</td></tr>
					                   				</c:if>
					                   				</c:when>
					                   		</c:choose>
				                   		</c:if>
				                   		<c:if test ="${birthSubsChk <= 0}">
				                   			<tr><td colspan="8">구독 정보가 존재하지 않습니다.</td></tr>
				                   		</c:if>
								</tbody>
							</table>
						</div>
					</div>
				
					<button type="button" id="prevBtn" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
				</div>
			</div>
		</div>

	</section>
</body>
</html>