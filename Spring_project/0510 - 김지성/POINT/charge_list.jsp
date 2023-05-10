<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<title>충전 내역 리스트 페이지</title>
<style>

	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		font-family: 'GmarketSansMedium';
	}
	table,td,tr{
		text-align:center;
	}
	
	table{
		 border: 1px #a39485 solid;
		  font-size: .9em;
		  box-shadow: 0 2px 5px rgba(0,0,0,.25);
		  width: 50%;
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		
	}
	
	#container {
		top: 110px;
		position: relative;
		min-height: 899px;
		background-color:white;
	}
	
	hr{
		width : 30%;
		background-color:lightgray;
	}
	th {
	  text-align: center;
	}
	  
	thead {
	  font-weight: bold;
	  color: #fff;
	  background: #73685d;
	}
	  
	 td, th {
	  padding: 1em .5em;
	  vertical-align: middle;
	}
	  
	 td {
	  border-bottom: 1px solid rgba(0,0,0,.1);
	  background: #fff;
	}

	#btn2 {
		font-family: 'GmarketSansMedium';
		font-size: 20px;
		border-radius: 10px;
		border-color: #eeeeee;
		width: 150px;
		height: 50px;
		background-color: white;
		color: black;
		font-weight: bold;
	}
	
	#btn2:hover{
		cursor:pointer;
		background-color: lightgreen;
	}
	
	h2{
		text-align:left;
		width: 50%;
	}
	
</style>
</head>
<body> 
	<!-- private int ch_no; 
	    private int mb_no;
	    private String charge_date;
	    private int charge_amount;
	    private int charge_now;
	    private String payment_tool; -->
	<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>

	<center id = "container">



		<h2>결제 내역 조회</h2>
		<br>
			<table>
				<thead>
					<tr>
						<th>결제 번호</th>
						<th width ="200px">결제 일자</th>
						<th>결제 금액</th>
						<th>결제 도구</th>
					</tr>
				</thead>
				<c:forEach items="${ch}" var="ch">
					
					<tr>
						<td>${ch.ch_no * 1234567}</td>
						<td>${ch.charge_date}</td>
						<td><fmt:formatNumber value="${ch.charge_amount}" pattern="#,###원" /></td>
						<td>${ch.payment_tool}</td>
					</tr>
				</c:forEach>
			</table>
		<br><br>	
		<h2>기부 내역 조회</h2>
		<br>
			<table>
				<thead>
					<tr>
						<th width ="200px">후원 일자</th>
						<th>후원 금액</th>
						<th>후원 메시지</th>
					</tr>
				</thead>
				<c:forEach items="${dh}" var="dh">
					<tr>
						<td>${dh.DN_DATE}</td>
						<td><fmt:formatNumber value="${dh.DN_POINT}" pattern="#,###원" /></td>
						<td>${dh.DN_MESSAGE}</td>
					</tr>
				</c:forEach>
			</table>
			
			<br>	
	           <input id="btn2" type="button" value="이전 페이지로" onclick="location.href='./point_info'">&nbsp;
	</center>
					 
	<!-- 좌측 슬라이드 메뉴 -->
	<%@ include file="../MAIN/left_menu.jsp"%>

	<!-- 하단 footer -->
	<%@ include file="../MAIN/footer.jsp"%>

</body>
</html>