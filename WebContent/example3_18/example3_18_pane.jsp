<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="UTF-8" import="java.util.*"%>
    <html>

    <body celSpacing="1" cellingPadding="1" width="60%" align="center" border="0">
        <%!
		Vector v = new Vector();
		int i=0;
		ServletContext application;
		synchronized void leaveWord(String s){
			application = getServletContext();
			i++;
			v.add("[NO."+i+"]"+s);
			application.setAttribute("Mess", v);
		}
	%>
            <%
		String name = request.getParameter("peopleName");
		String title = request.getParameter("title");
		String messages = request.getParameter("messages");
		if(name == null)
			name = "guest"+(int)(Math.random()*10000);
		if(title == null)
			title = "无标题";
		if(messages == null)
			messages = "无信息";
		String s = name + "#" +title +"#" + messages;
		leaveWord(s);
		out.println("您的信息已经提交");
	%>
                <br><a href="example3_18_input.jsp">返回留言页面</a>
    </body>

    </html>
