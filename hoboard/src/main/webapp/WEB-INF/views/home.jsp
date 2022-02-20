<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="../resources/css/home.css">
	<script src="https://kit.fontawesome.com/6dbc707731.js" crossorigin="anonymous"></script>
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
 </script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<div class="background_area">
				<div class="banner fade active">
					<img src="resources/img/banner_01.png">
				</div>
				<div class="banner fade">
					<img src="resources/img/banner_02.png">
				</div>
				<div class="banner fade">
					<img src="resources/img/banner_04.png">
				</div>
				<!-- <a class="prev" onclick="prevSlide()">&#10094;</a>
					 <a class="next" onclick="nextSlide()">&#10095;</a>	
				 -->
			</div>
			<div class="top_gnb_area">
				<div class="top_left"><img src="resources/img/phone.PNG"> 대표번호 010-4772-6301</div>
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
			
			<div class="content_area">
				<div class="content_title1">
					<div class="t1">Best</div>
					<div class="t2">Views</div>
					<div class="t3">가장 높은 조회수 게시물</div>
				</div>
				<div class="rank_table">
					<table class="rank_realtable">
						<thead>
							<tr>
								<th class="first_width"><img src="resources/img/rank/rank_1.png"></th>
								<th class="second_width"><img src="resources/img/rank/rank_2.png"></th>
								<th class="third_width"><img src="resources/img/rank/rank_3.png"></th>
							</tr>
						</thead>
						<tbody>
							<tr class="rank_tr">
								<c:forEach items="${rank}" var="rank">
									<td id="rank_no">No. <c:out value="${rank.hno}"></c:out></td>
								</c:forEach>
							</tr>
							<tr class="rank_tr">
								<c:forEach items="${rank}" var="rank">
									<td id="rank_title"><strong>제목 : </strong> 
										<a href="/board/get?hno=<c:out value="${rank.hno}"></c:out>">
											<c:out value="${rank.title}"></c:out>
										</a>
									</td>
								</c:forEach>
							</tr>
							<tr class="rank_tr">
								<c:forEach items="${rank}" var="rank">
									<td id="rank_writer"><strong>작성자 : </strong><c:out value="${rank.writer}"></c:out></td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="content_title2">
					<div class="t1">Using</div>
					<div class="t2">Tools</div>
					<div class="t3">프로젝트를 만들며 사용한 기술들</div>
				</div>	
				<div class="logo_table">
					<table>
				        <tr>
				        	<td>
				        		<img src="resources/img/logo/html.png">
				        		<div class="name">HTML</div>
				        		<div>태그를 이용한 마크업</div>
				        	</td>
				          	<td>
								<img src="resources/img/logo/css.png">
				        		<div class="name">CSS</div>
				        		<div>화면 디자인</div>
							</td>
				          	<td>
				          		<img src="resources/img/logo/java.png">
				        		<div class="name">JAVA</div>
				        		<div>객체 지향</div>
				          	</td>
				        </tr>
				        <tr>
				        	<td>
				          		<img src="resources/img/logo/js.png">
				        		<div class="name">JAVA SCRIPT</div>
				        		<div>자바스크립트</div>
				          	</td>
				          	<td>
				          		<img src="resources/img/logo/jquery.png">
				        		<div class="name">JQUERY</div>
				        		<div>라이브러리 활용 및<br>커스터마이징</div>
				          	</td>
				          	<td>
				          		<img src="resources/img/logo/spring.png">
				        		<div class="name">SPRING</div>
				        		<div>프레임워크 활용<br>환결설정·MVC 개발</div>
				          	</td>
				        </tr>
				        <tr>
				        	<td>
				          		<img src="resources/img/logo/tomcat.png">
				        		<div class="name">TOMCAT</div>
				        		<div>서버 구축</div>
				          	</td>
				          	<td>
				          		<img src="resources/img/logo/oracle.png">
				        		<div class="name">ORACLE</div>
				        		<div>데이터베이스<br>sql 문법</div>
				          	</td>
				        </tr>
			    	</table>
			    </div>
			</div>
			<div class="footer">
				<div class="footer_container">
					<div class="footer_left">
						<img src="resources/img/logo/hosan.png">
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
	</script>
</body>
</html>
