<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>

<style>

  .cal {
    padding: 40px 10px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
    height: 100vh;
    overflow-y: auto;
  }

  #calendar {
    max-width: 130vh;
    margin: 0 auto;
   
  }

</style>



</head>
<body>

	<div class="container-fluid">
    	<div class="row flex-nowrap">

		
		<jsp:include page="../common/sidebar.jsp"/>
		
		<div class="cal col-10">
			<div id='calendar'></div>
		</div>
		
		</div>
	</div>
	
	
	
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	var today = new Date();
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialDate: today,
      editable: true,
      selectable: true,
      businessHours: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2021-11-01'
        },
        {
          title: 'Long Event',
          start: '2021-11-07',
          end: '2021-11-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-11-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-11-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2021-11-11',
          end: '2021-11-13'
        },
        {
          title: 'Meeting',
          start: '2021-11-12T10:30:00',
          end: '2021-11-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2021-11-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2021-11-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2021-11-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2021-11-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2021-11-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2021-11-28'
        }
      ]
    });

    calendar.render();
  });

</script>

</body>
</html>