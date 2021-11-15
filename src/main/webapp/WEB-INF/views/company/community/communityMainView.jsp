<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>snackPotCommunity</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- <link rel="stylesheet" href="/css/community.css"> -->
</head>
<style>
.top-img{
    background-color: skyblue;
    text-align: center;
}
/*검색box 포지션*/
.search-box{
    position: relative;
    margin-bottom: 20px;
    margin-left: 40px;
    text-align: left;

}
/*검색box안에 아이콘을 넣기위한 포지션*/
.search-box i{
    position: absolute;
    left: 210px;
    top: 12px;
    color: rgb(10, 23, 78);
}
#myInput{
	width: 250px;
    display: inline-block;
    border-radius: 20px;
    border: 4px solid rgb(245, 208, 66);
}
/*인기 게시글*/
.fa-fire-alt{
    color: red;
    margin-right: 5px;
    margin-top: 20px;
    font-size: 30px;
}
.hotBoard{
    text-align: center;
}
.hotBoard > label > h3{
    font-weight: bold;
    margin-bottom: 20px;
}
#topBoardBody{
    border: 1px solid lightgray;
}
/*글쓰기 , 조회 버튼*/
.writerBtn{
    background-color: rgb(10, 23, 78);
    color: white;
    border-style: none;
}
.readBtn{
    background-color: rgb(245, 208, 66);
    border-color:  rgb(245, 208, 66);
    border-style: none;

}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<div class="container-fluid">
		<!--맨위 상단
		<div class="top-img">
			<img src="/resource/image/쿠키.png" style="width: 30px;"> <label><h4>회사명커뮤니티</h4></label>
			<img src="/resource/image/케이크.png" style="width: 30px;">
		</div>-->

		<br>

		<!--인기글-->
		<div class="hotBoard">
			<i class="fas fa-fire-alt"></i> <label><h4>HOT.인기 게시글</h4></label>
		</div>

		<!--인기글 table-->
		<table class="table table-borderless">
			<thead>
				<tr>
					<th></th>
					<th>제목</th>
					<th>작성일</th>
					<th>추천</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody id="topBoardBody">
				<tr>
					<td>1.</td>
					<td>제목내용</td>
					<th>작성일내용</th>
					<td>추천수</td>
					<td>조회수</td>
				</tr>
			</tbody>
		</table>
		<br>
		<br>

		<!--제목 찾기 부트스트랩(filter)-->
		<div class="search-box">
			<input class="form-control" id="myInput" type="text" placeholder="제목">
			<a class="searchBtn"> <i class="fas fa-search"></i>
			</a>
		</div>
		<!--커뮤니티 게시판-->
		<table class="table" id="cmnt">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성일</th>
					<th>추천</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="c">
				<tr>
					<td>${c.communityNo }</td>
					<td>${c.title}<label>[댓글수]</label><i class="far fa-image"></i></td>
					<td>${c.writerDate }</td>
					<td>${c.recommend }</td>
					<td>${c.views }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="board-Btn">
			<button class="writerBtn" onclick="writer()">글쓰기</button>
			<button class="readBtn">내글보기</button>
		</div>
		
		 <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            <br clear="both"><br>
	</div>
</body>
<script>
    	$(function(){
    		$("#cmnt tbody tr").click(function(){
    			location.href="detail.cm?cno=" + $(this).children().eq(0).text();
    		});
    	});
    	
    	function writer(){
    	location.href="enrollForm.cm";
    	}
</script>

</html>