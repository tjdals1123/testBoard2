<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel=”stylesheet” href=”/jquery-ui.css”>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src=”/jquery-ui.js”></script></head>
<body>

	<h1>게시글 작성하기</h1>
	
	<form action="/board/register" method="post">
		제목 : <input class="form-control" type="text" name="title"><br>
		내용 : <br><textarea class="form-control" name="content"></textarea><br>
		글쓴이 : <input class="form-control" type="text" name="writer"><br>
		<input type="submit" value="완료">
	</form>
</body>
</html>