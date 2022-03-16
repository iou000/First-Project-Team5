<%--
  작성자: 김지혜
  작성일자: 3/12/22
  내용: 메인 페이지 jsp 구현
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>레시피 상세 페이지</title>
    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
</head>
<body>
<div id="wrap" class="mypage mypage main" style="height: fit-content !important;">
    <jsp:include page='<%="../header.jsp" %>'/>
    <div id="contents">
        <div class="innercon">
            <!-- mypage lnb// -->
            <section class="lnbarea">
                <h2>마이페이지</h2>
            </section>
            <!-- //mypage lnb -->

            <section class="conarea">
                <h3 class="hide">마이페이지</h3>

                <section class="mystate-section">
                    <div class="myinfo">
                        <div class="memclass normal">
                            <div class="cont">
                                <strong class="name">${loginUser.username}님</strong>
                                <ul>
                                    <li><a href="/front/cua/mypage/certPwd.do" class="btn-line">회원정보</a></li>
                                    <li><a href="#" class="btn-line" onclick="fn.popupOpen('#p_popGradeBenefit')">멤버십
                                        혜택</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="point">
                        <ul>
                            <li>
                                <a href="/front/mp/mpb/couponList.do">
                                    <div class="inner">
                                        <strong><span id="cupnCnt">${recipeDesVOS[0].recipe_count}</span>개</strong> 내가
                                        올린 레시피 수
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/front/mp/mpb/hBonus.do">
                                    <div class="inner">
                                        <strong><span id="curHBonus">${commentList.size()}</span>개</strong> 내가 올린 댓글 수
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/front/mp/mpb/hPoint.do">
                                    <div class="inner">
                                        <strong><span
                                                id="upointCurAmt">${recipeDesVOS[0].recipe_view_count}</span>개</strong>
                                        나의 레시피 조회수
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/front/cua/mypage/cdpst.do">
                                    <div class="inner">
                                        <strong><span
                                                id="curAmt">${recipeDesVOS[0].recipe_grade_average}</span>개</strong> 나의
                                        레시피 전체 평점
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>


                <section class="hpointchange-section" id="hpointNoMem">
                    <p>나만의 래시피를 생성하고 이를 여러 사람들과 함게 공유해보세요!</p>
                    <a href="app?command=recipe_insert_form" class="btn-round">레시피 만들기</a>
                </section>

                <section class="like-section">
                    <header class="header">
                        <h4><span>내가 만든 레시피 </span><strong>${recipeDesVOS[0].recipe_count}</strong></h4>
                    </header>

                    <%--                    데이터 있는지 없는지 if else --%>
                    <c:choose>
                        <c:when test="${empty myRecipeList}">
                            <div class="nodata">만든 레시피가 없습니다.</div>
                        </c:when>
                        <c:otherwise>
                            <ul class="product-list small">
                                <c:forEach items="${myRecipeList}" var="recipeVO">
                                    <li>
                                        <a href="fnProductDetailMove('S02006002119', '', '100411', '01');">
                                        <span class="thumb">
                                            <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/0/0/9/8809152871900_00.jpg?RS=232x278"
                                                 alt="[현대쌀집][백미] 프리미엄 쌀 4kg"
                                                 onerror="this.src='/UIUX/w/pjtCom/images/common/noimage_232x278.jpg'">
                                        </span>
                                            <strong class="txt-ti ellipsis">${recipeVO.title}</strong>
                                        </a>
                                        <span class="info">
                                            <span class="txt-price">
                                                <strong><em>${recipeVO.updatedAt}</em></strong>
                                            </span>
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </section>

                <section class="view-section">
                    <header class="header">
                        <h4><span>댓글 단 레시피 </span><strong>${commentRecipeList.size()}</strong></h4>
                    </header>
                    <c:choose>
                        <c:when test="${empty commentRecipeList}">
                            <div class="nodata">댓글 단 레시피가 없습니다.</div>
                        </c:when>
                        <c:otherwise>
                            <ul class="product-list small">
                                <c:forEach items="${commentRecipeList}" var="recipeVO">
                                    <li>
                                        <a href="fnProductDetailMove('S02006002119', '', '100411', '01');">
                                        <span class="thumb">
                                            <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/0/0/9/8809152871900_00.jpg?RS=232x278"
                                                 alt="[현대쌀집][백미] 프리미엄 쌀 4kg"
                                                 onerror="this.src='/UIUX/w/pjtCom/images/common/noimage_232x278.jpg'">
                                        </span>
                                            <strong class="txt-ti ellipsis">${recipeVO.title}</strong>
                                        </a>
                                        <span class="info">
                                            <span class="txt-price">
                                                <strong><em>${recipeVO.updatedAt}</em></strong>
                                            </span>
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </section>

                <section id="p_proReview" class="tab-contents proreview active">
                    <header class="header">
                        <h4><span>나의 댓글</span><strong>${commentList.size()}</strong></h4>
                    </header>

                    <div class="list-top">
                        <p>
                            ${loginUser.username}님의 댓글들을 확인해보세요!<br>
                            정성이 담긴 리뷰는 레세피 공유 활성화에 도움이 됩니다 ^^
                        </p>
                    </div>
                    <!-- 리뷰 리스트 동적 구현 -->
                    <div class="review-list">
                        <ul>
                            <c:forEach items="${commentList}" var="commentVO">
                                <a href="app?command=recipe_view&recipeId=${commentVO.recipe_id}">
                                    <li data-wrt-id="${loginUser.username}" data-ord-no="${commentVO.updatedAt}"
                                        data-contents="${commentVO.contents}" data-scrg="${commentVO.grade}">
                                        <div class="star">
                                            <div class="grade-star"><span><span
                                                    style="width:100%;">${commentVO.grade}</span></span></div>
                                        </div>
                                        <div class="recont">
                                            <div class="ti">
                                                <span class="txt-review">${commentVO.contents}</span>
                                            </div>
                                                <%--                                            <div class="ui-icon-search">--%>
                                                <%--                                                <button type="button" class="btn smaller gray btn-reviewlike"--%>
                                                <%--                                                        onclick="go_recipe_view(${commentVO.recipe_id});">--%>
                                                <%--                                                </button>--%>
                                                <%--                                                해당 레시피로 이동하기--%>
                                                <%--                                            </div>--%>
                                        </div>
                                        <div class="info">
                                            <span class="txt-date">${commentVO.updatedAt}</span>
                                        </div>
                                    </li>
                                </a>
                            </c:forEach>
                        </ul>
                        <!-- pagination// -->
                        <div class="pagination">
                            <span class="num">
                                 <a href="javascript:fnReviewAjaxPcList('B', '1');" class="active">1</a>
                                <!-- 현재페이지 class="active" -->
                                <a href="javascript:fnReviewAjaxPcList('B', '2');">2</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '3');">3</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '4');">4</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '5');">5</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '6');">6</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '7');">7</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '8');">8</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '9');">9</a>
                                <a href="javascript:fnReviewAjaxPcList('B', '10');">10</a>
                                </span>
                            <a href="fnBlockCnt('A', 'B');" class="next">다음</a>
                        </div>
                        <!-- //pagination -->
                    </div>
                </section>
            </section>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript" src="js/mypage.js"></script>
<script type="text/javascript" src="js/comment.js"></script>
</script>
</body>
</html>
