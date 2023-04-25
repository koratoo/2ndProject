<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>충전에 성공</title>
<style>
 	a{
 		decoration:none;
 	}
</style>
</head>
<body>
<center>

	<h2>충전에 성공하셨습니다!</h2>
	
	<hr />
	<a href="${pageContext.request.contextPath}/POINT/ChargePoint">충전화면으로 이동</a><br>
	<a href="${pageContext.request.contextPath}/POINT/PointInfo">포인트 정보화면으로 이동</a>

</center>
</body>
</html>