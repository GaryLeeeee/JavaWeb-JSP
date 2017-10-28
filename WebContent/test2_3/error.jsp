<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="UTF-8" import="java.util.*"%>

    <head>
        <jsp:include page="head.jsp" />
    </head>

    <html>

    <body style="margin:0px auto;text-align: center;background-color:coral">
        <font size=5 color="Red">This is error.jsp</font>
        <font size=2>
            <%
            String s = request.getParameter("mess");
            out.println("<br>传递过来的错误信息是:"+s);
        %>
                <br>
                <img src="error.jpg" width="120" height="120"></img>
        </font>
        <form action="one.jsp" method="post" name="back2">
            <input type="submit" value="返回首页" name="back">
        </form>
    </body>

    </html>
