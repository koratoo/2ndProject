<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	/* box-sizing: border-box;	 */
}

#container {
	margin: 0 auto;
	position: relative;
	top: 110px;
	min-height: 859px;
}

.font-color {
	color: purple;
}

#btn {
	border-radius: 100%;
	border-color: #fff8f2;
	width: 30px;
	height: 30px;
	background-color: none;
	color: black;
	font-weight: bold;
}

.click-money-btn {
	padding: 10px 0;
}

#btn2 {
	border-radius: 10px;
	border-color: #fffbf8;
	width: 150px;
	height: 50px;
	background-color: #f8ede4;
	color: black;
	font-weight: bold;
	cursor: pointer;
}

#btn2:hover {
	background-color: rgb(240, 192, 138);
}

.connect_btn {
	width: 800px;
	height: 95px;
}
/* footer 아래에 놓으려고 일단 넣어둠  */
.connect_btn_bottom {
	padding-bottom: 28px;
}

li {
	list-style: none;
}

li input {
	font-family: 'GmarketSansMedium';
	font-size: 20px;
	border-radius: 3px;
	border-color: #fff8f2;
	cursor: pointer;
	background-color: #fcefe4;
	margin: 2px;
	box-shadow: 1px 1px #ec8f3d;
}

li input:hover {
	background-color: rgb(223, 248, 155);
}
</style>
<title>PLORS_포인트 충전</title>
</head>
<body>
	<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>

	<%-- <input id="btn" type="button" value="<" onclick="history.back()" style="margin-left: 400px; margin-top: 10px;"> --%>

	<center id="container">
		<h4>포인트 충전 페이지</h4>
		<div align="left" style="width: 800px;">
			<a class="font-color" href="./PointInfo">보유 포인트 정보</a>
		</div>
		<div style="width: 800px;">
			<p></p>
			<input type="text" placeholder="충전할 금액을 입력해 주세요." style="width: 600px; height: 50px;" />
		</div>
		<p />
		<div class="click-money-btn">
			<input id="btn2" type="button" value="+1만"> 
			<input id="btn2" type="button" value="+5만"> 
			<input id="btn2" type="button" value="+10만"> 
			<input id="btn2" type="button" value="+100만">
		</div>
		<p />
		<div class="connect-bank">
			<ul>
				<li>
					<input class="connect_btn" type="button" onclick="location.href='#'" value="+은행/증권 계좌를 등록해주세요">
				</li>
				<li>
					<input class="connect_btn" type="button" onclick="location.href='#'" value="신한은행 계좌 번호 : 1231-149-1123-0294-123">
				</li>
				<li>
					<input class="connect_btn" type="button" onclick="location.href='#'" value="하나은행 계좌 번호 : 2120301-14902194-123">
				</li>
				<li>
					<input class="connect_btn" type="button" onclick="location.href='#'" value="농협은행 계좌 번호 : 6453301-149134-155681">
				</li>
				<li>
					<input class="connect_btn" type="button" onclick="location.href='#'" value="기업은행 계좌 번호 : 312233-1231231234">
				</li>
				<li class="connect_btn_bottom" >
					<input type="button" value="충전하기" style="width: 800px; height: 50px;">
				</li>
			</ul>
			<p />
		</div>
		
		<!-- 좌측 슬라이드 메뉴 -->
		<%@ include file="../MAIN/left_menu.jsp"%>

		<!-- 하단 footer -->
		<%@ include file="../MAIN/footer.jsp"%>
	</center>
</body>
</html>