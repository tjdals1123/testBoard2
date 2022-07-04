<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h1 class="text-primary text-center">글쓰기</h1>
	<br><br>
		제목	 : <input class="form-control" type="text" id="title" name="title"><br><hr>
		내용	 : <textarea class="form-control" style="resize: none; height: 150px;" name="content" id="content"></textarea><br><hr>
		작성자 : <input class="form-control" type="text" name="writer" id="writer" value="${login.uid }"><br><hr>
		작성일자: <input class="form-control" type="text" name="regdate" readonly><br><hr>
	<input type="button" class="btn btn-primary float-right" id="complBtn" value="완료">
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
			
			$("#complBtn").on("click", function(){
				
				var title = $("#title").val();
				var content = $("#content").val();
				var writer = $("#writer").val();
				
				console.log(title);
				console.log(content);
				console.log(writer);
				
				$.ajax({
					
					type : 'post',
					url : '/board/register',
					header : {
						
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					contentType : "application/json",
					data : JSON.stringify({
						
						title : title,
						writer : writer,
						content : content
					}),
					dataType : 'text',
					success : function(result) {
						
						console.log("result: " + result);
						if(result == 'SUCCESS') {
							
							alert("작성이 완료되었습니다.");
 							location.href="/board/list";
						}
					}
					
					
				});
			});
			
		
	</script>
</body>
</html>














