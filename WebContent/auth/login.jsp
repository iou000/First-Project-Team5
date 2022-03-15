<!-- @author 김지혜 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
    <link rel="stylesheet" href="css/member.css">
</head>
<body>
<div id="wrap" class="member login">
    <!-- header// -->
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
                    <a href="app?command=login_form">로그인</a>
                    <a href="app?command=join_form">회원가입</a>
                    <!-- //util : 로그인 전 -->


                    <a href="/front/dp/dpf/customerCenterMain.do">고객센터</a>
                </div>

            </div>
            <!-- //toparea -->
        </div>
    </header>
    <!-- header// -->

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>로그인</h2>
            <p class="txt">레시피를 구해워 전용회원은 아이디를 입력해 주세요.</p>

            <form method="post" action="app?command=login">
                <input type="hidden" name="redirectUrl" value="https://tohome.thehyundai.com/front?UseCache=N">
                <input type="hidden" name="popupYn" value="N"> <input type="hidden" name="token"> <input type="hidden"
                                                                                                         name="snsType">
                <input type="hidden" name="hpointTabYn" value="N"> <input type="hidden" name="autoCheck"
                                                                          value="13FEC6BBD117642CCE00E69A79DA235B">
                <input type="hidden" name="august" value="417F1A65770DA6CE3D19D26AC68C4A2E"> <input type="hidden"
                                                                                                    name="autoCheck"
                                                                                                    value="">
                <fieldset class="form-field">
                    <legend class="hide">로그인</legend>

                    <ul>
                        <li><label class="form-entry"> <input type="text" id="id" name="username" class="big"
                                                              title="아이디 입력"
                                                              placeholder="아이디" value=""
                        >
                            <button type="button" class="btn-del" tabindex="-1">삭제</button>
                        </label></li>
                        <li><label class="form-entry"> <input type="password" id="pwd" name="password" class="big"
                                                              title="비밀번호 입력" placeholder="비밀번호" value=""
                        >
                            <button type="button" class="btn-del" tabindex="-1">삭제</button>
                        </label></li>
                    </ul>

                    <label class="form-save"><input type="checkbox" id="idSaveYn" name="idSaveYn" class="big"
                                                    checked=""><span>아이디저장</span></label>
                    <!-- <label class="form-save" id='autoLoginLabel' style='display: none'><input type="checkbox" id='autoLoginYn'  class="big"><span>자동로그인</span></label> -->

                    <ul class="btn-group login-surport">
                        <li><a href="app?command=join_form">회원가입</a></li>
                        <%--                        아이디 비밀번호 찾기 우선 보류--%>
                        <li><a href="/front/cua/front/findIdPwd.do">아이디/비밀번호
                            찾기</a></li>
                    </ul>

                    <button type="submit" class="btn fill big black" onclick="goLogin();">로그인</button>
                </fieldset>
            </form>
        </div>
    </div>
    <!-- //contents -->

    <!-- 팝업 : 비밀번호 오류횟수 5회 초과// -->
    <div id="popPwReset" class="popup small poppwreset">
        <div class="inner">
            <div class="contents">
                <h3>
                    <strong>비밀번호를 다섯 번 넘게 <br>잘못 등록하셨습니다.
                    </strong>
                </h3>
                <p class="txt">
                    개인정보 보호를 위해 본인 확인이 필요합니다.<br>새로운 비밀번호를 발급받아 <br>다시 로그인
                    해주시기 바랍니다.
                </p>
            </div>

            <footer>
                <div class="btns">
                    <button type="button" class="btn middle lightgray btn-cancel" onclick="javascript:fn.popupClose();">
                        취소
                    </button>
                    <button type="button" class="btn fill middle black btn-confirm"
                            onclick="javascript:processType=0;openMobileCert();">비밀번호
                        재설정
                    </button>
                </div>
            </footer>
        </div>
    </div>
    <!-- //팝업 : 비밀번호 오류횟수 5회 초과 -->

    <!-- 팝업 : 비밀번호 초기화// -->
    <div id="popPwReset2" class="popup small poppwreset">
        <div class="inner">
            <div class="contents">
                <h3>
                    <strong>비밀번호 초기화 대상입니다.</strong>
                </h3>
                <p class="txt">
                    개인정보보호를 위해 본인 확인 후 로그인 가능합니다.<br>새 비밀번호를 재설정 해주시기 바랍니다.
                </p>
            </div>

            <footer>
                <div class="btns">
                    <button type="button" class="btn middle lightgray btn-cancel" onclick="javascript:fn.popupClose();">
                        취소
                    </button>
                    <button type="button" class="btn fill middle black btn-confirm"
                            onclick="javascript:processType=0;openMobileCert();">비밀번호
                        재설정
                    </button>
                </div>
            </footer>
        </div>
    </div>
    <!-- //팝업 : 비밀번호 초기화 -->


    <!-- 팝업 : 아이디/비밀번호 찾기 qq//
    <div id="p_popSearchCertify" class="popup popjoincertify">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>본인인증</h2>
            </header>

            <div class="contents">
                <h3>아이디/비밀번호가 기억나지 않으세요?</h3>
                <div class="txt">회원가입 시 인증한 휴대폰번호로<br>아이디 확인 및 비밀번호 재설정이 가능합니다.</div>

                <button type="button" class="btn fill middle black">휴대폰 인증</button>
            </div>
        </div>
    </div>-->
    <!-- //팝업 : 아이디/비밀번호 찾기 휴대폰인증 -->

    <div id="popPwChange" class="popup poppwchange">
        <div class="inner">
            <header>
                <h2>비밀번호 변경</h2>
            </header>
            <form id="mainform" name="mainform">
                <input type="hidden" name="nextChange">
                <div class="contents">
                    <h3>
                        개인정보 보호를 위해<br>비밀번호를 변경해주세요.
                    </h3>
                    <p class="txt">
                        회원님의 개인정보를 안전하게 보호하고, 개인정보 도용으로 인한<br>피해를 방지하기 위해 비밀번호 변경을
                        안내해드리고 있습니다.
                    </p>

                    <fieldset class="form-field">
                        <legend class="hide">비밀번호 입력</legend>

                        <ul>
                            <li><label class="form-entry"> <input type="password" id="OPWD" name="PWD"
                                                                  title="현재 비밀번호 입력" placeholder="현재 비밀번호">
                                <button type="button" class="btn-del" tabindex="-1">삭제</button>
                            </label></li>

                            <li><label class="form-entry"> <input type="password" id="PWD1" name="NEW_PWD"
                                                                  title="새 비밀번호 입력" placeholder="새 비밀번호">
                                <button type="button" class="btn-del" tabindex="-1">삭제</button>
                            </label>
                                <div class="infotxt">
                                    <ul>
                                        <li>영문, 숫자, 특수문자를 포함하여 8~ 30자 사용 가능</li>
                                        <li>연속된 3자리 이상의 숫자, 문자는 사용 불가</li>
                                    </ul>
                                </div>
                            </li>

                            <li class="pw"><label class="form-entry"> <input type="password" id="PWD2" name="NEW_PWD2"
                                                                             title="새 비밀번호 확인 입력"
                                                                             placeholder="새 비밀번호 확인">
                                <button type="button" class="btn-del" tabindex="-1">삭제</button>
                            </label>
                                <div class="infotxt">
                                    <ul>
                                        <li>비밀번호를 다시 입력해 주세요.</li>
                                    </ul>
                                </div>
                            </li>
                        </ul>

                        <!--
                            메세지 띄우기 : fn.inputMsg('input ID명', '에러 메세지'); / fn.inputMsg('input ID명', '긍정 메세지', true);
                            특정 메세지 지우기 : fn.inputMsgClear('input ID명');
                            전체 메세지 지우기 : fn.inputMsgClear();
                        -->
                        <div class="btns">
                            <button type="button" class="btn black" onclick="javascript:updatePwd('N');">비밀번호 변경
                            </button>
                            <button type="button" class="btn fill black" onclick="javascript:updatePwd('Y');">다음에 변경
                            </button>
                        </div>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
    <!-- //팝업 : 비밀번호 변경 -->

    <!-- footer// -->
    <footer id="footer"></footer>
