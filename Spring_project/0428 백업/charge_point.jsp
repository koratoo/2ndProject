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
 <!-- SweetAlert2 -->
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

#container {
	top: 110px;
	position: relative;
	margin: 0 auto;
	min-height: 735px;
}


a {
  text-decoration: none;
}
.font-color {
	color: purple;
}

#btn {
	border-radius: 10px;
	width: 30px;
	height: 30px;
	background-color: none;
	color: black;
	font-weight: bold;
}

.click-money-btn {
	padding: 10px 0;
}
h6{
	color: gray;
}

#btn2 {
	border-radius: 10px;
	width: 150px;
	height: 50px;
	background-color: eeeeee;
	color: black;
	font-size:20px;
	font-weight: bold;
	border-color:white;
	cursor: pointer;
}

#btn2:hover {
	background-color: rgb(240, 192, 138);
}

.connect_btn {
	border-radius:4px;
	width: 800px;
	height: 80px;
	background-color: #eeeeee;
	border-color:white;
	color:black;
}

.connect_btn:hover{
	cursor:pointer;
	background-color: yellow;
}

/* footer 아래에 놓으려고 일단 넣어둠  */

.charge_btn{
	border-radius:5px;
	background-color: #eeeeee;
	border-color:white
}
.charge_btn:hover{
	cursor:pointer;
	background-color: yellow;
}

.connect-bank{
	height:410px;
}

li {
	list-style: none;
	padding-bottom:10px;
}

li input {
	font-size: 20px;
	border-radius: 1px;
	background-color: #ffffff;
	margin: 2px;
	box-shadow: 1px 1px #808080;
}

li input:hover {
	cursor:pointer;
	background-color: rgb(223, 248, 155);
}

#sumtext{
	border: none; /* 기본적으로 모든 테두리를 없애줍니다. */
  	border-bottom: 3px solid #808080; /* 아래 테두리만 추가합니다. */
	font-size:42px;
	text-align:center;
	
}

.pointinfo_img>img, .connect_btn>img{
	width:30px;
	height:30px;
	border-radius:10px;
}

h6{
	margin-bottom:5px;
}


</style>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 <script>

 </script>
	<script>
        var IMP = window.IMP; 
        IMP.init("imp70574668"); 
    
        function requestPay() {
       	    var sumtext = $("#sumtext").val().replace(",", "").replace("원","");
        	var merchant_uid = $("#merchant_id").val();
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: merchant_uid, 
                name : 'PLORS 포인트 충전',
                amount : sumtext,
                buyer_email : 'lears98@naver.com',
                buyer_name : '김지성',
                buyer_tel : '010-7566-5630',
                buyer_addr : '서울특별시 마포구 연남동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                	var mb_no = 1;
       	    		location.href = "charge_success/" + sumtext + "/" + mb_no+"/kakao pay";
                } else {
                    console.log(rsp);
                }
            });
        }
        
       
        
         var sum = 0; // 변수를 함수 내에서 선언
       	 function calc(button) {
        	  if(sum>=1000000){
        		  // 계좌 등록에 성공한 경우 SweetAlert로 알림창 띄우기
       	          Swal.fire({
       	            icon: 'warning',
       	            title: '결제금액 초과',
       	            text:  "한번에 100만원까지 결제가 가능합니다.",
       	          });
        		  return;
        	  }
        	  if (button) {
        	    sum += parseInt(button.value);
        	  } else {
        	    sum -= button.value;
        	  }
        	  
        	  
        	  document.getElementById("sumtext").value = sum.toLocaleString('ko-KR') + '원';
        	}
         
       	 function init(button) {
        	 sum=0;
        	  document.getElementById("sumtext").value = sum;
        	}
         
       
		
       	function showAlert() {
       	    const sumtext = $("#sumtext").val().replace(",", "").replace("원","");
	       	 
	       	 if (sumtext <= "0") {
	       	    Swal.fire("알림", "금액을 입력해주세요.", "warning");
	       	    return;
	       	  }
       	    const alertMsg = "충전하시겠습니까? " + sumtext ;

       	    Swal.fire({
       	      title: "알림",
       	      text: alertMsg,
       	      icon: "warning",
       	      showCancelButton: true,
       	      confirmButtonColor: "#3085d6",
       	      cancelButtonColor: "#d33",
       	      confirmButtonText: "충전",
       	      cancelButtonText: "취소",
       	    }).then((result) => {
       	      if (result.isConfirmed) {
                	 var mb_no = 1;
       	    		location.href = "charge_success/" + sumtext + "/" + mb_no + "/card" ;
       	      } else {
       	        Swal.fire("충전이 취소되었습니다.", "", "info");
       	      }
       	    });
       	}
       	
       	
      
       	function registerAccount() {
       	 var accountCount = document.querySelectorAll('.connect_btn').length;
       	   if (accountCount < 4) {
       	      location.href = 'account_info';
       	   } else {
       	      alert('더 이상 계좌를 등록할 수 없습니다.');
       	   }
       	}
       	
       	function showDeleteConfirm(event) {
       	   event.preventDefault(); // 기본 동작을 막습니다.
       	   const accountNumber = event.currentTarget.dataset.accountNumber;
       	   Swal.fire({
       	      title: '계좌를 삭제하시겠습니까?',
       	      icon: 'warning',
       	      showCancelButton: true,
       	      confirmButtonText: '삭제',
       	      cancelButtonText: '취소'
       	   }).then((result) => {
       	      if (result.isConfirmed) {
       	    	location.href = "charge_point/" + accountNumber;
       	    	console.log(accountNumber);
       	      }
       	   });
       	}
       	
       	   
       	function deleteAccount(accountNumber) {
       		var xhr = new XMLHttpRequest();
	       	  xhr.open("DELETE", "/charge_point/" + accountNumber, true);
	       	  xhr.onload = function () {
	       	    if (xhr.readyState === xhr.DONE) {
	       	      if (xhr.status === 200) {
	       	        console.log("Account successfully deleted");
	       	      } else {
	       	        console.error("There was a problem deleting the account");
	       	      }
	       	    }
	       	  };
	       	  xhr.send();
       	}


 </script>

