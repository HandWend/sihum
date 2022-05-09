<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
String writerDate = request.getParameter("writerDate");

//JDBC프로그래밍
String url = "jdbc:mysql://localhost:3306/smart?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";
StringBuffer qry = new StringBuffer();
qry.append(" INSERT INTO board (title, content, writer, writerDate) ");
qry.append(" VALUES (?, ?, ?, now()) ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
int res = 0;
//드라이버 로드
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, title);
	stmt.setString(2, content);
	stmt.setString(3, writer);
	
	res = stmt.executeUpdate();
} catch(Exception e){
	
} finally {
	//닫기
	if(stmt != null) stmt.close();
	if(conn != null) stmt.close();
}
response.sendRedirect("list.html");

%>
    
    