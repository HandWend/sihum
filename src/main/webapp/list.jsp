<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="domain.BoardVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String url = "jdbc:mysql://localhost:3306/smart?characterEnconding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT num, title, writer, writerDate FROM board ORDER BY num DESC");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();

String title = "";
String writer = "";
String writerDate = "";
//드라이버 로드
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql);

	rs = stmt.executeQuery();

	BoardVO vo = null;

	while (rs.next()) {
		vo = new BoardVO();

		vo.setNum(rs.getInt("num"));
		vo.setTitle(rs.getString("title"));
		vo.setWriter(rs.getString("writer"));
		vo.setWriterDate(rs.getDate("writerDate"));

		boardList.add(vo);
	}
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성날짜</td>
			</tr>
			<%
			Iterator<BoardVO> it = boardList.iterator();
			while (it.hasNext()) {
				BoardVO vo = it.next();
			%>
			<tr>

				<td><%=vo.getNum() %></td>
				<td><a href="view.jsp?num=<%=vo.getNum() %>"><%=vo.getTitle()%></a></td>
				<td><%=vo.getWriter() %></td>
				<td><%=vo.getWriterDate()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</form>
</body>
</html>