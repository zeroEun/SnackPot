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
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#sending_delete">선택 삭제</button>                
            </div>
            
            <div class="card-body">
                <script>
                    $(function(){
                        $("#sendingChk").click(function(){
                            var checkYN = $("#sendingChk").is(":checked")
                
                            if(checkYN == true){
                                $("input[name='sendingChk']").attr("checked",true);
                            }else{
                                $("input[name='sendingChk']").attr("checked",false);
                            }
                        })
                
                    })
                </script>
                <!-- 발송 예정 테이블 -->
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
	                    <c:forEach items="${ list }" var="curSts" varStatus="status">
							<c:if test="${ curSts.selectDate == null }">
								<c:set var="num1" value="${ num1+1 }" />
		                        <tr>
		                            <td><input type="checkbox" name="sendingChk"></td>
		                           	<td>${ num1 }</td>
									<td>${ curSts.cempDept }</td>
									<td>${ curSts.cempJob }</td>
									<td>${ curSts.cempName }</td>
									<td>${ curSts.cempPhone }</td>
									<td>${ curSts.cempBirth }</td>
									<td>${ curSts.sendingMsgDate }</td>
		                        </tr>
							</c:if>
						</c:forEach>
                    </tbody>
                </table>
    
                <!-- 선택 삭제 -->
                <div class="modal fade" id="sending_delete" data-backdrop="static" data-keyboard="false" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">선택 삭제</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            <h5>선택하신 삭제 목록은 다음과 같습니다.</h5>
                            <hr>
                            <table class="table">
                                <thead class="thead-light">
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
                                <tbody>
                                    <c:forEach items="${ list }" var="curSts" varStatus="status">
										<c:if test="${ curSts.selectDate != null }">
											<c:set var="num2" value="${ num2+1 }" />
											<tr>
												<td>${ num2 }</td>
												<td>${ curSts.cempDept }</td>
												<td>${ curSts.cempJob }</td>
												<td>${ curSts.cempName }</td>
												<td>${ curSts.cempPhone }</td>
												<td>${ curSts.cempBirth }</td>
												<td>${ curSts.sendingMsgDate }</td>
											</tr>
										</c:if>
									</c:forEach>
                                </tbody>
                            </table>
                            <hr>
                            <h5>삭제하시겠습니까?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 추가하기 -->
                <div class="modal fade" id="sending_insert" data-backdrop="static" data-keyboard="false" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">추가하기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="">
                                <div class="modal-body">                                
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">부서명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="deptName" placeholder="'-' 빼고 입력">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="deptName" placeholder="example@email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="deptName">
                                        </div>
                                    </div>                                                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="submit" class="btn btn-primary">추가</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- 선택 수정 -->
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


                <!-- 발송 완료 테이블 -->
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
                        <tr>
                            <td>1</td>
                            <td>영업부</td>
                            <td>대리</td>
                            <td>차OO</td>
                            <td>010-3333-4444</td>
                            <td>1985-10-03</td>
                            <td>2021-10-01</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    
    
        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
  </body>
</html>