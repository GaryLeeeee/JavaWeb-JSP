<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

    <head>
        <jsp:include page="head.jsp" />
    </head>
    <html>

    <body style="margin:0px auto;text-align: center;background-color: darkturquoise">
        <p>
            <font size=5 color=green><strong>This is three.jsp</strong></font>
            <font size=3>
                <% String s = request.getParameter("number");
            out.println("<BR>传递过来的值是"+s);
            %>
                    <br>
                    <img src="b.jpg" width="<%=s%>" height="<%=s%>"></img>
            </font>
            <form action="one.jsp" method="post" name="back2">
                <input type="submit" value="返回首页" name="back">
            </form>
    </body>

    </html>
