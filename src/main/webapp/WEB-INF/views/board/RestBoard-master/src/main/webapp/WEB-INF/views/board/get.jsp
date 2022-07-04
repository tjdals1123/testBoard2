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
	
	<h1 class="text-primary text-center">상세보기</h1>
	<br><br>
		글번호 : <input class="form-control" type="text" id="bnoo" name="bno" readonly><br><hr>
		제목	 : <input class="form-control" type="text" id="title" name="title" readonly><br><hr>
		내용	 : <textarea class="form-control" style="resize: none; height: 150px;" name="content" id="content" readonly></textarea><br><hr>
		작성자 : <input class="form-control" type="text" name="writer" id="writer" readonly><br><hr>
		작성일자: <input class="form-control" type="text" name="regdate" id="regdate" readonly><br><hr>
		<div id="get"></div>
	<div>
		<a href="/board/list">
	<input type="button" class="btn btn-primary float-right" id="listBack" value="목록">
	</a>
	<input type="button" class="btn btn-warning float-right" id="modifyBtn" value="수정">
	<input type="button" class="btn btn-danger float-right" id="deleteBtn" value="삭제">
	</div>
		
<!-- 	<div id ="replwrite">	 -->
<!-- 	<div class="row"> -->
<!-- 		<h3 class="text-primary">댓글 작성</h3> -->
<!-- 	</div> -->
<!-- 	<div class="row"> -->
<!-- 		<textarea rows="4" cols="50" id="replcontent"></textarea> -->
<!-- 		<button class="btn btn-primary ml-1" id="replWrite">작성완료</button> -->
<!-- 	</div> -->
<!-- 	</div> -->
	
<!-- 	<div class="row"> -->
<!-- 		<h3 class="text-primary">댓글</h3><br><br> -->
<!-- 	</div> -->
<!-- 	<div class="row"> -->
<!-- 		<div> -->
<!-- 			<!-- 댓글이 들어갈 위치 --> 
<!-- 			<table class="table table-hover"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>댓글번호</th> -->
<!-- 						<th>작성자</th> -->
<!-- 						<th>제목</th> -->
<!-- 						<th>작성일자</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody id="replies"> -->
<!-- 				</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div>	 -->
<%-- 	<input type="hidden" id="uid" name="uid" value="${login.uid}"> --%>
	
	
<!-- 	<div class="row"> -->
<!-- 		<ul class="pagination"> -->
<!-- 			<!-- 페이지네이션 --> 
<!-- 		</ul> -->
<!-- 	</div>	 -->
	
</div>
	


<script type="text/javascript">

	$(document).ready(function(){
		
		
		
		
			
			
		
		var para = document.location.href.split("="); 
		
		var bno = para[1]
		
		var str = "";
		
		$.ajax({
			
			type : 'get',
			url : '/board/get/' + bno,
			header : {
				
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "get"
			},
			
			dataType : 'json',
			data : 
				bno
			,
			success : function(board) {
				
				
				$("#bnoo").val(board.bno);
				$("#title").val(board.title);
				$("#content").val(board.content);
				$("#writer").val(board.writer);
				$("#regdate").val(board.regdate);
				
				if(board.updatedate != null){
					
				str += "<input class='form-control' type='text' name='updatedate' id='updatedate' value='"+ board.updatedate +"' readonly><br><hr>";
				
				
				
				$("#get").append(str);
				
				}
				
// 				if($("#uid").val() != board.writer){
// 					$("#modifyBtn").hide();
// 					$("#deleteBtn").hide();
// 				} 
				
			}
			
		});
		
		
		$("#deleteBtn").on("click", function(){
			
			
			$.ajax({
				
				type : 'get',
				url : '/board/delete/' + bno,
				header : {
					
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "get"
				},
				
				dataType : 'text',
				data : 
					bno
				,
				success : function(result) {
					
					if(result == 'SUCCESS'){
						
						alert("게시글 삭제가 완료되었습니다.");
						location.href="/board/list"
					}
				}
				
				});		
			});	
		
		$("#modifyBtn").on("click", function(){
			
			location.href="/board/modify?bno=" + $("#bnoo").val();
			
		});
		
		replStr = "";
		
		$.ajax({
			
			type : 'post',
			url  : '/replies/all/' + bno,
			header : {
				
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			data : 
				bno
			,
			success : function(result){
							
					$(result).each(function(){
						
						var timestamp = this.regdate;
						var date = new Date(timestamp);
						var formattedTime = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
						
						
						
						replStr += "<tr><td class='text-center'>" + this.rno + "</td><td>" + this.replyer + "</td><td>" + this.replytext
								+ "</td><td>" + formattedTime + "</td></tr>"	
					});
					
				$("#replies").html(replStr);
				
				
			}
		});
		
		
		
		if($("#uid").val() == ""){
			
			$("#replwrite").hide();
		} // 비로그인 상태에서 댓글 작성창 가림
		
		
		$("#replWrite").on("click", function(){
			
			var bno = $("#bnoo").val();
			var replyer = $("#uid").val();
			var content = $("#replcontent").val();
			
			console.log(bno);
			console.log(replyer);
			console.log(content);
			
			$.ajax({
				
				type : 'post',
				url : '/replies',
				header : {
					
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				
				data : 
					 JSON.stringify({
						 bno : bno, 
						 replyer : replyer, 
						 content : content
						 }),
				dataType : 'text',
				success : function(result){
					
					alert("전송 완료");
				}
			});
		});
		
		
	});

	
	
	//로그인 처리 후 리플 작성 구현, 모달창으로 수정 삭제 기능 구현
</script>	
</body>
</html>














