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
				<td>�����һ����:</td>
				<td><input type="text" name="numberOne" placeholder="0" size=6></td><tr>
				<td>����ڶ�����:</td>
				<td><input type="text" name="numberTwo" placeholder="0" size=6></td>
			</tr>
			<tr>
				<td>ѡ�����㷽ʽ:</td>
				<td><select name="operator">
						<option value=" + ">+(��)
						<option value=" - ">-(��)
						<option value=" * ">*(��)
						<option value=" / ">/(��)
						<option value=" % ">%(����)
						<option value="  +  ">|abs|(����ֵ��)
						<option value=" ^ ">^(ָ��)
						<option value=" sqrt ">��(����)
						<option value=" log ">log(����)
				</select></td>
				<td><input type="submit" value="�ύ" name="sub"></td>
			</tr>
		</table>
	</form>

	<p style="font-size:30">������:</p>
	<font size=20><jsp:getProperty name="digitBean" property="numberOne" /></font>
	<font size=10><jsp:getProperty name="digitBean" property="operator" /></font>
	<font size=20><jsp:getProperty name="digitBean" property="numberTwo" /></font>
	<font size=10>=</font>
	<font size=20><jsp:getProperty name="digitBean" property="result" /></font>
</body>
</html>