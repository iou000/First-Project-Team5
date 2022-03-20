<!-- author 송진호 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/library.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<header id="header">
    <div class="inner">
        <!-- toparea// -->
        <div class="toparea">
        	<!-- 메인 페이지로 이동하는 로고 // -->
            <h1>
                <a href="app?command=mainpage"><img
                        src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/common/header_logo_freex34.png"
                        alt="현대식품관"></a>
            </h1>
            <!-- // 메인 페이지로 이동하는 로고 -->

			<!-- 로그인 여부에 따라서 표시되는 화면을 달리함 // -->
            <c:choose>
                <c:when test="${empty loginUser.username}">
                    <div class="util" id="dawnLoginN" style="display: hidden">
                        <a href="app?command=login_form">로그인</a>
                        <a href="app?command=join_form">회원가입</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="util" id="dawnLoginY" style="display: hidden">
                            ${loginUser.username}님! &nbsp; 반갑습니다.
                        <a href="app?command=logout">로그아웃</a>
                        <a href="app?command=mypage">마이페이지</a>
                    </div>
                </c:otherwise>
            </c:choose>
			<!-- // 로그인 여부에 따라서 표시되는 화면을 달리함 -->
			
        </div>
        <!-- //toparea -->

        <!-- gnbarea// -->
        <nav class="gnbarea">
            <!-- 카테고리 드롭다운 기능 구현 // -->
            <div id="popCategory">
                <!-- category -->
                <button type="button" class="btn-category">음식 카테고리</button>

                <!-- 카테고리를 누르면 해당 카테고리에 부합하는 음식 리스트 조회 // -->
                <div id="p_popCategory" class="popcategory">
                    <nav class="lnb-list">
                        <ul class="lnb">
                            <li class="depth1">
                                <button type="button" id="all" value="" onclick="searchWithCategory(this.id)">전체
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="korean" value="한식" onclick="searchWithCategory(this.id)">한식
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="western" value="양식" onclick="searchWithCategory(this.id)">양식
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="japanese" value="일식" onclick="searchWithCategory(this.id)">
                                    일식
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="chinese" value="중식" onclick="searchWithCategory(this.id)">중식
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="flour-based" value="분식" onclick="searchWithCategory(this.id)">
                                    분식
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="snack" value="간식" onclick="searchWithCategory(this.id)">간식
                                </button>
                            </li>
                            <li class="depth1">
                                <button type="button" id="dessert" value="디저트" onclick="searchWithCategory(this.id)">
                                    디저트
                                </button>
                            </li>
                        </ul>
                    </nav>
                </div>

                <!-- // 카테고리를 누르면 해당 카테고리에 부합하는 음식 리스트 조회 -->
                <div id="categorySearch">
                    <form id="categoryForm" method="POST" action="app?command=recipe_list">
                        <input type="hidden" name="category" value=""/>
                    </form>
                </div>
                <!-- // 카테고리를 통해서 레시미 목록 조회 -->
            </div>
            <!-- // 카테고리 드롭다운 기능 구현 -->

            <!-- 상단메뉴 탭 // -->
            <ul class="gnb-list" id="homeGnbList">
                <li>
                    <a href="app?command=recipe_insert_form">레시피 만들기</a>
                </li>
                <li>
                    <a href="app?command=recipe_list&selectRecipe=best">베스트 레시피</a>
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
            <!-- // 상단메뉴 탭 -->

            <!-- 키워드를 통해서 레시피 목록 조회 // -->
            <div class="searcharea">
                <form name="pdPcSearchForm" id="pdPcSearchForm" method="post" action="app?command=recipe_list"
                      onsubmit="return checkSearchForm()">
                    <fieldset>
                        <legend class="hide">검색어 입력</legend>
                        <div class="form-entry exist search">
                            <input type="text" name="keyword" title="검색어 입력" value="${keywordAjax}"
                                   onfocus="fn.addClass('.searcharea')" onblur="fn.removeClass('.searcharea')"
                                   autocomplete="off">
                            <button type="button" class="btn-search" onclick="searchWithKeyword()">검색</button>
                        </div>
                    </fieldset>
                </form>
            </div>
            <!-- // 키워드를 통해서 레시피 목록 조회 -->
        </nav>
        <!-- //gnbarea -->
    </div>
</header>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Imported Javscript -->
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/product.js"></script>
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript" src="js/product.search.js"></script>

<script type="text/javascript" nonce="3539e0288dd047b9a275bfaef58"
        src="//local.adguard.org?ts=1647207397334&amp;type=content-script&amp;dmn=tohome.thehyundai.com&amp;pth=%2Ffront%2Fdp%2Fdpa%2FpopCategory.Ajax&amp;app=chrome.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1&amp;stealth=1&amp;uag="></script>
<script type="text/javascript" nonce="3539e0288dd047b9a275bfaef58"
        src="//local.adguard.org?ts=1647207397334&amp;name=AdGuard%20Assistant&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;name=Web%20of%20Trust&amp;type=user-script"></script>

<!-- Javascript -->
<script type="text/javascript">
	//마우스를 올려놓으면/떼면 카테고리 드롭다운 활성화/비활성화 @author 김지혜
    $(document).ready(function () {
        $('.btn-category').hover(
            function () {
                var d = document.getElementById("p_popCategory");
                d.classList.add("active");
            },
            function () {
                var d = document.getElementById("p_popCategory");
                d.classList.remove("active")
            });

        $('#p_popCategory').hover(
            function () {
                var d = document.getElementById("p_popCategory");
                d.classList.add("active");
            },
            function () {
                var d = document.getElementById("p_popCategory");
                d.classList.remove("active")
            });
    });

    // 드롭다운으로 펼쳐진 카테고리를 클릭하면 해당 카테고리에 부합하는 레시피 리스트 출력 @author 송진호
    function searchWithCategory(id) {
        var foodCategory = document.getElementById(id).value;
        $("input[name=category]").attr("value", foodCategory);
        $("#categoryForm").submit();
    }

 	// 키워드를 통해서 레시피 리스트 검색 @author 송진호
    function searchWithKeyword() {
        $("#pdPcSearchForm").submit();
    }

 	// 키워드가 입력되지 않은 상태에서 검색 버튼을 누르면 알림창 띄우기 @author 송진호
    function checkSearchForm() {
        // 키워드가 입력되지 않은 상태에서 검색 버튼을 누르면 알림창 띄우기
        if (pdPcSearchForm.keyword.value == "") {
            pdPcSearchForm.keyword.focus();
            alert('키워드를 먼저 입력해주세요!!!');
            return false;
        } else
            return true;
    }

 	// 미구현 기능 접근시 알림창 띄우기 @author 송진호
    function notReady() {
        event.preventDefault();
        alert('준비중입니다!!!');
    }
</script>