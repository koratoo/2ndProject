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
</head>
<body>
	<center>
		<h2>계좌 등록 페이지</h2>
		<hr>
		<p>
			<form action="account_enroll" method="post" onsubmit="showSuccessAlert(event)">
				유저아이디 : <input type="text" name="user_id"><br>
				은행 이름: <input type="text" name="bankName"><br>
				계좌 번호: <input type="text" name="accountNumber"><br>
				2차 비밀번호: <input type="password" name="accountPwd"><br>
				<button type="submit">계좌 등록</button>
			</form>
		</p>
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
	</script>
</body>
</html>
