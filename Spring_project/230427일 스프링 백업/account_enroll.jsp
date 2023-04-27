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
	
	center{
		margin-top:100px;		
		height: 250px;
	}
	form{
		padding-top: 10px;
		width: 430px;
		height: 200px;
		background-size: cover;
		color:black;
	}
	input{
		width: 240px;
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
		width: 280px;
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
		width: 430px;
		height: 280px;
		background-color:darkgray;
		border-radius: 20px;
	}
	
	span{
		color:red;
	}
	
	#title{
		font-size : 30px;
		background-color: lightblue;
	}
	#input_1{
		background-color: #eeeeee;
	}
</style>
</head>
<body>
	<center>
	<div class="section">
		
		
			<form action="account_enroll" method="post" onsubmit="showSuccessAlert(event)">
			<table>
				<tr>
					<td colspan="2" id="title">계좌등록페이지 - 등록</td> 
				</tr>
				<tr>
					<td id ="input_1">은행 이름*</td>
					<td>
					<select name="bankName">
						<option>은행을 선택해주세요</option>
						<option value="신한은행">신한은행</option>
						<option value="국민은행">국민은행</option>
						<option value="하나은행">하나은행</option>
						<option value="한국은행">한국은행</option>
						<option value="삼성카드">삼성카드</option>
					</select>
					
				</tr>
				<tr>
					<td id ="input_1">계좌 번호*</td>
					<td><input type="text" name="accountNumber"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" disabled>계좌 등록</button></td>
				</tr>
			</table>
			
			</form>
		</div>
	</center>
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
			  const submitButton = document.querySelector('button[type="submit"]');
			  
			  // 은행 이름과 계좌 번호가 모두 입력되면 submit 버튼 활성화
			  if (bankName.value !== '은행을 선택해주세요' && accountNumber.value !== '') {
			    submitButton.disabled = false;
			  } else {
			    submitButton.disabled = true;
			  }
			}

			// 은행 이름과 계좌 번호가 변경될 때마다 checkInputs() 함수 실행
			document.querySelector('select[name="bankName"]').addEventListener('change', checkInputs);
			document.querySelector('input[name="accountNumber"]').addEventListener('input', checkInputs);

	</script>
</body>
</html>
