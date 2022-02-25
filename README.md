# 게시판 CRUD
## 1. 개 요
- 프로젝트 명칭 : HoStroy
- 개발 인원 : 1명
- 개발 기간 : 2022.02.01 ~  
- 주요 기능 : 
  - 게시판 - CRUD 기능, 조회수, 조회수 순위(1,2,3위), 페이징 및 검색 처리
  - 사용자 - Security 회원가입 및 로그인, 로그인 유효성 및 중복 검사
- 개발 언어 : Java 11
- 개발 환경 : SpringFramework, Spring Security
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
게시물(ho_board)

![ho_board](https://user-images.githubusercontent.com/83334512/155712400-e36c8f77-5104-4c0a-84d0-f3576c0a642e.PNG)

회원(ho_member)

![ho_member](https://user-images.githubusercontent.com/83334512/155712429-e813a151-9351-43c5-984b-74c931179052.PNG)

## 4. API 설계
### 메인 페이지

![main_api](https://user-images.githubusercontent.com/83334512/155711653-01c5e666-af5d-416c-bdfc-193bab3f6715.PNG)

### 게시글 관련

![board_api](https://user-images.githubusercontent.com/83334512/155711677-aa561a08-d8e6-498d-a8fb-0f84f76b56ed.PNG)

### 회원 관련

![member_api](https://user-images.githubusercontent.com/83334512/155711703-6f82593f-f7ee-4e1d-8638-6e120cd7dccf.PNG)

## 6. 화면
### 게시글 관련
#### 메인 페이지

![home](https://user-images.githubusercontent.com/83334512/155679250-fa086db1-a73d-4b23-a8cc-47e60e29fc1d.PNG)


게시물 중 조회수가 높은 순서 1, 2, 3위를 보여줍니다.

#### 게시판 페이지

![board](https://user-images.githubusercontent.com/83334512/155679278-e8cd863c-728e-4d64-9dfd-727fb923724a.PNG)

- 현재 등록된 게시물과 게시물을 등록할 수 있고 제목과 작성자 등 검색 기능과 페이징 처리를 통해 게시물을 정리하였습니다. 
- 게시판 오른쪽 상단에 게시판 등록 버튼을 통해 게시물을 등록할 수 있습니다.
- 각 게시물의 제목을 클릭하면 해당 게시물의 내용을 확인 할 수 있습니다.
- 하단의 검색 조건과 검색 기능을 통하여 원하는 게시물을 검색할 수 있습니다.

#### 상세 조회 페이지

![get_login](https://user-images.githubusercontent.com/83334512/155680994-96f19a13-f8a1-4ddd-9088-2f7855dc1281.png)

![로그인_modify_x_ㅁ](https://user-images.githubusercontent.com/83334512/155680867-9dda3a6d-e575-4ad9-b473-62cbcb3740d4.png)


- 게시물의 고유 번호와 제목, 작성자, 최근 수정일, 조회수, 내용을 보여주는 페이지입니다.
- 본인이 작성한 글만 수정 및 삭제가 가능합니다.

#### 수정 및 삭제 페이지

![modify_2](https://user-images.githubusercontent.com/83334512/155681546-bb5ab729-a9ed-4370-bfbf-5a1f9e5dc411.PNG)

![modify_success](https://user-images.githubusercontent.com/83334512/155681586-587051ac-651c-407b-be17-540ef0ecbb6e.PNG)

![modify_complete](https://user-images.githubusercontent.com/83334512/155681905-48a16138-326e-43ed-81cb-7f07021dcdc2.PNG)

제목과 내용만 수정할 수 있게 합니다.

#### 삭제 페이지

![modify_2](https://user-images.githubusercontent.com/83334512/155682243-7992f104-9710-4d65-9db0-f665b7d1fe9a.PNG)

![delete_complete](https://user-images.githubusercontent.com/83334512/155682255-508d852a-01b2-41e7-83ae-fbe16ac4b506.PNG)

![delete_complete_2](https://user-images.githubusercontent.com/83334512/155682286-811c30ce-4910-483e-af9d-f498a07dec33.PNG)

수정 페이지에서 삭제 버튼을 클릭하면 목록에서 해당 게시물이 삭제된 것을 볼 수 있습니다.

#### 게시글 검색 화면

![스크린샷(12)](https://user-images.githubusercontent.com/83334512/155682895-eca8d758-b868-4c49-ba16-144d6d3aeff5.png)

![search_result](https://user-images.githubusercontent.com/83334512/155683381-8c5543dc-7f1a-43f6-b37c-61ddd7a05c67.png)

- 사용자가 원하는 검색 주제별로 검색할 수 있다.
- 페이징 처리되어 조회할 수 있다.

### 회원 관련
#### 회원가입 페이지

![join](https://user-images.githubusercontent.com/83334512/155717268-608ad3a3-6caf-4087-945d-85a6a5386672.png)

아이디, 비밀번호, 비밀번호 확인, 이름, 이메일, 주소를 입력하여 회원 가입을 진행할 수 있습니다.

#### 로그인 페이지
![login_ox](https://user-images.githubusercontent.com/83334512/155713317-93f9fe2c-7c5d-4519-adb2-de8fb719b868.png)

- 회원가입 했던 아이디와 비밀번호를 입력하여 로그인 할 수 있습니다.
- 로그인 실패시 경고 메시지가 나오고, 로그인에 성공하면 메인 페이지로 리다이렉트 된다.
