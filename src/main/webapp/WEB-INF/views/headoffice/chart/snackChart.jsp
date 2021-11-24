<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

	<div class="container-fluid">
		<div class="row flex-nowrap">

			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />


			<div class="content">
			

			
			<h2>인기 간식 통계</h2>
			<br>
			 <div id="bar_chart_div"></div>
			

			</div>



		</div>
	</div>

<script>
google.charts.load('current', {'packages':['bar','corechart']});
 
    function schedulerSuccessAndFailChart() {
        var data = google.visualization.arrayToDataTable([
               ["Title","성공", {role:'annotation'}, "실패", {role:'annotation'}],
                        [""
                ,413, 413 //성공데이터
                ,24, 24] //실패데이터
       ]);
 
       var barChartOption = {
               bars: 'vertical',
               height :260,
               width :'100%',
               legend: { position: "top" },
               isStacked: false,
               tooltip:{textStyle : {fontSize:12}, showColorCode : true},
               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                 startup: true,
                 duration: 1000,
                 easing: 'linear' },
               annotations: {
                   textStyle: {
                     fontSize: 15,
                     bold: true,
                     italic: true,
                     color: '#871b47',
                     auraColor: '#d799ae',
                     opacity: 0.8
                   }
              }
        };
 
       var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
 
       chart.draw(data, barChartOption);
       //반응형 그래프 출력 
       //window.addEventListener('resize', function() { chart.draw(data, barChartOption); }, false);
    }
 
    google.charts.setOnLoadCallback(schedulerSuccessAndFailChart);
 
 
 
</script>



</body>
</html>