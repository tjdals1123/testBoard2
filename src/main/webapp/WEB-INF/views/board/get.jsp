<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%-- <link rel="stylesheet" href="<c:url value='/css/jquery-ui.css' />"> --%>
<%-- <script src="<c:url value = '/js/jquery.js' />" type="text/javascript"></script> --%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<%-- <script src= "<c:url value = '/js/jquery-ui.js'/>"></script> --%>
<link href="/jqueryui/css/start/jquery-ui-1.10.4.custom.css" rel="stylesheet"> 
<script src="/jqueryui/js/jquery-1.10.2.js" type="text/javascript"></script> 
<script src="/jqueryui/js/jquery-ui-1.10.4.custom.js" type="text/javascript"></script>


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
	${pageContext.request.contextPath}/
	<h1>${board.bno }번 글 내용</h1>
	
		<input type="hidden" name="bno" value="${board.bno }">
		<input type="hidden" name="page" value="${cri.page }">
		<div>
		글쓴이 <input type="text" readonly value="${board.writer}"><br>
		</div>
		<div>
		글제목 <input type="text" readonly value="${board.title}"><br>
		</div>
		<div>
		본문<textarea readonly>${board.content }</textarea><br>
		</div>
		<div>
		등록일자 <input type="text" readonly value="${board.regdate }"><br>
		</div>
	
	<div>
		<a href="/board/list?page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}"><input type="button" value="목록"></a>
		<a href="/board/modify?bno=${board.bno}&searchType=${cri.searchType}&keyword=${cri.keyword}"><input type="button" value="수정"></a>
		<a href="/board/remove?bno=${board.bno}&searchType=${cri.searchType}&keyword=${cri.keyword}"><input type="button" value="삭제"></a>
		<input type="button" id="button" value="버튼샘플" />
	</div>
	
	<div class="row">
			<h3 class="text-primary">댓글</h3>
			<div id="replies">
				<!-- 댓글이 들어갈 위치 -->
			</div>
		</div><!-- row -->
		
		<div class="row box-box-success">
			<div class="box-header">
				<h2 class="text-primary">댓글 작성</h2>
			</div><!-- header -->
			<div class="box-body">
				<strong>Writer</strong>
				<input type="text" id="newReplyer" placeholder="Replyer" class="form-control">
				<strong>ReplyText</strong>
				<input type="text" id="newReplyText" placeholder="ReplyText" class="form-control">
			</div><!-- body -->
			<div class="box-footer">
				<button type="button" class="btn btn-success" id="replyAddBtn">Add Reply</button>
			</div>
		</div><!-- row -->
		<div id="modDiv" style="display:none;">
			<div class="modal-title"></div>
			<div>
				<input type="text" id="replytext">
			</div>
			<div>
				<button type="button" id="replyModBtn">Modify</button>
				<button type="button" id="replyDelBtn">Delete</button>
				<button type="button" id="closeBtn">Close</button>
				
			</div>
		</div>
	
	
<script>
$(document).ready(function() {
	
	$(function(){ $("#button").button(); })

	
	var formObj = $("form");
	
	$('#board').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		console.log(operation);
		
		formObj.attr("method", "post");
		
		if(operation === "modify"){
			formObj.attr("action", "/board/modify");
		}else if(operation === "remove"){
			formObj.attr("action", "/board/remove");
		}
		

		formObj.submit(); 
	});
	
	var bno = ${board.bno};
	
	function getAllList(){
		$.getJSON("/replies/all/" + bno, function(data){
			
			console.log(data.length);
		
			var str = "";

			$(data).each(function() {
				var timestamp = this.updatedate;
				var date = new Date(timestamp);
				
				var formattedTime = "게시일 : " + date.getFullYear()
									+ "/" + (date.getMonth() + 1)
									+ "/" + date.getDate();
				
				str += "<div class='replyLi' data-rno='" + this.rno + "'><strong>@"
					+ this.replyer + "</strong> - " + formattedTime + "<br>"
					+ "<div class='replytext'>" + this.replytext + "</div>"
					+ "<button type='button' class='btn btn-info'>수정/삭제</button>"
					+ "</div>";
			});
			
			$("#replies").html(str);
		});
	}// getAllList()
	getAllList();
	
	
	$("#replyAddBtn").on("click", function() {
		var replyer = $("#newReplyer").val();
		var replytext = $("#newReplyText").val();
		
		$.ajax({
			type : 'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
		    dataType : 'text',
		    data : JSON.stringify({
		    	bno : bno,
		    	replyer: replyer,
		    	replytext : replytext
		    }),
		    success : function(result) {
		    	if(result == 'SUCCESS'){
		    		alert("등록 되었습니다.");
		    		$("#newReplyer").val("");
		    		$("#newReplyText").val("");
					getAllList();
		    	}
		    }
		});
	});
	
	$("#replies").on("click", ".replyLi button", function(){
		var reply = $(this).parent();
		var rno = reply.data("rno");
		var replytext = reply.children('.replytext').html();
		
		$(".modal-title").html(rno);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");
	});
	
	
	$("#replyDelBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result:  " + result);
				if(result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});		
	
	//수정버튼 작동
	$("#replyModBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type : 'patch',
			url : '/replies/' + rno,
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH"
			},
			contentType: "application/json",
			data: JSON.stringify({replytext:replytext}),
			dataType : 'text',
			success : function(result) {
				console.log("result:  " + result);
				if(result == 'SUCCESS') {
					alert("수정 되었습니다.");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});		
	
	//모달 닫기
	$("#closeBtn").on("click", function() {
		$("#modDiv").hide("slow");
	});
	
	

	
});//document

</script>	
</body>
</html>












