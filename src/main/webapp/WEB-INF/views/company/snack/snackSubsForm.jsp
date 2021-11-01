<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .category-menu{
        padding: 0px;
    }

    .category-sub{
        margin-bottom: 0.8rem;
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

                    <form id="subsEnroll" method="post" action="">

                        <div class="form-group row" id="budget">

                            <!-- 숫자만 입력하도록 하기-->
                            <label for="snack-budget" class="col-md-2 col-form-label">간식 예산</label> 
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="snack-budget" placeholder="금액을 입력해 주세요">
                            </div>
                           
                        </div>

                        
                        <div class="form-group row" id="ratio">

                            <label class="col-md-2">간식 비율</label>

                            <div class="col-md-10 row">
                                    <!-- 숫자만 입력하도록 하기-->
                                <label for="snack-ratio" class="col-md-1 col-form-label">스낵</label> 
                                <div class="col-md-2">
                                    <input type="text" class="form-control" id="snack-ratio" placeholder="%">
                                </div>

                                <label for="drink-ratio" class="col-md-1 col-form-label">음료</label> 
                                <div class="col-md-2">
                                    <input type="text" class="form-control" id="snack-ratio" placeholder="%">
                                </div>

                                <label for="retort-ratio" class="col-md-1 col-form-label">간편식</label> 
                                <div class="col-md-2">
                                    <input type="text" class="form-control" id="retort-ratio" placeholder="%">
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
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">1</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                    <label class="form-check-label" for="inlineCheckbox2">2</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                                    <label class="form-check-label" for="inlineCheckbox3">3</label>
                                </div>

                                </div>
                                


                                <div class="col-md-12 category-sub">
                                    <label>음료 카테고리 선택</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                        <label class="form-check-label" for="inlineCheckbox1">1</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                        <label class="form-check-label" for="inlineCheckbox2">2</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                                        <label class="form-check-label" for="inlineCheckbox3">3</label>
                                    </div>
                                </div>

                                <div class="col-md-12 category-sub">
                                    <label>간편식 카테고리 선택</label><br>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                        <label class="form-check-label" for="inlineCheckbox1">1</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                        <label class="form-check-label" for="inlineCheckbox2">2</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                                        <label class="form-check-label" for="inlineCheckbox3">3</label>
                                    </div>
                                </div>


                            </div>
                           
                        </div>
                        <!-- 카테고리 선택 끝-->

                        <hr>
                        <div class="form-group row" id="taste">

                            <label class="col-md-2">선호하는 맛</label>

                            <div class="col-md-10 category-menu" id="category-menu">
                                <div class="col-md-12">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                        <label class="form-check-label" for="inlineCheckbox1">1</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                                        <label class="form-check-label" for="inlineCheckbox2">2</label>
                                      </div>
                                      <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                                        <label class="form-check-label" for="inlineCheckbox3">3</label>
                                    </div>
                                </div>
                            
                            </div>

                        </div>

                        <div class="form-group row" id="flavour">

                            <label class="col-md-2">싫어하는 향</label>

                            <div class="col-md-10 category-menu" id="category-menu">
                                <div class="col-md-12 ">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                        <label class="form-check-label" for="inlineCheckbox1">1</label>
                                      </div>
                                     
                                </div>
                            
                            </div>

                        </div>
                        <hr>
                        <!-- 배송 예정일 --> 
                        <div class="form-group row" id="delivery">

                            <label for="delivery-date" class="col-md-2 col-form-label">배송 예정일</label> 
                            <div class="col-md-3" style="display:flex;">
                                <p style="width: 50px; margin: auto;">매달</p><input type="text" class="form-control" id="delivery-date" placeholder="일" >
                                
                            </div>
            
                        </div>

                        <!-- 결제일(신청일) --> 
                        <div class="form-group row" id="settlement">

                            <label for="settlement-date" class="col-md-2 col-form-label">결제 예정일(신청일)</label> 
                            <div class="col-md-3" style="display:flex;">
                                <p style="width: 50px; margin: auto;">매달</p><input type="text" class="form-control" id="settlement-date" value="일" readonly>
                                
                            </div>
            
                        </div>

                        <button type="submit" class="btn btn-warning mr-2 float-right">구독 신청하기</button>


                    </form>

                </div>


            </div>
        </div>


    </section>


</body>
</html>