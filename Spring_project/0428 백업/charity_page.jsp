<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />

<style type="text/css">

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
	background-color:#eeeeee;
	transition: background-color 0.5s ease;
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
	border-radius: 3px;
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
	color: white;
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
</style>
<title>PLORS_기부하기</title>
</head>
<body>

<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>
<%-- <input id ="btn" type="button" value="<" onclick="history.back()" style="margin-left : 400px; margin-top: 10px;"> --%>
    <center id="container">
    <h2 class="margin_cls">당신의 따스한 손길이 세상을 변화시킵니다.</h2>
		<img id="charity-img" class="img" src="../img/helpchild.jpg">
    <div style="width: 600px;">
        <p></p>
        <h1 class="margin_cls">기부 모금액 : 130,029,000 원</h1>
        <div align="left" style="width: 600px;"> <a id="point-color" href="./point_info">보유 포인트 정보</a></div>
        <p class="margin_cls" />
        
        <form action="donateSuccess" method="post">
	        <div  class="margin_cls" align="left" > <img id ="person" src="../img/person.png"> 도움이 필요해요! &nbsp; :&nbsp;
	            <select name="og_no" id="charity-select" onchange="changeImage()">
				  <option value="1">평온했던 새벽, 무서운 지진이 도시를 강타했습니다.</option>
				  <option value="2">강릉 산불 피해로부터 아이들을 지켜 주세요.</option>
				  <option value="3">아이들의 세계를 넓혀 주세요.</option>
				</select>
	        </div>
	        <p class="margin_cls"/>
	        <div class="margin_cls"  align="left" >선물할 포인트
	            <input class="margin_cls" id="input1" type="number" placeholder="100포인트 이상 입력해 주세요." name ="dn_point" style="width:600px;" step="1000">
	        </div>
	        
	        <div class="margin_cls" align="left" style="width:800">메시지
	            <input class="margin_cls" id="input1" name ="dn_message" type="text" placeholder="항상 응원합니다!" style="width:600px;">
	        </div>
 		   <input class="btn" type="submit" value="기부하기" onclick="charityfuntion()"> 
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
        alert('기부가 완료되었습니다!');
    }
    
    function changeImage() {
    	  var selectBox = document.getElementById("charity-select");
    	  var img = document.getElementById("charity-img");
    	  var body = document.getElementsByTagName("body")[0];
    	  if (selectBox.value == "1") {
    	    img.src = "../img/helpchild.jpg";
    	    body.style.backgroundColor = "#eeeeee";
    	  } else if (selectBox.value == "2") {
    	    img.src = "../img/helpfirefighter.jpg";
    	    body.style.backgroundColor = "#ffdfbf";
    	  } else if (selectBox.value == "3") {
    	    img.src = "../img/helpvolunteer.jpg";
    	    body.style.backgroundColor = "#c6d8d6";
    	  }
    	}
</script>
</body>
</html>