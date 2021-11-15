<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .content{
        margin: auto;
        margin-top: 30px;
        margin-bottom: 50px;
    }

    #subsEnroll  label{
        min-width: 100px;
    }

    #category-menu{
    	
        padding: 0px;
    }

    .category-sub{
        margin-bottom: 0.8rem;
    }
    
    #delivery p, #settlement p{
    	width: 50px;
    	min-width: 50px;
    	margin: auto;
    }
</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>


 	<!-- snack subscribe section-->
    <section class="snack-subs">

        <div class="container-fluid">
            <div class="row">

                <div class="content  col-10">
                    <h4>간식 구독 신청</h4>
                    <hr>

                    <form id="subsEnroll" method="post" action="insertSubs.sn">
                    	<input type="hidden" name="comCode" value="${loginUser.comCode}">

                        <div class="form-group row" id="snack-budget">

                            <!-- 숫자만 입력하도록 하기-->
                            <label for="budget" class="col-md-2 col-form-label">간식 예산</label> 
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="budget" name="budget" placeholder="금액을 입력해 주세요">
                            </div>
                           
                        </div>

                        
                        <div class="form-group row" id="ratio">

                            <label class="col-md-2">간식 비율</label>

                            <div class="col-md-10 row">
                                    <!-- 숫자만 입력하도록 하기-->
                                <label for="snack-ratio" class="col-md-1 col-form-label">스낵</label> 
                                <div class="col-md-2">
                                    <input type="text" class="form-control" id="snack-ratio" name="snackRatio" placeholder="%">
                                </div>

                                <label for="drink-ratio" class="col-md-1 col-form-label">음료</label> 
                                <div class="col-md-2">
                                    <input type="text" class="form-control" id="drink-ratio" name="drinkRatio" placeholder="%">
                                </div>

                                <label for="retort-ratio" class="col-md-1 col-form-label">간편식</label> 
                                <div class="col-md-2">
                                    <input type="text" class="form-control" id="retort-ratio" name="retortRatio" placeholder="%">
                                </div>
                            </div>
                           
                        </div>
                        <hr>

                        <!-- 카테고리 선택-->
                        <div class="form-group row" id="category">

                            <label class="col-md-2">카테고리 선택</label>

                            <div class="col-md-10 category-menu" id="category-menu">

                                <div class="col-md-12 category-sub">
                                  <label>스낵류 카테고리 선택</label><br>
                                  
                                  <c:forEach items="${snackCategory}" var="s">
	                                  <div class="form-check form-check-inline">
	                                    <input class="form-check-input" type="checkbox" id="snackCheckbox${s.detailNo}" name="snackCategory" value="${s.detailNo}">
	                                    <label class="form-check-label" for="snackCheckbox${s.detailNo}">${s.detailCategory }</label>
	                                  </div>
                                  </c:forEach>
                                 
                                </div>
                                

                                <div class="col-md-12 category-sub">
                                    <label>음료 카테고리 선택</label><br>
                                    
                                    <c:forEach items="${drinkCategory}" var="d">
	                                  <div class="form-check form-check-inline">
	                                    <input class="form-check-input" type="checkbox" id="drinkCheckbox${d.detailNo}"  name="drinkCategory" value="${d.detailNo}">
	                                    <label class="form-check-label" for="drinkCheckbox${d.detailNo}">${d.detailCategory }</label>
	                                  </div>
                                  	</c:forEach>
                                  	
                                </div>

                                <div class="col-md-12 category-sub">
                                    <label>간편식 카테고리 선택</label><br>
                                   	
                                   	<c:forEach items="${retortCategory}" var="r">
	                                  <div class="form-check form-check-inline">
	                                    <input class="form-check-input" type="checkbox" id="retortCheckbox${r.detailNo}" name="retortCategory" value="${r.detailNo}">
	                                    <label class="form-check-label" for="retortCheckbox${r.detailNo}">${r.detailCategory }</label>
	                                  </div>
                                  	</c:forEach>
                                   
                                </div>


                            </div>
                           
                        </div>
                        <!-- 카테고리 선택 끝-->

                        <hr>
                        <div class="form-group row" id="taste">

                            <label class="col-md-2">선호하는 맛</label>

                            <div class="col-md-10 category-menu" id="category-menu">
                                <div class="col-md-12">
	                                <c:forEach items="${taste}" var="t">
	                                	<div class="form-check form-check-inline">
	                                        <input class="form-check-input" type="checkbox" id="tasteCheckbox${t.tasteNo}" name="preferTaste" value="${t.tasteNo}">
	                                        <label class="form-check-label" for="tasteCheckbox${t.tasteNo}">${t.taste}</label>
	                                    </div>
	                                </c:forEach>
                                </div>
                            </div>

                        </div>

                        <div class="form-group row" id="flavour">

                            <label class="col-md-2">싫어하는 향</label>

                            <div class="col-md-10 category-menu" id="category-menu">
                                <div class="col-md-12 ">
	                                <c:forEach items="${flavour}" var="f">
	                                	<div class="form-check form-check-inline">
	                                        <input class="form-check-input" type="checkbox" id="flavourCheckbox${f.aromaNo}" name="dislikeFlavour" value="${f.aromaNo}">
	                                        <label class="form-check-label" for="flavourCheckbox${f.aromaNo}">${f.aroma}</label>
	                                    </div>
	                                </c:forEach>
                                </div>
                            </div>

                        </div>
                        <hr>
                        <!-- 배송 예정일 --> 
                        <div class="form-group row" id="delivery">

                            <label for="delivery-date" class="col-md-2 col-form-label">배송 예정일</label> 
                            <div class="col-md-3 d-flex"> <!-- d-flex 인라인으로 정렬 -->
                                <p>매달</p><input type="text" class="form-control" id="delivery-date" name="deliveryDate"><p>일</p>
                            </div>
            
                        </div>

                        <!-- 결제일(신청일) --> 
                        <div class="form-group row" id="settlement">

                            <label for="settlement-date" class="col-md-2 col-form-label">결제 예정일(신청일)</label> 
                            <div class="col-md-3 d-flex" >
                                <p>매달</p><input type="text" class="form-control" id="settlement-date" name="" readonly><p>일</p>
                            </div>
            
                        </div>
                        

                        <button type="button" class="btn btn-warning mr-2 float-right"  id="subsBtn">구독 신청하기</button>


                    </form>

                </div>


            </div>
        </div>


    </section>
    
<script type="text/javascript">
	$(function(){
		var today = new Date();
		var date = today.getDate();
		console.log(date);
		$('#settlement-date').attr('value', date);
		
		$('#subsBtn').on('click', function(){
			
			$.ajax({
				
				url:'checkSubsDup.sn',
				data:{comCode : '${loginUser.comCode}'},
				success: function(result){
					
					if(result > 0){
						alert("이미 구독중 입니다.")				
					}else{
						$('#subsEnroll').submit();
					}
					
				},error:function(){
					console.log("댓글 작성 ajax 통신 실패");
				}
				
			});
			
		})
	});
</script>


</body>
</html>