<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<html>
<body>
<%
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("找到Mysql数据库驱动程序");
	}catch(Exception e){
		out.println("忘记把MySQL数据库的JDBC数据库驱动程序赋值到JDK的扩展目录中");
	}
	try{
		String uri="jdbc:mysql://127.0.0.1/lol";
		String user = "root";
		String password="19961219";
		connection = DriverManager.getConnection(uri,user,password);
		System.out.println("建立数据库连接成功");
		statement = connection.createStatement();
		resultSet = statement.executeQuery("select * from hero");
		System.out.println("查询成功");
		out.print("<table border=2>");
		out.print("<tr>");
		out.print("<th width=50>"+"ID");
		out.print("<th width=60>"+"名称");
		out.print("<th width=50>"+"价格");
		out.print("<th width=50>"+"类型");
		out.print("</tr>");
		while(resultSet.next()){
			out.print("<tr>");
			out.print("<td>"+resultSet.getInt("id")+"</td>");
			out.print("<td>"+resultSet.getString(2)+"</td>");
			out.print("<td>"+resultSet.getInt("price")+"</td>");
			out.print("<td>"+resultSet.getString("type")+"</td>");
			out.print("</tr>");
		}
		out.print("</table>");
	}catch(SQLException e){
		out.print(e);
	}
%>
</body>
</html>