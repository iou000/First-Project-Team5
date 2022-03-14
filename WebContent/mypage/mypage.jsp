<!-- @author 김지혜 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>레시피 상세 페이지</title>
    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
</head>
<body>
<div id="wrap" class="mypage mypage main">
    <jsp:include page='<%="../header.jsp" %>'/>
    <div id="contents">
        <div class="innercon">
            <!-- mypage lnb// -->
            <script type="text/javascript">
                var custTndcGbcd = '99';

                $(document).ready(function () {
                    if (window.location.pathname.toString().indexOf("prmsBoxList") > -1) $("li[name=prmsBoxList]").addClass("active");

                });

                function fn_mtmInqrClick() {
                    if (custTndcGbcd == "20" || custTndcGbcd == "30" || custTndcGbcd == "40" || custTndcGbcd == "50") {
                        alert("1:1 웹문의 접수가 불가합니다. 문의사항은 고객센터 전화상담을 이용해주시기 바랍니다.");
                        return false;
                    } else {
                        location.href = "/front/mp/mpc/mtmInqrList.do";
                    }
                }
            </script>
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
                                        <strong><span id="cupnCnt">0</span>개</strong> 내가 올린 레시피 수
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/front/mp/mpb/hBonus.do">
                                    <div class="inner">
                                        <strong><span id="curHBonus">0</span>개</strong> 내가 올린 댓글 수
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/front/mp/mpb/hPoint.do">
                                    <div class="inner">
                                        <strong><span id="upointCurAmt">0</span>P</strong> 나의 레시피 조회수
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/front/cua/mypage/cdpst.do">
                                    <div class="inner">
                                        <strong><span id="curAmt">0</span>원</strong> 나의 레시피 전체 평점
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>


                <section class="hpointchange-section" id="hpointNoMem">
                    <p>나의 레시피 한눈에 확인하기!</p>
                    <a href="/front/cua/front/joinStep3Hpoint.do" class="btn-round">차트 확인</a>
                </section>

                <section class="like-section">
                    <header class="header">
                        <h4><span>내가 만든 레시피 </span><strong>0</strong></h4>
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
                        <h4><span>내가 단 댓글 </span><strong>1</strong></h4>
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
            </section>
        </div>
    </div>
    <a href="app?command=recipe_insert_form">레시피 만들기</a>
    <div id="front">
        <div id="myRecipe">
            <h2> 내가 만든 레시피 </h2>

        </div>
        <hr>
        <!-- author SJH -->
        <div id="myComment">
            <h2> 내가 작성한 댓글 </h2>
            <c:forEach items="${commentList}" var="commentVO">
                <div id="item">
                    <!-- 댓글을 작성한 레시피의 주소로 이동해야 함 -->
                    <a href="app?command=recipe_view&recipeId=${commentVO.recipe_id}">
                        평점 : ${commentVO.grade}, 내용 : ${commentVO.contents} (수정일자 : ${commentVO.updatedAt})
                        <br>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
