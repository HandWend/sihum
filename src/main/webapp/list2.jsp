<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="domain.BoardVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	
	
	String url = "jdbc:mysql://localhost:3306/smart?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
	String user = "root";
	String password = "smart";
	StringBuffer qry = new StringBuffer();
	qry.append(" SELECT num, title, writer, writerDate FROM board ");

	String sql = qry.toString();
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
	
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록출력</title>
</head>
<body>
	<form>
		게시판
		<hr>
		<table>
			<tr>
				<td>no</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성날짜</td>
			</tr>
<%
// boardvo를 만들고 vo에 필드값을 지정한다. 
// vo를 배열에 추가

while (rs.next()) {
	BoardVO vo = new BoardVO();
	
	vo.setNum(rs.getInt("num"));
	vo.setTitle(rs.getString("title"));
	vo.setWriter(rs.getString("writer"));
	vo.setWriterDate(rs.getDate("writerDate"));
	
	boardList.add(vo);
} 

%>

			<tr>
				<td><%=rs.getInt("num") %></td>
				<td><%=rs.getString("title") %></td>
				<td><%=rs.getString("content")%></td>
				<td><%=rs.getDate("writerDate")%></td>
			</tr>
			
		</table>

		<%
		//try 닫는 괄호
		} catch (Exception e) {
		e.getLocalizedMessage();
		} finally {
		//닫기
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
		} 
		%>
	</form>
</body>
</html>