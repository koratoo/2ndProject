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
}

#container {
	width: 70%;
	margin: 0 auto; /* 가로로 중앙에 배치 */
	min-height: 859px;
	top: 110px;
	position: relative;
}

.show-account-info {
	
}

#tab2 {
	width: 35%;
	border-collapse: collapse;
	background-color: rgb(255, 255, 255);
	border-radius: 20px;
}

td {
	text-align: center;
	opacity: 0.8;
	padding: 12px;
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

#btn2 {
	font-family: 'GmarketSansMedium';
	font-size: 20px;
	border-radius: 10px;
	border-color: #fff8f2;
	width: 150px;
	height: 50px;
	background-color: none;
	color: black;
	font-weight: bold;
}

.margin_cls {
	margin: 10px 0;
}
</style>
<title>PLORS_포인트 내역</title>
</head>
<body>

<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>

<%-- <input id = "btn" type="button" value="<" onclick="history.back()" style="margin-left : 400px; margin-top: 10px;"> --%>

    <center id="container">
	    <h4>포인트 내역 페이지</h4>
	    
	    <div>
	        <p></p>
	        <h1>보유 포인트 : 0원</h1>
	    </div>
	    <p />
	    <div class="show-account-info">
	        <table height="100" width="800" >
	           <tr align="center">
	            <td><input id = "btn" type="button" value="<"></td>
	            <td >3월 <br>
	                    2023.03~03.31
	                </td>
	                <td><input id = "btn" type="button" value=">"></td>
	           </tr>
	        </table>
	        <table id="tab2" height="80" width="800" >
	           <tr >
	            <td width="200" height="40"><strong>총 적립 금액</strong></td>
	            <td>|</td>
	            <td width="600" style="text-align: right;"><strong>25,000원</strong></td>
	           </tr>
	           <tr >
	            <td width="200" height="40">기본</td>
	            <td>|</td>
	            <td width="600" style="text-align: right;">0원</td>
	           </tr>
	           <tr >
	            <td width="200" height="40">멤버쉽</td>
	            <td>|</td>
	            <td width="600" style="text-align: right;">0원</td>
	           </tr>
	           <tr >
	            <td width="200" height="40">구매경로</td>
	            <td>|</td>
	            <td width="600" style="text-align: right;">0원</td>
	           </tr>
	           <tr >
	            <td width="200" height="40">결제수단</td>
	            <td>|</td>
	            <td width="600" style="text-align: right;">0원</td>
	           </tr>
	           <tr>
	            <td width="200" height="40">리뷰</td>
	            <td>|</td>
	            <td width="600" style="text-align: right;">0원</td>
	           </tr>
	           <tr>
	            <td width="200" height="40">이벤트/기타</td>
	            <td>|</td>
	            <td width="600" style="text-align: right;">0원</td>
	           </tr>
	          
	        </table>
	        <p/>
	            <input id="btn2" type="button" value="전  체" style="background-color: rgb(250, 198, 54); color:rgb(0, 0, 0);">&nbsp;
	            <input id="btn2" type="button" value="충  전" onclick="location.href='./ChargePoint'">&nbsp;
	            <input id="btn2" type="button" value="기  부" onclick="location.href='./CharityPage'">
	        <p/>
	        <h3 class="margin_cls">3월 포인트 내역이 없습니다.</h3>
	        <input  type="button" value="2월 내역 보기">
	    </div>
</center>
    <!-- 좌측 슬라이드 메뉴 -->
	<%@ include file="../MAIN/left_menu.jsp"%>

	<!-- 하단 footer -->
	<%@ include file="../MAIN/footer.jsp"%>
</body>
</html>