<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/library.css">
<head>
	<style>
		#header .gnbarea .btn-category {
		    position: absolute;
		    left: 0;
		    bottom: 0;
		    padding-left: 30px;
		    padding-bottom: 23px;
		    line-height: 1;
		    color: #767572;
		}
		#header .gnbarea .btn-category:before {
		    content: "";
		    position: absolute;
		    left: 0;
		    top: 0;
		    display: inline-block;
		    width: 18px;
		    height: 16px;
		    background: url("https://tohome.thehyundai.com/UIUX/w/pjtCom/images/common/btn.png") no-repeat -100px -450px;
		}
		#header .gnbarea .searcharea .form-entry .btn-search:after {
		    content: "";
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    display: inline-block;
		    width: 20px;
		    height: 20px;
		    background: url("https://tohome.thehyundai.com/UIUX/w/pjtCom/images/common/btn.png") no-repeat -300px -300px;
		}
		body {
		    position: relative;
		    font-family: "NotoSansKR", sans-serif, Malgungothic, "맑은고딕", Dotum, "돋움";
		    font-weight: 200;
		    font-size: 15px;
		    line-height: 1.6;
		    color: #767572;
		    letter-spacing: -0.025em;
		    word-break: keep-all;
		    word-wrap: break-word;
		}
		button {
		    font-family: "NotoSansKR", sans-serif, Malgungothic, "맑은고딕", Dotum, "돋움";
		    cursor: pointer;
		    padding: 0;
		    border: none;
		    letter-spacing: -0.025em;
		}
	</style>
</head>
<header id="header">
	<noscript>
		이 사이트를 이용하기 위해서 자바스크립트를 활성화 시킬 필요가 있습니다. <a
			href="http://www.enable-javascript.com/ko/" target="_blank">브라우저에서
			자바스크립트를 활성화하는 방법</a>을 참고 하세요.
	</noscript>

	<!-- 복지관(이지웰) 배너 노출 //-->
	<div id="ezwelHeader"></div>
	<!-- // 복지관(이지웰) 배너 노출 -->

	<!-- topbanner : 메인에서만 노출// -->
	<div id="topBanner"></div>
	<!-- topbanner// -->

	<div class="inner">
		<!-- toparea// -->
		<div class="toparea">
			<h1>
				<a href="app?command=mainpage">
					<img src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/common/header_logo_freex34.png" alt="현대식품관">
				</a>
			</h1>

			<!-- util : 로그인 전// -->
			<div class="util" id="dawnLoginN" style="display: hidden">
				<a href="app?command=login_form">로그인</a>
				<a href="app?command=join_form">회원가입</a>
				<a href="app?command=mypage">마이페이지</a>
			</div>
			<!-- //util : 로그인 전 -->

			<!-- util : 로그인 후// -->


			<!-- //util : 로그인 후 -->
		</div>
		<!-- //toparea -->

		<!-- gnbarea// -->
		<nav class="gnbarea">
			<!-- 팝업 : category// -->
			<div id="popCategory">
				<script type="text/javascript" nonce="3539e0288dd047b9a275bfaef58"
					src="//local.adguard.org?ts=1647207397334&amp;type=content-script&amp;dmn=tohome.thehyundai.com&amp;pth=%2Ffront%2Fdp%2Fdpa%2FpopCategory.Ajax&amp;app=chrome.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1&amp;stealth=1&amp;uag="></script>
				<script type="text/javascript" nonce="3539e0288dd047b9a275bfaef58"
					src="//local.adguard.org?ts=1647207397334&amp;name=AdGuard%20Assistant&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;name=Web%20of%20Trust&amp;type=user-script"></script>
				<script type="text/javascript">
					$(document).ready(
							function() {
								// 퍼블 정상 동작을 위해 $(document).ready에 추가 
								$('.depth1.brand-wrap .depth2 button, .depth3')
										.hover(
												function() {
													$(this).parents('ul.lnb')
															.addClass('on');
												},
												function() {
													$(this).parents('ul.lnb')
															.removeClass('on');
												});

								$('.exhibition-wrap, .brand-ct').hover(
										function() {
											$(this).parents('ul.lnb').addClass(
													'on2');
										},
										function() {
											$(this).parents('ul.lnb')
													.removeClass('on2');
										});
							});
				</script>

				<!-- category -->
				<button type="button" class="btn-category">음식 카테고리</button>

				<!-- 팝업 : category// -->
				<div id="p_popCategory" class="popcategory">
					<nav class="lnb-list">
						<ul class="lnb">
							<li class="depth1">
								<button type="button" id="korean" onclick="searchWithCategory(this.id)">한식</button>
							</li>
							<li class="depth1">
								<button type="button" id="western" onclick="searchWithCategory(this.id)">양식</button>
							</li>
							<li class="depth1">
								<button type="button" id="japanese" onclick="searchWithCategory(this.id)">일식</button>
							</li>
							<li class="depth1">
								<button type="button" id="chinese" onclick="searchWithCategory(this.id)">중식</button>
							</li>
							<li class="depth1">
								<button type="button" id="flour-based" onclick="searchWithCategory(this.id)">분식</button>
							</li>
							<li class="depth1">
								<button type="button" id="snack" onclick="searchWithCategory(this.id)">간식</button>
							</li>
							<li class="depth1">
								<button type="button" id="dessert" onclick="searchWithCategory(this.id)">디저트</button>
							</li>
						</ul>
					</nav>
				</div>
				<!-- //팝업 : category -->
			</div>
			<!-- //팝업 : category -->

			<!-- gnb// -->
			<ul class="gnb-list" id="homeGnbList">
				<li>
					<a href="app?command=recipe_insert_form">레시피 만들기</a>
				</li>
				<li>
					<a href="" onclick="notReady()">베스트 레시피</a>
				</li>
				<li>
					<a href="app?command=chartpage">인기 카테고리</a>
				</li>
				<li>
					<a href="" onclick="notReady()">즐겨찾기</a>
				</li>
				<li>
					<a href="" onclick="notReady()">커뮤니티</a>
				</li>
			</ul>
			<!-- //gnb -->

			<!-- search// -->
			<div class="searcharea">
				<form name="pdPcSearchForm" id="pdPcSearchForm" method="post" action="app?command=mainpage" onsubmit="return checkSearchForm()">
					<fieldset>
						<legend class="hide">검색어 입력</legend>
						<div class="form-entry exist search">
							<input type="text" name="keyWord" value="" placeholder="키워드를 입력해주세요!"/>
								<!-- onfocus="fn.addClass('.searcharea');$('.defaultsearch').fadeIn();"
								oninput="handleOnInput(this, 20);" autocomplete="off"
								onkeyup="fnPDSearchAutoSelect(this, event);"> -->
							<button type="submit" class="btn-search" onclick="searchWithKeyword()">검색</button>
						</div>
					</fieldset>
				</form>
			</div>
		</nav>
		<!-- //gnbarea -->
	</div>
</header>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Javascript -->
<script type="text/javascript">
	function searchWithCategory(id) {
		var foodCategory = document.getElementById(id).value;
		$("input[name=category]").attr("value", foodCategory);
		$("#categoryForm").submit();
	}

	function checkSearchForm() {
		// 키워드가 입력되지 않은 상태에서 검색 버튼을 누르면 알림창 띄우기
		if (pdPcSearchForm.keyword.value == "") {
			alert('키워드를 먼저 입력해주세요!!!');
			pdPcSearchForm.keyword.focus();
			return false;
		} else
			return true;
	}
	
	function notReady() {
		event.preventDefault();
		alert('준비중입니다!!!');
	}
</script>