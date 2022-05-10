<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
 String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer"); 

String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer sql = new StringBuffer();
sql.append(" SELECT *  FROM board");
sql.append(" where num = ? ");

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String num2 = "";
String title2 = "";
String content2 = "";
String writer2 = "";

try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql.toString());
	stmt.setString(1, num);
	
	rs = stmt.executeQuery();
	
	if (rs.next()) {
		
		num2 = rs.getString("num");
		title2 = rs.getString("title");
		content2 = rs.getString("content");
		writer2 = rs.getString("writer");
	}
} catch (Exception e) {
	e.getLocalizedMessage();
} finally {
	if (rs != null) rs.close();
	if (stmt != null) stmt.close();
	if (conn != null) conn.close();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용수정</title>
</head>
<body>
	홈 > 글수정
	<hr>
	<form method="post" action="updateAct.jsp">
		<input type="hidden" name="num" id="num" value="<%=num2 %>" >
		제목: <input name="title" id="title" value="<%=title2 %>">
		<hr>
		내용:<textarea name="content" id="writer"  cols="100" rows="50"><%=content2 %></textarea>
		<br> 
		작성자: <input name="writer" id="writer" value="<%=writer2 %>">
		<hr>
		<button>수정하기</button>
	</form>
	<button onclick="location.href='list.jsp'">목록</button>
</body>
</html>