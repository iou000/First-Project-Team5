<!-- author SJH -->
<%--
  작성자: 김지혜
  작성일자: 3/14/22
  내용: 메인 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
    <link href="css/library.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
</head>
<body>
<div id="wrap" class="main">
    <!-- header// -->
    <jsp:include page='<%="./header.jsp" %>'/>
    <!-- header// -->

    <!-- //contents -->
    <!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
    <div id="contents">
        <section class="mainbanner active">
            <div class="swiper-container mainbannerswiper swiper-container-horizontal">
                <div class="swiper-wrapper"
                     style="transition-duration: 0ms; transform: translate3d(-12122px, 0px, 0px);">
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev"
                         data-swiper-slide-index="0" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901950&amp;ga_param=dwMain1"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','두리향');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/rxpsi.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
                         data-swiper-slide-index="1" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901998&amp;ga_param=dwMain2"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','모두의 맛집 2탄 - 제주도,？서울');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/jkgxj.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
                         data-swiper-slide-index="2" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901967&amp;ga_param=dwMain3"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','봄, 내몸을 위한 가벼운식단');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/wsrja.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901973&amp;ga_param=dwMain4"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','서울칩');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/svbyd.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901978&amp;ga_param=dwMain5"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','원테이블 피자 사은품');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/olzia.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901987&amp;ga_param=dwMain6"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','치밥도시락');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/nwrjg.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/pd/pdd/productDetail.do?slitmCd=S02203099707&amp;ga_param=dwMain7"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','마마스윗');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/08/093858/pqdoj.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220304100576001&amp;ga_param=dwMain8"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','신상품 소개');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/08/093858/tnodt.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901977&amp;ga_param=dwMain9"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','서울만두');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/10/134258/ilakn.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0" style="margin-right: 10px;">
                        <a href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901950&amp;ga_param=dwMain1"
                           onclick="GA_Event('PC_새벽투홈_메인', '메인배너','두리향');"><img
                                src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/rxpsi.jpg?RS=1204x540"
                                alt=""></a></div>
                    <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="1"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901998&amp;ga_param=dwMain2"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','모두의 맛집 2탄 - 제주도,？서울');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/jkgxj.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="2" style="margin-right: 10px;">
                        <a href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901967&amp;ga_param=dwMain3"
                           onclick="GA_Event('PC_새벽투홈_메인', '메인배너','봄, 내몸을 위한 가벼운식단');"><img
                                src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/wsrja.png?RS=1204x540"
                                alt=""></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="3" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901973&amp;ga_param=dwMain4"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','서울칩');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/svbyd.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="4" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901978&amp;ga_param=dwMain5"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','원테이블 피자 사은품');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/olzia.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="5" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901987&amp;ga_param=dwMain6"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','치밥도시락');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/nwrjg.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="6" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/pd/pdd/productDetail.do?slitmCd=S02203099707&amp;ga_param=dwMain7"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','마마스윗');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/08/093858/pqdoj.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="7" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220304100576001&amp;ga_param=dwMain8"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','신상품 소개');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/08/093858/tnodt.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="8" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901977&amp;ga_param=dwMain9"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','서울만두');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/10/134258/ilakn.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev"
                         data-swiper-slide-index="0" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901950&amp;ga_param=dwMain1"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','두리향');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/rxpsi.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
                         data-swiper-slide-index="1" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901998&amp;ga_param=dwMain2"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','모두의 맛집 2탄 - 제주도,？서울');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/jkgxj.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
                         data-swiper-slide-index="2" style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901967&amp;ga_param=dwMain3"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','봄, 내몸을 위한 가벼운식단');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/143200/wsrja.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901973&amp;ga_param=dwMain4"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','서울칩');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/svbyd.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901978&amp;ga_param=dwMain5"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','원테이블 피자 사은품');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/olzia.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901987&amp;ga_param=dwMain6"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','치밥도시락');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/11/091949/nwrjg.jpg?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/pd/pdd/productDetail.do?slitmCd=S02203099707&amp;ga_param=dwMain7"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','마마스윗');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/08/093858/pqdoj.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="7"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpd/mgzDetail.do?mgzNo=220304100576001&amp;ga_param=dwMain8"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','신상품 소개');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/08/093858/tnodt.png?RS=1204x540"
                            alt=""></a></div>
                    <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8"
                         style="margin-right: 10px;"><a
                            href="https://tohome.thehyundai.com/front/dp/dpc/spexSectDetailMain.do?sectId=901977&amp;ga_param=dwMain9"
                            onclick="GA_Event('PC_새벽투홈_메인', '메인배너','서울만두');"><img
                            src="https://tohomeimage.thehyundai.com/DP/DP034/2022/03/10/134258/ilakn.png?RS=1204x540"
                            alt=""></a></div>
                </div>
                <div class="innercon">
                    <div class="swiper-pagination-tot"><strong>02</strong> / <span>09</span></div>
                    <a href="#" class="btn-play active">재생/일시정지</a></div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
        </section>
        <div id="cdnTimeSale">
            <section class="timesale" id="timeSale">
                <div class="innercon"><h2><span class="bl" style="border-top:4px solid "><i
                        style="border-bottom:4px solid "></i></span><strong style="font-weight:bold">레시피를
                    부탁해</strong><small style="font-weight:normal">맛있는 음식이 주는 즐거운 경험</small></h2>
                    <div class="swiper-container timesaleswiper swiper-container-horizontal">
                        <div class="swiper-wrapper"
                             style="transform: translate3d(-603px, 0px, 0px); transition-duration: 0ms;">
                            <div class="swiper-slide swiper-slide-duplicate swiper-slide-prev"
                                 data-time-start="2022/03/15 15:09:37" data-time-end="null" data-swiper-slide-index="18"
                                 style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[베어벨스] 더블바이트 프로틴바 55g, 2종');fnProductDetailMove('S02106056411','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/1/1/4/S02106056411_00.JPG?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>20%</strong></span></span><strong class="txt-ti ellipsis">[베어벨스]
                                더블바이트 프로틴바 55g, 2종</strong><span class="txt-price"><strong><em>3,600</em>원</strong><del>4,500</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[베어벨스] 더블바이트 프로틴바 55g, 2종');fnProductBasketAdd('01','S02106056411','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide swiper-slide-active" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="null" data-swiper-slide-index="0" style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[수블수블] 바바리아 논알콜 맥주 330ml, 4종');fnProductDetailMove('S02102033267','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/6/2/S02102033267_00.jpg?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge" style="display: none;"><strong></strong></span></span><strong
                                    class="txt-ti ellipsis"></strong><span
                                    class="txt-price"><strong><em></em></strong><del></del></span>
                            </a>
                            </div>
                            <div class="swiper-slide swiper-slide-next" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/31 22:59:59" data-swiper-slide-index="1" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[수블수블] NEW 미자곡(쌀누룩발효) 3g×30스틱');fnProductDetailMove('S02105051750','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/4/0/2/8808018690204_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>30%</strong></span></span><strong class="txt-ti ellipsis">[수블수블]
                                    NEW 미자곡(쌀누룩발효) 3g×30스틱</strong><span
                                        class="txt-price"><strong><em>17,500</em>원</strong><del>25,000</del></span> </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[수블수블] NEW 미자곡(쌀누룩발효) 3g×30스틱');fnProductBasketAdd('01','S02105051750','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/20 22:50:59" data-swiper-slide-index="2" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[Dried-H] 마른 칼치 500g');fnProductDetailMove('S02011023352','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/9/0/8806079859097_00.JPG?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>30%</strong></span></span><strong class="txt-ti ellipsis">[Dried-H]
                                    마른 칼치 500g</strong><span class="txt-price"><strong><em>12,600</em>원</strong><del>18,000</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[Dried-H] 마른 칼치 500g');fnProductBasketAdd('01','S02011023352','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/15 22:50:59" data-swiper-slide-index="3" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[제직증명] 제주흑돼지 앞다리 구이용 400g');fnProductDetailMove('S02111094105','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/9/2/1/8809754920129_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>35%</strong></span></span><strong class="txt-ti ellipsis">[제직증명]
                                    제주흑돼지 앞다리 구이용 400g</strong><span class="txt-price"><strong><em>9,030</em>원</strong><del>13,900</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[제직증명] 제주흑돼지 앞다리 구이용 400g');fnProductBasketAdd('01','S02111094105','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/15 22:50:59" data-swiper-slide-index="4" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[63다이닝키트] 파빌리온 스테이크 플래터 1,068g');fnProductDetailMove('S02112095509','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/4/3/5/8809558849534_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>15%</strong></span></span><strong class="txt-ti ellipsis">[63다이닝키트]
                                    파빌리온 스테이크 플래터 1,068g</strong><span
                                        class="txt-price"><strong><em>37,310</em>원</strong><del>43,900</del></span> </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[63다이닝키트] 파빌리온 스테이크 플래터 1,068g');fnProductBasketAdd('01','S02112095509','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/31 22:50:59" data-swiper-slide-index="5" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','흙대파 3대(300g)');fnProductDetailMove('S02006004504','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/6/2/1/8806079690126_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>10%</strong></span></span><strong class="txt-ti ellipsis">흙대파
                                    3대(300g)</strong><span class="txt-price"><strong><em>4,500</em>원</strong><del>5,000</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_흙대파 3대(300g)');fnProductBasketAdd('01','S02006004504','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/16 22:50:59" data-swiper-slide-index="6" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','태국망고 2입');fnProductDetailMove('S02006004328','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/4/8/2/8806079688284_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>10%</strong></span></span><strong class="txt-ti ellipsis">태국망고
                                    2입</strong><span class="txt-price"><strong><em>14,400</em>원</strong><del>16,000</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_태국망고 2입');fnProductBasketAdd('01','S02006004328','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/20 22:50:59" data-swiper-slide-index="7" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[압구정 예향] 포테이토 에그 샐러드');fnProductDetailMove('S02105046850','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/8/3/8806079974387_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>10%</strong></span></span><strong class="txt-ti ellipsis">[압구정
                                    예향] 포테이토 에그 샐러드</strong><span class="txt-price"><strong><em>5,850</em>원</strong><del>6,500</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[압구정 예향] 포테이토 에그 샐러드');fnProductBasketAdd('01','S02105046850','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/20 22:50:59" data-swiper-slide-index="8" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[압구정 예향] 연근 흑임자 샐러드');fnProductDetailMove('S02105046900','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/0/0/4/8806079974400_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>10%</strong></span></span><strong class="txt-ti ellipsis">[압구정
                                    예향] 연근 흑임자 샐러드</strong><span class="txt-price"><strong><em>5,850</em>원</strong><del>6,500</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[압구정 예향] 연근 흑임자 샐러드');fnProductBasketAdd('01','S02105046900','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/15 22:50:59" data-swiper-slide-index="9" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[명가오향족발] 수제 오돌이 편족발');fnProductDetailMove('S02111094362','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/9/3/4/8806079684439_01.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>11%</strong></span></span><strong class="txt-ti ellipsis">[명가오향족발]
                                    수제 오돌이 편족발</strong><span class="txt-price"><strong><em>17,000</em>원</strong><del>19,200</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[명가오향족발] 수제 오돌이 편족발');fnProductBasketAdd('01','S02111094362','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/15 22:50:59" data-swiper-slide-index="10" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[텃골] 1+등급동물복지유정란 10구');fnProductDetailMove('S02101029320','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/1/3/5/8809081461531_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>20%</strong></span></span><strong class="txt-ti ellipsis">[텃골]
                                    1+등급동물복지유정란 10구</strong><span class="txt-price"><strong><em>7,600</em>원</strong><del>9,500</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[텃골] 1+등급동물복지유정란 10구');fnProductBasketAdd('01','S02101029320','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/20 22:50:59" data-swiper-slide-index="11" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[압구정 예향] 고구마 단호박 샐러드');fnProductDetailMove('S02105046851','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/4/9/3/8806079974394_00.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>10%</strong></span></span><strong class="txt-ti ellipsis">[압구정
                                    예향] 고구마 단호박 샐러드</strong><span class="txt-price"><strong><em>5,850</em>원</strong><del>6,500</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[압구정 예향] 고구마 단호박 샐러드');fnProductBasketAdd('01','S02105046851','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/15 22:50:59" data-swiper-slide-index="12" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[바릴라] 페스토 바실리코 앤 루콜라 (190g)');fnProductDetailMove('S02107064601','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/6/9/3/8076809545396_00.JPG?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>30%</strong></span></span><strong class="txt-ti ellipsis">[바릴라]
                                    페스토 바실리코 앤 루콜라 (190g)</strong><span
                                        class="txt-price"><strong><em>6,280</em>원</strong><del>8,980</del></span> </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[바릴라] 페스토 바실리코 앤 루콜라 (190g)');fnProductBasketAdd('01','S02107064601','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37" data-time-end="null"
                                 data-swiper-slide-index="13" style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[미주라] 곡물 크래커 3종');fnProductDetailMove('S02109090456','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/6/5/4/S02109090456_00.JPG?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>40%</strong></span></span><strong class="txt-ti ellipsis">[미주라]
                                곡물 크래커 3종</strong><span class="txt-price"><strong><em>3,480</em>원</strong><del>5,800</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[미주라] 곡물 크래커 3종');fnProductBasketAdd('01','S02109090456','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37" data-time-end="null"
                                 data-swiper-slide-index="14" style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[랩노쉬] 마시는식사 비건 2종');fnProductDetailMove('S02110092711','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/1/1/7/S02110092711_00.JPG?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>45%</strong></span></span><strong class="txt-ti ellipsis">[랩노쉬]
                                마시는식사 비건 2종</strong><span class="txt-price"><strong><em>1,200</em>원</strong><del>2,200</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[랩노쉬] 마시는식사 비건 2종');fnProductBasketAdd('01','S02110092711','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37" data-time-end="null"
                                 data-swiper-slide-index="15" style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[와이쏘시리얼] 그래놀라 3종');fnProductDetailMove('S02112096203','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/3/0/2/S02112096203_00.jpg?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>30%</strong></span></span><strong class="txt-ti ellipsis">[와이쏘시리얼]
                                그래놀라 3종</strong><span class="txt-price"><strong><em>8,960</em>원</strong><del>12,800</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[와이쏘시리얼] 그래놀라 3종');fnProductBasketAdd('01','S02112096203','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="2022/03/15 22:50:59" data-swiper-slide-index="16" style="width: 603px;">
                                <a href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[하겐다즈] 그린티 파인트 (473ml)');fnProductDetailMove('S02103035482','','100411','','','dwMainTS')"><span
                                        class="thumb"><img
                                        src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/9/2/3415581126297_01.jpg?RS=720x864"
                                        alt=""
                                        onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                        class="badge"><strong>23%</strong></span></span><strong class="txt-ti ellipsis">[하겐다즈]
                                    그린티 파인트 (473ml)</strong><span class="txt-price"><strong><em>9,900</em>원</strong><del>12,900</del></span>
                                </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[하겐다즈] 그린티 파인트 (473ml)');fnProductBasketAdd('01','S02103035482','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide" data-time-start="2022/03/15 15:09:37" data-time-end="null"
                                 data-swiper-slide-index="17" style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[그릭데이] 리얼카카오 그래놀라 2종');fnProductDetailMove('S02110093352','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/2/5/3/S02110093352_00.jpg?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>15%</strong></span></span><strong class="txt-ti ellipsis">[그릭데이]
                                리얼카카오 그래놀라 2종</strong><span class="txt-price"><strong><em>1,700</em>원</strong><del>2,000</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[그릭데이] 리얼카카오 그래놀라 2종');fnProductBasketAdd('01','S02110093352','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide swiper-slide-duplicate-prev" data-time-start="2022/03/15 15:09:37"
                                 data-time-end="null" data-swiper-slide-index="18" style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[베어벨스] 더블바이트 프로틴바 55g, 2종');fnProductDetailMove('S02106056411','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/1/1/4/S02106056411_00.JPG?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>20%</strong></span></span><strong class="txt-ti ellipsis">[베어벨스]
                                더블바이트 프로틴바 55g, 2종</strong><span class="txt-price"><strong><em>3,600</em>원</strong><del>4,500</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[베어벨스] 더블바이트 프로틴바 55g, 2종');fnProductBasketAdd('01','S02106056411','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                            <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
                                 data-time-start="2022/03/15 15:09:37" data-time-end="null" data-swiper-slide-index="0"
                                 style="width: 603px;"><a
                                    href="javascript:GA_Event('PC_새벽투홈_메인TEMPLATE_SALE','타임세일','[수블수블] 바바리아 논알콜 맥주 330ml, 4종');fnProductDetailMove('S02102033267','','100411','','','dwMainTS')"><span
                                    class="thumb"><img
                                    src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/6/2/S02102033267_00.jpg?RS=720x864"
                                    alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'"><span
                                    class="badge"><strong>38%</strong></span></span><strong class="txt-ti ellipsis">[수블수블]
                                바바리아 논알콜 맥주 330ml, 4종</strong><span class="txt-price"><strong><em>1,420</em>원</strong><del>2,300</del></span>
                            </a>
                                <button type="button" class="btn-cart"
                                        onclick="javascript:GA_Event('PC_새벽투홈_메인','타임세일','장바구니_[수블수블] 바바리아 논알콜 맥주 330ml, 4종');fnProductBasketAdd('01','S02102033267','','100411');return false;">
                                    장바구니 담기
                                </button>
                            </div>
                        </div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                </div>
            </section>
        </div>

        <%--        레시피 4개씩 보여주기--%>
        <%--        조회순--%>
        <section class="innercon aos-init aos-animate" data-aos="fade-up">
            <h2><span class="bl"
                      style="border-top:4px solid "><i
                    style="border-bottom:4px solid "></i></span><strong
                    style="font-weight:bold">조회수</strong><small
                    style="font-weight:normal">가장 많은 조회수를 기록하는 레시피들을 확인하세요!!</small><a
                    href="app?command=recipe_list&sortType=viewcount"
                    onclick="GA_Event('PC_새벽투홈_메인','신상품','전체보기');" class="btn all">전체보기</a></h2>
            <ul class="product-list">
                <c:forEach var="recipeVO" items="${view_high_recipeList}">
                    <li>
                        <a href="app?command=recipe_view&recipeId=${recipeVO.id}">
                        <span class="thumb">
                            <img src="./images/recipe/${recipeVO.image}" alt="이미지 없음">
                        </span>
                            <strong class="txt-ti ellipsis">
                                    ${recipeVO.title}
                            </strong>
                            <span id="user_by">
                           by. ${recipeVO.username}
                        </span>
                        </a>
                        <span class="info">
                       <span class="product_caption">
                          <span class="caption_star">
                             <img src="./images/common/star.png">
                          </span>
                          <span>${recipeVO.grade}</span>
                          <span>&nbsp;&nbsp;&nbsp;조회수 ${recipeVO.viewcount}</span>
                       </span>
                    </span>
                    </li>
                </c:forEach>
            </ul>
        </section>
        <%--        평점순--%>
        <section class="innercon aos-init aos-animate" data-aos="fade-up">
            <h2><span class="bl"
                      style="border-top:4px solid "><i
                    style="border-bottom:4px solid "></i></span><strong
                    style="font-weight:bold">평점순</strong><small
                    style="font-weight:normal">가장 높은 평점을 가진 레시피들을 확인하세요!!</small><a
                    href="app?command=recipe_list&sortType=grade"
                    onclick="GA_Event('PC_새벽투홈_메인','신상품','전체보기');" class="btn all">전체보기</a></h2>
            <ul class="product-list">
                <c:forEach var="recipeVO" items="${grade_high_recipeList}">
                    <li>
                        <a href="app?command=recipe_view&recipeId=${recipeVO.id}">
                        <span class="thumb">
                            <img src="./images/recipe/${recipeVO.image}" alt="이미지 없음">
                        </span>
                            <strong class="txt-ti ellipsis">
                                    ${recipeVO.title}
                            </strong>
                            <span id="user_by">
                           by. ${recipeVO.username}
                        </span>
                        </a>
                        <span class="info">
                       <span class="product_caption">
                          <span class="caption_star">
                             <img src="./images/common/star.png">
                          </span>
                          <span>${recipeVO.grade}</span>
                          <span>&nbsp;&nbsp;&nbsp;조회수 ${recipeVO.viewcount}</span>
                       </span>
                    </span>
                    </li>
                </c:forEach>
            </ul>
        </section>

        <section class="innercon bottominfo aos-init aos-animate" data-aos="fade-up">
            <div class="service">
                <h3>현대백화점 서비스</h3>

                <ul>
                    <li><a><img
                            src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/sub/homebanner9.jpg"
                            alt="회원혜택"></a></li>
                    <li><a><img
                            src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/sub/homebanner9_2.jpg"
                            alt="투홈패스"></a></li>
                    <li><a><img
                            src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/sub/homebanner9_3.jpg"
                            alt="투홈구독"></a></li>
                    <li><a><img
                            src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/sub/homebanner9_4.jpg"
                            alt="선물하기"></a></li>
                    <li><a><img
                            src="https://tohome.thehyundai.com/UIUX/w/pjtCom/images/sub/homebanner9_5.jpg"
                            alt="출석체크"></a></li>
                </ul>
            </div>

            <div class="customer">
                <h3>고객센터</h3>

                <div>
                    <strong>Made by</strong>
                    <small>김지혜, 김경섭, 송진호</small>
                    <a
                            class="btn big gray btn-qna">1:1 문의</a>
                </div>
            </div>

            <div class="notice">
                <h3>공지사항</h3>
                <a href="/front/dp/dpf/notice.do?tabIndex=2" onclick="GA_Event('PC_새벽투홈_메인', '공지사항', '공지사항 더보기');"
                   class="btn-more">공지사항 더보기</a>

                <ul>


                    <li><a href="/front/dp/dpf/notice.do?tabIndex=2&amp;ancmId=98"
                           onclick="GA_Event('PC_새벽투홈_메인', '공지사항', '새벽투홈 배송 안내 ');">레시피를 부탁해 안내</a></li>


                </ul>

            </div>
        </section>


    </div>
    <!-- footer// -->
    <footer id="footer">
        <div class="util">
            <div class="inner">
                <a href="/front/dp/dpf/companyIntro.do" class="btn-tohome"
                   onclick="GA_Event('PC_공통', '푸터_메뉴', '브랜드소개');">브랜드소개</a>
                <a href="/front/dp/dpf/serviceTos.do" onclick="GA_Event('PC_공통', '푸터_메뉴', '이용약관');">이용약관</a>
                <a href="/front/dp/dpf/personalInfoPolicy.do" onclick="GA_Event('PC_공통', '푸터_메뉴', '개인정보처리방침');"><strong>개인정보처리방침</strong></a>
                <a href="/front/dp/dpf/youthPolicy.do" onclick="GA_Event('PC_공통', '푸터_메뉴', '청소년보호정책');">청소년보호정책</a>
                <a href="/front/dp/dpf/imagingDevicePolicy.do" onclick="GA_Event('PC_공통', '푸터_메뉴', '영상기기운영방침');">영상기기운영방침</a>

                <div class="share">
                    <button type="button" class="btn-youtube"
                            onclick="GA_Event('PC_공통', '푸터_SNS', 'youtube'); location.href='https://www.youtube.com/channel/UCiAFKYYJOexSKyKmhEIXDEw?outUrlYn=Y'">
                        youtube
                    </button>
                    <button type="button" class="btn-facebook"
                            onclick="GA_Event('PC_공통', '푸터_SNS', 'facebook'); location.href='https://www.facebook.com/tohome.official?outUrlYn=Y'">
                        facebook
                    </button>
                    <button type="button" class="btn-instagram"
                            onclick="GA_Event('PC_공통', '푸터_SNS', 'instagram'); location.href='https://www.instagram.com/tohome.official?outUrlYn=Y'">
                        instagram
                    </button>
                </div>

                <div class="familysite">
                    <button type="button" class="btn-site" onclick="$('.familysite .link-list').fadeToggle()">Family
                        Site
                    </button>
                    <ul class="link-list">
                        <li><a href="https://www.thehyundai.com/Home.html" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '더현대닷컴');">더현대닷컴</a></li>
                        <li><a href="https://esuper.ehyundai.com/esuper/main.do?storeCd=210" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', 'e수퍼마켓');">e수퍼마켓</a></li>
                        <li><a href="https://www.greating.co.kr/" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '그리팅 (greating)');">그리팅 (greating)</a></li>
                        <li><a href="https://www.hmall.com/p/" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '현대Hmall');">현대Hmall</a></li>
                        <li><a href="https://www.thehandsome.com/ko/" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '더한섬');">더한섬</a></li>
                        <li><a href="https://www.eqlstore.com/main" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '한섬 EQL');">한섬 EQL</a></li>
                        <li><a href="https://www.hfashionmall.com/sfmweb" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', 'H패션몰');">H패션몰</a></li>
                        <li><a href="https://www.hddfs.com/shop/dm/main.do" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '현대백화점 DUTY FREE');">현대백화점 DUTY FREE</a></li>
                        <li><a href="https://mall.hyundailivart.co.kr/front/index_org.lv" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '현대리바트몰');">현대리바트몰</a></li>
                        <li><a href="https://www.hyundairentalcare.co.kr/" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', '현대렌탈케어');">현대렌탈케어</a></li>
                        <li><a href="https://www.h-point.co.kr/cu/main/index.nhd" target="_blank"
                               onclick="GA_Event('PC_공통', '패밀리사이트', 'H.point');">H.point</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="info">
            <div class="inner">
                <div class="logo">현대식품관</div>
                <div id="fnDawnBizpCrstList"><strong>(주)현대백화점</strong><br><span>대표이사 : 김형종 외 2인</span><span> 주소 : 서울 강남구 테헤란로98길 12 (대치동) 현대백화점</span><br>이메일
                    : tohome@thehyundai.com (제휴 문의, 02-6904-0761) <br>사업자 등록번호 : 211-87-21455<a href="#"
                                                                                                onclick="javascript:fnAppLoad('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2118721455');return false;">사업자등록확인</a><br>통신판매업자
                    신고번호 : 2010-서울강남-01882<br>
                    <p class="essential-info"><em>현대식품관 투홈의 개별 판매자가 등록한 상품(브랜드직송) 상품에 대한 광고, 상품주문, 배송, 환불의 의무와 책임은 각
                        판매자가 부담하고,<br>현대식품관 투홈은 통신판매 중개자로서의 의무와 책임을 다합니다.</em><br>고객님의 안전거래를 위해 현금결제 시 KG이니시스 구매안전 서비스를
                        이용하실 수 있습니다.
                        <button type="button" class="confirm-btn" onclick="fn.popupOpen('#guaranteePopup')" ;="">서비스
                            가입사실 확인
                        </button>
                    </p>
                    <small class="copyright">Copyright © Hyundai Department Store. All rights reserved.</small></div>
            </div>
        </div>

        <!-- topbtn// -->
        <button type="button" class="btn-top" onclick="GA_Event('PC_공통', 'TOP', 'TOP');" style="right: 232.5px;">TOP
        </button>
        <!-- //topbtn -->
    </footer>

</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/common.js"></script>
<script src="js/function.js"></script>
<script src="js/main.js"></script>
<script src="js/library.js"></script>
</html>