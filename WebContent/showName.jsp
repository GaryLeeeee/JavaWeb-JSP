<%@ page language="java" contentType="text/html; charset=gb2312"%>
<html>
<body>
<%
	String name = request.getParameter("name");
%>
<br>�û��������<br><font style="color:red"><%=name%></font>
<br><a href="inputName.jsp">����</a>
</body>
</html>