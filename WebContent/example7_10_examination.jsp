<%@ page contentType="text/html; charset=gb2312"%>
<jsp:useBean id="testBean" class="mybean.data.Example7_10_Bean"
	scope="session" />
<html>
<style>
font.color {
	color: red;
	font-weight: bold;
}

font.strong {
	font-weight: bold;
}
</style>
<body>
	<jsp:getProperty property="questions" name="testBean" />
	<br><jsp:getProperty property="choiceA" name="testBean" />
	<br><jsp:getProperty property="choiceB" name="testBean" />
	<br><jsp:getProperty property="choiceC" name="testBean" />
	<br><jsp:getProperty property="choiceD" name="testBean" />
	<%
		String pic = testBean.getImage();
		if (pic != null && pic.length() >= 1) {
	%>
	<br>
	<img src="<%=pic%>" width="200" height="120"></img>
	<br>
	<!-- 	111 -->
	<%
		}
	%>
	<%
		String studentAnswer = "";
		studentAnswer = request.getParameter("R");//
		if (studentAnswer != null && studentAnswer.length() >= 1) {
			testBean.setAnswer(studentAnswer.trim());
		}
	%>
	<font class="strong">目前分数:</font>
	<font class="color"><jsp:getProperty property="score"
			name="testBean" />(1题1.0分)</font>
	<br>
	<font class="strong">消息:</font>
	<jsp:getProperty name="testBean" property="mess" /><br>
	<form action="" method="post" name="form">
		<br>选择:<input type="radio" name="R" value="A">A <br>选择:<input
			type="radio" name="R" value="B">B <br>选择:<input
			type="radio" name="R" value="C">C <br>选择:<input
			type="radio" name="R" value="D">D <br> <input
			type="submit" value="确实(在读取下一题之前,可反复确认)" name="submit">
	</form>
	你目前给出的选择是<%=studentAnswer%>
	<form action="readTestServlet" method="post" name="form">
		<input type="hidden" value="<%=testBean.getId()%>" name="id">
		<input type="submit" value="下一题" name="submit">
	</form>
	<form action="endTestServlet" method="post" name="form">
		<input type="submit" value="交卷" name="submit">
	</form>
</body>
</html>