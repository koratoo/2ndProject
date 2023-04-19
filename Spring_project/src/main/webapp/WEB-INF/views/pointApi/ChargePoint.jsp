<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<link rel="stylesheet" href="../css/ChargePoint.css" />
	<script>
        var IMP = window.IMP; 
        IMP.init("imp70574668"); 
    
        function requestPay() {
        	var amount = $("#sumtext").val();
        	var merchant_uid = $("#").val();
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: merchant_uid, 
                name : 'PLORS 포인트 충전',
                amount : amount,
                buyer_email : 'lears98@naver.com',
                buyer_name : '김지성',
                buyer_tel : '010-7566-5630',
                buyer_addr : '서울특별시 마포구 연남동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                	   location.href = "#";
                } else {
                    console.log(rsp);
                }
            });
        }
        
         var sum = 0; // 변수를 함수 내에서 선언
       	 function calc(button) {
        	  if(sum>=1000000){
        		  alert('한번에 100만원 이상 충전은 불가능합니다.')
        		  return;
        	  }
        	  if (button) {
        	    sum += parseInt(button.value);
        	  } else {
        	    sum -= button.value;
        	  }
        	  
        	  
        	  document.getElementById("sumtext").value = sum;
        	}
       	 function init(button) {
        	 sum=0;
        	  document.getElementById("sumtext").value = sum;
        	}
         
       	
        
        function addButton() {
        	  // 버튼 개수가 5개 이상인 경우 추가할 수 없습니다.
        	  if (document.querySelectorAll(".connect_btn").length >= 4) {
        	    alert("최대 3개의 계좌를 등록할 수 있습니다.");
        	    return;
        	  }

        	  // 은행과 계좌번호 입력 받기
        	  var bankInput = prompt("은행 이름을 입력해주세요.");
        	  var accountInput = prompt("계좌번호를 입력해주세요.");

        	  // 입력값이 없는 경우 추가하지 않음
        	  if (!bankInput || !accountInput) {
        	    return;
        	  }

        	  // 새로운 li 요소를 생성
        	  var newLi = document.createElement("li");

	        	  // 새로운 input 요소를 생성합니다.
	        	  var newInput = document.createElement("input");
	        	  newInput.setAttribute("type", "button");
	        	  newInput.setAttribute("class", "connect_btn");
	        	  newInput.setAttribute("name", accountInput);
	        	  newInput.setAttribute("onclick", "location.href='accountInfo'");
	        	  newInput.setAttribute("value", bankInput + " | 계좌 번호 : " + accountInput);

        	  // 생성된 input 요소를 li 요소에 추가
        	  newLi.appendChild(newInput);

        	  // 생성된 li 요소를 버튼 컨테이너에 추가
        	  var container = document.getElementById("button-container");
        	  container.appendChild(newLi);
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
			<a class="pointinfo_img" href="./PointInfo"><img src="../img/point.png" alt="포인트정보 페이지로 이동합니다."/></a>
			
		</div>
		<br>
		<div style="width: 800px;">
			<p></p>
			<input type="text" id="sumtext" placeholder="충전할 금액을 입력해 주세요." style="width: 550px; height: 50px;" />
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
					<button class="connect_btn"  onclick="addButton()" onclick="location.href='#'" >
						<img src="../img/card.png" alt="" />
						<h4>+은행/증권 계좌를 등록해주세요</h4>
					</button>
				</li>
			</ul>
		</div>
			
	<input class="charge_btn" type="button" onclick="requestPay()" value="충전하기" style="width: 800px; height: 50px;">
				
			<br>	
			<h6>PLORS 판매 번호</h6>
			<h6>이미 성공한 판매번호는 다시 사용할 수 없습니다.</h6>
			<input id="merchant_id" type="text" value="57008833-33016" style="text-align:center" />
			<br><h6>made by js</h6>
		
<!-- 			<input class="connect_btn" type="button" onclick="location.href='ChargeSuccess'" value="충전 성공 테스트용">
 -->		
	<%@ include file="../MAIN/footer.jsp"%>
	</center>
	<%@ include file="../MAIN/left_menu.jsp"%>

	
</body>
</html>
