<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<body>
<%
	String name = request.getParameter("name");
%>
<br>用户输入的是<br><font style="color:red"><%=name%></font>
<br><a href="inputName.jsp">返回</a>
</body>
</html>