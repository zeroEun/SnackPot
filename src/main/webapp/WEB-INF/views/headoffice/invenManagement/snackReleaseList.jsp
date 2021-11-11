<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 목록 조회</title>

<style>
    #modal.modal-overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.25);
        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
    }
    #modal .modal-window {
        background: rgba( 69, 139, 197, 0.70 );
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 400px;
        height: 500px;
        position: relative;
        top: -100px;
        padding: 10px;
    }
    #modal .title {
        padding-left: 10px;
        display: inline;
        text-shadow: 1px 1px 2px gray;
        color: white;
        
    }
    #modal .title h2 {
        display: inline;
    }
    #modal .close-area {
        display: inline;
        float: right;
        padding-right: 10px;
        cursor: pointer;
        text-shadow: 1px 1px 2px gray;
        color: white;
    }
    
    #modal .content {
        margin-top: 20px;
        padding: 0px 10px;
        text-shadow: 1px 1px 2px gray;
        color: white;
    }

    .inputLabel{

        
        display: flex;

    }
</style>


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

        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <div class="title">
                    <h2>출고등록</h2>
                </div>
                <div class="close-area">X</div>
                <form>
                <div class="content">
                    <p><label class="inputLabel">제품코드</label> <input type="number"></p>
                    <p><label class="inputLabel">수량</label> <input type="number"></p>
                    <p><label class="inputLabel">비고</label> <input type="text"></p>
                    <br><br>
                    <input type="submit">
                </div>
            </form>
            </div>
        </div>
	
    <div id="arrivalWrap">

        <h3>출고목록</h3>

        <input type="date">
        <br>
        <form name="search">
        <select name="searchType">
            <option value="1">상품코드</option>
            <option value="2">상품명</option>
            <option value="3">입고번호</option>
        </select>
        <input type="text" name="searchInput">
        <input type="submit" name="searchBtn">
        </form>
        <br>
        <br>
        <table id="arrivalList" border="1">


            <tr>
                <th>출고번호</th>    
                <th>상품코드</th>  
                <th>상품명</th>   
                <th>출고수량</th>   
                <th>재고량</th>              
                <th>단위</th>   
                <th>비고</th>   
            </tr>

        </table>
        
        <button id="addBtn">출고 등록</button>

    </div>
      </div>
        </div>

        <script>

        
        const modal = document.getElementById("modal")
const btnModal = document.getElementById("addBtn")
btnModal.addEventListener("click", e => {
modal.style.display = "flex"
})

const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
modal.style.display = "none"
})

window.addEventListener("keyup", e => {
if(modal.style.display === "flex" && e.key === "Escape") {
modal.style.display = "none"
}
})
</script>
</body>


</html>