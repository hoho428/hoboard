<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="../resources/css/board/list.css">
</head>
<!-- background="../resources/img/homepage.png" -->
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
			<!-- <a class="prev" onclick="prevSlide()">&#10094;</a>
				 <a class="next" onclick="nextSlide()">&#10095;</a>	
			 -->
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
			<div class="content_title1">
				<span class="t1">BOARD</span>
				<span class="t2">게시판</span>
			</div>
			<c:if test="${member == null}">
				<a href="#" class="top_btn">게시판 등록</a>
			</c:if>
			<c:if test="${member != null}">
				<a href="/board/enroll" class="top_btn">게시판 등록</a>
			</c:if>
			<div class="table_wrap">
				<table>
					<thead>
						<tr>
							<th class="hno_width">번호</th>
							<th class="title_width">제목</th>
							<th class="writer_width">작성자</th>
							<th class="regdate_width">작성일</th>
							<th class="view_width">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td class="able_solid_1"><c:out value="${list.hno}"></c:out></td>
								<td class="able_solid_2">
									<a class="move" href='<c:out value="${list.hno}"></c:out>'>
										<c:out value="${list.title}"></c:out>
									</a>
								</td>
								<td class="able_solid_3"><c:out value="${list.writer}"></c:out></td>
								<td class="able_solid_4"><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${list.regdate}"/></td>
								<td class="able_solid_5"><c:out value="${list.bview}"></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
				<div class="search_wrap">
					<div class="search_area">
						<select name="type">
							<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
							<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목+내용</option>
							<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목+작성자</option>
							<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>제목+내용+작성자</option>
						</select>
						<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
						<button>검 색</button>
					</div>
				</div>
				
				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
							<!-- 이전 페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">prev</a></li>
							</c:if>
							
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
							</c:forEach>
							
							<!-- 다음 페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a href="${pageMaker.endPage+1}">next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				
				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
				</form>
			</div>
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

	$(document).ready(function(){
		
		/* 등록 성공 이벤트 */
		let result = '<c:out value="${result}"/>';
		console.log(result);
		checkAlert(result);
		
		function checkAlert(result){
			if(result === ''){
				return;
			}
			if(result === "enroll success"){
				alert("등록이 완료되었습니다.");
			}

			if(result === "modify success"){
				alert("수정이 완료되었습니다.");
			}
			if(result === "delete success"){
				alert("삭제가 완료되었습니다.");
			}
		}
	});
	
	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='hno' value='"+$(this).attr("href")+"'>");
		moveForm.attr("action", "/board/get");
		moveForm.submit();
		
	});
	
	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/list");
		moveForm.submit();
	});
	
	$(".search_area button").on("click", function(e){
		
		e.preventDefault();
		
		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();
		
		if(!type){
			alert("검색 종류를 선택하세요.");
			return false;
		}
		if(!keyword){
			alert("키워드를 입력하세요");
			return false;
		}
		
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});
	
	
	
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