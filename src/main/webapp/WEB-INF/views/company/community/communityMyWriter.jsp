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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

<table class="table" id="cmnt">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성일</th>
					<th>추천</th>
					<th>조회</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="c">
				<tr>
					<td>${c.communityNo }</td>
					<c:if  test="${ !empty c.originName }">
					<td>${c.title}<label>[댓글수]</label>&nbsp;&nbsp;<i class="far fa-image"></i></td>
					</c:if>
					
					<c:if  test="${ empty c.originName }">
					<td>${c.title}<label>[댓글수]</label></td>
					</c:if>		
					<td>${c.writerDate }</td>
					<td>${c.recommend }</td>
					<td>${c.views }</td>
					<td>${c.writer}</td>
				</tr>
			</c:forEach>
			</tbody>
			<button class="CmntBtn" onclick="CmntBtn()"><i class="fas fa-home"></i></button>
	</table>
	 <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="myWriter.cm?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="myWriter.cm?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="myWriter.cm?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="myWriter.cm?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
        <br clear="both"><br>
</body>
<script>

    	$(function(){
    		$("#cmnt tbody tr").click(function(){
    			location.href="detail.cm?cno=" + $(this).children().eq(0).text();
    		});
    	});   	
    	
    	function CmntBtn(){
    		location.href="list.cm";
    	}
    	
</script>
</html>