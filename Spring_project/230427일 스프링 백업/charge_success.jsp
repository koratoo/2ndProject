<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
<title>충전에 성공</title>
<style>
 	a{
 		text-decoration:none;
 		font-size:20px;
 	}
 	
 	center{
 		margin-top: 280px;
 	}
 	hr{
 		width: 50%;
 	}
 	
 	p{
 		font-size : 30px;
 		font-weight:bold;
 	}
 	
 	body{
 		background-color:darkgray;
 	}
 	
 	table, tr, td{
 		background-color:white;
 		border : 1px solid black;
 		padding : 5px;
 	}
</style>
</head>
<body>
<center>

	<table>
		<tr>
			<td colspan="2"><h2>PLORS 포인트 충전에 성공하셨습니다!</h2></td>
		</tr>
		<tr>
			<td style="width:140px;"><h2> 결제 금액 </h2></td>
			<td><h2> ${amount} 원</h2></td>
		</tr>
		<tr>
			<td colspan="2"><a href="${pageContext.request.contextPath}/POINT/charge_point">충전화면으로 이동</a></td>
		</tr>
		<tr>
			<td colspan="2"><a href="${pageContext.request.contextPath}/POINT/point_info">포인트 정보화면으로 이동</a></td>
		</tr>
	</table>
	<p></p>
	

</center>
</body>
</html>