<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
    li>p {
        cursor: pointer;
    }
    #sendingTab{
        float: left;
    }
    .card-header button{
        float: right;
        margin-left: 2px;
        margin-right: 2px;
    }
    </style>
    <body>
        <script>
            window.onload = function() {
                $("#sending_expected").css("background", "white")
                $("#sending_complete").css("background", "gray")
    
                $("#sending_expected_table").show();
                $("#sending_complete_table").hide();
            }
    
            $(document).ready(function() {
                $("#sending_expected").click(function() {
                    $("#sending_expected").css("background", "white")
                    $("#sending_complete").css("background", "gray")
    
                    $("#sending_expected_table").show();
                    $("#sending_complete_table").hide();
                });
            });
            $(document).ready(function() {
                $("#sending_complete").click(function() {
                    $("#sending_expected").css("background", "gray")
                    $("#sending_complete").css("background", "white")
    
                    $("#sending_expected_table").hide();
                    $("#sending_complete_table").show();
                });
            });
        </script>
    
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs" id="sendingTab">
                    <li class="nav-item" id="sending_expected">
                        <p class="nav-link">발송 예정</p>
                    </li>
                    <li class="nav-item" id="sending_complete">
                        <p class="nav-link">발송 완료</p>
                    </li>
                </ul>
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#sending_update">선택 수정</button>                
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#sending_insert">추가하기</button>
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#sending_delete" onclick="deleteRow();">선택 삭제</button>                
            </div>
            
            <div class="card-body">
                <script>
	                $(function(){
	                	var chkRow = $("input[name='sendingChk']");
	                	var rowCount = chkRow.length;
		                $("#sendingChk").click(function(){
		                    var chkList = $("input[name='sendingChk']");
		                    for(var i=0; i<chkList.length; i++){
		                        chkList[i].checked = this.checked;
		                    }
		                });
		
		                $("input[name='sendingChk']").click(function(){
		                     if($("input[name='sendingChk']:checked").length == rowCount){ /*각각 체크해서 전체를 다 체크했을 때*/
		                         $("#sendingChk")[0].checked = true;
		                     }else{
		                         $("#sendingChk")[0].checked = false;
		                     }
		                });
	                });
                	
	            	function deleteRow(){
	            		var chkArr = new Array();
	            		var list = $("input[name='sendingChk']");
	            		for(var i=0; i<list.length; i++){
	            			if(list[i].checked){
	            				chkArr.push(list[i].value);
	            			}
	            		}
	            		
	            		if(chkArr.length == 0){
	            			alert("선택된 항목이 없습니다.");
	            		}
	            		else{
	            			console.log("chkArr : " + chkArr);
	            			console.log("chkArr 타입 : " + typeof(chkArr));
	            			var chk = confirm("정말 삭제하시겠습니까?( 삭제 개수 : " + chkArr.length + " )");
	            			$.ajax({
	            				url : "delSendSts.birth",
	            				dataType: "json",
	            				type : 'POST',
	            				traditional : true,
	            				data : {
	            					chkArr : chkArr
	            				},
	            				success : function(data){
	            					console.log("succes진입");
	            					if(data == chkArr.length){
	            						console.log("if진입");
	            						alert(chkArr.length + "개 삭제가 완료되었습니다.");
	            						location.replace("sendingcursts.birth");
	            					}else{
	            						console.log("else진입");
	            						alert("삭제하는데 실패했습니다.")
	            					}
	            				},
	            				error : function(error){
	            					console.log("error진입" + error);
	            					
	            					alert("에러발생 : " + error);
	            				}
	            			});
	            		}
	            	}
	                
	            	$(function(){
	            		$("#insertSendStsBtn").click(function(){
	            			$.ajax({
	            				
	            				url : "insSendSts.birth",
	            				type : "POST",
	            				data:{
	            					cempDept : $("#cempDept").val(),
	            					cempJob : $("#cempJob").val(),
	            					cempName : $("#cempName").val(),
	            					cempPhone : $("#cempPhone").val(),
	            					cempEmail : $("#cempEmail").val(),
	            					cempBirth : $("#cempBirth").val()
	            				},
	            				success : function(result){
	            					if(result > 0){
	        							console.log("result : " + result);
	        							console.log("result타입 : " + typeof(result));
	        							alert("발송 예정 항목 등록 성공!");
	        							location.replace("sendingcursts.birth");
	        							
	        						}else{
	        							alert("발송 예정 항목 등록 실패!");
	        						}
	            				},
	            				error : function(error){
	            					console.log("error진입" + error);
	            					
	            					alert("에러발생 : " + error);
	            				}
	            				
	            			});
	            		});
	            	});
                </script>
                <%-- 발송 예정 테이블 --%>
                <table class="table" id="sending_expected_table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col"><input type="checkbox" id="sendingChk"></th>
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
                   		<c:set var="sendListSts" value="${list }"/>
                   		<c:choose>
                   			<c:when test="${empty sendListSts }">
                   				<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
                   			</c:when>
                   			<c:when test="${!empty sendListSts }">
                   				<c:forEach items="${ list }" var="sendingSts" varStatus="status">
                   					<c:if test="${ sendingSts.selectDate == null }">                  		
									<c:set var="num1" value="${ num1+1 }" />
			                        <tr>
			                            <td><input type="checkbox" name="sendingChk" value="${sendingSts.cempSeq }"></td>
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
                    </tbody>
                </table>

                <%-- 추가하기 --%>
                <div class="modal fade" id="sending_insert" data-backdrop="static" data-keyboard="false" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">추가하기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            
                                <div class="modal-body">                                
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">부서명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempDept">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempJob">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempName">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempPhone" placeholder="'-' 빼고 입력">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="cempEmail" placeholder="example@email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="cempBirth">
                                        </div>
                                    </div>                                                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="submit" id="insertSendStsBtn" class="btn btn-primary">추가</button>
                                </div>

                        </div>
                    </div>
                </div>

                <%-- 선택 수정 --%>
                <div class="modal fade" id="sending_update" data-backdrop="static" data-keyboard="false" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">선택 수정</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="">
                                <div class="modal-body">                                
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">부서명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName" placeholder="'-' 빼고 입력" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="deptName" placeholder="example@email" value="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="deptName" value="2012-09-12">
                                        </div>
                                    </div>                                                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="submit" class="btn btn-primary">수정</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <%-- 발송 완료 테이블 --%>
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
                    </tbody>
                </table>
            </div>
        </div>
    
    
        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
  </body>
</html>