<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />


<style type="text/css">

@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
@font-face {
    font-family: 'MapoAgape';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoAgapeA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#container {
	top: 110px;
	position: relative;
	min-height: 899px;
}
body{
	transition: background-color 0.5s ease;
	background-color:#FFF7F7;
}
.padding_cls {
	padding-bottom: 10px;
}

.margin_cls {
 	font-family: 'MapoAgape';
	margin-bottom: 10px;
}

#input1 {
	height: 50px;
	border-radius: 10px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid #eeeeee;
	padding-left: 13px;
	text-align:center;
	font-size : 24px;
}

#input1:hover, select{
	cursor: pointer;
}

.img {
	height: 300px;
	width: 600px;
	background-color: white;
	border-radius: 10px;
	margin-bottom: 10px;
}


#point-color {
	 font-family: 'GmarketSansMedium';
	color: #gray;
}
#point-color:hover {
	color: gray;
}

#person {
	height: 20px;
	width: 20px;
	background-color: #f8dabf;
}

.btn{
	width: 200px;
	height: 45px;
	background-color: #262e57;
	color:white;
	font-size:24px;
	border-radius: 20px;
}
.btn:hover{
	cursor : pointer;
	background-color:#FF5733;
	transition : 0.5s;
}

a{
	text-decoration:none;
}

select{
	font-size: 15px;
	height: 40px;
	width: 420px;
	border-radius: 10px;
	border-color: #eeeeee;
}

h1{
	font-family: 'GmarketSansMedium';
	background-color:white;
	border-radius:10px;
	color:#FF6666;
}
</style>
<title>PLORS_기부하기</title>
</head>
<body>

<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>
<%-- <input id ="btn" type="button" value="<" onclick="history.back()" style="margin-left : 400px; margin-top: 10px;"> --%>
    <center id="container">
     <h2 class="margin_cls">"함께하는 PLORS를 응원해주세요!"</h2> 
		<img id="charity-img" class="img" src="../img/plorshelp.jpg">
    <div style="width: 600px;">
        <p></p>
        <div align="right" style="width: 600px;"> <a id="point-color" href="./point_info">보유 포인트 정보</a></div>
        <p class="margin_cls" />
	   <div  class="margin_cls" align="left" > ${ub.mb_name}님 후원포인트: ${donate}p </div>
       <h1> <fmt:formatNumber value="${point}" pattern="#,### 포인트" /></h1>
        <br>
        <form action="donateSuccess" method="post">
	        <p class="margin_cls"/>
	        <div class="margin_cls"  align="left" >선물할 포인트
	           <input class="margin_cls" id="input1" type="number" placeholder="후원 포인트" name="dn_point"  style="width:600px;" step="1000" min="1000" max="${ub.mb_money - donate}">
	        </div>
	        
	        <div class="margin_cls" align="left" style="width:800">메시지
	            <input class="margin_cls" id="input1" name ="dn_message" type="text" placeholder="항상 응원합니다!" style="width:600px;">
	        </div><br>
 		   <input class="btn" type="submit" value="후원하기!" onclick="charityfuntion()"> 
        </form>
    </div>
    <br>
  
    </center>
    
    <!-- 좌측 슬라이드 메뉴 -->
	<%@ include file="../MAIN/left_menu.jsp"%>

	<!-- 하단 footer -->
	<%@ include file="../MAIN/footer.jsp"%>

<script>
    function charityfuntion(){
        alert('후원이 완료되었습니다!');
    }
   
</script>
</body>
</html>