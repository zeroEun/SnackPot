<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

        /*본문 부분*/
        .content{
            height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
        }

        .search{
            margin: 15px 0px;
            
            
        }

</style>

</head>
<body>

    <section class="snack-list">
    
        <div class="container-fluid">
            <div class="row flex-nowrap">

                <!-- Sidebar -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
            
                <div class="content col-8">
                    <h5>간식 리스트 발송 내역</h5>
                    <hr>

                    <div class="search form-inline"><!-- form-inline : 한줄에 배치 -->
                    	<form action="searchList.sn" method="post" id="searchList">
	                        <select class="search-select form-control" id="category" name="category">
	                            <option value="0">카테고리</option>
	                            <option value="1">리스트 번호</option>
	                            <option value="2">회사명</option>
	                            <option value="3">발송 상품</option>
	                        </select>
	
							<input hidden="hidden"><!-- enter 눌렀을 때 submit 방지 -->
	                        <input type="text" class="form-control" name="search" id="searchInput" placeholder="검색어 입력">
	                        <input type="date" class="form-control" name="startDate" id="startDate">
	                        <input type="date" class="form-control" name="endDate" id="endDate">
	
	                        <button class="btn btn-primary" type="button" id="searchBtn">검색</button>
                        </form>
                    </div>

                    <table class="table table-bordered" id="snackList">
                        <thead class="thead-light">
                            <tr>
                            	<th>리스트 번호</th>
                                <th>회사명</th>
                                <th>리스트 발송일</th>
                                <th>발송 내역</th>
                            </tr>
                        </thead>

                        <tbody>
                        	<c:forEach items="${sendingList}" var="s">
                        	
                        		<tr>
                        			<td>${s.snackListNo}</td>
	                                <td>${s.comName}</td>
	                                <td>${s.transDate}</td>
	                                <td>${s.content} 외...</td>
                            	</tr>
                        	
                        	</c:forEach>
                        </tbody>

                    </table>

                </div>
            </div>
        </div>
    
    </section>
    
<script>
	$(function(){
		$("#snackList tbody tr").click(function(){
			location.href="sendingDetail.sn?snackListNo=" + $(this).children().eq(0).text();
		});
		
		
		<%--날짜 값을 설정하지 않으면 형변환 에러가 발생하므로 disabled속성 주기, disabled는  객체 전송 안됨--%>
		$('#searchBtn').click(function(){
			
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			
			if(startDate == ''){
				$('#startDate').attr('disabled', true);
			}
			
			if(endDate == ''){
				$('#endDate').attr('disabled', true);
			}
			
			<%--카테고리 리스트번호 선택 후 검색어 입력하지 않았을 경우 --%>
			var c = $('select[name=category]').val();
			var text = $('#searchInput').val();
			
			if(c == 1 && text == ''){
				$('select[name=category]').val(0);
			}
			
			$('#searchList').submit();
			
		});
		
		$('#category').on('change', function(){
			
			var c = $('select[name=category]').val();
			
			if(c == 1){
				$('#searchInput').val('');
				$('#searchInput').attr('placeholder', '숫자만 입력해 주세요');
				$('#searchInput').attr('onKeyup', 'this.value=this.value.replace(/[^0-9]/g,"");');
			}else{
				$('#searchInput').removeAttr('onKeyup');
				$('#searchInput').attr('placeholder', '검색어 입력');
			}
			
		});
		
		
	});

</script>

</body>
</html>