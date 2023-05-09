<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>계좌 등록 페이지</title>
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- SweetAlert2 라이브러리 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	body{
		background-color:darkgray;
	}
	
	
	form{
		padding-top: 180px;
		padding-left: 530px;
		width: 430px;
		height: 200px;
		background-size: cover;
		color:black;
	}
	input{
		width: 200px;
		height:40px;
		font-size: 25px;
		border:none;
	}
	table{
		background-color:white;
		padding : 20px;
		border-spacing:0px 0px;
	}
	tr,td{
		font-weight:bold;
		padding :8px;
		border : 1px solid lightgray;
		cell-spacing:none;
		border-radius:1px;
		text-align:center;
	}
	select{
		width: 380px;
		font-size:25px;
		text-align:center;
		border:none;
	}
	select:hover{
		cursor:pointer;
	}
	
	button{
		font-family: 'GmarketSansMedium';
		font-size : 20px;
		width:360px;
		height:50px;
		border:none;
	}
	button[type="submit"]:disabled {
	  opacity: 0.5;
	  cursor: not-allowed;
	}
	
	button[type="submit"]:not([disabled]):hover {
	  background-color: #4CAF50;
	  color: white;
	  cursor:pointer;
	}
	
	hr{
		width:81%;
		height:2px;
		background-color:#eeeeee;
	}
	
	.section{
		width: 800px;
		height: 280px;
		background-color:darkgray;
		border-radius: 20px;
	}
	
	span{
		color:red;
	}
	
	#title{
		font-size : 30px;
		background-color: #005ba9;
		color:white;
	}
	#input_1{
		min-width: 150px;
		background-color: #eeeeee;
	}
	
	img{
		width:80px;
		height:60px;
	}
</style>
</head>
<body>
	
	<div class="section">
		
		
			<form action="account_enroll" method="post" onsubmit="showSuccessAlert(event)">
			<table>
				<tr>
					<td colspan="4" id="title">계좌등록페이지 - 카드</td> 
				</tr>
				<tr>
					<td id ="input_1" colspan="2">은행 이름 </td>
					<td colspan="2">
					<select name="bankName" >
						<option>카드를 선택해주세요</option>
						<option value="신한카드">신한카드</option>
						<option value="BC카드">BC카드</option>
						<option value="우리카드">우리카드</option>
						<option value="기업은행">기업은행</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="국민은행">국민은행</option>
						<option value="하나카드">하나카드</option>
						<option value="롯데카드">롯데카드</option>
						<option value="삼성카드">삼성카드</option>
					</select>
					</td>
				</tr>
				<tr>
					<td id ="input_1" colspan="2">계좌 번호 (- 없이 필수 입력)</td>
					<td colspan="2"><input type="text" name="accountNumber" style="width:380px;"></td>
				</tr>
				<tr>
					<td id ="input_1" >비밀번호<br>(네자리)</td>
					<td><input type="password" name="cardpwd"></td>
					<td id ="input_1">cvc<br>(카드뒷면 세자리)</td>
					<td><input type="password" name="cvc"></td>
				</tr>
				<tr>
					<td id ="input_1" colspan="2">만료일</td>
					<td colspan="2" ><input type="date" name="cardexpiry"  style="width:380px; text-align:center;"></td>
				</tr>
				<tr>
					<td colspan="4"><button type="submit" disabled>계좌 등록</button></td>
				</tr>
			</table>
			
			</form>
		</div>
	
	<script>
		// 2차 비밀번호 등록 완료 알림창 띄우는 함수
		function showSuccessAlert(event) {
			event.preventDefault(); // 기본 동작 막기
			Swal.fire({
				icon: 'success',
				title: '계좌 등록',
				text: '계좌등록이 성공적으로 완료되었습니다.',
				onClose: () => {
					// 알림창 닫힐 때 폼 submit
					event.target.submit();
				}
			});
		}
		
		function checkInputs() {
			  const bankName = document.querySelector('select[name="bankName"]');
			  const accountNumber = document.querySelector('input[name="accountNumber"]');
			  const cvc = document.querySelector('input[name="cvc"]');
			  const cardexpiry = document.querySelector('input[name="cardexpiry"]');
			  const cardpwd = document.querySelector('input[name="cardpwd"]');
			  const submitButton = document.querySelector('button[type="submit"]');
			  
			  // 은행 이름과 계좌 번호가 모두 입력되면 submit 버튼 활성화
			  if (bankName.value !== '은행을 선택해주세요' && accountNumber.value !== '' 
			   && cardpwd.value !== '' &&  cvc.value !=='' &&  cardexpiry.value !=='') {
			    submitButton.disabled = false;
			  } else {
			    submitButton.disabled = true;
			  }
			}

			// 은행 이름과 계좌 번호가 변경될 때마다 checkInputs() 함수 실행
			document.querySelector('select[name="bankName"]').addEventListener('change', checkInputs);
			document.querySelector('input[name="accountNumber"]').addEventListener('input', checkInputs);
			document.querySelector('input[name="cvc"]').addEventListener('input', checkInputs);
			document.querySelector('input[name="cardexpiry"]').addEventListener('input', checkInputs);
			document.querySelector('input[name="cardpwd"]').addEventListener('input', checkInputs);

	</script>
</body>
</html>
