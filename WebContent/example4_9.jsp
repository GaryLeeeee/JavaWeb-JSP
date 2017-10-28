<%@ page language="java" contentType="text/html; charset=gb2312"%>
<jsp:useBean id="play" class="red.star.Play" scope="session"/>
<%
	String webDir = request.getContextPath();
	webDir = webDir.substring(1);
%>
<jsp:setProperty property="webDir" name="play" value="<%=webDir%>"/>
<jsp:setProperty property="imageNumber" name="play" param="imageNumber"/>
<html>
<body>
<img src="image/<jsp:getProperty name="play" property="playImage"/>" width=120 height=90><br>这是当前显示的图像
<br>单击"上一张"或"下一张"按钮浏览图像
<form action="" method="post">
	<input type="submit" name="ok" value="上一张">
	<input type="hidden" name="imageNumber" value="<%=play.getImageNumber()-1%>">
</form>
<form action="" method="post">
	<input type="submit" name="ok" value="下一张">
	<input type="hidden" name="imageNumber" value="<%=play.getImageNumber()+1%>">
</form>
</body>
</html>