<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
String num = request.getParameter("num");

String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

StringBuffer sql = new StringBuffer();

sql.append(" SELECT *  FROM board");
sql.append(" where num = ? "); 

String num2 = "";
String title2 = "";
String content2 = "";
String writer2 = "";

try {
	//드라이버로드
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
<title>상세보기 화면</title>
</head>
<body>
상세보기 
<hr>
<form method = "post" action ="update.jsp">
<input value="<%=num2 %>" type="hidden" name="num">
제목: <input name = "title" readonly="readonly" value="<%=title2 %>"><hr>
내용: <textarea name ="content"  cols="100" rows="50" readonly ><%=content2 %></textarea><br>
작성자: <input name="writer" readonly value="<%=writer2 %>"><hr>
<button>글수정</button> 

</form>
<button onclick="location.href='list.jsp'">목록으로</button>
</body>
</html>