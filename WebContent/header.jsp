<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<body>
<!--헤더파일 들어가는 곳 시작 -->
<header id="header">
    <!-- 검색어(키워드)를 통해서 레시미 목록 조회 -->
    <div id="keywordSearch" align="center">
        <form name="searchForm" method="POST" action="app?command=mainpage" onsubmit="return checkSearchForm()">
            <input type="text" name="keyword" value="" placeholder="키워드를 입력해주세요!"/>
            <input type="submit" value="검색"/>
            <br><br>
        </form>
    </div>

    <!-- 카테고리를 통해서 레시미 목록 조회 -->
    <div id="categorySearch" align="center">
        <form id="categoryForm" method="POST" action="app?command=mainpage">
            <input type="hidden" name="category" value=""/>
        </form>
    </div>
    <script>
        $(document).ready(function(){
            // 장바구니 수량 조회
            basketInf.getBasketTotalCnt('01', function(cnt) {
                if (isEmpty(cnt)) { cnt = 0 }
                $('#basketCnt').text(gfn_appendComma(cnt));
            });
        });
    </script>

    <!-- 카테고리를 접근하기 위한 버튼 목록 -->
    <div id="buttonGroup" align="center">
        <button type="button" id="all" value="" onclick="searchWithCategory(this.id)">전체</button>
        <button type="button" id="korean" value="한식" onclick="searchWithCategory(this.id)">한식</button>
        <button type="button" id="western" value="양식" onclick="searchWithCategory(this.id)">양식</button>
        <button type="button" id="japanese" value="일식" onclick="searchWithCategory(this.id)">일식</button>
        <button type="button" id="chinese" value="중식" onclick="searchWithCategory(this.id)">중식</button>
        <button type="button" id="flour-based" value="분식" onclick="searchWithCategory(this.id)">분식</button>
        <button type="button" id="snack" value="간식" onclick="searchWithCategory(this.id)">간식</button>
        <button type="button" id="dessert" value="디저트" onclick="searchWithCategory(this.id)">디저트</button>
    </div>

    <!--로고 들어가는 곳 시작--->
        <div id="logo">
            로고
        </div>
    <!--로고 들어가는 곳 끝-->
    <!--마이페이지 로그인 시작-->
    <!-- author 김지혜 -->
    <nav id="catagory_menu">
        <ul>
            <c:choose>
                <c:when test="${empty sessionScope.loginUser}">
                    <li>
                        <a href="app?command=login_form" style="width:110px;">LOGIN</a>
                    </li>
                    <li><a href="app?command=join_form">JOIN</a></li>
                </c:when>
                <c:otherwise>
                    <li style="color:orange">
                            ${sessionScope.loginUser.username}님 안녕하세요~~
                    </li>
                    <li><a href="app?command=logout">LOGOUT</a></li>
                    <li>
                        <a href="app?command=mypage">MY PAGE</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li>
                <a href="app?command=mainpage">MAIN PAGE</a>
            </li>
            <li>
                <a href="app?command=chartpage">CHART PAGE</a>
            </li>
        </ul>
        <hr>
    </nav>
    <!--마이페이지 로그인 끝-->
</header>
<!--헤더파일 들어가는 곳 끝 -->
</body>

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
        if(searchForm.keyword.value == "") {
            alert('키워드를 먼저 입력해주세요!!!');
            searchForm.keyword.focus();
            //event.preventDefault();
            return false;
        } else return true;
    }
</script>
</html>