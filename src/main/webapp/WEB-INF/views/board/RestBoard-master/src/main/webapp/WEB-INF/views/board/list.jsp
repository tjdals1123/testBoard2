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
	
	
	<div class="container"><br><br>
	<h1 class="text-primary text-center">게시글 리스트</h1><br><br><br><br><br>
			<a href="/board/register"><input type="button" class="btn btn-primary float-right mb-2" value="글쓰기"></a>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일자</th>
					<th>수정일자</th>
				</tr>
			</thead>
			<tbody id="boardList">
			
			</tbody>
		</table>
		<div class="row d-block" style="width:65%">
			<ul id="pagination" class="pagination float-right">
			
			</ul>
			<ul id="search" class="search float-right">
			
			</ul>
		</div>
		
	
	<div class="row d-block ">
	<div class="btn-group float-right" data-toggle="buttons" style="width:45%">
		<label class="btn btn-default" >
		<input type="radio" name="searchTypeT" id="option1" value="t">제목
		</label>
		<label class="btn btn-default">
			<input type="radio" name="searchTypeT" id="option2" value="c"> 내용
		</label>
		<label class="btn btn-default">
			<input type="radio" name="searchTypeT" id="option3" value="w"> 작성자
		</label>		
		<input type="text" name="keyword" id="keywordInput" placeholder="Search">
		<button class="btn btn-primary btn-lg" id=searchBtn>검색</button>
	</div>
	</div>
</div>
		<input type="hidden" id="hiddenNum" value="0">
	

	<script type="text/javascript">
		$(document).ready(function(){
			
			
			
 		function listCriteria(page){	
			
			$.ajax({
				
				type : 'get' ,
				url : '/board/list/' + page,
				header : {
					"Content-Type" : "application/json" ,
					"X-HTTP-Method-Override" : "get"
				},
				dataType : 'json',
				data :  
					page,
					
				success : function(result){
					
						var str1 = "";
						
					$(result.list).each(function(){
						
						
						str1 += "<tr><td>" + this.bno + "</td><td><a href='/board/get?bno="+this.bno+"'>" + this.title
							+ "</a></td><td>" + this.writer + "</td><td>" + this.regdate
							+ "</td><td class='updatedate'>" + this.updatedate + "</td></tr>";
						paging(result.pageMaker);
					});
					
					
 					$("#boardList").html(str1);
 					
 					$("#hiddenNum").val("1");
				
					 
				}
 					
				
			});
		}
					
					
				function paging(pageMaker){	
					
					
					var str = "";
					
					if(pageMaker.prev){
					
					str += "<li class='page-item'><a class='page-link' href = '"+ (pageMaker.startPage - 1) +"'>"
						+" << </a></li>";
					
					}
					
					for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
						
						var active = pageMaker.cri.page == i ? 'active' : '';
						
						
						str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i +
						"</a></li>";
					}
					
					if(pageMaker.next) {
						
						str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) +
						"'> >> </a></li>";
					}
					
					$("#pagination").html(str);
				}
			
			
				listCriteria(1);
			
			
			$("#pagination").on("click", "li a", function(e) {
				
				e.preventDefault();
				
				formPage = $(this).attr("href");
				
				if($("#hiddenNum").val() == 1){
					
					listCriteria(formPage);
					
				}else if($("#hiddenNum").val() == 2){
					
					var searchType = $('input[name="searchTypeT"]:checked').val();
					
					var keyword = $("#keywordInput").val();
					searchList(formPage, searchType, keyword);
				}else{}
				
				
			});
			
		
			function searchList(page, searchType, keyword) {
				
				var searchListStr = "";
				
				
				
				$.ajax({
					
					type : "get",
					url : "/board/list/" + page + "/" + searchType + "/" + keyword ,
					header : {
						"Content-Type" : "application/json",
						"X-HTTP-Mthod-Override" : "GET"
					},
					contentType : 'application/json',
					data : JSON.stringify(page , searchType, encodeURI(keyword)),
					dataType : 'json',
					success : 
						function(searchList) {
						
						
    	    			
						$(searchList.list).each(function(){
						
							searchListStr += "<tr><td>" + this.bno + "</td><td><a href='/board/get?bno="+this.bno+"'>" + this.title
							+ "</a></td><td>" + this.writer + "</td><td>" + this.regdate
							+ "</td><td class='updatedate'>" + this.updatedate + "</td></tr>";

							
						});
						
						$("#boardList").html(searchListStr);
						paging(searchList.pageMaker);
						
						$("#hiddenNum").val("2");
					}
					
				});
				
			}
 			
			$("#searchBtn").on("click", function(){
				
				var searchType = $('input[name="searchTypeT"]:checked').val();
				
				var keyword = $("#keywordInput").val();
				
				searchList(1, searchType, keyword);
				
			});
		
		});
	</script>
	
</body>
</html>
















