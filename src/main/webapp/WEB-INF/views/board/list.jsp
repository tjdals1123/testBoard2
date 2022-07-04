<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel=”stylesheet” href=”/jquery-ui.css”>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src=”/jquery-ui.js”></script></head>
<body>
<div>
	<h1>전체 글목록</h1>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일자</th>
			</tr>	
		</thead>
		<tbody>
			<tr>
				<c:forEach var="board" items="${boardlist }">
	          <tr>
		          <td>${board.bno }</td>
		          <td><a href="/board/get?bno=${board.bno}&page=${page}&searchType=${cri.searchType}&keyword=${cri.keyword}">${board.title }</a></td>
		          <td>${board.writer }</td>
		          <td>${board.regdate }</td>
		      </tr>
          </c:forEach>
			</tr>
		</tbody>
	</table>
	<c:if test = "${pageMaker.prev }">
		<li>
			<a href="/board/list?page=${pageMaker.startPage -1}&searchType=${cri.searchType}&keyword=${cri.keyword}">
				&laquo;
			</a>
		</li>	
	</c:if>
	<c:forEach begin="${pageMaker.startPage }"
				end = "${pageMaker.endPage }"
				var = "idx">
		<li>
			<a href="/board/list?page=${idx }&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
		</li>			
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		<li>
			<a href="/board/list?page=${pageMaker.endPage +1}&searchType=${cri.searchType}&keyword=${cri.keyword}">
				&raquo;
			</a>
		</li>
	</c:if>
	
	<select name="searchType">
		<option value="n"
		<c:out value="${cri.searchType == null ? 'selected' : '' }"/>>
		-
		</option>
		<option value="t"
		<c:out value="${cri.searchType eq 't' ? 'selected' : '' }"/>>
		제목
		<option value="w"
		<c:out value="${cri.searchType eq 'w' ? 'selected' : '' }"/>>
		작성자
		</option>
		<option value="c"
		<c:out value="${cri.searchType eq 'c' ? 'selected' : '' }"/>>
		내용
		</option>
		<option value="tc"
		<c:out value="${cri.searchType eq 'tc' ? 'selected' : '' }"/>>
		제목+내용
		</option>		
	</select>
	<input type="text"
		name="keyword"
		id="keywordInput"
		value="${cri.keyword}">
	<button id="searchBtn">Search</button><br>
	
	
	<a href="/board/register"><input type="button" value="글쓰기"></a>
</div>

<script>

$('#searchBtn').on("click", function(event){
	
	self.location = "list"
			+ "?page=1"
			+ "&searchType="
			+ $("select option:selected").val()
 			+ "&keyword=" + $("#keywordInput").val();
 			
 			
})

</script>
</body>

</html>

















