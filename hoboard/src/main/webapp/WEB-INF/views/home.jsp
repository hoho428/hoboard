<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="../resources/css/home.css">
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
 </script>
</head>
<body>
	<div class="wrapper">	
		<div class="wrap">
			<div class="top_background">
				<div class="banner fade active">
					<img src="resources/img/banner_01.png">
				</div>
				<div class="banner fade">
					<img src="resources/img/banner_02.png">
				</div>
				<div class="banner fade">
					<img src="resources/img/banner_03.png">
				</div>
				<a class="prev" onclick="prevSlide()">&#10094;</a>
				<a class="next" onclick="nextSlide()">&#10095;</a>	
				<div class="top_area">
					<div class="logo_top_area">
						<span>대표 전화 010-4772-6301</span>
						<span>로그인</span>
						<span>회원가입</span>
					</div>
					<div class="logo_area">
						<div class="logo_area_box">
							<a href="/"><span>HOME</span></a>
							<a href="/"><span>INTRODUCE</span></a>
							<a href="board/list"><span>게게시판</span></a>
							<a href="/"><span>GIT HUB</span></a>
						</div>
					</div>
					<div class="login_area">
						<!-- 로그인 하지 않은 상태 -->
						<c:if test="${member == null}">
							<div class="login_button"><a href="../member/login">로그인</a></div>
							<span><a href="../member/join">회원가입</a></span>
						</c:if>
	
						<!-- 로그인 상태 -->
						<c:if test="${ member != null }">
	                   		<div class="login_success_area">
	                        	<span>${member.memberName} 님</span>
	                    	    <span>안녕하세요!</span>
	                	        <a href="/member/logout">로그아웃</a>
	            	        </div>
	        	        </c:if>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="body_frame">
				<h1>환영합니다</h1>
				<h1>현재 시각 ${serverTime}에 입장하셨습니다.</h1>	
				<a href="/board/list">
					<button class="enterBtn">입장</button>
				</a>
			</div>
		</div>
	</div>
		
	<script type="text/javascript">
	$(document).ready(function(){
		$(".banner").not(".active").hide() // 화면 로딩 후 첫번째 div를 제외한 나머지 숨김
		
		/* 2초마다 다음 슬라이드로 넘어감 */
		setInterval(nextSlide, 4000); 
		
	});
	
	/* 이전 슬라이드 */
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
		
		/* 새롭게 나타낼 div의 index */
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
	
	</script>
</body>
</html>
