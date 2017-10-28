<%@ page language="java" contentType="text/html; charset=gb2312"%>
<jsp:useBean id="digitBean" class="mybean.data.Example6_2_Bean"
	scope="session" />
<html>
<style>
	tr{
	font-size:25;
	}
</style>
<body>
	<form action="compute" method="post" name="form">
		<table>
			<tr>
				<td>输入第一个数:</td>
				<td><input type="text" name="numberOne" placeholder="0" size=6></td><tr>
				<td>输入第二个数:</td>
				<td><input type="text" name="numberTwo" placeholder="0" size=6></td>
			</tr>
			<tr>
				<td>选择运算方式:</td>
				<td><select name="operator">
						<option value=" + ">+(加)
						<option value=" - ">-(减)
						<option value=" * ">*(乘)
						<option value=" / ">/(除)
						<option value=" % ">%(求余)
						<option value="  +  ">|abs|(绝对值和)
						<option value=" ^ ">^(指数)
						<option value=" sqrt ">√(开方)
						<option value=" log ">log(对数)
				</select></td>
				<td><input type="submit" value="提交" name="sub"></td>
			</tr>
		</table>
	</form>

	<p style="font-size:30">运算结果:</p>
	<font size=20><jsp:getProperty name="digitBean" property="numberOne" /></font>
	<font size=10><jsp:getProperty name="digitBean" property="operator" /></font>
	<font size=20><jsp:getProperty name="digitBean" property="numberTwo" /></font>
	<font size=10>=</font>
	<font size=20><jsp:getProperty name="digitBean" property="result" /></font>
</body>
</html>