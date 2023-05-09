# 프로젝트 명 : PLORS
PLORS(Public Library Order Relation System)
공공 도서관 대여 연계 시스템

### 1. 사용 기술
<hr/>
자바, 스프링, 마이바티스, JQuery, HTML, CSS, JavaScript, Oracle 11g

### 2. 설계 주안점
<hr/>
<p>
실제 프로세스는 어떤지에 대해 고민하였습니다.<br>
  -네이버 페이의 계좌연동 절차를 참고

동시에 일어나는 일에 대한 고민<br>
  -프론트 영역과 백엔드 영역
</p>

### 역할 및 기능 설명
<hr/>
<p>
제가 담당한 부분은 포인트충전, 충전내역 조회, 기부 페이지입니다.

충전 후 포인트를 사용할 수 있습니다.
휴대폰 결제 혹은 계좌연동을 통해 충전이 가능합니다.

계좌연동의 경우
약관동의 후 2차비밀번호 설정을 하게 됩니다.
2차 비밀번호의 경우 AES암호화를 통해 DB에 저장될 때는 암호화된 비밀번호가 저장되게끔 구현했습니다.
정책에 따라서 단방향알고리즘도 쓸 수 있도록 만들어 놓았습니다.
단방향의 경우 깃허브의 커밋을 할때 쓰입니다. 복호화가 불가능하여 
보안이 강력하다는 장점이 있으나 비밀번호를 잃어버릴 경우 새로 발급해야하는
불편함이 있습니다.

다음은 계좌를 등록해줍니다.
실제 은행이 아닌 가상은행을 가정하고 등록을 진행해 보았습니다.
한번 계좌가 등록되면 바로 결제가 가능합니다.
마우스 우클릭을 하여 삭제가 가능합니다.
  

</p>

![화면1](https://user-images.githubusercontent.com/96603612/237048835-f3b64f3a-401f-4a40-a070-2d173654d158.png)




### 4월 18일 ~ 
<hr/>
1일차 결제 연동 : https://blog.naver.com/lears98/223078466074<br>
2일차 충전화면 이벤트 로직 구현 : https://blog.naver.com/lears98/223078948944<br>
3일차 조건에 따른 회원정보를 조회 : https://blog.naver.com/lears98/223080473530<br>
4일차 계좌연동 이용약관 페이지 : https://blog.naver.com/lears98/223081494909<br>
5일차 계좌연동 프로세스 전면수정 (토요일)  : https://blog.naver.com/lears98/223082251924<br>
6일차 계좌 충전 페이지 디테일한 부분 (일요일) : https://blog.naver.com/lears98/223082842900 <br>
7일차 AES를 서비스로직으로 분리 : https://blog.naver.com/lears98/223083388717<br>
8일차 중간 정리 : https://blog.naver.com/lears98/223084879494<br>
9일차 계좌 삭제기능 추가 : https://blog.naver.com/lears98/223086748027<br>
10일차 결제결과 분리 / 계좌 마스킹 처리 : https://blog.naver.com/lears98/223086911194<br>
11일차 세션을 적용 : https://blog.naver.com/lears98/223087566518<br>
12일차 기부페이지/ PDF 저장 기능 : https://blog.naver.com/lears98/223097317604<br>


![화면2](https://user-images.githubusercontent.com/96603612/237048848-bbce5aaa-00eb-4655-85a6-3a3a41d5f135.png)


### 기타
<hr/>
토스페이먼트 결제 연습 : https://blog.naver.com/lears98/223077374349<br>
아임포트 결제 연동 : https://blog.naver.com/lears98/223078261933<br>
암호와 알고리즘 : https://blog.naver.com/lears98/223081422666<br>
REDIS 환경설정 : https://blog.naver.com/lears98/223092840887<br>

![화면3](https://user-images.githubusercontent.com/96603612/237048856-0052f671-71f7-4f12-9eb7-a2e0834f39cd.png)
