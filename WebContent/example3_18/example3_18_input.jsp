<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="UTF-8" import="java.util.*"%>
    <html>

    <body celSpacing="1" cellingPadding="1" width="60%" align="center" border="0">
        <form action="example3_18_pane.jsp" method="post" name="form">
            输入名字: <input type="text" name="peopleName" placeholder="在这里输入名字"><br> 输入标题:
            <input type="text" name="title" placeholder="在这里输入标题"><br> 输入留言:(可拉伸)<br>
            <textarea name="messages" rows="10" cols="36" wrap="physical" placeholder="在这里输入留言"></textarea><br>
            <input type="submit" value="提交" name="submit">
        </form>
        <form action="example3_18_show.jsp" method="post" name="forml">
            <input type="submit" value="查看留言板" name="look">
        </form>
    </body>

    </html>
