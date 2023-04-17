<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<!-- 메인페이지에서 도서 검색 후 실행되는 도서관&지도 화면 -->
<style>
.container {
	width: 70%;
	min-height: 859px;
	background-color: rgb(253, 253, 253);
	display: flex;
	flex-direction: row;
	position: relative;
	top: 110px;
	margin: 0 auto;
}

/* 왼쪽 큰 박스 */
.searchLibInfo {
	width: 700px;/* 
	height: 800px; */
	margin-right: 30px;
	background-color: rgb(255, 255, 255);
	scrollbar-color: black white;
}

.LibImage1 {
	background-image: url('../img/lib1.png');
	background-size: cover;
	border-radius: 50%;
	width: 150px;
	height: 150px;
	float: left;
}

.LibImage2 {
	background-image: url('../img/lib2.png');
	background-size: cover;
	border-radius: 50%;
	width: 150px;
	height: 150px;
	float: left;
}

.LibImage3 {
	background-image: url('../img/lib3.png');
	background-size: cover;
	border-radius: 50%;
	width: 150px;
	height: 150px;
	float: left;
}
/* 검색하면 나오는 도서관 div상자 */
.aVenue {
	display: flex;
	width: 600px;
	height: 150px;
	background-color: rgb(255, 255, 255);
	margin-bottom: 10px;
}

#search {
	border-radius: 10px;
}

.libInfo1 {
	text-align: left;
	padding: 40px 10px;
}
/* 지역 */
#loc {
	margin-right: 100px;
	color: rgb(144, 209, 47);
	font-size: 15px;
}

.mapInfo {
	width: 1200px;/* 
	height: 800px; */
	background-color: rgb(255, 255, 255);
	background-image: url('../img/sample_map.png');
}

#button {
	width: 80px; 
	height: 40px;
	background-color: #0a0a23;
	color: #fff;
	cursor: pointer;
}
</style>
<title>보유 도서 도서관 현황</title>
</head>
<body>
	<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>
	<div id="container" style="text-align:center;">
       <div class="container">
            <div class="searchLibInfo">
                <div class="searchLibMainInfo">
                    <h2>{책이름} 보유 도서관 현황</h2>
                    <input id="search" type="text" style="width: 600px; height: 50px;" value="도서관 검색"><br><br>
                    <input id="button" type="button" value="카테고리" style="float: left; margin-left: 22px;">
                    <input id="button" type="button" value="세부선택" style="float: left; margin-left: 22px;"><br>
                    <h5>내 위치로 검색하기</h5>
                </div>
                <h6 style="text-align: left; margin-left: 20px; color:darkgrey">총 3 개의 검색 결과</h6>
                <hr/>
                <div class="aVenue">
                    <div class="LibImage1"></div>
                    <div class="libInfo1">
                        <span id="library">등빛도서관</span> <span id="loc">강서구</span> <br><br>
                        <span>서울특별시 강서구 등촌제3동 강서로62길 48</span>
                    </div> 
                </div>
                <div class="aVenue">
                    <div class="LibImage2"></div>
                    <div class="libInfo1">
                        <span id="library">강동구립 강일도서관</span> <span id="loc">강동구</span><br><br>
                        <span>서울특별시 강동구 아리수로93길 9-14 4,5층</span>
                    </div> 
                </div>
                <div class="aVenue">
                    <div class="LibImage3"></div>
                    <div class="libInfo1">
                        <span id="library">논현도서관</span> <span id="loc">강남구</span><br><br>
                        <span>	서울특별시 강남구 학동로43길 17</span>
                    </div> 
                </div>
            </div>

            <div class="mapInfo"></div>
         
        </div>
        <!--container-->
              
</div>
<!-- 좌측 슬라이드 메뉴 -->
	<%@ include file="../MAIN/left_menu.jsp" %>		

	<!-- 하단 footer -->
	<%@ include file="../MAIN/footer.jsp" %>
	
</body>
</html>