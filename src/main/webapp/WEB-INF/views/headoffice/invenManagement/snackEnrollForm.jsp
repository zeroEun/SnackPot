<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목 등록</title>

  <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-fluid">
    	<div class="row flex-nowrap">

		<jsp:include page="../../common/sidebar.jsp"/>
		
	    <div id="formWrap">

        <h2>간식품목등록</h2>

        <form id="snackEnroll" action="insert.pm" method="post" enctype="multipart/form-data">



            <table border="1px">
               <tr>
                   <td rowspan="10">사진등록
                       <br>
                       <input type="file" name="uploadFile">
                </td>
               </tr>
               <tr>
                   <td>상품명
                    <br>
                    <input type="text" name="snackName" class="inputForm">
                    </td>
               </tr>
                 <tr>
                   <td>상품코드
                    <br>
                    <input type="text" name="snackNo" class="inputForm">
                   </td>
               </tr>
               <tr>
                   <td>상품단위
                    <br>
                    <input type="text" name="unit" class="inputForm">
                   </td>
               </tr>
               <tr>
                    <td>구입가
                    <br>
                    <input type="text" name="purchasePrice" class="inputForm">
                    </td>     
               </tr>
               <tr>
                     <td>공급가액
                        <br>
                        <input type="text" name="releasePrice" class="inputForm">
                     </td>
               </tr>
               <tr>
                    <td>카테고리<br>
                        <select name="categoryNo">
                            <option value="1">스낵류</option>
                            <option value="2">음료류</option>
                            <option value="3">간편식류</option>
                        </select>
                    </td>
                    
               </tr>
               <tr>
                    <td><b>세부 카테고리</b>
                        <br>
                        스낵류
                        <br>
                        <input type="radio" id ="1"name="detailNo" value="1">
                        <label for="1">스낵</label>
                        <input type="radio" id ="2"name="detailNo" value="2">
                        <label for="2">파이/비스킷</label>
                        <input type="radio" id ="3"name="detailNo" value="3">
                        <label for="3">초콜릿</label>
                        <input type="radio" id ="4"name="detailNo" value="4">
                        <label for="4">캔디</label>
                        <input type="radio" id ="5"name="detailNo" value="5">
                        <label for="5">젤리</label>
                        <br>
                        <input type="radio" id ="6"name="detailNo" value="6">
                        <label for="6">껌</label>
                        <input type="radio" id ="7"name="detailNo" value="7">
                        <label for="7">시리얼바</label>
                        <br>
                        음료류
                        <br>
                        <input type="radio" id ="8"name="detailNo" value="8">
                        <label for="8">탄산음료</label>
                        <input type="radio" id ="9"name="detailNo" value="9">
                        <label for="9">이온음료</label>
                
                        <input type="radio" id ="10"name="detailNo" value="10">
                        <label for="10">과일음료</label>
                        <input type="radio" id ="11"name="detailNo" value="11">
                        <label for="11">에너지음료</label>
                        <input type="radio" id ="12"name="detailNo" value="12">
                        <label for="12">유산균음료</label>
                        <input type="radio" id ="13"name="detailNo" value="13">
                        <label for="13">커피</label>
  						<br>
                        간편식류
                        <br>
                        <input type="radio" id ="14"name="detailNo" value="14">
                        <label for="14">컵라면</label>
                        <input type="radio" id ="15"name="detailNo" value="15">
                        <label for="15">핫도그/소시지</label>
                        <input type="radio" id ="16"name="detailNo" value="16">
                        <label for="16">계란</label>
                        <input type="radio" id ="17"name="detailNo" value="17">
                        <label for="17">시리얼</label>
                        <input type="radio" id ="18"name="detailNo" value="18">
                        <label for="17">컵밥</label>

                    </td>
                    
               </tr>
               <tr>
                    <td>맛
                        <br>
                        <input type="radio" id ="1"name="tasteNo" value="1">
                        <label for="1">달콤</label>
                        <input type="radio" id ="2"name="tasteNo" value="2">
                        <label for="2">짭잘</label>
                        <input type="radio" id ="3"name="tasteNo" value="3">
                        <label for="3">담백</label>
                        <input type="radio" id ="4"name="tasteNo" value="4">
                        <label for="4">고소</label>
                        <input type="radio" id ="5"name="tasteNo" value="5">
                        <label for="5">새콤</label>
                        <input type="radio" id ="6"name="tasteNo" value="6">
                        <label for="6">매콤</label>

                    </td>
               </tr>
               <tr>
                <td>향
                    <br>
                        <input type="radio" id ="1"name="aromaNo" value="1">
                        <label for="1">꿀</label>
                        <input type="radio" id ="2"name="aromaNo" value="2">
                        <label for="2">녹차</label>
                        <input type="radio" id ="3"name="aromaNo" value="3">
                        <label for="3">커피</label>
                        <input type="radio" id ="4"name="aromaNo" value="4">
                        <label for="4">초코</label>
                        <input type="radio" id ="5"name="aromaNo" value="5">
                        <label for="5">바닐라</label>
                        <br>
                        <input type="radio" id ="6"name="aromaNo" value="6">
                        <label for="6">요거트</label>
                        <input type="radio" id ="7"name="aromaNo" value="7">
                        <label for="7">치즈</label>
                        <input type="radio" id ="8"name="aromaNo" value="8">
                        <label for="8">감자</label>
                        <input type="radio" id ="9"name="aromaNo" value="9">
                        <label for="9">고구마</label>
                        <input type="radio" id ="10"name="aromaNo" value="10">
                        <label for="10">곡물</label>
                        <br>
                        <input type="radio" id ="11"name="aromaNo" value="11">
                        <label for="11">와사비</label>
                        <input type="radio" id ="12"name="aromaNo" value="12">
                        <label for="12">양파</label>
                        <input type="radio" id ="13"name="aromaNo" value="13">
                        <label for="13">해물</label>

                </td>
                </tr>
            </table>



           <input type="submit" value="등록하기">

        </form>

    </div>
    
    	</div>
	</div>

</body>
</html>