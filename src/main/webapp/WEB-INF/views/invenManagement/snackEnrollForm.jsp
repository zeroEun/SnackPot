<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	  <div id="formWrap">

        <h2>간식품목등록</h2>

        <form id="snackEnroll">


            <table border="1px">
               <tr>
                   <td rowspan="9">사진등록
                       <br>
                       <input type="file">
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
                            <option value="snack">스낵류</option>
                            <option value="beverage">음료류</option>
                            <option value="instantMeal">간편식류</option>
                        </select>
                    </td>
                    
               </tr>
               <tr>
                    <td>세부 카테고리
                        <br>
                        <input type="radio" id ="snack"name="detail">
                        <label for="snack">과자</label>
                        <input type="radio" id ="cookie"name="detail">
                        <label for="cookie">쿠키</label>
                        <input type="radio" id ="pie"name="detail">
                        <label for="pie">파이</label>
                        <input type="radio" id ="chocolate"name="detail">
                        <label for="chocolate">초콜렛</label>
                        <input type="radio" id ="snack"name="detail">
                        <label for="snack">과자</label>
                        <input type="radio" id ="cookie"name="detail">
                        <label for="cookie">쿠키</label>
                        <input type="radio" id ="snack"name="detail">
                        <label for="snack">과자</label>
                        <input type="radio" id ="cookie"name="detail">
                        <label for="cookie">쿠키</label>
                    </td>
                    
               </tr>
               <tr>
                    <td>맛</td>
               </tr>
               <tr>
                <td>향</td>
                </tr>
            </table>



           <input type="submit" value="등록하기">

        </form>

    </div>

</body>
</html>