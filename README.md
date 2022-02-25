# 게시판 CRUD
## 1. 개 요
- 프로젝트 명칭 : HoStroy
- 개발 인원 : 1명
- 개발 기간 : 2022.02.01 ~  
- 주요 기능 : 
  - 게시판 - CRUD 기능, 조회수, 조회수 순위(1,2,3위), 페이징 및 검색 처리
  - 사용자 - Security 회원가입 및 로그인, 로그인 유효성 및 중복 검사
- 개발 언어 : Java 11
- 개발 환경 : SpringFramework, Spring Security, Jquery3.4.1, html, css
- 데이터베이스 : Oracle 11g, Oracle SQL Developer
- 형상관리 툴 : GitHub
- 프로젝트 소개 : 웹 개발의 기본 소양인 CRUD 게시판 프로젝트 구현


## 2. 요구사항 분석
### 1) 회원 가입 페이지
  - 유효성 검사
    - 아이디, 비밀번호, 비밀번호 확인, 이름, 이메일, 주소를 입력하여 회원 가입을 할 수 있습니다.
    - 이메일은 형식 패턴 적용해 확인하고 인증번호를 통해 회원가입을 진행할 수 있습니다.
    - 입력란 빈 칸이 있는지 확인하고 있다면, 각 칸에 알맞은 문구 ex) "비밀번호를 입력해주세요"의 메시지를 출력합니다.
  - 중복확인
    - 데이터베이스에 존재하는 아이디를 입력한 채 회원가입 버튼을 누를 경우 "아이디가 이미 존재합니다."의 메시지를 출력합니다.

### 2) 로그인 페이지
  - 로그인을 하지 않은 경우 아래의 페이지만 이용가능
    - 회원가입 페이지
    - 로그인 페이지
    - 게시물 조회 페이지
    - 게시물 상세 조회 페이지
    - 메인(home) 페이지
  - 로그인 검사
    - 아이디와 비밀번호가 일치하지 않을 시 "아이디 또는 비밀번호가 일치하지 않습니다."의 메시지를 출력합니다.
    - 모든 검사가 통과되었다면 로그인 후 메인 페이지로 이동시켜줍니다.
   
### 3) 게시글 검사
  - 게시글 작성, 수정 시 제목과 내용은 공백 혹은 빈칸으로 작성하지 않도록 합니다.
  - 자신이 작성한 글만 수정, 삭제 가능합니다.(관리자 제외)
  - 로그인을 하지 않고 글 작성 버튼을 누를 경우 동작하지 않습니다.

## 3. DB 설계

## 4. API 설계
### 게시글 관련

### 회원 관련

## 6. 화면
### 메인 페이지

![home](https://user-images.githubusercontent.com/83334512/155676798-bed0a598-4a0b-439d-99bd-04a30ed82a0a.PNG)

게시물 중 조회수가 높은 순서 1, 2, 3위를 보여줍니다.

### 회원가입 페이지

![join](https://user-images.githubusercontent.com/83334512/155676983-b46eac20-fd3e-464a-9d86-111a9acc4e69.PNG)

아이디, 비밀번호, 비밀번호 확인, 이름, 이메일, 주소를 입력하여 회원 가입을 진행할 수 있습니다.

### 로그인 페이지

![login_or](https://user-images.githubusercontent.com/83334512/155677807-8c5807d4-eba9-4bef-a1d2-b8360bc981c2.PNG)

회원가입 했던 아이디와 비밀번호를 입력하여 로그인 할 수 있습니다.

### 게시판 페이지

![list](https://user-images.githubusercontent.com/83334512/155677924-f7eaca2e-a8f2-4298-b9ca-00ca622ae4f3.png)

- 현재 등록된 게시물과 게시물을 등록할 수 있고 제목과 작성자 등 검색 기능과 페이징 처리를 통해 게시물을 정리하였습니다. 
- 게시판 오른쪽 상단에 게시판 등록 버튼을 통해 게시물을 등록할 수 있습니다.
- 각 게시물의 제목을 클릭하면 해당 게시물의 내용을 확인 할 수 있습니다.
- 하단의 검색 조건과 검색 기능을 통하여 원하는 게시물을 검색할 수 있습니다.

### 상세 조회 페이지

![get](https://user-images.githubusercontent.com/83334512/155678147-40d8b84f-d8c4-4577-9490-3d63aedf30b4.png)

게시물의 고유 번호와 제목, 작성자, 최근 수정일, 조회수, 내용을 보여주는 페이지
입니다.

### 수정 및 삭제 페이지

![modify_1](https://user-images.githubusercontent.com/83334512/155678887-01932903-7378-4e7c-9048-de184294a4d7.PNG)

