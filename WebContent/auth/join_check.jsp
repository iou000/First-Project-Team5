<%--
  작성자: 김지혜
  작성일자: 3/15/22
  내용: 회원가입 확인 jsp 구현
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style class="vjs-styles-defaults">
        .video-js {
            width: 300px;
            height: 150px;
        }

        .vjs-fluid {
            padding-top: 56.25%
        }
    </style>
    <!-- 공통 태그 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="format-detection" content="telephone=no, email=no, address=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!-- // 공통 태그 -->


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, viewport-fit=cover">
    <meta name="format-detection" content="telephone=no, email=no, address=no">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <title>회원가입 동의 페이지</title>

    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
    <link href="css/library.css" rel="stylesheet">


    <link rel="shortcut icon" type="image/x-icon" href="/UIUX/w/pjtCom/images/common/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/UIUX/w/pjtCom/css/v1/css-library.min.css?ver=10">
    <script src="https://connect.facebook.net/signals/config/751265748967170?v=2.9.55&amp;r=stable" async=""></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-KRGG3NR"></script>
    <script type="text/javascript" src="/UIUX/w/pjtCom/js/v1/jquery-library.min.js?ver=10"></script>
    <script type="text/javascript" src="/UIUX/w/pjtCom/js/v1/function.min.js?ver=10"></script>

    <link rel="stylesheet" type="text/css" href="/UIUX/w/pjtCom/css/v1/common.min.css?ver=10">
    <script type="text/javascript" src="/js/common.js?ver=1647306732232"></script>
    <script type="text/javascript" src="/js/pd/product.search.pc.js?ver=1647306732232"></script>

    <!-- GA360 -->


    <!--
    Description : GA360 ê³µíµ
    Date : 2022.01.12
     -->
    <script type="text/javascript" src="/js/co/GoogleAnalyticsBuilder.js"></script>

    <script type="text/javascript">

        /*
         * íì´ì§ë·°ë°ì´í° ì ì¡ì ë§ì¶¤ì¸¡ì ê¸°ì¤ë°ì´í° í¨ê» ì ì¡
         * ë§ì¶¤ì¸¡ì ê¸°ì¤ë°ì´í°ë ëª¨ë íì´ì§ ì ì©
        */

        /* ì´ ë¶ë¶ ì£¼ìí´ì  í ê°ë°/í¸ì¶íì¤í¸

        //ë°ì´í° ìí
        $(window).load(function(){
            var pvdmObj = getGaPageViewObj();

            //ë°ì´í° GAì ì¡
            if(pvdmObj != null){
                GADataScreen(pvdmObj);
            }
        });

        */

        function getGaPageViewObj() {

            var pvdmObj = null;

            if (GAcuVO != null) {

                pvdmObj = setGaPageViewObj(GAcuVO);

            } else {

                $.ajax({
                    type     : "post"
                    , url    : ""
                    , async  : false
                    , success: function (data) {

                        pvdmObj = setGaPageViewObj(data.cuDimensionObj);    //key : object(key:value)

                    }
                    , error  : function (data, xhr, status, error) {

                    }
                });

            }

            return pvdmObj;

        }

    </script>


    <!-- GTM 컨테이너 설치 start-->
    <!-- Google Tag Manager(삭제될 예정) -->
    <script>(function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start'                    :
                new Date().getTime(), event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src =
            'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-KRGG3NR');</script>
    <!-- End Google Tag Manager -->
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KRGG3NR"
                height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!-- GTM 컨테이너 설치 end-->

    <!-- GA 공통스크립트 심기 start-->
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-172917666-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-172917666-1');
    </script> -->
    <!-- GA 공통스크립트 심기 end-->

    <script type="text/javascript">
        $(document).ready(function () {
        });

        var cdnRequestYn = "null";
        var vServerPath = '/app';

        var contextPath = "/front";
        var addrSearchServer = "https://tohome.thehyundai.com/front/cob/selectRoadNameAddressList.do";
        var isMobile = "N"; // 모바일여부

        //토큰만료 콜백
        function dscdCallback(data) {
            //console.log("data.rtnMsg:"+data.rtnMsg);
            if (data.succYn == "Y") {
                console.log("토큰 만료처리");

            } else {
                console.log("토큰 미존재");

            }
        }

        // WEB 캐시에의해 모바일이 PC로 접속한경우 다시 모바일 페이지로 변경
        var userAgentObj = navigator.userAgent.toLowerCase();
        if (userAgentObj.indexOf("ipod") > -1
            || userAgentObj.indexOf("ipad") > -1
            || userAgentObj.indexOf("windows phone") > -1
            || userAgentObj.indexOf("android") > -1
            || userAgentObj.indexOf("mobi") > -1
            || userAgentObj.indexOf("mobile") > -1
            || userAgentObj.indexOf("symbos") > -1
            || userAgentObj.indexOf("symbianos") > -1
            || userAgentObj.indexOf("mini") > -1
            || userAgentObj.indexOf("bada") > -1
            || userAgentObj.indexOf("webos") > -1
            || userAgentObj.indexOf("blackberry") > -1
            || userAgentObj.indexOf("apache-httpclient") > -1
            || userAgentObj.indexOf("ahc") > -1
            || userAgentObj.indexOf("kakaotalk") > -1
            || userAgentObj.indexOf("samsung") > -1
        ) {
            // 모바일브라우저
            //if (pubGetCookie("site_refresh") != "Y") {
            isMobile = "Y";
            var currUrl = window.location.href;
            if (currUrl.indexOf('UseCache') < 1) {
                if (currUrl.indexOf('dpa') > -1 || currUrl.indexOf('dpb') > -1 || currUrl.indexOf('dpc') > -1 || currUrl.indexOf('dpm') > -1 || currUrl.indexOf('pdd') > -1 || currUrl.indexOf('dpd') > -1) {
                    if (currUrl.indexOf('?') > -1) {
                        currUrl += "&UseCache=N"
                    } else {
                        currUrl += "?UseCache=N"
                    }
                    pubSetCookie("site_refresh", "Y", 1);
                    window.location.href = currUrl;
                }
            }
            //} else {
            //    pubSetCookie( "site_refresh", "N" , 1);
            //}
        }

        var locationVal = location.host;
        if (locationVal.indexOf("pctohome") > -1) {
            window.location.href = "https://tohome.thehyundai.com/front/"
        }

        function setCookieSso(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; domain=tohome.thehyundai.com; expires=" + todayDate.toGMTString() + ";"
        }

        function getCookieSso(name) {
            name = new RegExp(name + '=([^;]*)');
            return name.test(document.cookie) ? unescape(RegExp.$1) : '';
        }


        //SSO 요청 처리
        function fnSsoReq() {
            gfnSsoReqHttp(fnSsoCallback);
        }

        //SSO 인증성공시에 콜백 함수를 호출함.
        function fnSsoCallback(data) {
            var mcustNo = data.mcustNo;

            //alert(data.succYn + ":" + mcustNo );

            if (data.succYn == "Y" && mcustNo != null && mcustNo != '') {
                $.ajax({
                    url     : "/front/cua/front/ssoLogin.do",
                    type    : "post",
                    dataType: "json",
                    data    : 'mcustNo=' + data.mcustNo,
                    async   : false,
                    success : function (res) {
                        if (res == false) {
                            trySsoOpen = getCookieSso('trySsoOpen');

                            if (trySsoOpen != 'Y' && contextPath != '/event') {
                                fn.popupOpen('#popHpointUser');
                            }
                        } else {
                            if (res == true) {
                                location.reload();
                            }
                        }
                    }
                });
            }
        }


    </script>

    <script src="/js/sso/SsoHttpRequest.js?ver=031510"></script>
    <script src="/js/sso/SsoAjax.js?ver=031510"></script>
    <script type="text/javascript" src="/js/kakao.min.js"></script>
    <script type="text/javascript" src="/js/pd/product.share.js?ver=10"></script>


    <!-- 아래부터 body 시작 -->
    <!-- 팝업 : H.Point 회원// -->
    <script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/613043577/?random=1647306733585&amp;cv=9&amp;fst=1647306733585&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1120&amp;u_w=1792&amp;u_ah=1120&amp;u_aw=1792&amp;u_cd=30&amp;u_his=8&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2wg370&amp;sendb=1&amp;ig=1&amp;frm=0&amp;url=https%3A%2F%2Ftohome.thehyundai.com%2Ffront%2Fcua%2Ffront%2FjoinStep4.do&amp;ref=https%3A%2F%2Ftohome.thehyundai.com%2Ffront%2Fcua%2Ffront%2FjoinStep3.do%3FpublicYn%3DY&amp;tiba=%ED%98%84%EB%8C%80%EC%8B%9D%ED%92%88%EA%B4%80%20%ED%88%AC%ED%99%88&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
    <meta http-equiv="origin-trial"
          content="A+sitaPn3hlQ8QipTsncwHz+k1NvfPtFsQqIOiD8GK3M9v9XCeQqlF7x1P9AVJdoYTiJPZXZc5XZYpwc10fH4wEAAACfeyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGVhZHNlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiQ29udmVyc2lvbk1lYXN1cmVtZW50IiwiZXhwaXJ5IjoxNjQzMTU1MTk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlLCJ1c2FnZSI6InN1YnNldCJ9">
    <script src="https://www.googleadservices.com/pagead/conversion/613043577/?random=1647306733588&amp;cv=9&amp;fst=1647306733588&amp;num=1&amp;value=0&amp;label=y4UOCLzMqNsBEPmaqaQC&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1120&amp;u_w=1792&amp;u_ah=1120&amp;u_aw=1792&amp;u_cd=30&amp;u_his=8&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2wg370&amp;sendb=1&amp;ig=1&amp;frm=0&amp;url=https%3A%2F%2Ftohome.thehyundai.com%2Ffront%2Fcua%2Ffront%2FjoinStep4.do&amp;ref=https%3A%2F%2Ftohome.thehyundai.com%2Ffront%2Fcua%2Ffront%2FjoinStep3.do%3FpublicYn%3DY&amp;tiba=%ED%98%84%EB%8C%80%EC%8B%9D%ED%92%88%EA%B4%80%20%ED%88%AC%ED%99%88&amp;auid=1853096348.1646354623&amp;hn=www.googleadservices.com&amp;bttype=purchase&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
