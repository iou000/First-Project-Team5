<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/library.css">
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
                    <img src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/common/header_logo_freex34.png"
                         alt="현대식품관">
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
            <!-- 팝업 : category -->
            <div id="popCategory">
                <!-- category -->
                <button type="button" class="btn-category">음식 카테고리</button>

                <!-- 팝업 : category -->
                <div id="p_popCategory" class="popcategory">
                    <nav class="lnb-list">
                        <ul class="lnb">
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

                <!-- 카테고리를 통해서 레시미 목록 조회 -->
                <div id="categorySearch">
                    <form id="categoryForm" method="POST" action="app?command=mainpage">
                        <input type="hidden" name="category" value=""/>
                    </form>
                </div>
            </div>

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
                <form name="pdPcSearchForm" id="pdPcSearchForm" method="post" action="app?command=mainpage"
                      onsubmit="return checkSearchForm()">
                    <fieldset>
                        <legend class="hide">검색어 입력</legend>
                        <div class="form-entry exist search">
                            <input type="text" name="keyword" value="" placeholder="키워드를 입력해주세요!"/>
                            <button type="button" class="btn-search" onclick="searchWithKeyword()">검색</button>
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
<script type="text/javascript" nonce="3539e0288dd047b9a275bfaef58"
        src="//local.adguard.org?ts=1647207397334&amp;type=content-script&amp;dmn=tohome.thehyundai.com&amp;pth=%2Ffront%2Fdp%2Fdpa%2FpopCategory.Ajax&amp;app=chrome.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1&amp;stealth=1&amp;uag="></script>
<script type="text/javascript" nonce="3539e0288dd047b9a275bfaef58"
        src="//local.adguard.org?ts=1647207397334&amp;name=AdGuard%20Assistant&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;name=Web%20of%20Trust&amp;type=user-script"></script>
<script type="text/javascript">
    $(document).ready(
        function () {
            // 퍼블 정상 동작을 위해 $(document).ready에 추가
            $('.btn-category')
                .hover(
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
</script>

<!-- Javascript -->
<script type="text/javascript">
    function searchWithCategory(id) {
        var foodCategory = document.getElementById(id).value;
        $("input[name=category]").attr("value", foodCategory);
        $("#categoryForm").submit();
    }

    function searchWithKeyword() {
        $("#pdPcSearchForm").submit();
    }

    function checkSearchForm() {
        // 키워드가 입력되지 않은 상태에서 검색 버튼을 누르면 알림창 띄우기
        if (pdPcSearchForm.keyword.value == "") {
            pdPcSearchForm.keyword.focus();
            alert('키워드를 먼저 입력해주세요!!!');
            return false;
        } else
            return true;
    }

    function notReady() {
        event.preventDefault();
        alert('준비중입니다!!!');
    }
</script>