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
	<font class="strong">Ŀǰ����:</font>
	<font class="color"><jsp:getProperty property="score"
			name="testBean" />(1��1.0��)</font>
	<br>
	<font class="strong">��Ϣ:</font>
	<jsp:getProperty name="testBean" property="mess" /><br>
	<form action="" method="post" name="form">
		<br>ѡ��:<input type="radio" name="R" value="A">A <br>ѡ��:<input
			type="radio" name="R" value="B">B <br>ѡ��:<input
			type="radio" name="R" value="C">C <br>ѡ��:<input
			type="radio" name="R" value="D">D <br> <input
			type="submit" value="ȷʵ(�ڶ�ȡ��һ��֮ǰ,�ɷ���ȷ��)" name="submit">
	</form>
	��Ŀǰ������ѡ����<%=studentAnswer%>
	<form action="readTestServlet" method="post" name="form">
		<input type="hidden" value="<%=testBean.getId()%>" name="id">
		<input type="submit" value="��һ��" name="submit">
	</form>
	<form action="endTestServlet" method="post" name="form">
		<input type="submit" value="����" name="submit">
	</form>
</body>
</html>