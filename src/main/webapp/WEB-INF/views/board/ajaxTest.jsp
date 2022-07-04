<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- <link href="/jqueryui/css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet">  -->
<!-- <script src="/jqueryui/js/jquery-1.10.2.js" type="text/javascript"></script>  -->
<!-- <script src="/jqueryui/js/jquery-ui-1.10.4.custom.js" type="text/javascript"></script> -->


<style>
	#modDiv {
		width: 300px;
		height: 100px;
		background-color: yellow;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
</style>
</head>
<body>

<input type="text" id="title" style="border:1px solid"><br><br>
<input type="text" id="id" style="border:1px solid"><br><br>
<input type="text" id="date" style="border:1px solid">
	
<button type="button" id = 'button'><a href="/restBoard/restList.html"> 데이터 가져오기</a></button>	

<script>

$(document).ready(function() {
	
	var userId = 'tjdals1122'
		
	var today = new Date();
	
	var year = today.getFullYear();
	
	var month = today.getMonth()+1;
	
	var day = today.getDay();
	
	var date = year-+month-+day;
	
	//$('#button').on('click', function(){
		$.ajax({
			type : 'get',
			url :  'http://localhost:8080/replies/conversation/2022-07-01/'+userId+'',
			headers : {
				"Content-Type" : "application/json; charset=utf-8",
				"X-HTTP-Method-Override" : "GET"
			},
	 	    dataType : 'json',

		    success : function(result) {

				console.log(result);
		    }

		});
	// });	
	
// 		var url = '/restBoard/restList.html'	
		
// 		$('#button').on('click', function(){
				
// 				window.open(url,'게시물리스트')
			
// 		});	

	var path = window.location.pathname;
	
	alert(path);
	
	});
	

	
// 게시판 리스트
// 	$('#button').on('click', function(){
// 		$.ajax({
// 			type : 'get',
// 			url : 'http://10.51.53.121:47901/openapi/v1/brity/tenants/conversation?date='+date,
// 			headers : {
// 				"Content-Type" : "application/json; charset=utf-8",
// 				"X-HTTP-Method-Override" : "GET"
// 			},
// 	 	    dataType : 'json',

// 		    success : function(result) {

// 				console.log(result);
		    	
// 				var timestamp = result[0].regdate;
// 				var date = new Date(timestamp);
				
// 				var formattedTime =  date.getFullYear()
// 									+ "/" + (date.getMonth() + 1)
// 									+ "/" + date.getDate();
				
				

// 		    	$('#title').val(result[0].replytext);
// 		    	$('#id').val(result[0].replyer);
// 		    	$('#date').val(formattedTime);		 
// 		    }
// 		});
// 	});	






// 		$('#button').on('click', function(){
			
// 			$.ajax({
// 				type : 'get',
// 				url : '/replies/all/1000',
// 				headers : {
// 					"Content-Type" : "application/json; charset=utf-8",
// 					"X-HTTP-Method-Override" : "GET"
// 				},
// 		 	    dataType : 'json',

// 			    success : function(result) {

// 					console.log(result);
			    	
// 					var timestamp = result[0].regdate;
// 					var date = new Date(timestamp);
					
// 					var formattedTime =  date.getFullYear()
// 										+ "/" + (date.getMonth() + 1)
// 										+ "/" + date.getDate();
					
					

// 			    	$('#title').val(result[0].replytext);
// 			    	$('#id').val(result[0].replyer);
// 			    	$('#date').val(formattedTime);			
// 			    }
// 			});
	







</script>	
</body>
</html>












