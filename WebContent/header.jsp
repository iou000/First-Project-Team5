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
<header>
    <!-- 검색어를 통해서 레시미 목록 조회 -->
    <div align="center">
        <form id="searchForm" method="post" action="app?command=mainpage" onclick="searchWithKeyword()">
            <input type="text" name="keyword" value="" placeholder="키워드를 입력해주세요!"/>
            <input type="hidden" name="category" value=""/>
            <input type="submit" value="검색"/>
            <hr>
            <button type="button" id="all" value="" onclick="searchWithCategory(this.id)">전체</button>
            <button type="button" id="korean" value="한식" onclick="searchWithCategory(this.id)">한식</button>
            <button type="button" id="western" value="양식" onclick="searchWithCategory(this.id)">양식</button>
            <button type="button" id="japanese" value="일식" onclick="searchWithCategory(this.id)">일식</button>
            <button type="button" id="chinese" value="중식" onclick="searchWithCategory(this.id)">중식</button>
            <button type="button" id="flour-based" value="분식" onclick="searchWithCategory(this.id)">분식</button>
            <button type="button" id="snack" value="간식" onclick="searchWithCategory(this.id)">간식</button>
            <button type="button" id="dessert" value="디저트" onclick="searchWithCategory(this.id)">디저트</button>
        </form>
    </div>
    <!--로고 들어가는 곳 시작--->
    <%--    <div id="logo">--%>
    <%--        로고--%>
    <%--    </div>--%>
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
        </ul>
    </nav>
    <!--마이페이지 로그인 끝-->

</header>
<!--헤더파일 들어가는 곳 끝 -->
</body>

<!-- jQuery 3.5.1 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>

<!-- Javascript -->
<script type="text/javascript">
    function searchWithCategory(id) {
        var foodCategory = document.getElementById(id).value;
        $("input[name=category]").attr("value", foodCategory);
        $("#searchForm").submit();
    }

    function searchWithKeyword() {
        var foodKeyword = $("input[name=keyword]").val();
        // 키워드가 입력되지 않은 상태에서 검색 버튼을 누르면 알림창 띄우기
        /*if(foodKeyword == null || foodKeyword == "") {
            alert('키워드를 먼저 입력해주세요!');
            $("input[name=keyword]").focus();
        }*/
    }
</script>
</html>