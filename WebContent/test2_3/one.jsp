<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

    <head>

        <jsp:include page="head.jsp" />
    </head>
    <html>

    <body>
        <form action="" method="get" name="form" style="margin:0px auto;text-align: center;">
            请输入一个1-100之内的整数:<br><input type="text" name="number" style="margin: 5px" placeholder="<--输入到这里-->">
            <br>
            <input type="submit" name="submit" style="width: 200px;height: 30px">
        </form>
        <% String num = request.getParameter("number");
          if(num == null)
              num="0";
           try{
            int n = Integer.parseInt(num);
            if(n >= 1 && n <= 50){
        %>
            <jsp:forward page="two.jsp">
                <jsp:param name="number" value="<%=n%>" />
            </jsp:forward>
            <% }
            else if(n>50 && n<=100){
        %>
                <jsp:forward page="three.jsp">
                    <jsp:param name="number" value="<%=n%>" />
                </jsp:forward>
                <% }
                else if(n>100){                
                %>
                    <jsp:forward page="error.jsp">
                        <jsp:param name="mess" value="<%=n%>" />
                    </jsp:forward>
                    <%
                }
                }catch(Exception e){
                %>
                        <jsp:forward page="error.jsp">
                            <jsp:param name="mess" value="<%=e.toString()%>" />
                        </jsp:forward>
                        <% }                
                %>
    </body>

    </html>
