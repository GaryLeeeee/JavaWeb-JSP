<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="UTF-8" import="java.lang.*,java.util.*"%>
    <%! public String handleStr(String s) {
		try {
			byte[] bb = s.getBytes("iso-8859-1");
			s = new String(bb);
		} catch (Exception exp) {
		}
		return s;
	}%>
        <html>
        <style>
            font {
                color: red;
                font-weight: bold;
            }

        </style>

        <body>
            <%
		Vector v = (Vector) application.getAttribute("Mess");
		for (int i = 0; i < v.size(); i++) {
			String message = (String)v.elementAt(i);
			String a[] = message.split("#");
			out.println("<font>留言人: </font>"+ handleStr(a[0])+"<br>");
			out.println("<font>标题是: </font>" + handleStr(a[1]) + "<br>");
			out.println("<font>留言内容: </font><br>" + handleStr(a[2]));
			out.println("<br>---------------------------------<br>");
		}
	%>
                <form action="example3_18_input.jsp" method="post" name="backl">
                    <input type="submit" value="返回首页" name="back">
                </form>
        </body>

        </html>
