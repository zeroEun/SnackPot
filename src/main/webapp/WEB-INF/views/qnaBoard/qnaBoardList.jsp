<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<style>
	#boardList{text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	 

    <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>문의게시판</h2>
            <br>
            
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${list}" var="q">
	                    <tr>
	                        <td>${ q.QNo }</td>
	                        <td>${ q.QTitle }</td>
	                        <td>${ q.name }</td>
	                        <td>${ q.createDate }</td>
	             			<td>
	             			 <c:if test="${not empty q.ATitle}">
	                        답변완료
	                        </c:if>
	             			</td>
	             			<td>${q.writer}</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.qna?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.qna?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.qna?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.qna?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <br>
            <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollForm.qna">글쓰기</a>
            </c:if>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <c:if test="${ !empty loginUser }">
    
    
    <script>
    
	var writer = $("#boardList tbody tr").children().eq(5).text();
	var loginUser = '${loginUser.getMemId()}';
	console.log(loginUser);
	console.log(writer);
     
    	$(function(){
    		
    		$("#boardList tbody tr").click(function(){
    			if(writer == loginUser){
    			console.log($(this).children().eq(0).text());
    			location.href="detail.qna?qno=" + $(this).children().eq(0).text();
    		}
    		});
    	});
    </script>
    
    
    
    </c:if>
    
     

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>