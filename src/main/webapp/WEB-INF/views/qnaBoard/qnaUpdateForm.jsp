<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>문의 수정하기</h2>
            <br>
			
            <form id="enrollForm" method="post" action="update.qna" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="qTitle" required value="${ q.QTitle }"></td>
                    </tr>
               
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                        <c:if test="${ !empty q.changeName }">
	                                                               현재 업로드된 파일 : ${ q.changeName } <br>
	                            <input type="hidden" name="changeName" value="${ q.changeName }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="qContent" id="content" rows="10" style="resize:none;">${ q.QContent }</textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-danger" onclick="javascript:history.go(-1);">취소하기</button>
                </div>
                <input type="hidden" name="qNo" value="${ q.QNo }">
            </form>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>