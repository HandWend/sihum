<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
</head>
<body>
	<form method="post" action="writerAct.jsp">
		제목: <input name="title" id="title"><br> 
		내용: <textarea name="content" id="content"></textarea>
		<br> 
		작성자: <input name="writer" id="writer"><br>
		<button type="submit" id="submit">글쓰기</button>
	</form>
</body>

</html>