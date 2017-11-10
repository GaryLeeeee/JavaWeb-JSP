<%@ page contentType="text/html; charset=gb2312"%>
<jsp:useBean id="testBean" class="mybean.data.Example7_10_Bean"
	scope="session" />
<html>
<style>
.center-in-center {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	border:10px dashed blue;
	padding:30px;
}
</style>
<body>
	<jsp:setProperty name="testBean" property="score" value="0" />
	<jsp:setProperty name="testBean" property="number" value="0" />
	<%-- 	考题数量是<jsp:getProperty name="testBean" property="testAmount" /> --%>
	<form action="readTestServlet?amount=3" method="post"
		class="center-in-center">
		<div style="width:100%;align:center"><h1>---LOGIN---</h1></div>
		<div style="font-weight: bold">*****考题数量是<jsp:getProperty name="testBean" property="testAmount" />*****</div>
		<br>输入考号<input type="text" name="id" size=16> <br><br>&emsp;&emsp;&emsp;<input
			type="submit" name="sub" value="开始考试">
	</form>
</body>
</html>