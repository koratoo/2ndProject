<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<style type="text/css">
#container {
	top: 110px;
	position: relative;
	min-height: 859px;
}

.padding_cls {
	padding-bottom: 10px;
}

.margin_cls {
	margin-bottom: 10px;
}

#input1 {
	height: 50px;
	border-radius: 10px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid rgb(216, 170, 118);
}

.img {
	height: 250px;
	width: 600px;
	background-color: #f8dabf;
	border-radius: 10px;
	margin-bottom: 10px;
}

#point-color {
	color: purple;
}

#person {
	height: 16px;
	width: 16px;
	background-color: #f8dabf;
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
	border-radius: 10px;
	border-color: #fff8f2;
	width: 150px;
	height: 50px;
	background-color: none;
	color: black;
	font-weight: bold;
}
</style>
<title>PLORS_기부하기</title>
</head>
<body>

<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>
<%-- <input id ="btn" type="button" value="<" onclick="history.back()" style="margin-left : 400px; margin-top: 10px;"> --%>
    <center id="container">
    <h4 class="margin_cls">포인트 기부</h4>
    <img class="img" src=../img/help.png>
    <div style="width: 600px;">
        <p></p>
        <h1 class="margin_cls">보유 포인트 : 0 포인트</h1>
        <div align="left" style="width: 600px;"> <a id="point-color" href="./PointInfo">보유 포인트 정보</a></div>
        <p class="margin_cls" />
        <div  class="margin_cls" align="left" > <img id ="person" src="../img/person.png"> 받는 사람 &nbsp; :&nbsp;
            <input  class="margin_cls" type="text" placeholder="받는사람을 선택해 주세요">
        </div>
        <p class="margin_cls"/>
        <div class="margin_cls"  align="left" >선물할 포인트
            <input class="margin_cls" id="input1" type="text" placeholder="100포인트 이상 입력해 주세요." style="width:600px;">
        </div>
        
        <div class="margin_cls" align="left" style="width:800">메시지
            <input class="margin_cls" id="input1" type="text" placeholder="메시지를 입력해주세요~." style="width:600px;">
        </div>
    </div>
    <br>
    <input class="btn btn-3" type="button" value="기부하기" onclick="charityfuntion()"> 
    </center>
    
    <!-- 좌측 슬라이드 메뉴 -->
	<%@ include file="../MAIN/left_menu.jsp"%>

	<!-- 하단 footer -->
	<%@ include file="../MAIN/footer.jsp"%>

<script>
    function charityfuntion(){
        alert('기부가 완료되었습니다!');
    }
</script>
</body>
</html>