</div>
<script>
    $(document).ready(function () {
        fnDawnBizpCrstList('190');
    });

    function fnDawnBizpCrstList(dptsBrnCd) {

        $.ajax({
            type    : 'get',
            data    : {'dptsBrnCd': dptsBrnCd},
            url     : '/front/dp/dpa/bizpCrstList.do',
            dataType: 'json',
            success : function (data, status, xhr) {
                if (data != null) {
                    var tHtml = '';
                    tHtml += "<strong>" + data.bizpNm + "</strong><br>";
                    tHtml += "<span>대표이사 : " + data.ceoNm + "</span>";
                    tHtml += "<span> 주소 : " + data.bizpAdr + "</span><br>";
                    tHtml += "이메일 : " + data.repEmailAdr + " (제휴 문의, 02-6904-0761) <br>";
                    tHtml += "사업자 등록번호 : " + data.rgno1 + "-" + data.rgno2 + "-" + data.rgno3 + "<a href='#' onclick=\"javascript:fnAppLoad('" + data.bscmInfIdnfNm + "');return false;\">사업자등록확인</a><br>";
                    tHtml += "통신판매업자 신고번호 : " + data.tlmkMngNo + "<br>";
                    tHtml += "<p class='essential-info'><em>식품관 투홈의 개별 판매자가 등록한 상품(브랜드직송) 상품에 대한 광고, 상품주문, 배송, 환불의 의무와 책임은 각 판매자가 부담하고,<br>";
                    tHtml += "현대식품관 투홈은 통신판매 중개자로서의 의무와 책임을 다합니다.</em><br>";
                    tHtml += "고객님의 안전거래를 위해 현금결제 시 KG이니시스 구매안전 서비스를 이용하실 수 있습니다.";
                    tHtml += "<button type='button' class='confirm-btn' onclick=fn.popupOpen('#guaranteePopup') ;>서비스 가입사실 확인</button></p>";
                    tHtml += "<small class='copyright'>Copyright &copy; Hyundai Department Store. All rights reserved.</small>";
                    $("#fnDawnBizpCrstList").html(tHtml);
                }
            }
        });
    }

    function fnAppLoad(url) {
        if (url != null && url != '') {
            var ret = window.open(url);
        }
    }

    function goLogin() {

    }
</script>
</body>
</html>