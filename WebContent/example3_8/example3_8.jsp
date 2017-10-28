<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!public String handleStr(String s) {
		try {
			byte[] bb = s.getBytes("iso-8859-1");
			s = new String(bb);
			return s;
		} catch (Exception e) {
			return s;
		}
	}%>
<%
	String video = request.getParameter("video");
	if (video == null)
		video = "";
	video = handleStr(video);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ÊÓÆµ²¥·ÅÆ÷</title>
</head>
<body>
	<form action="" method="post" name="form">
		<b>Ñ¡ÔñÊÓÆµ</b> <br> <select name="video">
			<option value="video1.mp4">video1
			<option value="video2.mp4">video2
		</select> <input type="submit" value="Ìá½»" name="submit">
	</form>
	<img src="basketball.jpg" width=120 height=120>
	<embed src="video1.mp4" width=300 height=180>
</body>
</html>