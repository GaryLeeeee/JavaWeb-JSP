<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="tri" class="red.star.Triangle" scope="request"/>
<html>
<body>
<form action="" method="post">
	��������������:<br>
	��A:<input type="text" name="sideA" size=5>
	��B:<input type="text" name="sideB" size=5>
	��C:<input type="text" name="sideC"  size=5>
	<input type="submit" value="�ύ">
</form>
	<jsp:setProperty property="*"name="tri"/>
	�����ε�������:<br>
	��A:<jsp:getProperty property="sideA" name="tri"/>
	��B:<jsp:getProperty property="sideB" name="tri"/>
	��C:<jsp:getProperty property="sideC" name="tri"/>
<br><br>���������ܹ���һ����������:
	<jsp:getProperty name="tri" property="triangle"/>
<br>�����:<jsp:getProperty name="tri" property="area"/>
</body>
</html>