</head>
<body>
<div id="wrap" class="member joinstep1">
    <!-- header// -->
    <!--begin:ca-exclude-->
    <header id="header" class="short">
        <noscript>이 사이트를 이용하기 위해서 자바스크립트를 활성화 시킬 필요가 있습니다.
            <a href="http://www.enable-javascript.com/ko/" target="_blank">브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
        </noscript>

        <div class="skip">
            <a href="#contents">본문으로 건너뛰기</a>
        </div>

        <div class="inner">
            <!-- toparea// -->
            <div class="toparea">
                <h1><a href="/front/dp/dpa/dawnHome.do"><img src="images/common/header_logo_freex34.png"
                                                             alt="현대식품관"></a></h1>

                <div class="util">


                    <!-- util : 로그인 전// -->
                    <a href="/front/cua/login.do">로그인</a>
                    <a href="/front/cua/front/joinStep1.do?publicYn=Y">회원가입</a>
                    <!-- //util : 로그인 전 -->


                    <a href="/front/mp/mpa/selectMyPageMain.do">마이페이지</a>
                    <a href="/front/dp/dpf/customerCenterMain.do">고객센터</a>
                </div>

            </div>
            <!-- //toparea -->
        </div>
    </header>
    <!--end:ca-exclude-->
    <!-- //header -->
    <!-- //header -->

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>현대식품관 회원가입</h2>

            <div class="linearea">
                <h3>현대식품관<br>필수 약관에 동의해 주세요.</h3>
                <form name="mainform" method="post" action="/front/cua/front/joinStep5.do">
                    <fieldset class="agree-field">
                        <legend class="tit">
                            <label>
                                <input type="checkbox" name="" id="allCheck" class="big"
                                       onclick="javascript:allAgree()">
                                <span><strong>전체 동의합니다.</strong></span>
                            </label>
                        </legend>
                        <strong class="txt-tit">현대식품관</strong>
                        <ul>
                            <li>
                                <label><input type="checkbox" name="" class="big" id="must1">
                                    <span><span class="need">[필수]</span> 이용약관 동의</span>
                                </label>
                                <button type="button" class="btn-line"
                                        onclick="javascript:fn.popupOpen('#popPolicyJoin1');">전문보기
                                </button>
                            </li>
                            <li>
                                <label><input type="checkbox" name="" class="big" id="must2">
                                    <span><span class="need">[필수]</span> 개인정보 수집·이용 동의</span>
                                </label>
                                <button type="button" class="btn-line"
                                        onclick="javascript:fn.popupOpen('#popPolicyJoin2');">전문보기
                                </button>
                            </li>

                            <li>
                                <label><input type="checkbox" name="GET_CARD_INFO" class="big" value="Y" id="option1">
                                    <span><span class="choice">[선택]</span> 개인정보 자동 입력 서비스 동의</span>
                                </label>
                                <button type="button" class="btn-line"
                                        onclick="javascript:fn.popupOpen('#popPolicyJoin4');">전문보기
                                </button>
                            </li>

                        </ul>

                        <div class="check">
                            <strong><span class="need">[필수]</span> 개인정보 유효기간 동의</strong>
                            <!-- <button type="button" class="btn-line" onclick="javascript:fn.popupOpen('#popPolicyJoin6');">전문보기</button> -->
                            <div class="marketing-info">
                                <div class="box">
                                    <label><input type="radio" class="big" name="CUST_VLID_TERM_GBCD" value="01"><span>탈퇴 시까지</span></label>
                                    <label><input type="radio" class="big" name="CUST_VLID_TERM_GBCD" value="02"><span>1년</span></label>
                                </div>
                            </div>
                        </div>

                        <div class="check makagryn">
                            <strong><span class="choice">[선택]</span> 마케팅을 위한 개인정보 수집·이용 동의</strong>
                            <button type="button" class="btn-line"
                                    onclick="javascript:fn.popupOpen('#popPolicyJoin12');">전문보기
                            </button>
                            <div class="box">
                                <!-- 20200421// -->
                                <label>
                                    <input type="checkbox" id="ALL_RCV_AGR_YN" value="Y" class="big">
                                    <span>전체</span>
                                </label>
                                <label>
                                    <input type="checkbox" name="PUSH_RCV_AGR_YN" id="PUSH_RCV_AGR_YN" value="Y"
                                           class="big" onclick="javascript:pushSwap();">
                                    <span>PUSH</span>
                                </label>
                                <label>
                                    <input type="checkbox" name="SMS_RCV_AGR_YN" id="SMS_RCV_AGR_YN" value="Y"
                                           class="big">
                                    <span>SMS</span>
                                </label>
                                <label>
                                    <input type="checkbox" name="EMAIL_RCV_AGR_YN" id="EMAIL_RCV_AGR_YN" value="Y"
                                           class="big">
                                    <span>이메일</span>
                                </label>
                                <p class="pushdate">Push 동의일자 : 2022.03.15</p>
                            </div>
                            <div class="infotxt">
                                <ul>
                                    <li>현대식품관 이벤트, 혜택, 홍보, 정보성 콘텐츠를 포함한 소식을 알려드립니다.</li>
                                </ul>
                            </div>
                        </div>

                        <div class="btns">
                            <button type="button" class="btn big black"
                                    onclick="javascript:location.href='/front/cua/front/joinStep1.do?publicYn=Y'">취소
                            </button>
                            <button type="button" class="btn fill big black" onclick="javascript:goNextStep()">다음
                            </button>
                        </div>
                        <p class="txt-exclaim">마케팅 활용 수집 동의는 필수가 아니며, 동의하지 않아도 가입/구매 하실 수 있습니다.</p>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <!-- //contents -->
    <!-- 팝업 :  동의// -->


    <!-- 20200609// -->
    <!-- 팝업 : 현대식품관 - 이용약관// -->
    <div id="popPolicyJoin1" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>이용약관</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    <strong>제1조 목적</strong>
                    <div class="none">이 약관은 주식회사 현대백화점 및 한무쇼핑 주식회사(이하 “회사”라 합니다)가 운영하는 현대식품관투홈(모바일 웹 및 APP 등 포함, 이하
                        “온라인몰”)에서 제공하는 모바일/인터넷 관련 서비스 및 기타 온라인몰을 통해 매장에서 제공하는 서비스(이하 통칭하여 “서비스”라 합니다)를 이용함에 있어, “회사”와
                        “이용자”의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
                    </div>
                    <br>
                    <strong>제2조 정의</strong>
                    <div>1. “온라인몰”이란 “회사”가 재화 또는 용역(이하 “재화 등”이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록
                        설정한 가상의 영업장을 말하며, 아울러 ”온라인몰”을 운영하는 사업자의 의미로도 사용합니다.
                    </div>
                    <div>2. “이용자”란 “온라인몰”에 접속하여 이 약관에 따라 “온라인몰”이 제공하는 서비스를 이용하는 자를 통칭합니다.</div>
                    <div>3. ”회원”이라 함은 “온라인몰”에 회원등록을 한 자로서, 계속적으로 “온라인몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</div>
                    <div>4. ”비회원”이라 함은 회원에 가입하지 않고 “온라인몰”이 제공하는 서비스를 이용하는 자를 말합니다.</div>
                    <div>5. “판매자”라 함은 “회사”가 제공하는 판매자용 “서비스”를 이용을 체결한 자를 말하며, “서비스”를 이용하여 실제로 고객에게 재화 등을 판매하는 자를 말합니다.
                    </div>
                    <div>6. “매장”이란 “회사” 또는 “판매자”가 상품을 고객에게 제공하기 위해 운영하는 물리적 공간 또는 관련된 오프라인 영업장을 말합니다.</div>
                    <div>7. “휴면회원”이라 함은 “온라인몰” 최종 접속일로부터 1년(365일) 이상 로그인을 하지 않아 회원자격이 상실된 자를 말합니다.</div>
                    <div>8. ”해외배송서비스”라 함은 “이용자”가 구매계약에 부수하여 “재화 등”의 해외배송을 별도로 요청한 경우 “온라인몰”이 업무제휴관계에 있는 해외배송망을 통하여 해외배송을
                        조력하는 서비스를 말합니다.
                    </div>
                    <div>9. “H.Bonus”라 함은 “회사”의 회원전용 서비스로서, “회사”가 회원의 서비스 이용 또는 구매실적 등 “회사”가 정한 기준에 따라 지급한 포인트를 말합니다.
                    </div>
                    <div>10. “언커먼스토어서비스”라 함은 “회사”가 운영중인 무인매장 서비스(공식명칭 : 언커먼스토어_파크원 무인매장 서비스)로서, “이용자”께서 재화 또는 용역을 선택하신 후
                        매장을 퇴장하시면 “회사”의 간편결제 시스템 H.Point Pay(이하 “H.Point Pay”)을 통해 자동으로 결제되는 서비스를 말합니다.
                    </div>
                    <br>
                    <strong>제3조 약관등의 명시와 개정</strong>
                    <div>1. “회사”가 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 “이용자”가 쉽게 알 수 있도록
                        “온라인몰” 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자”가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
                    </div>
                    <div>2. “회사”는 “이용자”가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 “이용자”가 이해할 수 있도록
                        별도의 연결화면 또는 팝업화면 등을 제공하여 “이용자”의 확인을 구하여야 합니다.
                    </div>
                    <div>3. “회사”는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자거래기본법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에
                        관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」, 「국세법」 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                    </div>
                    <div>4. “회사”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 “회사”의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
                        다만, “이용자”에게 불리하게 약관내용을 변경하는 경우에는 최소 30일이상 사전 유예기간을 두고 공지합니다. 이 경우 “회사”는 개정전과 개정후의 내용을 명확하게 비교하여
                        “이용자”가 알기 쉽도록 표기합니다.
                    </div>
                    <div>5. “회사”가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로
                        적용됩니다. 다만 이미 계약을 체결한 “이용자”가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 “회사”에 송신하여 “회사”의 동의를
                        받는 경우에는 개정약관 조항이 적용됩니다.
                    </div>
                    <div>6. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「전자상거래 등에서의 소비자 보호에 관한 법률」, 「약관의 규제에 관한 법률」, 공정거래위원회가 정하는
                        「전자상거래 등에서의 소비자 보호 지침」 및 관계 법령 또는 상관례에 따릅니다.
                    </div>
                    <br>
                    <strong>제4조 서비스의 제공 및 변경</strong>
                    <div>
                        1. ”회사”는 다음과 같은 업무를 수행합니다.
                        <ol>
                            <li>1) 재화 또는 용역에 대한 정보 제공</li>
                            <li>2) 구매계약의 체결과 재화 또는 용역의 배송</li>
                            <li>3) 기타 “회사”가 정하는 업무</li>
                        </ol>
                    </div>
                    <div>2. ”회사”는 “재화 등”의 품질 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화, 용역의 내용을 변경할 수 있습니다. 이 경우 변경된
                        재화, 용역의 내용 및 제공일자를 명시하여 현재의 재화, 용역의 내용을 게시한 곳에 즉시 공지합니다.
                    </div>
                    <div>3. ”회사”가 제공하기로 “이용자”와 계약을 체결한 서비스의 내용을 “재화 등”의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 “이용자”에게
                        통지 가능한 주소로 즉시 통지합니다.
                    </div>
                    <div>4. 전항의 경우 “회사”는 이로 인하여 “이용자”가 입은 손해를 배상합니다. 단, “회사”의 고의 또는 과실이 없음을 입증하는 경우에는 그러지 아니합니다.</div>
                    <br>
                    <strong>제5조 서비스의 중단</strong>
                    <div>1. “회사”는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</div>
                    <div>2. “회사”는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 “이용자” 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “회사”가 고의 또는 과실이
                        없음을 입증하는 경우에는 그러하지 아니합니다.
                    </div>
                    <div>3. 사업 종목의 전환, 사업의 포기, 업체간의 통합 등을 이유로 서비스를 제공할 수 없게 되는 경우, “회사”는 제8조에서 정한 방법으로 “이용자”에게 통지하고,
                        ”이용자”가 입은 피해에 대하여 “회사”의 지침 및 관련법령에 따라 보상할 수 있습니다.
                    </div>
                    <br>
                    <strong>제6조 회원가입</strong>
                    <div>
                        1. 이용자는 다음 각 중 하나의 회원유형을 선택하여 지정된 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
                        <ol>
                            <li>1) H.Point통합회원: 현대백화점 그룹이 운영하는 H.Point 멤버십과 “온라인몰”에 동시에 가입한 고객으로서 H.Point 멤버십, “온라인몰”서비스
                                이용이 가능한 회원
                            </li>
                            <li>2) 현대식품관 투홈 회원: “현대식품관 투홈”의 회원으로서, “온라인몰”및 “현대식품관” 서비스 이용이 가능한 회원</li>
                        </ol>
                    </div>
                    <div>2. "현대식품관 투홈”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 이하 각호에 해당하지 않는 한 회원으로 등록합니다.
                        <ol>
                            <li>1) 가입신청자가 본 약관 제 7 조 제3항에 의거하여 이전에 회원 자격을 상실한 적이 있는 경우 (다만 회원자격 상실 후 1년이 경과한 자로서 "현대식품관
                                투홈"의 승낙이 있는 경우 재등록 할 수 있습니다)
                            </li>
                            <li>2) 등록을 위하여 이용자가 입력 내지 제공한 내용에 허위, 기재누락, 오기가 있는 경우</li>
                            <li>3) 기타 회원으로 등록하는 것이 "현대식품관 투홈”의 기술상 또는 업무 수행상 현저히 지장이 있다고 판단하는 경우</li>
                            <li>4) 만 14세 미만인 자</li>
                        </ol>
                    </div>
                    <div>3. 회원 가입계약의 성립시기는 "회사”의 승낙이 회원에게 도달한 시점으로 합니다.</div>
                    <div>4. 회원은 등록사항에 변경이 있는 경우 즉시 전자우편, 홈페이지 내 회원정보수정 메뉴 입력 및 기타 방법으로 "회사”에 대하여 그 변경사항을 알려야 합니다.</div>
                    <div>5. 신규회원 가입시 웰컴케어 프로그램 가입을 진행한 고객님께는 혜택을 가입월 기준 3개월까지 제공되며, 3개월 이후에는 프로그램이 자동 종료됩니다. (일반회원의 경우
                        웰컴케어 프로그램 혜택을 받으실 수 없습니다.)
                    </div>
                    <div>6. 회원 가입신청 양식에 기재되는 모든 이용자 정보는 진실한 사실로서 실제 데이터인 것으로 간주됩니다. 만일, 실명이나 실제 정보를 입력하지 않은 경우 이용자는 법적인
                        보호를 받을 수 없으며, 서비스 사용에 제한을 받을 수 있습니다.
                    </div>
                    <div>7. 신규회원 가입 혜택은 ID당 1회만 제공되며, 회원가입 혜택(쿠폰, H.Bonus, H.Point등)은 회원가입 페이지, 이벤트를 통해 사전 안내됩니다. (탈퇴 후
                        재 가입시 혜택은 부여되지 않습니다.)
                    </div>
                    <br>
                    <strong>제7조 회원탈퇴 및 자격상실</strong>
                    <div>1. “회원”은 “회사”에 언제든지 탈퇴를 요청할 수 있으며, “회사”는 즉시 회원탈퇴를 처리합니다.</div>
                    <div>
                        2. “회원”이 다음 각 호의 사유에 해당하는 경우, “회사”는 회원 자격을 제한 및 정지시킬 수 있습니다.
                        <ol>
                            <li>1) 가입 신청시에 허위 내용을 등록한 경우</li>
                            <li>2) “온라인몰”을 이용하여 구입한 “재화 등”의 대금, 기타 “온라인몰”이용에 관련하여 “회원”이 부담하는 채무를 기일에 지급하지 않는 경우</li>
                            <li>3) 다른 사람의 “온라인몰” 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우</li>
                            <li>4) “온라인몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
                        </ol>
                    </div>
                    <div>3. “회사”가 회원 자격을 제한, 정지 시킨 후에도 전항의 행위가 2회 이상 반복되거나 30일이내 그 사유가 시정되지 아니하는 경우 “회사”는 회원자격을 상실 시킬 수
                        있습니다.
                    </div>
                    <div>4. “회사”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 “회원”에게 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를
                        부여합니다.
                    </div>
                    <div>5. 본조 제4항에 따라 회원등록이 말소된 회원은 재가입이 제한됩니다.</div>
                    <br>
                    <strong>제7조의2 휴면회원 처리</strong>
                    <div>1. “회사”는 “온라인몰” 최종 접속일로부터1년(365일) 이상 로그인을 하지 않은 경우 “회원”을 “휴면회원”으로 지정하고 회원자격을 상실시키며, 이 경우
                        “휴면회원”의 개인정보 등에 대하여 법률상 보관의무가 있는 항목을 제외하고 별도 저장•관리하는 조치를 취합니다. (단, 평생회원을 선택한 경우에는 고객님의 계정은
                        휴면회원으로 처리되지 않습니다.)
                    </div>
                    <div>2. “회사”는 회원자격 상실에 관하여 “회원”에게 SMS, 전자우편 등의 방법으로 휴면계정 처리 예정일로부터 30일전에 통지하고, 통지문에서 정한 방법으로 기한 내에
                        “회원”이 답변하지 않는 경우 회원자격을 상실 시킬 수 있습니다
                    </div>
                    <div>3. “휴면회원”은 “회사”에 휴면상태 해지를 신청할 수 있으며, 간단한 계정복원 절차를 거친 후 “회사”의 회원자격으로 “회사”가 제공하는 “서비스”를 정상적으로
                        이용하실 수 있습니다.
                    </div>
                    <div>4. “회원”이 보유한 “H.Bonus”, 쿠폰, 기타 이에 준하는 자산 등(이하 “자산 등”이라 합니다)은 “회원”의 자격상실 기간과는 별개로 “회사”가 “회원”에게
                        사전 고지한 해당 “자산 등”의 유효기간까지만 유효합니다.
                    </div>
                    <br>
                    <strong>제8조 제공서비스 및 통합회원의 탈퇴</strong>
                    <div>
                        1. H.Point통합회원 및 면세점 간편회원에게 제공하는 서비스는 다음과 같습니다.
                        <ol>
                            <li>1) 할인 혜택: “온라인몰” 및 “현대식품관”, 그리고 그 제휴사가 제공하는 할인 및 무료 사은품 제공 등의 혜택을 받을 수 있습니다.</li>
                            <li>2) 우대 혜택: 회원은 “온라인몰” 및 “현대식품관”의 상품구매시 구매금액을 누적할 수 있으며, “온라인몰”이 정한 멤버십 회원 정책에 의거, 누적된
                                구매금액에 따라 차등화된 멤버십 등급을 부여 받고 우대 혜택이나 서비스를 적용받을 수 있습니다.
                            </li>
                            <li>3) 기타 서비스: “온라인몰”은 회원의 이익을 위하여 추가적인 서비스 및 혜택을 개발하여 회원에게 제공할 수 있습니다.</li>
                        </ol>
                    </div>
                    <div>2. 비회원은 “온라인몰”멤버십 혜택을 받을 수 없고, 일부서비스가 제한될 수 있습니다.</div>
                    <div>3. H.Point통합회원을 탈퇴하거나 자격 상실이 될 경우 그 효력은 “온라인몰”에도 동일하게 적용되며, 그 상세한 절차는 본 약관 제 7 조(회원 탈퇴 및 자격의
                        상실)에 따릅니다. 단, 온라인몰 회원 가입 후 H.Point통합회원으로 전환한 고객이 H.Point 서비스를 탈퇴하거나 자격 상실이 될 경우 온라인몰 회원 자격은 그대로
                        유지됩니다.
                    </div>
                    <br>
                    <strong>제9조 회원에 대한 통지</strong>
                    <div>1. “회사”가 “회원”에 대한 통지를 하는 경우, “회원”이 “회사”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</div>
                    <div>2. “회사”는 불특정다수 “회원”에 대한 통지의 경우 1주일 이상 ”온라인몰” 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, “회원” 본인의 거래와
                        관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지합니다.
                    </div>
                    <br>
                    <strong>제10조 구매 신청</strong>
                    <div>
                        1.“온라인몰”의 “이용자”는 “회사” 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “회사”는 “이용자”가 구매를 신청함에 있어서 다음의 각 내용을 알기
                        쉽게 제공하여야 합니다. 단, “회원”인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
                        <ol>
                            <li>1) “재화 등”의 검색 및 선택</li>
                            <li>2) 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호)등의 입력</li>
                            <li>3) 약관내용, 청약철회권이 제한되는 서비스, 배송료, 설치비 등의 비용부담과 관련된 내용에 대한 확인</li>
                            <li>4) 이 약관에 동의하여 위3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li>
                            <li>5) “재화 등”의 구매신청 및 이에 관한 확인 또는 “회사”의 확인에 대한 동의</li>
                            <li>6) 결제방법의 선택</li>
                        </ol>
                    </div>
                    <div>2. “회사”가 제3자에게 “이용자” 개인정보를 제공, 위탁할 필요가 있는 경우 실제 구매신청 시 “이용자”의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를
                        받지 않습니다. 이 때 “회사”는 제공되는 개인정보 항목, 제공받는 자, 제공 받는 자의 개인정보 이용 목적 및 보유, 이용기간 등을 “이용자”에게 명시하여야 합니다. 다만
                        「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보처리위탁의 경우 등 관련법령에 달리 정함이 있는 경우에는 그에 따릅니다.
                    </div>
                    <br>
                    <strong>제11조 계약의 성립</strong>
                    <div>
                        1. ”회사”는 제10조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지
                        못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
                        <ol>
                            <li>1) 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
                            <li>2) 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
                            <li>3) 기타 구매신청에 승낙하는 것이 “회사” 기술상 현저히 지상이 있다고 판단하는 경우</li>
                        </ol>
                    </div>
                    <div>2. “회사”의 승낙이 제13조 제1항의 수신확인통지 형태로 “이용자”에게 도달한 시점에 계약이 성립한 것으로 봅니다.</div>
                    <div>3. “회사”의 승낙의 의사표시에는 “이용자”의 구매신청에 대한 확인 및 판매가능여부, 구매신청의 정정, 취소 등에 관한 정보 등을 포함하여야 합니다.</div>
                    <br>
                    <strong>제12조 대금결제</strong>
                    <div>
                        1. “회사”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단 “회사”는 “이용자”의 지급방법에 대하여,“재화
                        등”의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
                        <ol>
                            <li>1) 폰뱅킹, 인터넷뱅킹, 메일뱅킹 등의 각종 계좌이체</li>
                            <li>2) 선불카드, 직불카드, 신용카드 등의 각종 카드결제</li>
                            <li>3) 온라인 무통장입금</li>
                            <li>4) 전자화폐에 의한 결제</li>
                            <li>5) 수령시 대금 지급</li>
                            <li>6) “H.Bonus”, “H.Point” 등 “회사”가 지급한 포인트에 의한 결제</li>
                            <li>7) “회사”와 계약을 맺었거나 “회사”가 인정한 상품권에 의한 결제</li>
                            <li>8) 기타 전자적 지급방법에 의한 대급 지급 등</li>
                        </ol>
                    </div>
                    <br>
                    <strong>제13조 수신확인통지, 구매신청 변경 및 취소</strong>
                    <div>1. “회사”는 “이용자”의 구매신청이 있는 경우 “이용자”에게 수신확인 통지를 합니다.</div>
                    <div>2. 신확인통지를 받은 “이용자”는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, “회사”는 배송 전에
                        “이용자”의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제16조의 청약철회 등에 관한 규정에 따릅니다.
                    </div>
                    <br>
                    <strong>제14조 H.Bonus 적립 및 이용</strong>
                    <div>
                        1. “회사”는 다음 각 호의 사유가 발생한 경우 “회원”에게 사전 고지된 기준에 의거하여“회원”에게 “H.Bonus”를 지급합니다.
                        <ol>
                            <li>1) “회원”이 “H.Bonus” 지급 대상으로 지정된 “재화 등”을 구매한 경우</li>
                            <li>2) “회원”이 “회사”가 진행하는 각종이벤트에 당첨된 경우</li>
                            <li>3) “회사”가 “H.Bonus” 지급 대상을 특정하고 “회원”이 이에 참여한 경우</li>
                            <li>4) 기타 “회사”의 정책으로 정한 경우</li>
                        </ol>
                    </div>
                    <div>2. 전항 제1호의 경우, “회사”는 “재화 등”의 상품군, 할인율 등 기타 특성 별로 상이한 적립률을 정할 수 있으며, “회사”와 “회원”간 구매계약이 완료된 경우에
                        지급됩니다. 단, “회원”이“재화 등”을 구매함에 있어 “H.Bonus” 적립을 원하지 않는 경우, “회사”는 “회원”이 즉시할인 서비스 제공 대상으로 지정된 “재화 등”을
                        구매하는 경우에 한하여 즉시할인 서비스를 제공할 수 있습니다.
                    </div>
                    <div>3. “회원”이 “H.Bonus”를 지급받은 이후, 구매계약 취소, 이벤트 당첨취소, 이벤트 참여취소 등의 사유로 이미 지급된 “H.Bonus”의 지급사유가 소멸되는
                        경우, “회사”는 해당 “H.Bonus”를 즉시 회수합니다. 단, “회원”이 지급된 “H.Bonus”를 이미 사용하여 회수 처리시에 부족분이 발생한 경우, “회원”은 해당
                        부족분에 상응하는 금원(1포인트 당 1원)을 제12조 제1항의 방법으로 지급해야 합니다.
                    </div>
                    <div>
                        4. “회원”은 다음 각 호와 같이 ”회사”가 지급한 “H.Bonus”를 사용할 수 있습니다.
                        <ol>
                            <li>1) “H.Bonus”는 1,000포인트 이상 적립된 시점부터 결제수단의 전부 또는 일부로 사용하실 수 있습니다.</li>
                            <li>2) 특별이벤트, 특별세일상품 등 “회사”가 공급하는 “재화 등”에 특별한 사정이 있는 경우, “회사”는 “회원”의 “H.Bonus” 사용을 제한할 수
                                있습니다.
                            </li>
                            <li>3) “회원”이 “H.Bonus”를 사용할 경우 “H.Bonus”는 유효기간이 임박한 순서대로 사용됩니다.</li>
                            <li>4) “회원”은 해당 “H.Bonus”의 유효기간 내에 “H.Bonus” 전부를 사용하여야 하며, 유효기간이 경과한 해당 “H.Bonus”는 자동 소멸됩니다.
                                단, “회사”가 “H.Bonus”를 지급할 때 별도의 유효기간을 사전고지 또는 약정한 경우에는 해당 유효기간을 따릅니다.
                            </li>
                            <li>5) “H.Bonus에 대한 최대 사용율은 부여된 H.Bonus 별로 상이하며, 사용처가 제한될 수 있습니다.</li>
                        </ol>
                    </div>
                    <div>5. “회원”이 “H.Bonus”를 사용하여 구매한 “재화 등”의 환급을 요청한 경우, 구매계약시의 “H.Bonus”사용 분은 해당 “H.Bonus”의 유효기간(※ 최초
                        적립일 기준)이 경과되지 않는 한 “회원”에게 환원되며, 현금, 카드 등 기타 시재 또는 결제수단으로 환급되지 않습니다.
                    </div>
                    <br>
                    <strong>제15조 재화 등의 공급</strong>
                    <div>1. ”회사”는 “이용자”와 “재화 등”의 공급시기에 관하여 별도의 약정이 없는 이상 “이용자”가 청약을 한 날로부터 7일이내에 “재화 등”을 배송할 수 있도록 주문제작,
                        포장 등 기타의 필요한 조치를 취합니다. 다만, “회사”가 이미 “재화 등”의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2 영업일 이내에
                        조치를 취합니다. 이때 “회사”는 “이용자”가 “재화 등”의 공급절차 및 진행사항을 확인할 수 있도록 적절한 조치를 합니다.
                    </div>
                    <div>2. ”회사”는 “이용자”가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “회사”가 약정 배송기간을 초과한 경우에는 그로
                        인한 “이용자”의 손해를 배상하여야 합니다. 다만, “회사”가 고의, 과실이 없음을 입증한 경우에는 그러하지 아니합니다.
                    </div>
                    <div>3. ”회사”와 “이용자”간의 상품의 인도시기 또는 용역의 제공시기에 관하여 별도의 약정이 있는 경우에는 당해 약정이 이 약관에 우선합니다.</div>
                    <br>
                    <strong>제15조의2 환급</strong>
                    <div class="none">“회사”는 “이용자”가 구매 신청한 “재화 등”의 품절 등의 사유로 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 “이용자”에게
                        통지하고, 전에 “재화 등”의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
                    </div>
                    <br>
                    <strong>제16조 청약철회</strong>
                    <div>1. ”회사”와 상품 또는 용역 등의 구매에 관한 계약을 체결한 “이용자”는 상품 또는 용역이 “배송준비중”인 단계의 경우 언제든지 청약철회가 가능합니다. 또한
                        단순변심으로 인한 교환 및 반품의 경우, 상품을 수령한 날로부터 7일이내 청약을 철회할 수 있습니다
                    </div>
                    <div>
                        2. “이용자”는 “재화 등”을 배송받는 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
                        <ol>
                            <li>1) “이용자”의 귀책사유로 인한 상품 하자(다만, “재화 등”의 내용 확인을 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)</li>
                            <li>2) “이용자”의 사용 또는 일부 소비에 의하여 “재화 등”의 가치가 현저히 감소한 경우(착용상품, 화장품 등)</li>
                            <li>3) 시간의 경과에 의하여 재판매가 곤란할 정도로 “재화 등”의 가치가 현저히 감소한 경우(야채, 과일, 수산식품, 축산품, 냉동식품 등)</li>
                            <li>4) 같은 성능을 지닌 “재화 등”으로 복제가 가능한 경우 그 원본인 “재화 등”의 포장을 훼손한 경우(음반, DVD, 도서 등)</li>
                            <li>5) 주문제작 상품 등 청약철회시 “회사”에게 회복할 수 없는 중대한 피해가 예상되는 경우(귀금속, 각인상품(셔츠, 지갑, 펜 등), 가구, 테일러메이드 상품
                                등)
                            </li>
                        </ol>
                    </div>
                    <div>3. 제2항 제2호 내지 제4호의 경우 “회사”가 사전에 청약철회 등이 제한되는 사실을 “이용자”가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지
                        않았다면 “이용자”의 청약철회 등이 제한되지 않습니다.
                    </div>
                    <div>4. “이용자”는 제1항 및 제2항의 규정에도 불구하고 수령한 상품 또는 용역의 내용이 표시, 광고 내용과 다르거나, 계약내용과 다르게 이행된 경우에는 공급받은 날로부터
                        3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내 청약철회 등을 할 수 있습니다.
                    </div>
                    <br>
                    <strong>제16조의2 언커먼스토어서비스 이용시의 청약철회</strong>
                    <div>1. 이 약관 제16조 제1항 및 제4항의 규정에도 불구하고, “이용자”가 “언커먼스토어서비스”를 이용한 경우의 청약철회 기준은 다음 각 호를 따릅니다.</div>
                    <ol>
                        <li>1) 청약철회 기준
                            <table class="tbl-guide">
                                <caption>청약철회 기준표</caption>
                                <colgroup>
                                    <col style="width:25%;">
                                    <col style="width:25%;">
                                    <col style="width:25%;">
                                    <col style="width:25%;">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">구분</th>
                                    <th scope="col">유형</th>
                                    <th scope="col">내용</th>
                                    <th scope="col">기간</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>이용자 귀책</td>
                                    <td>단순변심</td>
                                    <td>
                                        "재화 등"에 이상이<br>
                                        없이 "이용자"의 단순 변심
                                    </td>
                                    <td>언커먼스토어서비스 이용일로부터 7일</td>
                                </tr>
                                <tr>
                                    <td rowspan="3">회사 귀책</td>
                                    <td>상품손상</td>
                                    <td>
                                        "재화 등"이 불량이거나 파손된 경우
                                    </td>
                                    <td>언커먼스토어서비스 이용일로부터 90일</td>
                                </tr>
                                <tr>
                                    <td>상품정보상이</td>
                                    <td>
                                        "재화 등"이 "회사"가 고지한<br>
                                        상세정보와 다른 경우
                                    </td>
                                    <td>언커먼스토어서비스 이용일로부터 90일</td>
                                </tr>
                                <tr>
                                    <td>기타 결제 오류</td>
                                    <td>
                                        "이용자"가 구매한 "재화 등"<br>
                                        판매금액 등이 "이용자"의 실제<br>
                                        결제 내역과 상이한 경우
                                    </td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </li>
                        <li>2) 청약철회 또는 교환 방법</li>
                        <li>① “이용자”가 청약철회 또는 교환하고자 할 경우, “언커먼스토어서비스”를 이용한 매장에 직접 방문하여야 합니다. 단, “회사”의 귀책사유로 인한 결제 오류 건의
                            경우에는 예외로 할 수 있습니다.
                        </li>
                        <li>② “언커먼스토어서비스” 매장에서 구매한 “재화 등”의 교환은 동일한 “재화 등”으로만 교환할 수 있습니다. 3) “H.Point Pay”에 등록한 “이용자”의
                            신용카드 상의 문제(유효기간 만료, 승인오류 등)로 인해 결제 승인이 거절 또는 취소된 경우에는 우선적으로 ”회사”에 대금 지급을 완료하신 후 청약철회 또는 교환이
                            가능합니다.
                        </li>
                        <br>
                        <li>3) 결제오류시 재결제 절차 안내</li>
                        <li>① 결제오류 발생 사실을 “회사”가 먼저 인지하게 될 경우, “이용자”에게 주문내역에 대해 안내한 후 사후결제를 진행합니다.</li>
                        <li>② “이용자”가 결제오류 발생 사실을 알게 된 경우 “언커먼스토어서비스”를 이용한 매장으로 통지하여야 하고, “회사”는 “이용자”의 실제 이용내역을 사전 동의받은
                            범위 내에서 영상정보로 확인한 후 재결제할 수 있습니다.
                        </li>
                        <li>③ 결제 취소 및 재결제는 “H.Point Pay” 에 등록한 “이용자”님의 신용카드를 통해 이루어지며, 재결제시에는 “이용자”가 주문한 내역에 “이용자”가
                            사용가능한 언커먼스토어 쿠폰 및 H.point(제12조 제2항에 따른 상시 사용 설정시) 등을 적용하여 산정된 금액으로 결제가 진행됩니다.
                        </li>
                        <br>
                        <li>4) “언커먼스토어서비스” 사용 제한</li>
                        <li>① “회원”이 다음 각 호의 사유에 해당하는 경우, “이용자”는 언커먼스토어서비스” 이용에 제한을 받을 수 있습니다.</li>
                        <li>가. “H.Point Pay”에 등록한 “이용자”의 신용카드 상의 문제(유효기간 만료, 승인오류 등)로 인해 구매한 “재화 등”의 대금 지급이 완료되지 않아
                            “회사”가 “이용자”에게 대금 지급을 요청하였음에도 불구하고, 대금 지급을 2회 이상 거절하거나 “회사”의 대금 지급 요청일로부터 30일 이내 대금 지급이 완료되지
                            않는 경우
                        </li>
                        <li>나. “H.Point Pay”에 등록한 “이용자”의 신용카드 상의 문제(유효기간 만료, 승인오류 등)로 인해 “언커먼스토어서비스”를 이용하여 재화 등을 수령하였으나
                            대금 지급이 완료되지 않은 경우
                        </li>
                        <li>다. 기타 상품 훼손, 절취 등 부정한 목적으로 “언커먼스토어서비스”를 이용한 이력이 있거나 이용하려는 경우</li>
                    </ol>
                    <div>2. 이 약관에 명시되지 않은 “언커먼스토어서비스” 이용 방법은 “온라인몰”에 공지된 바를 따릅니다.</div>
                    <br>
                    <strong>제17조 청약철회 등의 효과</strong>
                    <div>1. “회사”는 “이용자”로부터 “재화 등”을 반환받는 경우 3영업일 이내에 이미 지급받은 “재화 등”의 대금을 환급합니다. 이 경우 “회사”가“이용자”에게 “재화 등”의
                        환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원화가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
                    </div>
                    <div>2. “회사”는 위 대금을 환급함에 있어서 “이용자”가 신용카드 또는 전자화폐 등의 결제수단으로 “재화 등”의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한
                        사업자로 하여금 “재화 등”의 대금의 청구를 정치 또는 취소하도록 요청합니다.
                    </div>
                    <div>3. 청약철회 등의 경우 공급받은 “재화 등”의 반환에 필요한 비용은 상품 또는 용역이 “배송준비중”인 단계의 경우 별도로 발생하지 않으며, 단순변심으로 인해 7일이내
                        청약을 철회하는 경우 “이용자” 부담의 별도 교환, 반품 배송비를 명시하지 않는 상품의 경우 청약철회로 인한 공급받은 “재화 등”의 반환에 필요한 비용은 “회사”가
                        부담합니다.
                    </div>
                    <div>4. “회사”는 “이용자”에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 “재화 등”의 내용이 표시, 광고 내용과 다르거나 계약내용과 다르게
                        이행되어 청약철회 등을 하는 경우 “재화 등”의 반환에 필요한 비용은 “회사”가 부담합니다.
                    </div>
                    <div>5. “이용자”가 “재화 등”을 제공받을 때 발송비를 부담한 경우에 “회사”는 청약철회시 그 비용을 누가 부담하는지 “이용자”가 알기 쉽도록 명확하게 표시합니다.
                    </div>
                    <br>
                    <strong>제18조 개인정보보호</strong>
                    <div>1. “회사”는 “이용자”의 개인정보 수집시 서비스제공을 위하여 필요한 최소한의 개인정보를 수집합니다.</div>
                    <div>2. “회사”는 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의
                        특정개인정보를 수집하는 경우에는 그러하지 아니합니다.
                    </div>
                    <div>3. “회사”는 “이용자”의 개인정보를 수집, 이용하는 때에는 당해 “이용자”에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련법령에 달리 정함에 있는 경우에는 예외로
                        합니다.
                    </div>
                    <div>4. “회사”는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용, 제공단계에서 당해
                        “이용자”에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련법령에 달리 정함이 있는 경우에는 예외로 합니다.
                    </div>
                    <div>5. “회사”가 제2항과 제3항에 의해 “이용자”의 동의를 받아야 하는 경우에는 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및
                        제공할 정보의 내용), 제3자가 제공받은 개인정보를 보유하는 기간 등「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조 제2항이 규정한 사항을 미리 명시하거나
                        고지해야 하며 “이용자”는 얼마든지 이 동의를 철회할 수 있습니다.
                    </div>
                    <div>6. “이용자”는 언제든지 “회사”가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “회사”는 이에 대해 지체 없이 필요한 조치를 취할 의무를
                        집니다. “이용자”가 오류의 정정을 요구한 경우에 “회사”는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                    </div>
                    <div>7. “회사”는 개인정보보호를 위하여 관리자를 한정하여 그 수를 최소화하며, 신용카드, 은행계좌 등을 포함한 “이용자”의 개인정보 분실, 도난, 유출, 변조 등으로 인한
                        “이용자”의 손해에 대해 모든 책임을 집니다.
                    </div>
                    <div>8. “회사” 또는 그로부터 개인정보를 제공받는 제3자, 위탁자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때, 회원탈퇴 또는 회원자격의 상실이 발생한 때에는
                        법률상 보관의무가 있는 항목을 제외하고 당해 “이용자” 또는 “회원”의 개인정보를 지체 없이 파기합니다.
                    </div>
                    <div>9. “회사”는 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 “이용자”의 동의거절 시
                        제한되는 서비스를 구체적으로 명시하고, 필수 수집항목이 아닌 개인정보의 수집•이용•제공에 관한 “이용자”의 동의거절을 이유로 회원가입등 서비스제공을 제한하거나 거절하지
                        않습니다.
                    </div>
                    <div>10. 기타 개인정보의 수집, 이용, 제공, 보호와 관련된 보다 자세한 사항은 “현대식품관 투홈 개인정보 취급방침”에 정한 바에 따릅니다.</div>
                    <br>
                    <strong>제19조 회사의 의무</strong>
                    <div>1. “회사”는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화, 용역을 제공하는데 최선을
                        다하여야 합니다.
                    </div>
                    <div>2. “회사”는 “이용자”가 안전하게 인터넷 서비스를 이용할 수 있도록 “이용자”의 개인정보(신용정보 포함) 보호를 위한 보안시스템을 갖추어야 합니다</div>
                    <div>3. “회사”가 상품이나 용역에 대하여 「표시•광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시, 광고행위를 함으로써 “이용자”가 손해를 입은 때는 이를 배상할
                        책임을 집니다.
                    </div>
                    <div>4. “회사”는 “이용자”가 원하지 않는 영리목적의 광고성 전자 우편을 발송하지 않습니다.</div>
                    <br>
                    <strong>제20조 회원의 ID 및 비밀번호에 대한 의무</strong>
                    <div>1. 제18조의 경우를 제외한 ID와 비밀번호에 관한 관리 책임은 “회원”에게 있습니다.</div>
                    <div>2. “회원”은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</div>
                    <div>3. “회원”이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “회사”에 통보하고 “회사”가 안내가 있는 경우에는 그에 따라야
                        합니다.
                    </div>
                    <br>
                    <strong>제21조 이용자의 의무</strong>
                    <div class="none">“이용자”는 다음 각호의 행위를 하여서는 안됩니다.</div>
                    <div>1. 신청 또는 변경 시 허위내용의 등록</div>
                    <div>2. 타인의 정보 도용</div>
                    <div>3. ”온라인몰”에 게시된 정보의 변경</div>
                    <div>4. ”회사”가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시</div>
                    <div>5. “회사” 기타 제3자의 저작권 등 지적재산권의 침해</div>
                    <div>6. “회사”기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</div>
                    <div>7. 외설 또는 폭력적인 메시지, 화상, 음성 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</div>
                    <br>
                    <strong>제22조 회사와 연결된 몰과의 관계</strong>
                    <div>1. “온라인몰”과 연결된 ‘몰(웹사이트)’이란 하이퍼링크(하이퍼 링크의 대상에는 문자, 그림, 동화상 등이 포함됨) 방식 등으로 연결된 경우를 말합니다.</div>
                    <div>2. ”회사”는 연결된 몰이 독자적으로 제공하는 “재화 등”에 의하여 “이용자”와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 “회사”의 초기화면 또는 연결되는
                        시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
                    </div>
                    <br>
                    <strong>제23조 저작권의 귀속 및 이용제한</strong>
                    <div>1. “회사”가 작성한 저작물에 대한 저작권 기타 지적재산권은 “회사”에 귀속합니다.</div>
                    <div>2. “이용자”는 “회사”를 이용함으로써 얻은 정보 중 “회사”에게 지적재산권이 귀속된 정보를 “회사”의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에
                        의하여 영리목적으로 이용하거나 제3자에게 이용하게 해서는 안됩니다.
                    </div>
                    <div>3. “회사”는 약정에 따라 “이용자”에게 귀속된 저작권을 사용하는 경우 당해 “이용자”에게 통보하여야 합니다.</div>
                    <br>
                    <strong>제24조 분쟁해결</strong>
                    <div>1. “회사”는 “이용자”가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리 하기 위하여 피해보상처리기구를 설치, 운영합니다.</div>
                    <div>2. “회사”는 “이용자”로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 “이용자”에게 그 사유와 처리 일정을
                        즉시 통보해 드립니다.
                    </div>
                    <div>3. “회사”와 “이용자”간에 발생한 전자상거래 분쟁과 관련하여 “이용자”의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시/도지사가 의뢰하는 분쟁조정기관의 조정에
                        따를 수 있습니다
                    </div>
                    <br>
                    <strong>제25조 재판권 및 준거법</strong>
                    <div>1. ”회사”와 “이용자”간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 “이용자”의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로
                        합니다. 다만, 제소 당시 “이용자”의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사 소송법상의 관할법원에 제기합니다.
                    </div>
                    <div>2. ”회사”와 “이용자”간에 제기된 전자상거래 소송에는 대한민국의 법을 적용합니다.</div>
                    <br>
                    <div class="none">
                        <b>부칙(2020.7.22)</b>
                        <br>
                        <br>
                        이 약관은 2020년 7월 22일부터 시행됩니다.
                    </div>
                    <br>
                    <br>
                    <div class="none">
                        <b>부칙(2021.2.24)</b>
                        <br>
                        <br>
                        이 약관은 2021년 2월 24일부터 시행됩니다.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 현대식품관 - 이용약관 -->

    <!-- 팝업 : 현대식품관 - 개인정보 수집&middot;이용 동의// -->
    <div id="popPolicyJoin2" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>개인정보 수집·이용 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    수집·이용목적<br>
                    회원가입을 통한 서비스 이용 및 상담, 구매결제, 물품배송<br><br>
                    수집·이용할 항목<br>
                    Email, 이름, ID, 비밀번호, 생년월일, 휴대폰번호<br>
                    * 구매 및 배송 시<br>
                    - 결제정보 : 카드번호, 계좌번호, 휴대폰번호 등<br>
                    - 배송정보 : 주문자/수취인 이름, 연락처, 배송지주소<br>
                    ※ H.Point통합회원인경우, CI,통합고객번호,통합아이디,통합비밀번호 정보가 추가 수집됩니다.<br><br>
                    보유·이용기간<br>
                    <div style="text-decoration: underline; font-weight: bold; font-size: 120%;">회원탈퇴시 또는 법정보유기간</div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 현대식품관 - 개인정보 수집&middot;이용 동의 -->

    <!-- 팝업 : 현대식품관 - H.Point 서비스를 위한 개인정보 제공 동의// -->
    <div id="popPolicyJoin3" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>H.Point 서비스를 위한 개인정보 제공 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    제공받는자<br>
                    (주)현대백화점 (H.Point 서비스 운영사)<br><br>
                    제공받는 자의 이용 목적<br>
                    H.Point 회원가입, 웹사이트 로그인, H.Point 적립·사용, 기타 H.Point 멤버십 관련 서비스 제공<br><br>
                    제공할 개인정보 항목<br>
                    아이디(ID), 비밀번호, CI, 이름, 고객번호, 생년월일, 성별, 휴대폰번호, Email, 구매정보, 결제 정보 (H.Point 적립 물품에 한함)<br><br>
                    보유·이용기간<br>
                    <div style="text-decoration: underline; font-weight: bold; font-size: 120%;">탈퇴 신청 후, 탈퇴 확정시 까지
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 현대식품관 - H.Point 서비스를 위한 개인정보 제공 동의 -->

    <!-- 팝업 : 현대식품관 - 개인정보 자동입력 서비스 동의// -->
    <div id="popPolicyJoin4" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>개인정보 자동입력 서비스 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    귀하는 개인정보의 편리한 입력을 위해 동의하신 개인정보의 수집 및 이용에 관한 필수적 동의에 따라 수집한 주소, 이메일, 자사카드 등록등을 활용하는 것에 동의하실 수
                    있습니다.<br><br>
                    동의를 거부하실 경우, 현대백화점카드의 등록정보 활용이 불가하여 개인정보의 간편입력 서비스의 이용이 불가능 합니다.
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 현대식품관 - 개인정보 자동입력 서비스 동의 -->

    <!-- 팝업 :  H.Point - 이용약관// -->
    <div id="popPolicyJoin5" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>이용약관</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    <strong>제1장 총칙</strong>
                    <br>
                    <strong>제1조 (목적)</strong>
                    <div class="none">
                        본 약관은 H.Point회원(아래에서 정의)이 주식회사 현대백화점(이하 "당사")이 제공하는 H.Point 서비스를 이용함에 있어 H.Point회원과 당사의 제반 권리·의무
                        및 관련절차 등을 규정하는데 그 목적이 있습니다.
                    </div>
                    <br>
                    <strong>제2조 (정의)</strong>
                    <div class="none">본 약관에서 사용하는 주요 용어의 정의는 다음과 같습니다.</div>
                    <div>1. “H.Point 회원”(이하 "회원")이란 당사 또는 제휴사의 영업점이나 홈페이지(PC/모바일웹), 모바일앱을 통해 본 약관 제5조에 정해진 가입 절차에 따라
                        회원가입, 카드발급, 카드등록 등의 절차를 진행하여 정상적으로 H.Point 서비스를 이용할 수 있는 권한을 부여 받은 자를 말합니다.
                    </div>
                    <div>2. “H.Point 서비스”(이하 "H.Point 서비스" 또는 "서비스"라 함)란 당사와 제휴사가 회원에게 제공하는 포인트 적립, 사용, 할인, 이벤트 참여 등의 고객
                        서비스 프로그램으로서, 그 주요 내용은 본 약관 제3조에서 명시된 바와 같습니다.
                    </div>
                    <div>
                        3. “H.Point카드”(이하 "H.Point카드" 또는 "카드"라 함)란 회원이 H.Point 서비스를 이용할 수 있도록 당사 또는 제휴사가 발급한 포인트카드(모바일카드
                        포함)로서, 카드의 종류는 다음과 같습니다.
                        <ol>
                            <li>1) 일반 H.Point 카드 : 단순 포인트 적립 또는 사용 등 H.Point 서비스만 가능한 카드</li>
                            <li>2) H.Point 제휴카드 : 제휴사 발행하는 신용카드, 체크카드, 선불카드에 H.Point 서비스 기능이 탑재된 카드</li>
                        </ol>
                    </div>
                    <div>4. H.Point 바로적립카드(이하 "바로적립카드"라 함)란, 모바일앱을 통해 발급 받은 H.Point 카드로서 회원이 본 약관 제5조 제3항에 따른 등록절차를 이행하지
                        않은 카드를 말합니다.
                    </div>
                    <div>5. “H.Point”(이하 "포인트")란 당사와 제휴사에서 상품이나 서비스 구매 시 적립 또는 사용하도록 제공하는 서비스 포인트를 말합니다.</div>
                    <div>6. “H.Point 가용포인트” 또는 “H.Point 잔여포인트”(이하 "가용포인트" 또는 “잔여포인트”라 함)란 회원이 적법하게 부여 받은 포인트 중 이미 사용한
                        포인트를 제외한 나머지 포인트의 합계로서, 당사가 정한 기준에 따라 사용할 수 있는 포인트를 말합니다.
                    </div>
                    <div>7. “H.Point 통합아이디”(이하 "통합아이디")란 당사와 현대백화점그룹 제휴사 온라인 서비스간 하나의 로그인 계정과 비밀번호를 사용 할 수 있는 서비스를 말합니다.
                        통합아이디를 통해 Single Sign On 서비스(현대백화점그룹 제휴 사이트 통합아이디 유지 관리 서비스)를 기본으로 제공하며, 온라인 채널간 로그인 및 포인트를 적립
                        또는 사용 하는 수단으로 통합아이디가 사용됩니다.단, "통합아이디"는 H.Point 홈페이지 및 현대백화점그룹 내 제휴사 홈페이지 가입회원에만 제공되는 서비스 입니다.
                    </div>
                    <div>
                        8. “H.Point 제휴사”(이하 "제휴사")란 당사와 H.Point 서비스 운영과 관련하여 제휴 계약을 맺고 H.Point 서비스를 공동 제공하기로 합의 한 회사로서
                        해당 회사의 영업점포 (이하 "제휴영업점") 및 인터넷 사이트(온라인쇼핑몰 포함, 이하 "제휴사 홈페이지")를 포함합니다. 추후 제휴사는 당사 및 제휴사의 사정에 따라 추가
                        또는 서비스 계약 해지 될 수 있으며 H.Point 홈페이지(<a href="http://www.h-point.co.kr" target="_blank">www.h-point.co.kr</a>)를
                        통해 고지 합니다.<br>
                        <a href="https://admin.h-point.co.kr/cu/hpoint/hpoint.nhd" target="_blank">- H.Point 제휴사 보기</a>
                    </div>
                    <div>9. “H.Point 홈페이지”이라 함은 회원이 온라인 및 모바일을 통해 H.Point 서비스를 이용할 수 있는 당사 인터넷 사이트(<a
                            href="http://www.h-point.co.kr" target="_blank">www.h-point.co.kr</a>)를 말합니다.
                    </div>
                    <div>10. “H.Point 모바일앱”이라 함은 회원이 모바일앱을 설치하여 H.Point 서비스를 이용할 수 있는 모바일 프로그램을 말합니다.</div>
                    <br>
                    <strong>제3조 (H.Point서비스 개요)</strong>
                    <div>
                        1. 당사가 회원에게 제공하는 서비스는 아래와 같습니다.
                        <ol>
                            <li>
                                1) 포인트 적립 서비스<br>
                                - 회원은 당사와 제휴사에서 상품이나 서비스 구입 시나 이벤트 등에 의해 포인트를 적립 받을 수 있습니다. 단, 당사와 제휴사의 사정에 따라 일부 브랜드 및
                                상품은 제외 될 수 있습니다.
                            </li>
                            <li>
                                2) 포인트 사용 서비스<br>
                                - 회원은 적립된 포인트를 사용하여 당사와 제휴사에서 지정한 상품이나 서비스를 구입할 수 있습니다. 단, 회원이 포인트를 사용 하기 위해서는 반드시
                                "H.Point 카드"를 소지하여야 합니다. 단, 온라인 상품이나 서비스의 경우 통합아이디를 통해 포인트 사용이 가능합니다.
                            </li>
                            <li>
                                3) 할인 서비스<br>
                                - 회원은 당사와 제휴사에서 상품이나 서비스 구입 시에 당사와 제휴사의 방침에 따라 상품 구매액의 일부를 할인 받으실 수 있습니다.
                            </li>
                            <li>
                                4) 통합아이디 서비스<br>
                                - 회원은 H.Point 홈페이지 및 현대백화점그룹 내 제휴사 홈페이지의 ID와 비밀번호를 통합하여 이용할 수 있는 회원 인증 서비스인 통합아이디 서비스를
                                이용할 수 있습니다. 또한, H.Point 모바일앱 서비스를 이용할 경우 OTP(One Time Password)방식을 통해 간편하게 통합아이디로 로그인할 수
                                있는 서비스를 제공 합니다.
                            </li>
                            <li>
                                5) Single Sign On 서비스<br>
                                - 회원이 H.Point 홈페이지 및 현대백화점그룹 제휴사 홈페이지간 가입에 동의한 경우, 통합아이디를 기반으로 로그인 상태를 유지하면서 현대백화점그룹 제휴사
                                홈페이지를 이용할 수 있는 서비스 입니다.
                            </li>
                            <li>
                                6) 프렌즈 서비스<br>
                                - 회원은 통합멤버십앱을 통하여 회원의 휴대폰 주소록 정보와 동기화 하여, 친구목록을 구성하고 친구와 정보공유 및 포인트를 선물하고 프로모션에 공동참여 할 수
                                있는 서비스를 이용할 수 있습니다.
                            </li>
                            <li>
                                7) 클럽 서비스
                                <br>- 클럽서비스는 당사 회원中 특정회원대상으로 부가적으로 제공되는 서비스입니다. 클럽별 별도의 가입신청이 필요하며, 기준 부합시 클럽에서 제공해드리는
                                혜택을 받으실 수 있습니다. 클럽별 가입기준은 H.Point홈페이지 (<a href="http://www.h-point.co.kr" taget="_bank">www.h-point.co.kr</a>)를
                                참조하시기 바랍니다.
                            </li>
                            <li>
                                8) 인터넷상 서비스<br>
                                당사는 H.Point 홈페이지 및 H.Point 모바일앱을 통해 포인트 조회 및 이용 서비스 및 각종 정보 제공 서비스를 제공합니다.
                            </li>
                            <li>
                                9) 기타 서비스<br>
                                - 당사와 제휴사는 상기 각 호의 서비스 이외에도 추가적인 서비스를 회원에게 제공할 수 있으며 자세한 H.Point 서비스 내용은 당사가 운영하는
                                H.Point홈페이지(<a href="http://www.h-point.co.kr" target="_blank">www.h-point.co.kr</a>) 를
                                참조하시기 바랍니다.
                            </li>
                        </ol>
                    </div>
                    <div>2. 본 약관 제 5조 제 1 항에서 H.Point 홈페이지 및 H.Point 모바일앱을 통해 회원 가입하지 아니하고 당사와 제휴사 영업점을 통한 서면 가입 또는 제휴
                        신용카드를 통해 가입 한 회원의 경우 당사 또는 각 제휴사의 H.Point서비스를 원활하게 이용하기 위해서는 당사 및 제휴사에서 정하는 별도의 약관에 대한 동의 및 개인정보
                        처리 방침(‘개인정보 제공 및 활용 동의’등) 등 추가 등록절차를 완료하여야 하며, 본 조 제 1 항의 전체 서비스를 이용하고자 하면 반드시 H.Point 모바일앱을 설치
                        하고, 통합아이디를 만드셔야 합니다.
                    </div>
                    <div>3. 회원에게 제공되는 H.Point 서비스는 당사 및 제휴사의 영업정책이나 제휴사의 사정에 따라 변경될 수 있습니다.</div>
                    <br>
                    <strong>제4조 (약관개정)</strong>
                    <div>1. 본 약관의 내용은 H.Point 홈페이지 화면에 게시하거나 기타의 방법으로 회원에게 공지하고, 이에 동의한 회원이 H.Point 서비스에 가입함으로써 효력이
                        발생합니다.
                    </div>
                    <div>2. 본 약관은 H.Point 서비스에 가입된 회원을 포함하여 서비스를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다.</div>
                    <div>
                        3. 본 약관은 수시로 개정 가능하며 약관을 개정하고자 할 경우 당사는 개정된 약관을 적용하고자 하는 날로부터 14일 이전에 약관이 개정된다는 사실과 개정된 내용 등을 아래
                        규정된 방법 중 1가지 이상의 방법으로 회원에게 통지합니다. 다만, 회원에게 불리하게 약관내용이 변경되는 경우에는 최소한 30일 이상의 사전 유예기간을 두고
                        고지합니다.<br>
                        - e-mail 통보<br>
                        - H.Point 홈페이지(www.h-point.co.kr)내 고지<br>
                        - 모바일멤버십앱 푸쉬<br>
                        - 서면 통보 또는 전단고지<br>
                        - 제휴영업점 내 게시<br>
                        - 일간신문 게시<br>
                        - 기타 회원 가입 시, 회원이 제공한 연락처 정보 등을 이용한 전화 안내 등의 방법<br>
                    </div>
                    <div>4. 당사가 영업양도 등의 방법으로 본 약관에 따른 계약관계를 이전하고자 하는 경우, 그 사실을 회원에게 개별적으로 통지하고 회원이 이에 대하여 30일간 이의를 제기하지
                        않고 계속해서 H.Point 서비스를 이용하는 경우에는 이에 대하여 동의한 것으로 봅니다.
                    </div>
                    <div>5. 당사가 e-mail 또는 SMS를 통하여 본 약관이 개정된 사실 및 내용을 회원에게 고지하는 경우에는 회원이 제공한 정보 기준으로 통보하며, 이 경우 당사가 적법한
                        통보를 완료한 것으로 봅니다.
                    </div>
                    <div>6. 본 규정에 의하여 개정된 약관은 원칙적으로 그 효력 발생일로부터 장래를 향하여 유효합니다.</div>
                    <div>7. 본 약관의 개정과 관련하여 이의가 있는 회원은 회원탈퇴를 할 수 있으며 개정 된 약관의 효력발생일까지 탈퇴하지 않거나 별도로 당사에 이의를 제기하지 않는 경우 변경된
                        약관에 동의한 것으로 봅니다.
                    </div>
                    <div>8. 본 규정의 통지방법 및 통지의 효력은 본 약관의 각 조항에서 규정하는 개별적인 또는 전체적인 통지의 경우에 이를 준용합니다.</div>
                    <br>
                    <br>
                    <br>
                    <strong>제2장 회원가입과 H.Point카드</strong>
                    <br>
                    <strong>제5조 (회원가입과 카드발급)</strong>
                    <div>1. 회원가입 및 카드발급은 H.Point 홈페이지, H.Point 모바일앱, 일부 제휴 영업점을 통해 가능합니다. 회원으로 가입하고자 하는 고객은 당사에서 정한 서비스
                        H.Point 홈페이지나 H.Point 모바일앱, 일부 제휴영업점에서 회원 가입 신청서(서면 신청서 포함)에 정해진 사항을 기입 및 서명을 한 후 본 약관과
                        ‘개인정보처리방침(‘개인정보 수집 제공 및 활용 동의’ 등)'에 동의함으로써 회원가입을 신청합니다. 회원가입 과정중 본인인증은 필수며, 본인인증이 완료되었을때
                        H.Point서비스를 정상적으로 이용할 수 있습니다. 단, 만 14세 미만의 경우 가입이 제한되며, 외국인인 경우 본인인증이 가능한 경우만 가입이 가능합니다.
                    </div>
                    <div>2. 고객으로부터 회원가입 신청이 있는 경우 당사와 제휴사는 자체 기준에 따른 심사를 거친 후 고객에게 회원 자격을 부여 할 수 있으며 회원 자격이 부여된 고객은
                        당사로부터 가입 완료 공지를 받은 시점부터 회원으로서의 지위를 취득하고 H.Point서비스를 제공 받을 수 있습니다.
                    </div>
                    <div>3. 고객은 H.Point 모바일앱을 통해 바로적립카드를 발급하여 일부 제한된 서비스를 이용할 수 있습니다. 단, 고객이 본 약관에 명시된 H.Point 서비스를 제공받기
                        위해서는 본 조 제1항에 명시된 방법으로 회원가입 절차를 완료하거나, H.Point 모바일앱을 통해 로그인 하여 최초 적립일로부터 30일 이내에 카드 등록을 완료해야
                        합니다. 만일 기한 내 바로적립카드를 등록하지 않을 경우에는, 바로적립카드 사용이 정지되고 최초 적립일로부터 60일 경과시에는 자동으로 바로적립카드의 해지 및 적립 포인트
                        소멸 처리가 진행됩니다. 바로적립카드를 등록하지 않아 발생하는 바로적립카드의 해지 및 적립 포인트 소멸에 대하여는 당사가 책임지지 않습니다.
                    </div>
                    <div>4. 회원은 회원자격을 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</div>
                    <br>
                    <strong>제6조 (카드 이용 및 관리)</strong>
                    <div>1. 회원이 H.Point 서비스를 당사와 제휴사에서 이용하고자 할 경우, 카드를 제시해야 하며 당사와 제휴사는 미성년자 여부나 본인 확인 등 합리적인 이유가 있을 때
                        회원에게 본인확인을 위한 식별절차를 요청할 수 있습니다. 회원은 이러한 요청을 있을 경우 요청에 응해야 정상적이고 원활한 H.Point 서비스를 제공 받을 수 있습니다.
                    </div>
                    <div>2. H.Point 카드 및 사용 비밀번호는 회원 본인만 사용 가능하며, 제3자에게 임의적으로 대여 또는 사용하게 하거나 양도 또는 담보의 목적으로 사용 할 수
                        없습니다.
                    </div>
                    <div>3. 전항의 규정에도 불구하고, 회원이 당사의 사전 동의 없이 H.Point카드를 타인(가족, 동거인 등 포함)에게 대여하거나 그 사용을 위임한 경우, 양도 또는 담보의
                        목적으로 제공한 경우, 타인이 H.Point카드를 사용할 수 있음을 알았거나 쉽게 알 수 있었음에도 불구하고 이를 방치한 경우, 이로 인해 발생한 손해에 대해서는 당사가
                        어떠한 책임도 지지 않습니다
                    </div>
                    <div>4. H.Point카드 및 사용 비밀번호는 누설·노출 또는 방치하여서는 아니되며, 회원 스스로의 책임하에 관리하여야 합니다. 카드가 분실, 도난 되거나 비밀번호가 유출되는
                        등의 사고가 발생할 경우, 해당 회원은 즉시 그 사실을 당사 및 제휴사에 즉시 통지하여야 합니다.
                    </div>
                    <div>5. 당사 및 제휴사는 회원으로부터 본 조 제3항에 따른 통지를 받을 경우, 즉시 사고 등록 및 해당 회원카드의 사용을 중지하는 등 필요한 제반 조치를 취합니다. 단,
                        당사 및 제휴사는 회원이 본 조 제4항에 따른 통지를 하기 이전에 발생한 손해, 본 조 제2항 내지 제4항 및 기타 회원의 고의 또는 과실 등의 귀책사유로 발생한 사고의
                        경우에는 어떠한 책임도 지지 않습니다.
                    </div>
                    <div>6. 바로적립카드를 발급받은 후 회원가입 및 등록 없이 사용하던 중에 발생한 손해(모바일기기 분실 등), H.Point카드의 분실 또는 도난의 통지를 하기 전에 저장된
                        포인트에 대한 손해에 대한 책임은 회원에게 있습니다.
                    </div>
                    <br>
                    <strong>제7조 (회원탈퇴 및 자격상실)</strong>
                    <div>1. 회원은 언제든지 서면, 전화, 기타 당사가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, 당사는 회원의 요청에 따라 조속히 회원탈퇴에 필요한 제반 절차를
                        수행합니다.
                    </div>
                    <div>2. 전항의 회원탈퇴 방법 중 회원이 당사 상담원(1588-1588)을 통해 회원탈퇴(이하 “즉시탈퇴”라 함)를 요청하는 경우, 당사는 포인트 적립 내역을 포함하여 당사가
                        보유하는 회원의 일체 정보를 유예기간 없이 즉시 삭제하며, 회원탈퇴일로부터 90일 이내에 재가입이 불가합니다.
                    </div>
                    <div>
                        3. 회원이 다음 각 호의 사유에 해당하는 경우, 당사는 해당 회원에 대한 통보로 회원의 자격을 상실시킬 수 있습니다. 단, 제3)호의 경우에는 별도의 통보 없이 당연히
                        자격이 상실됩니다.
                        <ol>
                            <li>1) 회원가입 신청 시에 허위의 내용을 등록하거나 타인의 명의를 도용한 경우</li>
                            <li>
                                2) 포인트의 부정적립 및 부정사용 등 서비스를 부정한 방법 또는 목적으로 이용한 경우<br>
                                - 부정적립<br>
                                (1) 포인트 부정적립이란, 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 해당 회원에게 포인트가 적립된 경우를 말합니다. 그러나 시스템의 오류
                                등 회원의 귀책사유에 의하지 않고 포인트가 적립된 경우, 제휴사에서 상품이나 서비스를 구매한 자(이하 “실구매자”)의 동의를 통해 실구매자 대신 다른 회원에게
                                포인트가 적립된 경우에는 부정적립에 해당하지 않습니다. 단, 제휴사 또는 제휴영업점의 직원 지위를 보유하는 회원은 소속 제휴사 또는 제휴영업점에서 실구매자가
                                구매한 상품이나 서비스에 대한 포인트에 대하여 실구매자의 동의를 받고 포인트를 적립하더라도 부정적립에 해당됩니다.<br>
                                (2) 회원의 부정적립 행위 확인된 경우, 당사는 회원에게 회원자격 상실을 통보하고 부정적립된 포인트는 즉시 소멸처리 합니다. 이 경우 회원은 어떠한 권리도
                                주장할 수 없으며, 회원이 부정적립 포인트로 상품이나 서비스를 구매하는 등의 부당이득을 취한 경우 부정적립 동조자와 함께 당사 또는 제휴사에 대한 민·형사상
                                책임을 집니다.<br>
                                - 부정사용<br>
                                (1) 포인트 부정사용이란, 당사나 제휴사 또는 회원의 동의 없이 타 회원의 포인트를 수단과 방법에 관계 없이 임의로 사용한 경우를 말합니다.<br>
                                (2) 회원은 부정사용의 사유가 자신의 고의 또는 과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 당사는 회원의 소명 내용을 심사하여 회원의 주장이
                                타당하다고 판단하는 경우 회원으로 하여금 정상적으로 포인트를 이용할 수 있도록 합니다.
                            </li>
                            <li>3) 회원이 사망한 경우</li>
                            <li>4) 다른 회원의 H.Point 홈페이지 및 H.Point 모바일앱 이용을 방해하거나, 통합아이디와 비밀번호 등 개인정보를 도용하는 등 전자거래질서를 위협하는
                                경우
                            </li>
                            <li>5) H.Point 홈페이지 및 H.Point 모바일앱을 이용하여 법령 또는 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
                            <li>6) H.Point 홈페이지 및 H.Point 모바일앱의 화면에서 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우</li>
                            <li>7) H.Point 홈페이지 및 H.Point 모바일앱 화면에 음란물을 게재하거나 음란사이트를 링크시키는 경우</li>
                            <li>8) 기타 본 약관에 규정된 회원의 의무를 위반한 경우</li>
                            <li>9) 기타 H.Point 서비스 운영을 고의로 방해하는 행위를 하는 경우</li>
                            <li>10) 당사와 제휴사의 합리적인 판단에 기하여 H.Point 서비스 제공을 거부할 필요가 있다고 인정할 경우</li>
                        </ol>
                    </div>
                    <div>4. 본 조 제3항의 사유로 자격이 상실된 회원은 당사로부터 해당 사유 발생에 대한 통지를 받은 날로부터 최대 30일 이내에 제3항 각 호의 사유가 자신의 고의 또는
                        과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 당사는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 정상적인 서비스를 이용할
                        수 있도록 합니다.
                    </div>
                    <div>
                        5. 본 조 제1항에 의한 회원탈퇴 또는 제3항에 의한 회원자격상실이 확정되는 시점은 아래와 같습니다.<br>
                        <ol>
                            <li>1) 회원의 탈퇴 요청시 당사가 회원탈퇴 처리의 완료를 통보하는 시점에 탈퇴가 완료됩니다.</li>
                            <li>2) 회원자격상실의 경우 통보일에 회원 자격상실이 확정됩니다. 단 사망으로 인한 자격상실의 경우에는 당사의 통보여부와 상관없이 회원 사망일에 자격상실이
                                확정되며, 해당 회원에게 기 제공된 H.Point서비스와 관련된 권리나 의무 및 포인트는 해당 회원의 상속인에게 상속되지 않습니다.
                            </li>
                        </ol>
                    </div>
                    <div>6. 회원탈퇴시 당사가 제3조 제1항에서 정의한 모든 서비스 제공이 중단되며, 통합아이디로 가입한 제휴사의 회원 자격도 동시에 상실됩니다.</div>
                    <br>
                    <br>
                    <br>
                    <strong>제3장 포인트</strong>
                    <br>
                    <strong>제8조 (포인트 적립)</strong>
                    <div>1. 포인트는 회원이 당사와 제휴사에서 판매 되는 상품이나 서비스를 구매하거나 당사와 제휴사에서 주최하는 이벤트, 추가 적립 서비스 등 마케팅 활동 등과 관련하여 획득한
                        포인트를 말합니다.
                    </div>
                    <div>
                        2. 당사나 제휴사는 상품을 구입하거나 서비스를 이용하고 그에 따른 대금을 결제한 회원에게 약정에 고지된 바에 따라 아래와 같은 방식으로 포인트를 산정, 부여합니다. 단,
                        포인트와 관련하여 발생하는 제세공과금은 회원이 부담합니다.<br>
                        * 포인트 = (상품 및 서비스의 실 결제대금) × (고지된 포인트 적립률)<br>
                        * 포인트 적립방침은 H.Point홈페이지(<a href="http://www.h-point.co.kr" target="_blank">www.h-point.co.kr</a>)에서
                        확인이 가능합니다.<br>
                    </div>
                    <div>3. 포인트는 구매 당일 자동 적립이 원칙이나, 제휴사의 온라인 쇼핑몰의 경우는 해당 제휴사가 요구하는 방법에 의해 추후 적립됩니다. 가용화 되어 사용 가능한 포인트는
                        H.Point 홈페이지 및 H.Point 모바일앱 서비스를 통해 확인 가능합니다.
                    </div>
                    <div>4. 제휴사의 방침에 따라 일부 제휴사 또는 제휴영업점에서는 포인트 적립 또는 사용이 불가할 수 있으며, 일부 제휴사 홈페이지의 경우에는 별도의 적립률이 적용될 수
                        있습니다. 이 경우 해당 제휴사 또는 제휴영업점이나 제휴사 홈페이지에 해당 내용을 별도 표기 또는 안내 합니다.
                    </div>
                    <div>5. 사용가능포인트를 보유한 회원은 당사나 제휴사에서 소정의 절차에 따라 상품 구매나 서비스 이용에 따른 대금의 일부 또는 전부를 사용가능포인트로 결제할 수 있습니다.
                    </div>
                    <div>6. 포인트는 당사가 정하는 적립률 또는 당사와 제휴사간에 약정된 적립률에 따르며, 적립되는 포인트 중 소수점 이하의 단위는 반올림 됩니다. 당사나 제휴사가 별도로 정한
                        상품이나 서비스를 구매하거나 포인트, 제휴사 포인트 또는 제휴상품권, 모바일 쿠폰 등의 결제 수단을 사용하여 결제하는 경우에는 별도의 포인트 적립률이 적용 되거나 포인트가
                        적립되지 않을 수 있습니다. 이 경우 당사 또는 제휴사는 회원의 구매 또는 결제 시 안내 할 수 있습니다.
                    </div>
                    <div>7. 회원이 당사와 제휴사에서 상품 및 서비스를 구입함으로써 적립 받는 포인트에 대한 결제·정산은 당사를 통하여 이루어집니다.</div>
                    <div>8. 포인트 적립은 회원이 상품이나 서비스를 구입할 때 동시에 적립하는 것을 원칙으로 하나, 당사나 제휴사가 공식적으로 허용한 기한이 있는 경우 회원은 본인의 구매내역에
                        한하여 그 기간 내 구매가 이루어진 영업점에서 구매 영수증을 제시함으로써 소급하여 적립을 청구 할 수 있습니다. 당사나 제휴사는 내부방침에 따라 포인트 소급 적립 청구 기간
                        변경이 가능하고 경우에 따라 회원의 소급 청구를 거부 할 수 있습니다.
                    </div>
                    <div>9. 회원은 H.Point 모바일앱을 통해 회원가입 또는 로그인 없이 바로적립카드를 우선 발행받아 적립이 가능하나, 카드 등록 절차를 진행하지 않는 경우에는, 제5조
                        제3항에 따라 적립된 포인트가 소멸처리 됩니다.
                    </div>
                    <div>10. 포인트 적립률 및 기준은 당사와 제휴사의 내부 방침에 따라 임의로 변경될 수 있습니다.</div>
                    <div>11. 회원이 상품 또는 서비스를 구매하면서 H.Point 적립과 다른 적립 혜택 또는 할인 혜택 등의 제공을 동시에 요청할 경우, 당사 및 제휴사는 내부 방침에 따라
                        이를 거부할 수 있으며, 이때 회원은 당사 또는 제휴사의 요구에 따라 하나의 적립 혜택 또는 할인 혜택 등을 선택하여야 합니다. 단, 당사 또는 제휴사가 중복 할인 서비스
                        또는 적립서비스 등을 개발해 별도로 허용한 경우는 제외합니다.
                    </div>
                    <br>
                    <strong>제9조 (포인트 사용)</strong>
                    <div>1. 가용포인트를 보유한 회원은 당사 또는 제휴사에서 H.Point카드를 제시하는 등 당사가 정한 소정의 절차에 따라 상품 구매대금 또는 서비스 이용대금의의 일부 또는
                        전부를 사용가능 포인트로 결제할 수 있습니다. 이때, 당사 또는 제휴사가 안내한 일정 금액 이상의 포인트 사용시에는 비밀번호 인증을 해야 합니다. 적립된 포인트의 사용
                        순서는 가용포인트 중에서 소멸 일자가 빠른 포인트부터 우선적으로 차감됩니다. 단, 일부 포인트의 경우 예외적으로 우선 차감될 수 있습니다.
                    </div>
                    <div>2. 포인트 사용의 기준, 사용 가능한 최저 포인트 및 사용단위 등(이하 “포인트 사용방침”이라 함)은 내부 방침에 의하여 필요 시 변경될 수 있습니다. 포인트 사용방침의
                        변동사항은 H.Point 홈페이지, 제휴사 홈페이지, 제휴영업점 내 고지물 중 1가지 이상의 방법으로 고지됩니다. 또는 영업점 매장 내 고지물 중 1가지 이상 방법으로
                        고지됩니다.
                    </div>
                    <div>
                        3. 회원이 당사 또는 제휴사에서 포인트를 사용하기 위해서는 포인트 사용방침에 따라 가용포인트가 사용 가능한 최저 포인트 이상에 해당하여야 하며, 포인트 사용단위에 따라
                        사용이 가능합니다.<br>
                        * 포인트 사용방침은 H.Point홈페이지(<a href="http://www.h-point.co.kr" target="_blank">www.h-point.co.kr</a>)에서
                        확인이 가능합니다.<br>
                        - 해당 제휴사별 포인트 사용 가능 단위 보기<br>
                    </div>
                    <div>4.회원은 상품이나 서비스의 결제 수단으로 사용하는 것 외에 당사나 제휴사가 지정한 사은품 (상품권 포함)을 포인트를 사용하여 교환해 수령할 수 있습니다. 단, 이를
                        위해서는 당사나 제휴사가 정한 조건을 준수하여야 합니다.
                    </div>
                    <div>5.회원은 포인트를 타인에게 양도, 대여 또는 담보의 목적으로 이용할 수 없습니다. 다만, 당사나 제휴사에서 인정하는 본 약관 제3조 제1항 6)의 "포인트 선물하기"
                        서비스, 기타 예외적으로 허용되는 서비스를 이용하는 경우는 예외로 합니다. "포인트 선물하기"에 따라 타 회원에게 양도 받은 포인트는 다시 타 회원에게 재 양도는 불가하며
                        당사 방침에 따라 해당 포인트 사용 유효기간 및 양도 금액 한도/횟수의 제한이 있을 수 있으며, 이에 대한 사항은 H.Point 홈페이지에 고지 합니다.
                    </div>
                    <div>6.포인트 사용 후 사용된 포인트의 적립 원천이 되는 구매 행위가 매출취소, 반품, 기타의 사유에 의해 취소되었을 때, 가용포인트가 마이너스(-)인 경우 잔여 가용포인트가
                        해당 참여사 및 제휴사별 포인트 사용단위로 적립되기 전까지 포인트 사용이 불가합니다.
                    </div>
                    <div>7.당사는 H.Point카드의 발급과 결제시스템 운영 업무 등을 담당합니다. 회원이 제휴사에서 상품 또는 서비스 구입함으로써 적립 받는 포인트에 대한 결제·정산은 당사를
                        통하여 이루어집니다.
                    </div>
                    <br>
                    <strong>제10조 (기존 제휴사 포인트 및 서비스 연계 전환 불가)</strong>
                    <div class="none">당사나 제휴사가 운영 중이거나 운영을 종료한 멤버십 서비스 및 지급 포인트는 H.Point 서비스와 무관합니다. 따라서 본 H.Point 서비스의
                        회원 가입과 상관 없이 회원이 당사나 제휴사가 제공하는 다른 서비스의 회원으로서 제공받아 보유한 포인트 또는 적립금은 해당 서비스에서 별도로 정한 방침을 따릅니다.
                    </div>
                    <br>
                    <strong>제11조 (포인트 정정, 취소)</strong>
                    <div>1. 적립된 포인트에 오류가 있을 경우 회원은 오류발생 시점부터 60일 이내에 당사나 해당 제휴사에 정정 신청을 하여야 하며, 당사나 해당 제휴사는 회원의 정정
                        신청일로부터 최대 90일 이내에 정정절차를 마쳐야 합니다. 단, 회원은 필요한 경우 포인트 적립 오류를 증명할 수 있는 객관적인 자료 (영수증 등)를 제시 하여야 합니다.
                    </div>
                    <div>2. 당사가 회원에게 포인트를 지급하였으나 회원의 매출취소, 반품, 기타의 사유에 의해 포인트의 적립이 취소되는 경우 취소분만큼 자동 차감됩니다. 잔여포인트가 포인트
                        취소분 보다 부족한 경우에는 마이너스 포인트로 관리되며, 추후 적립되는 포인트와 상계 됩니다.
                    </div>
                    <div>3. 누적 적립된 마이너스 포인트가 1,000포인트 이상에 해당할 경우, 당사 또는 제휴사는 회원에게 마이너스 포인트 1포인트당 1원으로 계산하여 청구할 수 있으며, 변제
                        방법은 당사 또는 제휴사의 방침에 따릅니다. 단, 회원 탈퇴시에는 마이너스 포인트가 1,000포인트 이상에 해당하지 않더라도 당사 또는 제휴사가 회원에게 변제를 청구할 수
                        있습니다.
                    </div>
                    <br>
                    <strong>제12조 (포인트 유효기간 및 소멸)</strong>
                    <div>1. 포인트의 유효기간은 최초 적립일로부터 2년(24개월)이며, 유효기간 만료일의 익월 1일에 먼저 적립된 포인트부터 월 단위로 자동 소멸됩니다. 단, 이벤트 등 경우에는
                        당사 또는 제휴사의 방침에 따라 포인트 유효기간을 달리 적용할 수 있으며, 회원의 포인트 적립 시 별도로 고지된 유효기간이 적용됩니다.
                    </div>
                    <div>
                        2. 전항에도 불구하고 회원이 다음 각 호의 사유에 해당하는 경우 포인트가 소멸됩니다.
                        <ol>
                            <li>
                                1)회원 탈퇴로 인한 포인트 소멸<br>
                                본 약관 제7조 제1항에 정해진 방법으로 탈퇴시, 회원탈퇴 요청일 현재까지 적립된 포인트는 소멸되므로 사용이 불가하며, 적립된 포인트의 유효기간 만료 이내에
                                재가입하지 않을 경우 자동으로 소멸됩니다.
                            </li>
                            <li>
                                2) 즉시탈퇴 및 자격상실로 인한 포인트 소멸<br>
                                본 약관 제7조 제2항 및 제3항에 따른 회원 탈퇴시, 적립된 포인트는 복구가 불가한 상태로 즉시 소멸되며, 적립된 포인트의 유효기간 만료 이내에
                                재가입하더라도 복원되지 않습니다.
                            </li>
                        </ol>
                    </div>
                    <div>3. 당사는 본 조 제1항의 유효기간 만료에 따른 포인트 소멸시, 소멸예정 포인트, 소멸시기 등 포인트 소멸과 관련된 내용을 포인트 소멸일의 최소 90일전에
                        SMS,e-mail, H.Point 모바일앱 푸쉬 중 1가지 방법으로 고지하며, 회원이 당사 H.Point 홈페이지 또는 H.Point 모바일앱에서 소멸 예정 포인트 확인이
                        가능하도록 조치합니다.
                    </div>
                    <br>
                    <br>
                    <br>
                    <strong>제4장 개인정보보호)</strong>
                    <br>
                    <strong>제13조 (개인정보 수집)</strong>
                    <div>1. 당사와 제휴사는 회원이 가입신청을 할 때 제공하거나 H.Point 서비스 이용 시 발생하는 각종 개인정보 뿐만 아니라 사전에 회원으로부터 동의를 얻어 회원이 다양한
                        서비스 이용 시 발생하는 정보를 수시로 수집 및 저장 할 수 있으며 이를 분석하여 회원에게 보다 나은 서비스를 제공하고 고객 지향적인 마케팅 활동을 하기 위해 사용합니다.
                        개인정보수집 및 활용에 관한 자세한 사항은 H.Point 홈페이지나 제휴사 홈페이지에 게재되어 있는 ‘개인정보 처리방침’ 등을 따릅니다.
                    </div>
                    <div>2. 당사와 제휴사는 개인정보를 수집하고자 하는 경우 회원으로부터 별도 양식에 따른 ‘개인정보 수집·이용·제공 동의서’를 받고 있으며 회원은 언제든지 이를 철회할 수
                        있습니다.
                    </div>
                    <div>3. 회원은 당사나 제휴사에 제공한 개인정보에 변경사항이 있는 경우에는 지체 없이 당사나 제휴사에 그 변경사실을 통지하여야 하며, 이를 통지하지 않아 발생한 손해에 대하여
                        당사와 제휴사는 어떠한 책임도 지지 않습니다.
                    </div>
                    <br>
                    <strong>제14조 (개인정보 이용과 제공)</strong>
                    <div>1. 당사는 서비스를 회원에게 최적화하기 위한 목적과 서비스의 활성화를 통한 고객지향적인 마케팅 수행 및 ‘개인정보 수집·이용·제공 동의서’에 기재된 목적 범위 내에서만
                        수집된 개인정보를 활용하며, ‘개인정보 수집·이용·제공 동의서’에 기재된 자에게만 개인정보를 제공합니다.
                    </div>
                    <div>
                        2. 당사는 수집한 개인정보를 당해 회원의 동의 없이 전항에 기재된 목적 범위를 넘어선 용도로 이용하거나 ‘개인정보 수집·이용·제공 동의서’에 기재된 자 이외의 제3자에게
                        제공할 수 없으며, 이를 위반하는 경우 그에 대한 모든 책임은 당사가 부담합니다. 단, 관련 법령에 달리 정함이 있는 경우 또는 다음 각 호의 경우에는 예외로 합니다.
                        <ol>
                            <li>1) 배송업무상 배송업체에게 배송에 필요한 최소한의 회원의 정보(성명, 주소, 전화번호)를 알려주는 경우</li>
                            <li>2) 통계작성 연구 또는 마케팅 활동 등을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 가공되어 제공하는 경우</li>
                            <li>3) 상품 등의 거래에 따른 대금정산을 위하여 필요한 경우</li>
                            <li>4) 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우</li>
                            <li>5) 당사 또는 제휴사와 관련하여 합병, 인수, 포괄적 영업양도 등이 있는 경우 합병 후 당사, 인수당사 및 영업양수인에 대하여 제공하는 경우</li>
                        </ol>
                    </div>
                    <div>3. 당사는 포인트 결제 및 정산 등을 위하여 회원의 개인정보 및 포인트 관련 정보 등을 제휴사에 제공하거나 제공받을 수 있습니다.</div>
                    <div>
                        4. 당사가 제휴사 등 제3자에게 회원의 개인정보를 제공하려는 경우 동조 제2항 단서의 규정에 해당하는 경우를 제외하고는 다음 각 호의 모든 사항에 대하여 회원에게 알리고
                        동의를 받습니다.
                        <ol>
                            <li>1) 개인정보를 제공받는 자</li>
                            <li>2) 개인정보를 제공받는 자의 개인정보 이용목적</li>
                            <li>3) 제공하려는 개인정보의 항목</li>
                            <li>4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간</li>
                        </ol>
                    </div>
                    <br>
                    <strong>제15조 (개인정보 보유 및 이용기간)</strong>
                    <div>
                        1. 당사는 고객으로부터 수집 또는 제공받은 개인정보를 수집목적 또는 제공받은 목적을 달성한 후 지체 없이 파기합니다. 다만, 회원이 탈퇴하거나 자격을 상실한 경우라도,
                        상법, 전자금융거래법 등 관련 법령에 의하여 일정기간 동안 보유할 필요가 있는 경우 당사는 관련 법령이 정한 기간 동안 회원의 정보를 보유할 수 있습니다.
                        <ol>
                            <li>
                                1) 전자상거래 등에서의 소비자보호에 관한 법률<br>
                                - 계약 또는 청약철회에 관한 기록 : 5년<br>
                                - 대금결제 및 상품등의 공급에 관한 기록 : 5년<br>
                                - 소비자 불만 또는 분쟁처리에 관한 기록 : 3년
                            </li>
                            <li>
                                2) 상법<br>
                                - 계약서, 신청서, 청구서 등 영업 관련 중요 서류 : 10년
                            </li>
                        </ol>
                    </div>
                    <br>
                    <strong>제16조 (개인정보 보호를 위한 회원의 관리)</strong>
                    <div>1. 회원은 회원탈퇴를 통해 본 약관과 관련한 개인정보의 제공 및 활용과 관련한 동의를 철회할 수 있습니다. 그 경우에도 당사와 제휴사는 제15조에 한하여 회원정보를
                        보유할 수 있습니다.
                    </div>
                    <div>2. 회원은 당사나 제휴사가 고지한 개인정보보호책임자에게 당사나 제휴사에 대하여 본인의 개인정보에 대한 열람을 요구할 수 있으며, 자신의 개인정보에 오류가 있는 경우
                        H.Point 홈페이지 및 H.Point 모바일앱를 통해 직접 처리 하거나 정정을 요구할 수 있습니다.
                    </div>
                    <div>
                        3. 당사와 제휴사는 회원으로부터 본 조 제1항의 규정에 의한 동의철회 및 본 조 제2항의 규정에 의한 열람 및 정정요구를 받은 경우에는 지체 없이 필요한 조치를 취하도록
                        합니다.<br>
                        ※ 개인정보와 관련된 보다 자세한 사항은 '개인정보 처리방침'을 참조하시기 바랍니다.
                    </div>
                    <br>
                    <strong>제17조 (개인정보 처리의 위탁)</strong>
                    <div>1. 당사는 수집된 개인정보의 취급 및 관리 등의 업무(이하 "업무")를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 당사가 선정한 회사에 위탁할
                        수 있습니다.
                    </div>
                    <div>2. 당사는 회원의 개인정보 취급위탁계약 시 개인정보가 관계법령에 따라 안전하게 관리될 수 있도록 규정하고 있습니다.</div>
                    <div>3. 당사의 개인정보취급 수탁자와 그 업무의 내용은 '개인정보 처리방침'을 참조하시기 바랍니다.</div>
                    <br>
                    <strong>제18조 (개인정보 관리)</strong>
                    <div>1. 당사는 수집된 회원의 개인정보 관리를 위해 개인정보관리책임자를 지정하여 관리합니다.</div>
                    <div>2. 본 조 제1항의 규정에 의한 개인정보관리책임자는 회사 사정에 따라 변경될 수 있으며, 별도의 약관변경 절차는 생략합니다.</div>
                    <div>3. 당사는 회원이 안심하고 서비스를 이용할 수 있도록 회원의 개인정보 보호를 위한 보안시스템을 갖추도록 노력합니다.</div>
                    <br>
                    <br>
                    <br>
                    <strong>제5장 H.Point 홈페이지 및 모바일</strong>
                    <br>
                    <strong>제19조 (홈페이지 및 모바일앱 서비스 개요)</strong>
                    <div>1. 당사는 회원에게 보다 나은 H.Point 서비스를 제공하기 위하여 본 약관 제2조 제⑧항의 H.Point 홈페이지 및 제2조 9항의 H.Point 모바일앱을 운영하고
                        있습니다.
                    </div>
                    <div>2. 전항의 서비스를 이용하고자 하는 회원은 당사가 정한 별도의 가입 절차에 따라 가입 후 이용이 가능합니다.</div>
                    <br>
                    <strong>제20조 (멤버십 홈페이지 및 모바일 서비스의 제공 및 변경)</strong>
                    <div>
                        1. 당사가 운영하는 인터넷사이트 등에서 제공하는 인터넷상의 모든 서비스(무선인터넷 서비스 포함)(이하 "인터넷상 서비스"라 함)의 종류는 다음 각 호와 같습니다.
                        <ol>
                            <li>1) H.Point 홈페이지(PC/모바일웹 포함) 서비스</li>
                            <li>2) H.Point 모바일앱 서비스 서비스</li>
                        </ol>
                    </div>
                    <div>2. 당사는 전항의 인터넷상 서비스를 통해 포인트 관련 각종 조회 및 이용 서비스 밀 정보제공 서비스를 제공하며, 일부 서비스는 당사의 사정에 따라 회원의 이용을 제한할
                        수 있습니다.
                    </div>
                    <br>
                    <strong>제21조 (통합 ID &amp; Password)</strong>
                    <div>1. 당사는 회원이 H.Point 홈페이지 및 현대백화점그룹 내 제휴사 홈페이지를 원활하고 편리하게 이용할 수 있도록 회원의 H.Point 홈페이지 또는 H.Point
                        모바일앱의 ID와 비밀번호를 현대백화점그룹 내 제휴사 홈페이지(모바일앱 포함)와 통합하여 사용할 수 있는 Single Sign On 서비스를 제공하고 있습니다. 향후
                        통합아이디를 통해 사용할 수 있는 제휴사 홈페이지는 당사와 제휴사 방침에 따라 추가·변동될 수 있습니다. (단, H.Point 홈페이지를 제외한 제휴사 홈페이지 이용 시에는
                        해당 제휴사가 정한 방침에 따라, 해당 제휴사의 서비스 이용약관에 동의하는 등의 절차를 완료하여야 합니다.)
                    </div>
                    <div>2. 회원의 ID 및 비밀번호에 관한 관리책임은 회원 본인에게 있습니다. 회원에게 부여된 회원 ID와 비밀번호를 제3자에게 대여 또는 양도하거나 이와 유사한 행위를
                        하여서는 아니되며, 회원 ID와 비밀번호의 관리를 소홀하여 발생하는 모든 책임은 회원 본인에게 있습니다.
                    </div>
                    <div>3. 회원은 자신의 회원 ID가 부정하게 사용된 경우에 즉시 자신의 비밀번호를 바꾸고 그 사실을 당사에 통보하여야 합니다.</div>
                    <div>4. 회원은 본인의 신상관련 사항이 변경되었을 때는 인터넷을 통하여 수정, 추가하거나 유선을 통하여 지체 없이 당사에 통지하여야 합니다.</div>
                    <div>5. 회원은 자신의 ID 및 비밀번호를 제3자가 이용하게 해서는 안됩니다.</div>
                    <div>6. 회원이 자신의 ID 및 비밀번호를 도용 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 당사에 통보하고 당사의 안내가 있는 경우에는 그에 따라야 합니다.
                    </div>
                    <div>7. 당사는 회원이 상기 제2항, 제5항, 제6항을 위반하여 발생한 손해에 대해서는 법적 책임을 부담하지 않습니다.</div>
                    <br>
                    <strong>제22조 (인터넷상 서비스 관련 회원의 의무)</strong>
                    <div>
                        1. 회원은 다음 행위를 하여서는 안됩니다.
                        <ol>
                            <li>1) 신청 또는 변경 시 허위내용의 등록 또는 타인의 정보 도용</li>
                            <li>2) 당사에서 게시된 정보의 무단 변경, 삭제 등 훼손 행위</li>
                            <li>3) 당사가 지정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시</li>
                            <li>4) 기타 제3자의 저작권 등 지적재산권에 대한 침해하거나 제3자의 명예 손상 및 업무를 방해하는 행위</li>
                            <li>5) 외설 또는 폭력적인 메시지/화상/음성/기타 공서 양속에 반하는 정보를 홈페이지에 공개 또는 게시하는 행위</li>
                        </ol>
                    </div>
                    <br>
                    <strong>제23조 (저작권의 귀속 및 이용제한)</strong>
                    <div>1. 당사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 당사에 귀속합니다.</div>
                    <div>2. 회원은 인터넷상 서비스를 이용함으로써 얻은 정보를 당사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자로 하여금
                        이용하게 해서는 안됩니다.
                    </div>
                    <div>3. 회원이 게시한 게시물의 내용에 대한 권리와 책임은 이용자에게 있습니다. 따라서 회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로
                        이용자가 부담하여야 합니다.
                    </div>
                    <div>4. 당사는 본 약관에 따라 이용자에게 귀속된 저작권을 사용하는 경우 해당 이용자에게 통보하여야 합니다.</div>
                    <div>
                        5. 당사는 게시된 내용을 게시물의 동일성을 해하지 않는 범위 내에서 편집, 이동시킬 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다.
                        <ol>
                            <li>1) 본 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우</li>
                            <li>2) 다른 회원 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우</li>
                            <li>3) 당사에서 규정한 게시기간이나 용량을 초과한 경우</li>
                            <li>4) 공공질서 및 미풍양속에 위반되거나 범죄적 행위에 결부된다고 인정되는 내용일 경우</li>
                            <li>5) 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
                            <li>6) 탈퇴자가 게시한 게시물</li>
                            <li>7) 기타 관계 법령에 위배되는 경우</li>
                        </ol>
                    </div>
                    <br>
                    <strong>제24조 (사이트의 연결과 당사의 책임))</strong>
                    <div>1. H.Point 홈페이지 및 H.Point 모바일앱은 타 사이트에 하이퍼링크(하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등에 의해 연결시킬 수
                        있습니다.
                    </div>
                    <div>2. 당사는 회원이 해당 연결사이트와 독자적으로 상품 또는 용역을 거래한 행위에 대해서는 아무런 책임을 부담하지 않습니다.</div>
                    <br>
                    <br>
                    <br>
                    <strong>제6장 기타</strong>
                    <br>
                    <strong>제25조 (광고게재 등)</strong>
                    <div>1. 당사는 회원에게 최상의 서비스를 원활하게 제공하기 위한 재정기반을 마련하기 위하여 상업용 광고를 화면에 게재하거나 정보통신망 이용촉진 및 정보보호 등에 관한 법률
                        등에서 정한 요건에 따라 e-mail 및, SMS, 모바일앱 푸쉬, DM 등을 이용하여 개별 회원에게 보낼 수 있습니다. 단, 수신거절의 의사를 명백히 표시한 회원에
                        대해서는 더 이상 e-mail 및, SMS, 모바일앱 푸쉬, DM 등을 발송하지 않습니다.
                    </div>
                    <div>2. 당사는 본 서비스를 통한 광고주의 판촉활동에 회원이 직접 참여함으로써 발생하는 손해에 대하여는 아무런 책임을 부담하지 않습니다.</div>
                    <br>
                    <strong>제26조 (서비스의 변경)</strong>
                    <div>1. 회원에게 제공되는 포인트,및 기타 관련 서비스는 당사의 영업정책이나 제휴사의 사정에 따라 변경될 수 있으며, 그 내용은 본 약관 제4조 제3항에 규정된 통지방법을
                        준용하여 회원에게 알려드립니다. 단, 제휴사의 일방적 폐업, 부도, 파산 등의 불가피한 사유로 인한 경우는 그러하지 않습니다.
                    </div>
                    <div>2. 전항의 통지한 서비스 변경일 이후 당사가 포인트 적립률을 변경할 경우 회원은 변경된 포인트 적립률에 의하여 포인트 적립혜택을 받으며, 포인트 사용기준이 변경될 경우
                        변경된 사용기준에 의해 포인트를 사용할 수 있습니다.
                    </div>
                    <br>
                    <strong>제27조 (서비스의 중단)</strong>
                    <div>
                        1. 당사는 컴퓨터 등 전기통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
                        <ol>
                            <li>1) 컴퓨터 등 정보통신설비의 점검, 보수, 교체 및 고장, 통신의 두절 등의 부득이한 사유가 발생한 경우</li>
                            <li>2) 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
                            <li>3) 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</li>
                            <li>4) 서비스 제공업자와의 계약 종료 등과 같은 당사의 제반 사정으로 서비스를 유지할 수 없는 경우</li>
                            <li>5) 기타 국가 비상 사태 나 천재 지변 등 불가항력적 사유가 있는 경우</li>
                        </ol>
                    </div>
                    <div>2. 당사는 본 조 제1항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 당사는 e-mail 또는 인터넷상 서비스에 게시하는 방법으로
                        회원에게 서비스 중단사실을 알려드립니다.
                    </div>
                    <br>
                    <strong>제28조 (서비스의 종료)</strong>
                    <div>1. 서비스를 종료하고자 할 경우, 당사는 서비스를 종료하고자 하는 날로부터 3개월 이전에 본 약관 제4조 제3항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.
                    </div>
                    <div>2. 전항의 통지한 서비스 종료일 이후 회원은 당사와 제휴사에서 포인트 적립혜택을 받지 못하며, 기 적립된 포인트는 당사가 별도 지정하는 날까지 본 약관과 당사에서 정한
                        기준에 따라 사용하여야 하며, 서비스 종료일까지 사용하지 않은 포인트는 소멸됩니다.
                    </div>
                    <br>
                    <strong>제29조 (당사의 의무)</strong>
                    <div>1. 당사는 본 약관에서 정한 바에 따라 계속적이고 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리
                        복구하여야 합니다. 본 약관 제21조 제1항에 근거하여 부득이한 경우에는 서비스를 일시 중단하거나 중지할 수 있습니다.
                    </div>
                    <div>3. 당사는 회원의 개인정보 수집 및 이용에 관련 하여 ‘개인정보 처리 방침’을 준수합니다.</div>
                    <div>4. 당사가 제공하는 인터넷상 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 당사의 고의나 과실에 기해 발생한 경우에 한하여 당사에서 책임을 부담하며, 그
                        책임의 범위는 예측이 가능한 통상손해에 한합니다.
                    </div>
                    <div>5. 당사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.</div>
                    <br>
                    <strong>제30조 (회사의 책임)</strong>
                    <div>1. 당사는 천재지변, 불가항력 기타 당사의 합리적인 통제범위를 벗어난 사유로 인하여 인터넷상 서비스를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다.
                    </div>
                    <div>2. 당사는 회원의 귀책사유로 인하여 서비스를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다.</div>
                    <div>3. 당사는 회원이 서비스를 이용함으로써 기대되는 수익을 얻지 못하거나 서비스를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않을 수 있습니다.
                    </div>
                    <div>4. 회원이 화면에 게재한 정보, 자료, 사실 등의 내용에 관한 신뢰도 또는 정확성에 대하여는 해당 회원이 책임을 부담하며, 당사는 내용의 부정확 또는 허위로 인해 회원
                        또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.
                    </div>
                    <br>
                    <strong>제31조 (약관 외 준칙)</strong>
                    <div class="none">본 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 및 상관례에 따릅니다.</div>
                    <br>
                    <strong>제32조 (분쟁조정 및 관할법원)</strong>
                    <div class="none">본 약관에 의한 서비스 이용과 관련한 제반 분쟁 및 소송은 회원의 주소를 관할하는 법원에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의
                        전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : H.Point - 이용약관 -->

    <!-- 팝업 : H.Point - 개인정보 수집&middot;이용 동의// -->
    <div id="popPolicyJoin6" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>개인정보 수집·이용 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    수집·이용목적<br>
                    멤버십 서비스 제공, 본인 확인 통합 ID 관리, H.Point서비스홈페이지 로그인 및 Single Sign On, 회원에 대한 고지 사항 전달, 카드발급, H.Point 제휴사
                    구매내역에 따른 포인트 적립·사용·정산, 고객센터 운영, 불량회원 부정이용 방지 및 비인가 사용 방지<br><br>
                    수집·이용할 항목<br>
                    <table class="tbl-guide">
                        <caption>수집·이용목적 표</caption>
                        <colgroup>
                            <col style="width:50%;">
                            <col style="width:50%;">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">이용 목적</th>
                            <th scope="col">수집·이용할 항목</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>멤버십 서비스 제공, 회원에 대한 고지사항 전달, 카드발급, H.Point 제휴사 구매내역에 따른 포인트 적립·사용·정산, 고객센터 운영, 불량회원 부정 이용
                                방지 및 비인가 사용 방지
                            </td>
                            <td>이름, 고객번호, 생년월일, 성별, 내외국인구분, 통신사, 휴대폰번호, CI, DI, Email, 주소, 구매 및 결제정보</td>
                        </tr>
                        <tr>
                            <td>본인 확인 통합 ID 관리, H.Point 서비스홈페이지 로그인 및 Single Sign On</td>
                            <td>통합아이디, 통합비밀번호</td>
                        </tr>
                        </tbody>
                    </table>
                    * 아이핀 인증인 경우 : 아이핀번호<br>
                    * 서비스 이용 또는 사업처리 과정에서 생성/수집되는 정보<br>
                    * 기타 H.Point 서비스의 제공·관리 및 이를 위해 제휴사로부터 수집하는 회원정보, 기타 상담 등을 통해 생성되는 정보<br><br>
                    보유·이용기간<br>
                    탈퇴신청후, 탈퇴확정시 까지
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : H.Point - 개인정보 수집&middot;이용 동의 -->

    <!-- 팝업 : H.Point - H.Point 제휴사에 대한 개인정보 제공 동의// -->
    <div id="popPolicyJoin7" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>H.Point 제휴사에 대한 개인정보 제공 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    ⊙ 제공받는 자 : ㈜현대백화점, ㈜현대홈쇼핑, ㈜한섬, ㈜현대렌탈케어, ㈜현대IT&amp;E, ㈜ 현대드림투어, ㈜현대그린푸드, ㈜현대리바트, ㈜HCN, ㈜
                    현대백화점면세점<br><br>
                    제공받는 자의 이용 목적<br>
                    포인트 적립·사용에대한 승인 및 정산, 기타 H.Point 멤버십 관련 서비스 제공, 웹사이트 로그인 서비스, 고객응대(문의, 컴플레인 처리 등)<br><br>
                    제공할 개인정보 항목<br>
                    <div class="infotxt">
                        <ul>
                            <li>이름, 생년월일, 성별, 내외국인구분, 통신사, 휴대폰번호, CI,고객번호, 통합아이디, 통합비밀번호, Email, 회원상태</li>
                            <li>H.Point 서비스 과정중 발생한 거래정보 : H.Point 카드번호, 거래일시, 구매정보, 결제정보, 잔여 포인트, 제휴사포인트</li>
                        </ul>
                    </div>
                    ※ 최초 가입정보 및 이후 변경정보 포함<br><br>
                    보유·이용기간<br>
                    회원탈퇴시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)<br><br>
                    ⊙ 제공받는 자 : 교보문고<br><br>
                    제공받는 자의 이용 목적<br>
                    포인트의 적립/사용에 대한 승인 및 정산, H.Point 멤버십 관련 제휴 업무의 수행<br><br>
                    제공할 개인정보 항목<br>
                    H.Point 카드번호, 포인트 사용/적립 내역<br><br>
                    보유·이용기간<br>
                    회원탈퇴시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)<br><br>
                    ⊙ 제공받는 자 : 국민카드 (제휴신용카드 가입시)<br><br>
                    제공받는 자의 이용 목적<br>
                    제휴신용카드 포인트 적립/사용에 대한 승인 및 정산, H.Point관련 제휴 업무<br><br>
                    제공할 개인정보 항목<br>
                    CI, 고객번호, 회원상태, H.Point카드번호, 잔여 포인트<br><br>
                    보유·이용기간<br>
                    회원탈퇴시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)<br><br>
                    ⊙ 제공받는 자 : ㈜SK플래닛, ㈜카카오페이, ㈜KT, ㈜삼성전자, ㈜NHN, ㈜하나카드<br><br>
                    제공받는 자의 이용 목적<br>
                    멤버십 월렛 서비스 운영<br><br>
                    제공할 개인정보 항목<br>
                    고객번호, 회원상태, H.Point카드번호, 적립포인트, 사용포인트<br><br>
                    보유·이용기간<br>
                    회원탈퇴시<br><br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)<br>
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : H.Point - H.Point 제휴사에 대한 개인정보 제공 동의 -->

    <!-- 팝업 : H.Point - 제휴사 이벤트&middot;상품안내를 위한 제3자 제공 동의// -->
    <div id="popPolicyJoin8" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>제휴사 이벤트·상품안내를 위한 제3자 제공 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    제공받는 자<br>
                    H.Point제휴사 中, 현대백화점그룹 계열사에 대한 제공 : ㈜ 현대홈쇼핑, ㈜ 한섬, ㈜ 렌탈케어, ㈜ 현대그린푸드, ㈜ 현대드림투어, ㈜ 현대리바트, ㈜ 현대HCN, ㈜
                    현대백화점면세점<br><br>
                    제공받는 자의 이용 목적<br>
                    H.Point회원에 대한 이벤트 제공 및 클럽가입및 상태에 대한 서비스제공 각종 신상품 또는 서비스 홍보및 판매권유 소개, 판촉행사 안내, 통신판매, 여행업무, 이용권유 등 마케팅
                    활동 시장조사 및 상품개발 연구<br><br>
                    제공할 개인정보 항목<br>
                    휴대폰번호, Email<br><br>
                    보유·이용기간<br>
                    회원탈퇴시 또는 제3자 정보제공 철회 시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : H.Point - 제휴사 이벤트&middot;상품안내를 위한 제3자 제공 동의 -->

    <!-- 팝업 : H.Point - 금융정보 안내를 위한 제3자 제공 동의// -->
    <div id="popPolicyJoin9" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>금융정보 안내를 위한 제3자 제공 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    제공받는 자<br>
                    ㈜ 현대홈쇼핑<br><br>
                    제공받는 자의 이용 목적<br>
                    전화상담을 통한 보험, 상조, 렌탈, 상품 안내<br><br>
                    제공할 개인정보 항목<br>
                    이름, 생년월일, 성별, 휴대폰번호<br><br>
                    보유·이용기간<br>
                    회원탈퇴시 또는 제3자 정보제공 철회 시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)<br><br>
                    제공받는 자<br>
                    한화손해보험㈜, 현대해상화재보험㈜, 흥국화재㈜<br><br>
                    제공받는 자의 이용 목적<br>
                    보험, 상조 등 금융상품 안내, 판매 및 모집을 위한 텔레마케팅, SMS, Email 등 발송 및 서비스 가입시 가입처리<br><br>
                    제공할 개인정보 항목<br>
                    CI, 고객번호, 이름, 생년월일, 성별, 휴대폰번호, Email<br><br>
                    보유·이용기간<br>
                    회원탈퇴시 또는 제3자 정보제공 철회 시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : H.Point - 금융정보 안내를 위한 제3자 제공 동의 -->

    <!-- 팝업 : H.Point - 제휴신용카드 안내를 위한 제3자 제공 동의// -->
    <div id="popPolicyJoin10" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>제휴신용카드 안내를 위한 제3자 제공 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    제공받는 자<br>
                    국민카드<br><br>
                    제공받는 자의 이용 목적<br>
                    제휴카드 상품 안내 및 정보제공 동의/해지 관리<br><br>
                    제공할 개인정보 항목<br>
                    CI, 이름, 생년월일, 휴대폰번호<br><br>
                    보유·이용기간<br>
                    회원탈퇴시 또는 제3자 정보제공 철회 시<br>
                    (단, 탈퇴확정후에는 위에 기재된 이용 목적과 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의무이행을 위하여 필요한 범위내에서만 보유·이용됩니다.)
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : H.Point - 제휴신용카드 안내를 위한 제3자 제공 동의 -->

    <!-- 팝업 : 마케팅을 위한 개인정보 수집&middot;이용 동의(H.Point)// -->
    <div id="popPolicyJoin11" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>마케팅을 위한 개인정보 수집·이용 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    수집·이용목적<br>
                    프렌즈 서비스 이용,사은/판촉행사 등 각종 이벤트 행사 관련 정보안내 및 제반 마케팅 활동, 당사 및 제휴사 상품/서비스 안내 및 권유, 현대백화점카드 가입안내, 고지사항 안내,
                    혜택 및 서비스 개발을 위한 통계분석 및 연구조사, 여행, 통신판매 등 백화점카드 외사의 부수업무 관련 마케팅 활동, 당사가 보험대리점 자격으로 행하는 위탁 보험상품 소개, 판매,
                    보험서비스 제공에 활용하거나 보험개발원 전산망의 보험 정보 조회 목적으로 활용<br><br>
                    수집·이용할 항목<br>
                    필수 수집·이용에 동의한 정보, H.Point제휴사를 통해 수집되는 구매내역 중 선택적 수집.이용목적에 필요한 최소한의 정보(서비스,수량,구매금액)<br><br>
                    보유·이용기간<br>
                    탈퇴시 또는 동의 철회시까지
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 마케팅을 위한 개인정보 수집&middot;이용 동의(H.Point) -->

    <!-- 팝업 : 마케팅을 위한 개인정보 수집&middot;이용 동의(식품몰)// -->
    <div id="popPolicyJoin12" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>마케팅을 위한 개인정보 수집·이용 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">
                    수집·이용목적<br>
                    신규 서비스/상품안내/마케팅, 현금영수증 발급, 앱설치 URL 전송 등<br><br>
                    수집·이용할 항목<br>
                    이메일, 휴대폰번호, 성별, 스페셜데이<br><br>
                    보유·이용기간<br>
                    탈퇴시 또는 동의 철회시까지
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 마케팅을 위한 개인정보 수집&middot;이용 동의(식품몰)  -->

    <!-- 팝업 : 언커먼스토어 서비스 이용을 위한 개인정보 수집이용 동의 (언커먼스토어 소스 추가:20201209 유재연) -->
    <div id="popPolicyJoin13" class="popup poppolicyjoin">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>언커먼스토어 서비스 이용을 위한 개인정보 수집·이용 동의</h2>
            </header>

            <div class="contents">
                <div class="scrollbox">

                    <p>언커먼스토어에서는 자동결제 서비스를 제공하기 위해서 필요한 회원님의 필수 정보를 아래와 같이 수집, 이용하고자 하니 이에 동의해주시기를 부탁드립니다.</p>
                    <br>

                    <table class="tbl-guide">
                        <caption>수집·이용목적 표</caption>
                        <colgroup>
                            <col style="width:25%;">
                            <col style="width:25%;">
                            <col style="width:25%;">
                            <col style="width:25%;">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">구분</th>
                            <th scope="col">수집·이용 목적</th>
                            <th scope="col">수집·이용 항목</th>
                            <th scope="col">보유·이용 기간</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>현대식품관 to home</td>
                            <td>언커먼스토어 (더현대 서울) 서비스 이용 및 상담</td>
                            <td>
                                ID, 성명, 휴대폰번호<br>
                                상담 시 : 상담내용 음성 녹취<br>
                                ※ H.Point 통합회원인 경우통합고객번호, 통합 아이디
                            </td>
                            <td>회원탈퇴 시 또는 법정보유기간</td>
                        </tr>
                        <tr>
                            <td>
                                오프라인 매장<br>
                                (더현대 서울 언커먼스토어)
                            </td>
                            <td>매장 입장, 퇴장, 구매 행위 확인</td>
                            <td>
                                ID, 매장 방문 일시, 구매내역,<br>
                                언커먼스토어 이용 영상<br>
                                ※ H.Point 통합회원인 경우 통합 아이디
                            </td>
                            <td>
                                회원탈퇴 시 또는 법정보유기간<br>
                                단, 영상정보는 30일간 보관 후 폐기
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    ※ 정보 수집 및 이용에 대한 동의를 거부하실 수 있으나, 거부하실 경우 언커먼스토어 서비스 이용이 제한될 수 있습니다.
                </div>
            </div>
        </div>
    </div>
    <!-- //팝업 : 언커먼스토어 서비스 이용을 위한 개인정보 수집이용 동의 -->

    <!-- //20200605 -->
    <!-- //팝업 : 동의  -->
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
        <button type="button" class="btn-top" onclick="GA_Event('PC_공통', 'TOP', 'TOP');" style="right: -30px;">TOP
        </button>
        <!-- //topbtn -->
    </footer>
    <!--지급보증서 팝업-->
    <div id="guaranteePopup" class="popup">
        <div class="inner guarantee">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>
            <header>
                <h2>지급보증서</h2>
            </header>
            <div class="contents">
                <h3 class="hide"><strong>확인서 보기</strong></h3>
                <div>
                    <img src="/UIUX/w/pjtCom/images/common/guarantee_2022.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- //footer -->

</div>
</body>
</html>
