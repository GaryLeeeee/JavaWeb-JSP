<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="tri" class="red.star.Triangle" scope="request"/>
<html>
<body>
<form action="" method="post">
	输入三角形三边:<br>
	边A:<input type="text" name="sideA" size=5>
	边B:<input type="text" name="sideB" size=5>
	边C:<input type="text" name="sideC"  size=5>
	<input type="submit" value="提交">
</form>
	<jsp:setProperty property="*"name="tri"/>
	三角形的三边是:<br>
	边A:<jsp:getProperty property="sideA" name="tri"/>
	边B:<jsp:getProperty property="sideB" name="tri"/>
	边C:<jsp:getProperty property="sideC" name="tri"/>
<br><br>这三个边能构成一个三角形吗:
	<jsp:getProperty name="tri" property="triangle"/>
<br>面积是:<jsp:getProperty name="tri" property="area"/>
</body>
</html>