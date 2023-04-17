<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<style type="text/css">

*{
	margin: 0;
	padding: 0;
	
}

section {
	
	position: relative;
	text-align: center;
	z-index: 3; /* 스크롤 될 때 header 가리지 않게 */

}

#s1 {
	top: 80px;
	height: 650px;
	background-image: url("back.jpg");
	background-size: 100% 100%;
}
#s1_box {
	position: relative;
	top: 35%;
}
#s2 {
	top: 150px;
	height: 500px;
}
#s3 {
	height: 400px;
}
#intro {
	font-family: 'Hahmlet', serif;
	color: black;
	font-size: xx-large;
	padding-bottom: 40px;
}
#search_bar{
	padding-left: 8px;
	border-radius: 8px;
	border-color: lightgray;
	height: 50px;
	width: 500px;
}
.text_box {
	border: 3px solid #262e57;
	border-radius: 8px;
	display: inline-block;
	width: 100px;
	height: 100px;

}
.text_box p{
	font-family: 'Hahmlet', serif;
	padding-top: 23px; 
}

#up_icon {
	position: fixed;	 
	bottom: 15px;
	right: 15px;
}
#up_img {
	width: 24px;
	cursor: pointer;
}
</style>
<title>PLORS_main</title>
</head>
<body>
	<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>
	
	<!-- 검색엔진 -->
	<section id="s1">		
		<div id="s1_box" class="section_div">
			<h2 id="intro">반갑습니다, 서울시 공공 도서관 온라인 대여 서비스입니다.</h2>
			<input id="search_bar" type="search" placeholder="찾으시는 도서의 제목을 입력해주세요." />
		</div>
	</section>
	
	<!-- 소개 PLORS-->
	<section id="s2" class="section_div">	
		<div id="s2_box">
		<h2>
			<b>Public Library Online Rental Service</b>
		</h2>
		<p>
			공공 도서관 온라인 대여 서비스 <br>도서관 굳이 안 가도 돼~ <br>집에서 편하게 빌려 볼 수
			있어염~ <br>반납도 올 필요 없어요~
		</p>
		</div>
	</section>
	
	<!-- 통계 
		(회원 / 책/ 대여/ 신간) -->
	<section id="s3" class="section_div">		
		<div class="text_box">
			<p>
				1,501<br>
				<strong>회원 수</strong>
			</p>			
		</div>
		<div class="text_box">
			<p>
				222,222<br>
				<strong>보유 도서</strong>
			</p>			
		</div>
		<div class="text_box">
			<p>
				789<br>
				<strong>대여</strong>
			</p>			
		</div>
		<div class="text_box">
			<p>
				510<br>
				<strong>신간 도서</strong>
			</p>			
		</div>
	</section>
	
	<!-- 좌측 슬라이드 메뉴 -->
	<%@ include file="../MAIN/left_menu.jsp"%>

	<!-- 하단 footer -->
	<%@ include file="../MAIN/footer.jsp"%>
	
	
	<!-- 위로 올라가는 버튼 -->
	<div id="up_icon">
		<a href="#"><img id="up_img" src="img/up-arrow.png"></a>
	</div>
	
</script>
</body>
</html>