<title>PLORS_포인트 충전</title>
</head>
<body>
	<!-- 상단 header -->
	<%@ include file="../MAIN/header.jsp"%>


	<center id="container">
		<h2>PLORS 포인트 충전</h2>
		<div align="right" style="width: 800px;">
			<a class="pointinfo_img" href="./point_info"><img src="../img/point.png" alt="포인트정보 페이지로 이동합니다."/></a>
		</div>
		<br>
		<div style="width: 800px;">
			<p></p>
			<input type="text" id="sumtext" placeholder="충전할 금액을 입력해 주세요" style="width: 550px; height: 50px;" />
			<fmt:formatNumber value="${amount}" pattern="#,###원" />
		</div>
		<br>
		<p />
		<div class="click-money-btn">
			<button id="btn2"  value="1000" onclick="calc(this)">천원</button>
			<button id="btn2"  value="5000" onclick="calc(this)">5천원</button>
			<button id="btn2"  value="10000" onclick="calc(this)">만원</button>
			<button id="btn2"  value="50000" onclick="calc(this)">5만원</button>
			<button id="btn2"  onclick="init(this)">직접입력하기</button>
		</div>
		<p /><br>
		<div class="connect-bank">
			<ul id="button-container">
				<li>
					<button class="connect_btn" onclick="registerAccount()">
					   <img src="../img/add.png" alt="" /><br>
					   <span style="font-size:25px"> 은행 계좌를 등록해주세요</span>
					</button><br><br>
					
					
					<c:forEach items="${fakeBank}" var="fakeBank">
					   <button class="connect_btn" onclick="showAlert()" oncontextmenu="showDeleteConfirm(event)"  data-account-number="${fakeBank.accountNumber}">
					    	<img src="../img/bankimg.png"/>
					        <span style="font-size:20px;">은행 명 : ${fakeBank.bankName} <br></span>
					        <span>계좌 번호 : ${fakeBank.accountNumber.substring(0,4)}**********</span>
					    </button><br><br>
					</c:forEach>
				</li>
			</ul>
		</div>
			
		<input class="charge_btn" type="submit" onclick="requestPay()" value="충전하기(kakao pay)" style="width: 800px; height: 50px; font-size:30px;">
				
			<br>	
			<h6>PLORS 판매 번호</h6>
			<h6>이미 성공한 판매번호는 다시 사용할 수 없습니다.</h6>
			<input id="merchant_id" type="text" value="57008833-33019" style="text-align:center" />
			<br><h6>made by js</h6>
		
<!-- 			<input class="connect_btn" type="button" onclick="location.href='ChargeSuccess'" value="충전 성공 테스트용">
 -->		
	<%@ include file="../MAIN/footer.jsp"%>
	</center>
	<%@ include file="../MAIN/left_menu.jsp"%>


</body>
</html>