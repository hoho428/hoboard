<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js">
</script>
  <link rel="stylesheet" href="../resources/css/board/enroll.css">
</head>
<body>
<div class="wrapper">
	<div class="wrap">
		<div class="background_area">
			<div class="banner fade active">
				<img src="../resources/img/banner_01.png">
			</div>
			<div class="banner fade">
				<img src="../resources/img/banner_02.png">
			</div>
			<div class="banner fade">
				<img src="../resources/img/banner_04.png">
			</div>
		</div>
		<div class="top_gnb_area">
			<div class="top_left"><img src="../resources/img/phone.PNG"> 대표번호 010-4772-6301</div>
			<div class="top_right">
				<ul class="top_right_list">
					<c:if test="${member == null}"> <!-- 로그인 X -->
						<li>
							<a href="/member/login">로그인</a>
						</li>
						<li>
							<a href="/member/join">회원가입</a>
						</li>
					</c:if>
					<c:if test="${member != null}"> <!-- 로그인 O -->
						<c:if test="${member.adminCk == 1}"> <!-- 관리자 계정 -->
							<li><a href="/admin/list">관리자 페이지</a></li>
						</c:if>
						<li>
							${member.memberName}님 환영합니다!
						</li>
						<li>
							<a id="logout">로그아웃</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="navi_bar_area">
			<div class="navi_bar">
				<ul class="navi_list">
					<li><a href="/">HOME</a></li>
					<li><a href="/board/list">게시판</a></li>
					<li><a href="https://github.com/hoho428/hoboard">GIT HUB</a></li>
				</ul>
			</div>
		</div>
		<div class="intro">
			<div class="intro1"><strong>Process</strong> rather than <strong>result</strong></div>
			<div class="intro2">Hello! Introduce myself!</div>
			<div class="intro3">스프링 프레임워크 게시판 프로젝트 입니다.</div>
			<div class="intro4">Back-end Project</div>
		</div>
		<div class="content_wrap">
			<form id="enrollForm" action="/board/enroll" method="POST">
				<div class="content_top">
					<div class="input_wrap_right">
						<label id="c1">작성자 : </label>
						<input id="writer" name="writer" readonly="readonly" value='<c:out value="${member.memberName}"></c:out>'>
					</div>
					<div class="input_wrap_left">
						<label id="t1">제목 : </label>
						<input id="title" name="title" placeholder='제목을 입력하세요'>
					</div>
				</div>
				<div class="input_wrap_textarea">
					<textarea id="enroll_content" rows="3" name="content" placeholder='내용을 입력하세요'></textarea>
				</div>
				<div class="input_wrap_solid2"></div>
				<button class="enroll_btn">등록</button>
			</form>
		</div>
		<div class="footer">
			<div class="footer_container">
				<div class="footer_left">
					<img src="../resources/img/logo/hosan.png">
				</div>
				<div class="footer_right">
					(주) hosotry   대표이사 : 윤호산
					<br>
					사업자등록번호 : 123-45-6789
					<br>
					대표전화 : 010-4772-6301
					<br>
					<br>
					COPYRIGHT(C) <strong>github.com/hoho428/hoboard</strong> ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$(".banner").not(".active").hide() // 화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	/* 2초마다 다음 슬라이드로 넘어감 */
	setInterval(nextSlide, 4000); 
	
});

// 이전 슬라이드
function prevSlide(){
	$(".banner").hide(); // 모든 div 숨김
	var allSlide = $(".banner"); // 모든 div 객체를 변수에 저장
	var currentIndex = 0; // 현재 나타난 슬라이드의 인덱스 변수
	
	// 반복문으로 현재 active 클래스를 가진 div를 찾아 index 저장
	$(".banner").each(function(index, item){
		if($(this).hasClass("active")){
			currentIndex = index;
		}
	});
	
	// 새롭게 나타낼 div의 index 
	var newIndex = 0;
	
	if(currentIndex <= 0){
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	}else{
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}
	//모든 div에서 active 클래스 제거
	$(".banner").removeClass("active");
	
	//새롭게 지정한 index 번째 슬라이드에 active 클래스 부여 후 show()
	$(".banner").eq(newIndex).addClass("active");
	$(".banner").eq(newIndex).show();
}

//다음 슬라이드
function nextSlide(){
	$(".banner").hide();
	var allSlide = $(".banner");
	var currentIndex = 0;
	
	$(".banner").each(function(index, item){
		if($(this).hasClass("active")){
			currentIndex = index;
		}
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1){
		//현재 슬라이드 index가 마지막 순서면 0번찌로 보냄
		newIndex = 0;
	}else{
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}
	
	$(".banner").removeClass("active");
	$(".banner").eq(newIndex).addClass("active");
	$(".banner").eq(newIndex).show();
}


/* 로그아웃 작동 */
$("#logout").click(function(){
	$.ajax({
		type: "POST",
		url: "/member/logout",
		success: function(data){
			alert("로그아웃 성공");
			document.location.reload();
		}
	}); //ajax
});

/* ckeditor */
ClassicEditor
	.create(document.querySelector('#enroll_content'))
	.then( newEditor => {
		    editor = newEditor;
		})
	.catch(error=>{
		console.error(error);
	});

</script>
</body>
</html>