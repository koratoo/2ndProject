# 프로젝트 명 : PLORS
PLORS(Public Library Order Relation System)
공공 도서관 대여 연계 시스템

### 사용 기술
자바, 스프링, 마이바티스, JQuery, HTML, CSS, JavaScript, Oracle 11g

### 설계 주안점
<p>
  

  1. 팀의 의견 반영과 방향성을 수시로 확인하며 코드를 짜기 위해 노력하였습니다.
  ->팀원의 의견 피드백을 듣고자 노력

  2. 실제 프로세스는 어떤지에 대해 고민하였습니다.
  -> 네이버 페이의 계좌연동 절차를 참고

  3. 동시에 일어나는 일에 대한 고민
  -> 프론트 영역과 백엔드 영역
</p>

### 역할 및 기능 설명
<p>
제가 담당한 부분은 포인트충전, 충전내역 조회, 기부 페이지입니다.

첫번째로 API를 통해 결제를 하는 방법이 있습니다.
두번째로 계좌연동을 통해 결제하는 방법이 있습니다.

약관동의 후 2차비밀번호 설정을 하게 됩니다.
2차 비밀번호의 경우 AES암호화를 통해 DB에 저장될 때는 암호화된 비밀번호가 저장되게끔 구현했습니다.
정책에 따라서 단방향알고리즘도 쓸 수 있도록 만들어 놓았구요.
단방향의 경우 깃허브의 커밋을 할때 쓰입니다. 복호화가 불가능하여 
보안이 강력하다는 장점이 있으나 비밀번호를 잃어버릴 경우 새로 발급해야하는
불편함이 있습니다.

다음은 계좌를 등록해줍니다.
실제 은행이 아닌 가상은행을 가정하고 등록을 진행해 보았습니다.
한번 계좌가 등록되면 바로 결제가 가능합니다.

다음엔 충전내역 조회입니다.
월별로 조회가 가능하며 아직 오지 않은 다음달은 볼 수 없게끔 구현했습니다.

기부 페이지입니다.
원하는 기부액과 기부할 곳을 선택하신 후 결제하고 응원메시지를 보낼 수 있습니다.
  

</p>





### 4월 18일 ~ 
1일차 결제 연동 : https://blog.naver.com/lears98/223078466074<br>
2일차 충전화면 이벤트 로직 구현 : https://blog.naver.com/lears98/223078948944<br>
3일차 조건에 따른 회원정보를 조회 : https://blog.naver.com/lears98/223080473530<br>
4일차 계좌연동 이용약관 페이지 : https://blog.naver.com/lears98/223081494909<br>
5일차 계좌연동 프로세스 전면수정 (토요일 잔업)  : https://blog.naver.com/lears98/223082251924<br>

### 기타
토스페이먼트 결제 연습 : https://blog.naver.com/lears98/223077374349<br>
아임포트 결제 연동 : https://blog.naver.com/lears98/223078261933<br>
암호와 알고리즘 : https://blog.naver.com/lears98/223081422666
