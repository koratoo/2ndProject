<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/all.css" />
<link rel="stylesheet" href="../css/ChargePoint.css" />
 <!-- SweetAlert2 -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 <script>

 </script>
	<script>
        var IMP = window.IMP; 
        IMP.init("#"); 
    
        function requestPay() {
            var amount = $("#sumtext").val().replace(",", "");
        	var merchant_uid = $("#merchant_id").val();
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: merchant_uid, 
                name : 'PLORS 포인트 충전',
                amount : amount,
                buyer_email : 'lears98@naver.com',
                buyer_name : '김지성',
                buyer_tel : '번호',
                buyer_addr : '서울특별시 마포구 연남동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
	                	 var amount = document.getElementById("sumtext").value;
	                     var merchant_id = document.getElementById("merchant_id").value;
                	   location.href = "ChargeSuccess/" + amount + "/" + merchant_id;
                } else {
                    console.log(rsp);
                }
            });
        }
        
        $("#promptStart").click(function () {
            
            (async () => {
                const { value: getName } = await Swal.fire({
                    title: '당신의 이름을 입력하세요.',
                    text: '그냥 예시일 뿐이니 정보유출 같은건 없습니다.',
                    input: 'text',
                    inputPlaceholder: '이름을 입력..'
                })

                // 이후 처리되는 내용.
                if (getName) {
                    Swal.fire(`: ${getName}`)
                }
            })()
          });
         
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
					<button class="connect_btn"  onclick="location.href='accountInfo'" >
						<img src="../img/card3.png" alt="" />
						<h4>+은행/증권 계좌를 등록해주세요</h4>
					</button><br><br>
					<c:forEach items="${fakeBank}" var="fakeBank">
					    <button class="connect_btn" onclick="#">
					    	<img src="../img/card.png" alt="" />
					        <span>${fakeBank.bankName} | ${fakeBank.accountNumber}</span>
					    </button><br><br>
					</c:forEach>
				</li>
			</ul>
		</div>
			
		<input class="charge_btn" type="submit" onclick="requestPay()" value="충전하기" style="width: 800px; height: 50px;">
				
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
