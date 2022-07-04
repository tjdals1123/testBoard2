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

	<h1>${board.bno }번 글 수정하기</h1>
		<div>
		<form action="/board/modify" method="post">
		글쓴이 <input type="text" name="writer" readonly value="${board.writer}"><br>
		</div>
		<div>
		글제목 <input type="text" name="title" value="${board.title}"><br>
		</div>
		<div>
		본문<textarea name="content">${board.content }</textarea><br>
		</div>
		<div>
		등록일자 <input type="text" readonly value="${board.regdate }"><br>
		<br><br>
		<input type="hidden" name="bno" value="${board.bno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<input type="submit" value="수정 완료">
		</form>
		</div>
	
</body>
</html>












