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
<style>
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	body{
		font-family: 'GmarketSansMedium';
		background-color:lightgray;
	}
	
	center{
		margin-top:100px;		
		height: 250px;
	}
	form{
		margin-top: 40px;
		width: 800px;
		height: 200px;
		background-size: cover;
		color:black;
	}
	input{
		width: 200px;
		height:60px;
	}
	table{
		background-color:white;
		padding : 20px;
	}
	tr,td{
		font-weight:bold;
		padding :4px;
		border : 3px solid lightgray;
		cell-spacing:none;
		border-radius:5px;
	}
	input{
		font-size:100px;
		border:none;
	}
	
	button{
		font-family: 'GmarketSansMedium';
		font-size : 20px;
		width:200px;
		height:60px;
	}
	
	hr{
		width:81%;
		height:2px;
		background-color:#eeeeee;
	}
	
	.section{
		width: 800px;
		height: 530px;
		background-color:white;
		border-radius: 20px;
	}
	
	span{
		color:red;
	}
</style>
</head>
<body>
<center>
	<div class="section">
	<br>
	<h2>계정 보안을 위한 2차 비밀번호 등록이 필요합니다.</h2>
	<hr/>
	<h3><span>AES 암호화로 안전하게 DB에 저장됩니다.</span></h3>
		<form action="pwd_enhance" method="post" onsubmit="showSuccessAlert(event)">
		<table>
			<tr>
				<td>2차 비밀번호</td>
				<td><input type="password" id="pwd1" name="pwd1"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="pwd2" name="pwd2"/></td>
			</tr>
			
		</table>
			<div id="password-match"></div>
	   <p/>
	    <button type="submit">비밀번호 등록</button>
		</form>	
	</div>
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