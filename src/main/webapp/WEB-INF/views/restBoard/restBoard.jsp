<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>




</body>
<script>

$(document).ready(function(){
	
	
	var url = "http://localhost:8080/restboard/restList/200"
	
	$.ajax ({
		
		url			:	url
		,type		:	'GET'
		,dataType	:	'JSON'
		,headers	: {
			
			'Content-Type'	:	'application/json;charset=UTF-8',
				"X-HTTP-Method-Override" : "GET"
		}
		,success		:	function(result){
			
			console.log(result);
			
		}	
		,error		:	function(x, o, e){
		
			alert('실패!!!!');
		}
	
	});
});
</script>
</html>