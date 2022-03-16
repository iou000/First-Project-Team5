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
                                        <a href="javascript:fnProductDetailMove('S02006002119', '', '100411', '01');">
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
                                        <a href="javascript:fnProductDetailMove('S02006002119', '', '100411', '01');">
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
                            <%--                            <li data-no="566914" data-wrt-id="bravomom67" data-ord-no="22021600131046"--%>
                            <%--                                data-slitm-cd="S02202098452" data-opt-cd=""--%>
                            <%--                                data-img-path="PD/PDImages/S/7/7/1/4560330110177_00.jpg" data-contents="너무 터무니없는 가격이라 망설이다 구매했습니다.--%>
                            <%--일단 며칠 써봐야지 했는데 균일한 추출과--%>
                            <%--빨리 식어버리는 핸드드립의 단점을 제거한 따뜻한 커피...마음에 듭니다.--%>
                            <%--유라 전자동 커피머신과 여러 종류의 핸드드립, 사이폰까지 두루 쓰고있지만 앞으로는 더 브루를 많이 이용할 것 같네요--%>
                            <%--특별히 핸들링을 꼭 원하는 분이 아니고 가격의 사악함을 용서할 수 있는 분이라면 추천합니다 ㅎㅎ "--%>
                            <%--                                data-img-path1="pd/pde/2022/02/27/140032374/hdm_135955_716349719424718411.jpg"--%>
                            <%--                                data-img-path2="" data-img-path3="" data-slitm-nm="[발뮤다] 더 브루" data-slitm-desc=""--%>
                            <%--                                data-atfl-no="882421" data-scrg="5">--%>
                            <%--                                <div class="star">--%>
                            <%--                                    <div class="grade-star"><span><span style="width:100%;">5</span></span></div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="recont">--%>
                            <%--                                    <div class="pic" data-menu="[발뮤다] 더 브루" data-star="5" data-option="">--%>
                            <%--                                        <button type="button" data-picidx="1"><img--%>
                            <%--                                                src="https://tohomeimage.thehyundai.com/pd/pde/2022/02/27/140032374/hdm_135955_716349719424718411.jpg?RS=720&amp;AO=1"--%>
                            <%--                                                style="width: auto; height: 120px;"></button>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="ti">--%>
                            <%--            <span class="txt-option">--%>

                            <%--            </span>--%>
                            <%--                                        <span class="txt-review">너무 터무니없는 가격이라 망설이다 구매했습니다.<br>일단 며칠 써봐야지 했는데 균일한 추출과 <br>빨리 식어버리는 핸드드립의 단점을 제거한 따뜻한 커피...마음에 듭니다.<br>유라 전자동 커피머신과 여러 종류의 핸드드립, 사이폰까지 두루 쓰고있지만 앞으로는 더 브루를 많이 이용할 것 같네요 <br>특별히 핸들링을 꼭 원하는 분이 아니고 가격의 사악함을 용서할 수 있는 분이라면 추천합니다 ㅎㅎ </span>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="like">--%>
                            <%--                                        <button type="button" class="btn smaller gray btn-reviewlike"--%>
                            <%--                                                onclick="fnToggleClass(this);">1--%>
                            <%--                                        </button>--%>
                            <%--                                        리뷰가 도움이 되었나요?--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="info">--%>
                            <%--                                    <span class="txt-id">bra*****</span>--%>
                            <%--                                    <span class="txt-date">2022.02.27</span>--%>
                            <%--                                </div>--%>

                            <%--                                <div class="btnwrap">--%>
                            <%--                                    <button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고--%>
                            <%--                                    </button>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>
                            <%--                            <li data-no="566318" data-wrt-id="irin11" data-ord-no="22022300148593"--%>
                            <%--                                data-slitm-cd="S02202098452" data-opt-cd=""--%>
                            <%--                                data-img-path="PD/PDImages/S/7/7/1/4560330110177_00.jpg"--%>
                            <%--                                data-contents="너무도 갖고 싶었는데, 좋은 기회에 구매하게되어 감사한 마음입니다 "--%>
                            <%--                                data-img-path1="pd/pde/2022/02/26/171410118/hdm_171315_2657798215553324685.jpg"--%>
                            <%--                                data-img-path2="" data-img-path3="" data-slitm-nm="[발뮤다] 더 브루" data-slitm-desc=""--%>
                            <%--                                data-atfl-no="881912" data-scrg="5">--%>
                            <%--                                <div class="star">--%>
                            <%--                                    <div class="grade-star"><span><span style="width:100%;">5</span></span></div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="recont">--%>
                            <%--                                    <div class="pic" data-menu="[발뮤다] 더 브루" data-star="5" data-option="">--%>
                            <%--                                        <button type="button" data-picidx="1"><img--%>
                            <%--                                                src="https://tohomeimage.thehyundai.com/pd/pde/2022/02/26/171410118/hdm_171315_2657798215553324685.jpg?RS=720&amp;AO=1"--%>
                            <%--                                                style="width: auto; height: 120px;"></button>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="ti">--%>
                            <%--            <span class="txt-option">--%>

                            <%--            </span>--%>
                            <%--                                        <span class="txt-review">너무도 갖고 싶었는데, 좋은 기회에 구매하게되어 감사한 마음입니다 </span>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="like">--%>
                            <%--                                        <button type="button" class="btn smaller gray btn-reviewlike"--%>
                            <%--                                                onclick="fnToggleClass(this);">0--%>
                            <%--                                        </button>--%>
                            <%--                                        리뷰가 도움이 되었나요?--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="info">--%>
                            <%--                                    <span class="txt-id">iri*****</span>--%>
                            <%--                                    <span class="txt-date">2022.02.26</span>--%>
                            <%--                                </div>--%>

                            <%--                                <div class="btnwrap">--%>
                            <%--                                    <button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고--%>
                            <%--                                    </button>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>
                            <%--                            <li data-no="565629" data-wrt-id="milch79" data-ord-no="22022300148752"--%>
                            <%--                                data-slitm-cd="S02202098452" data-opt-cd=""--%>
                            <%--                                data-img-path="PD/PDImages/S/7/7/1/4560330110177_00.jpg"--%>
                            <%--                                data-contents="너무 사고팠는데 kb pay 20프로 페이백 덕분에 진짜 저렴하게 구매했어요 사은품 없다했는데 필터까지 센스있게 보내주셔서 감동 두배였네요 역시 현대식품관 최고에욧^^ 은은한 커피향과 캡슐 아닌 드립으로 라떼를 마실 수 있다니 진짜 좋네요~~~ 강추합니다 코로나에 적합한 기계에요!!! "--%>
                            <%--                                data-img-path1="pd/pde/2022/02/25/221001970/20220224_082237.jpg"--%>
                            <%--                                data-img-path2="pd/pde/2022/02/25/221001970/20220224_090753.jpg"--%>
                            <%--                                data-img-path3="pd/pde/2022/02/25/221001970/20220224_090949.jpg"--%>
                            <%--                                data-slitm-nm="[발뮤다] 더 브루" data-slitm-desc="" data-atfl-no="881327" data-scrg="5">--%>
                            <%--                                <div class="star">--%>
                            <%--                                    <div class="grade-star"><span><span style="width:100%;">5</span></span></div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="recont">--%>
                            <%--                                    <div class="pic" data-menu="[발뮤다] 더 브루" data-star="5" data-option="">--%>
                            <%--                                        <button type="button" data-picidx="1"><img--%>
                            <%--                                                src="https://tohomeimage.thehyundai.com/pd/pde/2022/02/25/221001970/20220224_082237.jpg?RS=720&amp;AO=1"--%>
                            <%--                                                style="width: auto; height: 120px;"></button>--%>
                            <%--                                        <button type="button" data-picidx="2"><img--%>
                            <%--                                                src="https://tohomeimage.thehyundai.com/pd/pde/2022/02/25/221001970/20220224_090753.jpg?RS=720&amp;AO=1"--%>
                            <%--                                                style="width: auto; height: 120px;"></button>--%>
                            <%--                                        <button type="button" data-picidx="3"><img--%>
                            <%--                                                src="https://tohomeimage.thehyundai.com/pd/pde/2022/02/25/221001970/20220224_090949.jpg?RS=720&amp;AO=1"--%>
                            <%--                                                style="width: auto; height: 120px;"></button>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="ti">--%>
                            <%--            <span class="txt-option">--%>

                            <%--            </span>--%>
                            <%--                                        <span class="txt-review">너무 사고팠는데 kb pay 20프로 페이백 덕분에 진짜 저렴하게 구매했어요 사은품 없다했는데 필터까지 센스있게 보내주셔서 감동 두배였네요 역시 현대식품관 최고에욧^^ 은은한 커피향과 캡슐 아닌 드립으로 라떼를 마실 수 있다니 진짜 좋네요~~~ 강추합니다 코로나에 적합한 기계에요!!! </span>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="like">--%>
                            <%--                                        <button type="button" class="btn smaller gray btn-reviewlike"--%>
                            <%--                                                onclick="fnToggleClass(this);">2--%>
                            <%--                                        </button>--%>
                            <%--                                        리뷰가 도움이 되었나요?--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="info">--%>
                            <%--                                    <span class="txt-id">mil*****</span>--%>
                            <%--                                    <span class="txt-date">2022.02.25</span>--%>
                            <%--                                </div>--%>

                            <%--                                <div class="btnwrap">--%>
                            <%--                                    <button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고--%>
                            <%--                                    </button>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>
                            <%--                            <li data-no="564855" data-wrt-id="gwtwfan" data-ord-no="22021600130428"--%>
                            <%--                                data-slitm-cd="S02202098452" data-opt-cd=""--%>
                            <%--                                data-img-path="PD/PDImages/S/7/7/1/4560330110177_00.jpg"--%>
                            <%--                                data-contents="드립커피를 좋아하는 분들한테 안성맞춤인 메이커입니다. 물온도 및 원두추출액 농도가 커피 전문점 맛과 동일하네요. "--%>
                            <%--                                data-img-path1="pd/pdd/2022/02/24/192229324/35C8CC63-4DF4-489D-B822-7B61C4CBB5C0.jpeg"--%>
                            <%--                                data-img-path2="" data-img-path3="" data-slitm-nm="[발뮤다] 더 브루" data-slitm-desc=""--%>
                            <%--                                data-atfl-no="880542" data-scrg="5">--%>
                            <%--                                <div class="star">--%>
                            <%--                                    <div class="grade-star"><span><span style="width:100%;">5</span></span></div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="recont">--%>
                            <%--                                    <div class="pic" data-menu="[발뮤다] 더 브루" data-star="5" data-option="">--%>
                            <%--                                        <button type="button" data-picidx="1"><img--%>
                            <%--                                                src="https://tohomeimage.thehyundai.com/pd/pdd/2022/02/24/192229324/35C8CC63-4DF4-489D-B822-7B61C4CBB5C0.jpeg?RS=720&amp;AO=1"--%>
                            <%--                                                style="width: auto; height: 120px;"></button>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="ti">--%>
                            <%--            <span class="txt-option">--%>

                            <%--            </span>--%>
                            <%--                                        <span class="txt-review">드립커피를 좋아하는 분들한테 안성맞춤인 메이커입니다. 물온도 및 원두추출액 농도가 커피 전문점 맛과 동일하네요. </span>--%>
                            <%--                                    </div>--%>
                            <%--                                    <div class="like">--%>
                            <%--                                        <button type="button" class="btn smaller gray btn-reviewlike"--%>
                            <%--                                                onclick="fnToggleClass(this);">1--%>
                            <%--                                        </button>--%>
                            <%--                                        리뷰가 도움이 되었나요?--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                                <div class="info">--%>
                            <%--                                    <span class="txt-id">gwt*****</span>--%>
                            <%--                                    <span class="txt-date">2022.02.24</span>--%>
                            <%--                                </div>--%>

                            <%--                                <div class="btnwrap">--%>
                            <%--                                    <button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고--%>
                            <%--                                    </button>--%>
                            <%--                                </div>--%>
                            <%--                            </li>--%>
                        </ul>
                        <%--                        댓글 페이징 일단 보류--%>
                        <!-- pagination// -->
                        <%--                        <div class="pagination">--%>
                        <%--                           <span class="num">--%>
                        <%--                           <a href="javascript:fnReviewAjaxPcList('B', '1');" class="active">1</a>--%>
                        <%--                               <!-- 현재페이지 class="active" -->--%>
                        <%--                           <a href="javascript:fnReviewAjaxPcList('B', '2');">2</a>--%>
                        <%--                           </span>--%>
                        <%--                        </div>--%>
                        <!-- //pagination -->
                    </div>
                </section>
            </section>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript" src="js/mypage.js"></script>
</script>
</body>
</html>
