<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>wishList</title>
        <!--Bootstrap4 를 시작할때 필요한 CDN들-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>     
</head>
<style>
    /*위시리스트 나열*/
    .countTxt{
        width: 40px;
        height: 30px;
        outline: none;
        border-radius: 4px;
    }
    .minus , .plus{
    outline: none;
    box-shadow: none;
    border-style: none;
    border-radius: 4px;
    background-color: rgb(245, 208, 66);
    }
    .minus:focus , .plus:focus{
        outline: none;
    }

   /*삭제 버튼*/
   .close {
    position:relative;
    display:inline-block;*display:inline;
    width:0px;
    height:0px;
    text-align:center;
    margin-right:20px;
    opacity: 0;
    transition: opacity .35e ease;
    }
    .close:after {
    content: "\00d7"; /*\00d7 : css만으로 x버튼 만들기 가능*/
    font-size:20pt; /*폰트 사이즈로 크기조절 가능*/
    line-height:5px;
    }
   .card:hover .close{
    opacity: 1;   
   }
   /*마감 버튼*/
   .endBtn{
       display: block;
       margin: auto;
       margin-top: 5%;
       width: 100px;
       height: 30px;
       border-radius: 5px;
       border-style: none;
       background-color: rgb(10, 23, 78);
       color: white;
   }
</style>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="close"></div>
                    <img class="card-img-top" src="img_avatar1.png" alt="간식이미지">
                    <div class="card-body">
                      <p class="card-text">간식 이름</p>
                       
                    <div class="countBtn">
                        <a>간식 가격</a> &nbsp;&nbsp;
                        <button  class="minus"><span>−</span></button>
                        <input type="text" class="countTxt"></input>
                        <button class="plus"><span>+</span></button>
                    </div>
                    </div>
                  </div>
            </div>
        </div>
    </div>
    <button type="submit" class="endBtn">마감</button>
</body>
</html>