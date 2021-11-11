<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
    #sendingTab>li>p {
        margin-left: 0;
        width: 100%;
    }
    #sendingTab{
        float: left;
        width: 12%;
    }
    #sendingTab>li{
    	width: 100%;
    }
    #tabArea button{
        float: right;
        margin-left: 2px;
        margin-right: 2px;
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

        <div class="card text-center">
            <div class="card-header" id="tabArea">
                <ul class="nav nav-tabs card-header-tabs" id="sendingTab">
                    <li class="nav-item" id="sendingListTab">
                        <p class="nav-link">발송 리스트</p>
                    </li>
                    
                </ul>
                <button type="button" class="btn btn-dark" id="updateBtn" onclick="updateRow();">선택 수정</button>                
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#sending_insert">추가하기</button>
                <button type="button" class="btn btn-dark" onclick="deleteRow();">선택 삭제</button>                
            </div>
            
            <div class="card-body">
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
                   		<c:set var="sendListChk" value="${list }"/>
                   		<c:choose>
                   			<c:when test="${empty sendListChk }">
                   				<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
                   			</c:when>
                   			<c:when test="${!empty sendListChk }">
                   				<c:forEach items="${ list }" var="sendList" varStatus="status">                   					                		
									<c:set var="num" value="${ num+1 }" />
			                        <tr>
			                            <td><input type="checkbox" name="sendingChk" value="${sendList.cempSeq }"></td>
			                           	<td>${ num }</td>
										<td>${sendList.cempDept }</td>
						                <td>${sendList.cempJob }</td>
						                <td>${sendList.cempName }</td>
						                <td>${sendList.cempPhone }</td>
						                <td>${sendList.cempBirth }</td>
						                <td>${sendList.sendMsgDate }</td>
			                        </tr>
                   				</c:forEach>
                   				<c:if test="${empty num }">
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
                                            <input type="text" class="form-control" id="cempDept" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempJob" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempName" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempPhone" placeholder="'-' 빼고 입력" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="cempEmail" placeholder="example@email" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="cempBirth" required>
                                        </div>
                                    </div>                                                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="submit" id="insertSendListBtn" class="btn btn-primary">추가</button>
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
                            	<input type="hidden" id="cSeq">
                                <div class="modal-body">                                
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">부서명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cDept">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cJob">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cName">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cPhone" placeholder="'-' 빼고 입력">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="cEmail" placeholder="example@email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="cBirth">
                                        </div>
                                    </div>                                                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="submit" id="updateSendListBtn" class="btn btn-primary">수정</button>
                                </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    
        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
        
	<script>
		window.onload = function() {
			/*
		    $("#sending_expected").css("background", "white")
		    $("#sending_complete").css("background", "gray")
		
		    $("#sending_expected_table").show();
		    $("#sending_complete_table").hide();
		    $("#updateBtn").show();
		    $("#insertBtn").show();
		    $("#deleteBtn").show();
		    */
		    $("#sendingListTab").css("background", "gray");
		    $("#tabArea").css("padding-bottom", 4);//추가탭 없으면 style로 변경
		}
		
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
				var chk = confirm("정말 삭제하시겠습니까?( 삭제 개수 : " + chkArr.length + " )");
				if(chk == true){
					$.ajax({
						url : "delSendList.birth",
						dataType: "json",
						type : 'POST',
						traditional : true,
						data : {
							chkArr : chkArr
						},
						success : function(data){
							//console.log("succes진입");
							if(data == chkArr.length){
								//console.log("if진입");
								alert(chkArr.length + "개 삭제가 완료되었습니다.");
								location.replace("sendList.birth");
							}else{
								//console.log("else진입");
								alert("삭제하는데 실패했습니다.")
							}
						},
						error : function(error){
							//console.log("error진입" + error);	            					
							alert("에러발생 : " + error);
						}
					});
				}
			}
		}
		
		$(function(){
			$("#insertSendListBtn").click(function(){
				
				var cempDept = $("#cempDept").val();
				var cempJob = $("#cempJob").val();
				var cempName = $("#cempName").val();
				var cempPhone = $("#cempPhone").val();
				var cempEmail = $("#cempEmail").val();
				var cempBirth = $("#cempBirth").val();
				
				if(cempDept == "" || cempJob == "" || cempName == "" || 
						cempPhone == "" || cempEmail == "" || cempBirth == ""){
					alert("모든 항목을 입력해주세요.");
				}else{
					$.ajax({		            				
						url : "insSendList.birth",
						type : "POST",
						data:{
							cempDept : cempDept,
							cempJob : cempJob,
							cempName : cempName,
							cempPhone : cempPhone,
							cempEmail : cempEmail,
							cempBirth : cempBirth
						},
						success : function(result){
							if(result > 0){
								//console.log("result : " + result);
								//console.log("result타입 : " + typeof(result));
								alert("발송 리스트 등록 성공!");
								location.replace("sendList.birth");
								
							}else{
								alert("발송 리스트 등록 실패!");
							}
						},
						error : function(error){
							//console.log("error진입" + error);	            					
							alert("에러발생 : " + error);
						}
						
					});
				}
				
			});
		});
		
		function updateRow(){
			var chkArr = new Array();
			var list = $("input[name='sendingChk']");
			var cempSeq;
			
			for(var i=0; i<list.length; i++){
				if(list[i].checked){
					chkArr.push(list[i].value);
					cempSeq = list[i].value;
				}
			}
			console.log("cempSeq : " + cempSeq);
			//console.log("cempSeq[0] : " + cempSeq[0]);
			console.log("chkArr길이 : " + chkArr.length);
			
			<%-- 체크된 항목이 1개일 때만 modal 실행 --%>
			if(chkArr.length == 1){
				//$("#updateBtn").attr("data-toggle","modal").attr("data-target","#sending_update");
				$("#updateBtn").attr("data-toggle","modal").attr("data-target","#sending_update");
				$.ajax({
					url : "selectEmpOne2.birth",
					type : "POST",
					data:{
						cempSeq : cempSeq
					},
					success : function(result){	            					
						console.log("result : " + result);
						console.log("result2 : " + cempSeq);
						console.log("result3 : " + result.cempBirthSdf);
						$("#cSeq").val(cempSeq);
						$("#cDept").val(result.cempDept);
						$("#cJob").val(result.cempJob);
						$("#cName").val(result.cempName);
						$("#cPhone").val(result.cempPhone);
						$("#cEmail").val(result.cempEmail);
						$("#cBirth").val(result.cempBirthSdf);	            					
						
					},
					error : function(error){
						//console.log("error진입" + error);	            					
						alert("에러발생 : " + error);
					}
				})
				
				//location.href="selectEmpOne.birth?cempSeq="+cempSeq;
			}
			else if(chkArr.length == 0){
				alert("수정할 항목을 체크한 후 다시 버튼을 클릭해주세요.");
				$("#updateBtn").removeAttr("data-toggle").removeAttr("data-target");
			}else{
				alert("한 번에 한 개의 항목만 수정이 가능합니다.");
				$("#updateBtn").removeAttr("data-toggle").removeAttr("data-target");
			}
		}
		
		$(function(){
			$("#updateSendListBtn").click(function(){
				
				var cempBirthSdf = new Date($("#cBirth").val());
				var cempBirth_final = new Date(+cempBirthSdf + 3240 * 10000).toISOString().split("T")[0];
				
				$.ajax({
					
					url : "updSendList.birth",
					type : "POST",
					data:{
						cempSeq : $("#cSeq").val(),
						cempDept : $("#cDept").val(),
						cempJob : $("#cJob").val(),
						cempName : $("#cName").val(),
						cempPhone : $("#cPhone").val(),
						cempEmail : $("#cEmail").val(),
						cempBirth : cempBirth_final
					},
					success : function(result){
						if(result > 0){
							//console.log("result : " + result);
							//console.log("result타입 : " + typeof(result));
							alert("발송 리스트 수정 성공!");
							location.replace("sendList.birth");
							
						}else{
							console.log("cempBirth : " + $("#cBirth").val());
							console.log("cempBirth타입 : " + typeof($("#cBirth").val()));
							console.log("cempBirth 변환 : " + cempBirthSdf)
							console.log(new Date(+cempBirthSdf + 3240 * 10000).toISOString().split("T")[0])
							alert("발송리스트 수정 실패!");
						}
					},
					error : function(error){
						//console.log("error진입" + error);	            					
						alert("에러발생 : " + error);
					}
					
				});
			});
		});
	
	</script>
</body>
</html>