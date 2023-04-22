<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <!-- SweetAlert2 -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>비밀번호 강화 - 2차 비밀번호 인증</title>
</head>
<body>
<center>
	<h2>계정 보안을 위한 2차 비밀번호 등록이 필요합니다.</h2>
	<hr/>
	<p>
		<form action="pwd_enhance" method="post" onsubmit="showSuccessAlert(event)">
	    2차 비밀번호: <input type="password" id="pwd1" name="pwd1"/><br>
	    비밀번호 확인: <input type="password" id="pwd2" name="pwd2"/><br>
	    <div id="password-match"></div>
	    <button type="submit">비밀번호 등록</button>
		</form>
	</p>
</center>
<script>
$(document).ready(function() {
  $('#pwd1, #pwd2').on('keyup', function() {
    if ($('#pwd1').val() == $('#pwd2').val()) {
      $('#password-match').html('비밀번호가 일치합니다.').css('color', 'green');
    } else {
      $('#password-match').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
    }
  });
});

function showSuccessAlert(event) {
    event.preventDefault(); // 기본 동작 막기
    Swal.fire({
        icon: 'success',
        title: '보안이 강화되었습니다.',
        text: '2차 비밀번호가 등록완료',
        onClose: () => {
            // 알림창 닫힐 때 폼 submit
            event.target.submit();
        }
    });
}
</script>
</body>
</html>