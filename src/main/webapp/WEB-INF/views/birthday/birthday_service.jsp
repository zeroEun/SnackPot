<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
    .per_amount{
        display: inline;
    }
    .sending_time{
        display: inline;
    }
</style>
<body>
    <h3>생일 구독 신청</h3>
    <form class="" action="">
        <label for="">1인당 최대 금액</label>
        <div class="form-group">            
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount1" value="10000">
                <label class="form-check-label" for="per_amount1">10,000원</label>
            </div>
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount2" value="30000">
                <label class="form-check-label" for="per_amount2">30,000원</label>
            </div>
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount3" value="50000">
                <label class="form-check-label" for="per_amount3">50,000원</label>
            </div>
            <div class="form-check per_amount">
                <input class="form-check-input" type="radio" name="per_amount" id="per_amount4" value="100000">
                <label class="form-check-label" for="per_amount4">100,000원</label>
            </div>
        </div>
        <hr>
        <label for="">발송 시점</label>
        <div class="form-group">            
            <div class="form-check sending_time">
                <input class="form-check-input" type="radio" name="sending_time" id="sending_time1" value="당일">
                <label class="form-check-label" for="per_amount1">당일</label>
            </div>
            <div class="form-check sending_time">
                <input class="form-check-input" type="radio" name="sending_time" id="sending_time2" value="3일전">
                <label class="form-check-label" for="per_amount2">3일 전</label>
            </div>
            <div class="form-check sending_time">
                <input class="form-check-input" type="radio" name="sending_time" id="sending_time3" value="5일전">
                <label class="form-check-label" for="per_amount2">5일 전</label>
            </div>
        </div>
        <hr>
        <label for="">선물 선택 알림 메시지</label>
        <div class="form-group">            
            <textarea class="form_control" cols="50" rows="5"></textarea>
        </div>
        <hr>
        <label for="">수신자 정보</label><br>
        <button class="btn btn-dark">사원 리스트 불러오기</button>
        <hr>
        <button class="btn btn-dark">이전으로</button><button class="btn btn-outline-primary">구독 신청하기</button>
    </form>
</body>
</html>