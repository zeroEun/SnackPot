<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="resources/css/snackPotMainView.css">
    </head>
<body>  
<jsp:include page="common/menubar.jsp"/>
    <!--carousel-->
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
        </ul>
      
        <!-- The slideshow -->
        <!--스낵 구독-->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/간식구독배너.jpg" class="img1">
            <div class="carousel-caption banner-img1">
                <h1>간식의 공식, 스낵팟</h1>
                <p>NO.1 맞춤형 간식구독 서비스</p><br>
                <div class="col-md-3 col-sm-3 col-xs-6 snackBtn"> 
                    <a href="#" class="btn btn-sm animated-button thar-three">구독하기</a>
                </div>
              </div>
          </div>
          <!--생일 구독-->
          <div class="carousel-item">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/생일구독배너.png" class="img1">
            <div class="carousel-caption banner-img1">
                <h1>1년의 단하루,</h1>
                <p>직원의 행복한 생일을 만들어주는 구독서비스</p><br>
                <div class="col-md-3 col-sm-3 col-xs-6 hbdkBtn"> 
                    <a href="#" class="btn btn-sm animated-button thar-three ">구독하기</a>
                </div>
              </div>
          </div>
        </div>
      
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
      <br><br><br><br>
      <!--스낵팟 설명(부가설명)-->
      <div class="container-fluid" style="width: 90%;">
          <h1><label class="snackPotName">스낵팟</label>은 기업 복지 니즈에<br>맞춰 다양한 서비스를 제공합니다</h1>
          <br><br>
        <!--스낵팟이 필요한 이유-->
        <div class="question"><h4>이러한 고민들 스낵팟으로 해결하세요!</h4></div>
          <div class="container profile-page">
            <div class="row">
                <div class="col">
                    <div class="card profile-header">
                        <div class="body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="profile-image float-md-right"><img src="${ pageContext.servletContext.contextPath }/resources/images/물음표1.png" style="padding: 30px;"> </div>
                                </div>
                                <div class=" col-md-8 ">
                                    <span class="queTxt">담당직원이 매일 탕비실을 채워넣기도 힘들고 지속적인 관리 해주는 곳은 없을까?</span>
                                </div>                
                            </div>
                        </div>                    
                    </div>
                </div>
            <div class="col">
                <div class="card profile-header">
                    <div class="body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="profile-image float-md-right"> <img src="${ pageContext.servletContext.contextPath }/resources/images/물음표1.png" style="padding: 30px;"> </div>
                            </div>
                            <div class="col-md-8">
                                <span class="queTxt">직원들의 복지를 효율적으로 관리할수있는 서비스가 없을까?</span>
                            </div>                
                        </div>
                    </div>                    
                </div>
                </div>
            </div>
         </div>
         <br><br>
         <!--사무실 간식 서비스 비교 설명-->
         <div>
            <div><h3><strong>첫번째</strong>.간식구독 서비스</h3></div>
            <div><h3><strong>두번째</strong>.생일구독 서비스</h3></div>


         </div>
       
       

      </div>
      <jsp:include page="common/footer.jsp"/> 
</body>
</html>
	