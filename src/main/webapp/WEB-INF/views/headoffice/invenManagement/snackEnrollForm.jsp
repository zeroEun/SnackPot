<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목 등록</title>
</head>
<body>

   <jsp:include page="../../common/sidebar.jsp"/>

	    <div id="formWrap">

        <h2>간식품목등록</h2>

        <form id="snackEnroll" action="insert.pm" method="post">



            <table border="1px">
               <tr>
                   <td rowspan="9">사진등록
                       <br>
                       <input type="file" name="snackImage">
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
                    <input type="text" name="snackCode" class="inputForm">
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
                        <select name="category">
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
                        <input type="radio" id ="1"name="detail" value="1">
                        <label for="1">과자</label>
                        <input type="radio" id ="2"name="detail" value="2">
                        <label for="2">쿠키</label>
                        <input type="radio" id ="3"name="detail" value="3">
                        <label for="3">파이</label>
                        <input type="radio" id ="4"name="detail" value="4">
                        <label for="4">초콜렛</label>
                        <input type="radio" id ="5"name="detail" value="5">
                        <label for="5">캔디</label>
                        <br>
                        <input type="radio" id ="6"name="detail" value="6">
                        <label for="6">젤리</label>
                        <input type="radio" id ="7"name="detail" value="7">
                        <label for="7">껌</label>
                        <input type="radio" id ="8"name="detail" value="8">
                        <label for="8">비스킷</label>
                        <input type="radio" id ="9"name="detail" value="9">
                        <label for="9">시리얼바</label>
                        <br>
                        음료류
                        <br>
                        <input type="radio" id ="10"name="detail" value="10">
                        <label for="10">차</label>
                        <input type="radio" id ="11"name="detail" value="11">
                        <label for="11">우유</label>
                        <input type="radio" id ="12"name="detail" value="12">
                        <label for="12">커피</label>
                        <input type="radio" id ="13"name="detail" value="13">
                        <label for="13">이온음료</label>
                        <br>
                        <input type="radio" id ="14"name="detail" value="14">
                        <label for="14">유산균음료</label>
                        <input type="radio" id ="15"name="detail" value="15">
                        <label for="15">과즙음료</label>
                        <input type="radio" id ="16"name="detail" value="16">
                        <label for="16">탄산음료</label>
                        <input type="radio" id ="17"name="detail" value="17">
                        <label for="17">에너지음료</label>
                        <br>
                        간편식류
                        <br>
                        <input type="radio" id ="18"name="detail" value="18">
                        <label for="10">컵라면</label>
                        <input type="radio" id ="19"name="detail" value="19">
                        <label for="11">핫도그/소시지</label>
                        <input type="radio" id ="20"name="detail" value="20">
                        <label for="12">계란</label>
                        <input type="radio" id ="21"name="detail" value="21">
                        <label for="13">시리얼</label>
                        <input type="radio" id ="22"name="detail" value="22">
                        <label for="13">컵밥</label>
                        
                    </td>
                    
               </tr>
               <tr>
                    <td>맛
                        <br>
                        <input type="radio" id ="1"name="flavor" value="1">
                        <label for="1">달콤</label>
                        <input type="radio" id ="2"name="flavor" value="2">
                        <label for="2">짭잘</label>
                        <input type="radio" id ="3"name="flavor" value="3">
                        <label for="3">담백</label>
                        <input type="radio" id ="4"name="flavor" value="4">
                        <label for="4">고소</label>
                        <input type="radio" id ="5"name="flavor" value="5">
                        <label for="5">새콤</label>
                        <input type="radio" id ="6"name="flavor" value="6">
                        <label for="6">매콤</label>

                    </td>
               </tr>
               <tr>
                <td>향
                    <br>
                        <input type="radio" id ="1"name="flavor" value="1">
                        <label for="1">딸기</label>
                        <input type="radio" id ="2"name="flavor" value="2">
                        <label for="2">바나나</label>
                        <input type="radio" id ="3"name="flavor" value="3">
                        <label for="3">복숭아</label>
                        <input type="radio" id ="4"name="flavor" value="4">
                        <label for="4">사과</label>
                        <input type="radio" id ="5"name="flavor" value="5">
                        <label for="5">자몽</label>
                        <br>
                        <input type="radio" id ="6"name="flavor" value="6">
                        <label for="6">포도</label>
                        <input type="radio" id ="7"name="flavor" value="7">
                        <label for="7">꿀</label>
                        <input type="radio" id ="8"name="flavor" value="8">
                        <label for="8">녹차</label>
                        <input type="radio" id ="9"name="flavor" value="9">
                        <label for="9">커피</label>
                        <input type="radio" id ="10"name="flavor" value="10">
                        <label for="10">초코</label>
                        <br>
                        <input type="radio" id ="11"name="flavor" value="11">
                        <label for="11">바닐라</label>
                        <input type="radio" id ="12"name="flavor" value="12">
                        <label for="12">요거트</label>
                        <input type="radio" id ="13"name="flavor" value="13">
                        <label for="13">치즈</label>
                        <input type="radio" id ="14"name="flavor" value="14">
                        <label for="14">감자</label>
                        <input type="radio" id ="15"name="flavor" value="15">
                        <label for="15">고구마</label>
                        <br>
                        <input type="radio" id ="16"name="flavor" value="16">
                        <label for="16">곡물</label>
                        <input type="radio" id ="17"name="flavor" value="17">
                        <label for="17">와사비</label>
                        <input type="radio" id ="18"name="flavor" value="18">
                        <label for="18">양파</label>
                        <input type="radio" id ="19"name="flavor" value="19">
                        <label for="19">해물</label>

                </td>
                </tr>
            </table>



           <input type="submit" value="등록하기">

        </form>

    </div>

</body>
</html>