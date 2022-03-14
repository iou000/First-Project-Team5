<!-- @author 김지혜 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<%--<%@ include file="sub_img.html"%> --%>
<%--<%@ include file="sub_menu.html" %>--%>
<div id="wrap" class="member login">
    <!-- header// -->


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
                <h1><a href="/front/dp/dpa/dawnHome.do"><img src="/UIUX/w/pjtCom/images/temp/header_logo_freex34.png"
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
            <h2>로그인</h2>
            <p class="txt">현대식품관 전용회원은 아이디를 이메일로 입력해 주세요.</p>

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
                        <li><label class="form-entry"> <input type="text" id="id" name="id" class="big" title="아이디 입력"
                                                              placeholder="아이디" value=""
                                                              onkeydown="javascript:fn.inputMsgClear('#id');">
                            <button type="button" class="btn-del" tabindex="-1">삭제</button>
                        </label></li>
                        <li><label class="form-entry"> <input type="password" id="pwd" name="pwd" class="big"
                                                              title="비밀번호 입력" placeholder="비밀번호" value=""
                                                              onkeydown="javascript:fn.inputMsgClear('#pwd');">
                            <button type="button" class="btn-del" tabindex="-1">삭제</button>
                        </label></li>
                    </ul>

                    <label class="form-save"><input type="checkbox" id="idSaveYn" name="idSaveYn" class="big"
                                                    checked=""><span>아이디저장</span></label>
                    <!-- <label class="form-save" id='autoLoginLabel' style='display: none'><input type="checkbox" id='autoLoginYn'  class="big"><span>자동로그인</span></label> -->

                    <ul class="btn-group login-surport">
                        <li><a href="/front/cua/front/joinStep1.do?publicYn=Y">회원가입</a></li>
                        <li><a href="/front/cua/front/findIdPwd.do">아이디/비밀번호
                            찾기</a></li>
                    </ul>

                    <!--
                        메세지 띄우기 : fn.inputMsg('input ID명', '에러 메세지'); / fn.inputMsg('input ID명', '긍정 메세지', true);
                        특정 메세지 지우기 : fn.inputMsgClear('input ID명');
                        전체 메세지 지우기 : fn.inputMsgClear();
                    -->
                    <button type="button" class="btn fill big black" onclick="javascript:goLogin();">로그인</button>
                    <button type="button" class="btn black big btn-kakao" id="kakaoLoginBtn"
                            onclick="javascript:goKakaoLogin();" style="margin-top: 10px">카카오 로그인
                    </button>
                </fieldset>
            </form>

            <!-- 20190709 카카오로그인샘플 S-->
            <form name="kakaoForm" id="kakaoForm" autocomplete="off">
                <input type="hidden" id="prtnrId" name="prtnrId" value="D010"> <input type="hidden" id="chnnlId"
                                                                                      name="chnnlId" value="1002">
                <input type="hidden" id="kkoRetUrl" name="kkoRetUrl"
                       value="https://tohome.thehyundai.com/front/cua/front/hpKakaoLogin.do?redirectUrl=https://tohome.thehyundai.com/front?UseCache=N">
            </form>
            <!-- 20190709 카카오로그인샘플 E-->


            <button type="button" class="btn fill middle lightgray" onclick="javascript:goNonLoginPage();">비회원 주문조회
            </button>


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

    <!-- 팝업 : H.point미가입자가 카카오 로그인을 진행한 경우// -->
    <div id="popJoinHpoint" class="popup poppwreset">
        <div class="inner">
            <div class="contents">
                <h3>
                    <strong>현대 식품관 미가입 회원입니다.</strong>
                </h3>
                <p class="txt">
                    <br>H.point 회원가입을 진행하시겠습니까?
                </p>
            </div>

            <footer>
                <div class="btns">
                    <button type="button" class="btn black btn-cancel" onclick="javascript:fn.popupClose();">취소</button>
                    <button type="button" class="btn fill black btn-confirm" onclick="javascript:joinPointMember();">
                        확인
                    </button>
                </div>
            </footer>
        </div>
    </div>
    <!-- 팝업 : H.point미가입자가 카카오 로그인을 진행한 경우// -->

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

    <!-- 팝업 : 비회원 주문조회// -->
    <!-- <div id="p_popNonmemberOrder" class="popup popnonmemberorder">
        <div class="inner">
            <button type="button" class="btn-close" onclick="fn.popupClose();">닫기</button>

            <header>
                <h2>비회원 주문조회</h2>
            </header>

            <div class="contents">
                <p class="txt">주문번호와 비밀번호를 입력해 주세요.</p>

                <form>
                    <fieldset class="form-field">
                        <legend class="hide">주문정보 입력</legend>

                        <ul>
                            <li>
                                <label class="form-entry">
                                    <input type="text" id="p_test2" name="" title="주문번호 입력" placeholder="주문번호"><button type="button" class="btn-del">삭제</button>
                                </label>
                            </li>
                            <li>
                                <label class="form-entry">
                                    <input type="password" name="" title="비밀번호 입력" placeholder="비밀번호 (숫자 6자리)"><button type="button" class="btn-del">삭제</button>
                                </label>
                            </li>
                        </ul>


                            메세지 띄우기 : fn.inputMsg('input ID명', '에러 메세지'); / fn.inputMsg('input ID명', '긍정 메세지', true);
                            특정 메세지 지우기 : fn.inputMsgClear('input ID명');
                            전체 메세지 지우기 : fn.inputMsgClear();

                        <button type="button" class="btn fill black" onclick="fn.inputMsgClear();fn.inputMsg('#p_test2', '주문번호를 확인해주세요.');">주문배송조회</button>
                    </fieldset>
                </form>

                <p class="txt-cscenter">주문번호 및 비밀번호가 기억나지 않을 경우<strong>고객센터 1234-5678로 문의해 주세요.</strong></p>
            </div>
        </div>
    </div> -->
    <!-- //팝업 : 비회원 주문조회 -->

    <!-- 팝업 : 휴면계정// -->
    <div id="popDormancyNoti" class="popup small popdormancynoti">
        <div class="inner">
            <div class="contents">
                <h3>
                    <strong>휴면계정</strong>
                </h3>
                <p class="txt">회원님의 계정은 현재 휴면 상태입니다.</p>
                <div class="box">
                    고객님의 계정을 다시 사용하실 수 있습니다.<br>개인정보 유효 기간을 '탈퇴 시까지'로 설정하시면<br>
                    휴면계정 전환 없이 사용 가능합니다.<br>개인정보 유효기간 동의 : 탈퇴 시까지
                </div>
            </div>

            <footer>
                <div class="btns">
                    <button type="button" class="btn fill middle lightgray btn-cancel" onclick="javascript:goCancel();">
                        취소
                    </button>
                    <button type="button" class="btn fill middle black btn-confirm" onclick="javascript:goDormancy();">
                        휴면계정 해제
                    </button>
                </div>
            </footer>
        </div>
    </div>
    <!-- //팝업 : 휴면계정 -->
    <!-- //20200318 -->

    <!-- 팝업 : 휴면계정해제완료// -->
    <div id="popDormancy" class="popup small popdormancy">
        <div class="inner">
            <div class="contents">
                <!-- 20200318// -->
                <h3>
                    <strong>휴면계정</strong>
                </h3>
                <p class="txt">고객님의 계정이 휴면해제 되었습니다.</p>
                <p>
                    개인정보 유효 기간을 탈퇴 시까지<br> 설정하시면 H.Point 혜택이 지급됩니다.<br> <strong>휴면계정
                    전환없이 현대식품관 평생회원이 되어주세요.</strong>
                </p>
                <label><input type="checkbox" name="CUST_VLID_TERM_GBCD"
                              checked=""><span>개인정보 유효기간 동의<small>(탈퇴 시 까지)</small></span></label>
                <!-- //20200318 -->
            </div>

            <footer>
                <button type="button" class="btn fill middle black btn-confirm"
                        onclick="javascript:updateVlidTermGbcd();">확인
                </button>
            </footer>
        </div>
    </div>
    <!-- //팝업 : 휴면계정해제완료 -->

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
    <footer id="footer">


        <script>
            $(document).ready(function () {
                fnDawnBizpCrstList('190');
            });

            function fnDawnBizpCrstList(dptsBrnCd) {

                $.ajax({
                    type: 'get',
                    data: {'dptsBrnCd': dptsBrnCd},
                    url: '/front/dp/dpa/bizpCrstList.do',
                    dataType: 'json',
                    success: function (data, status, xhr) {
                        if (data != null) {
                            var tHtml = '';
                            tHtml += "<strong>" + data.bizpNm + "</strong><br>";
                            tHtml += "<span>대표이사 : " + data.ceoNm + "</span>";
                            tHtml += "<span> 주소 : " + data.bizpAdr + "</span><br>";
                            tHtml += "이메일 : " + data.repEmailAdr + " (제휴 문의, 02-6904-0761) <br>";
                            tHtml += "사업자 등록번호 : " + data.rgno1 + "-" + data.rgno2 + "-" + data.rgno3 + "<a href='#' onclick=\"javascript:fnAppLoad('" + data.bscmInfIdnfNm + "');return false;\">사업자등록확인</a><br>";
                            tHtml += "통신판매업자 신고번호 : " + data.tlmkMngNo + "<br>";
                            tHtml += "<p class='essential-info'><em>현대식품관 투홈의 개별 판매자가 등록한 상품(브랜드직송) 상품에 대한 광고, 상품주문, 배송, 환불의 의무와 책임은 각 판매자가 부담하고,<br>";
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
        </script>
        <!-- footer// -->
        <footer id="footer">
            <div class="util">
                <div class="inner">
                    <a href="/front/dp/dpf/companyIntro.do" class="btn-tohome"
                       onclick="GA_Event('PC_공통', '푸터_메뉴', '브랜드소개');">브랜드소개</a>
                    <a href="/front/dp/dpf/serviceTos.do" onclick="GA_Event('PC_공통', '푸터_메뉴', '이용약관');">이용약관</a>
                    <a href="/front/dp/dpf/personalInfoPolicy.do"
                       onclick="GA_Event('PC_공통', '푸터_메뉴', '개인정보처리방침');"><strong>개인정보처리방침</strong></a>
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
                            판매자가 부담하고,<br>현대식품관 투홈은 통신판매 중개자로서의 의무와 책임을 다합니다.</em><br>고객님의 안전거래를 위해 현금결제 시 KG이니시스 구매안전
                            서비스를 이용하실 수 있습니다.
                            <button type="button" class="confirm-btn" onclick="fn.popupOpen('#guaranteePopup')" ;="">서비스
                                가입사실 확인
                            </button>
                        </p>
                        <small class="copyright">Copyright © Hyundai Department Store. All rights reserved.</small>
                    </div>
                </div>
            </div>

            <!-- topbtn// -->
            <button type="button" class="btn-top" onclick="GA_Event('PC_공통', 'TOP', 'TOP');" style="right: 558px;">TOP
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

    </footer>
    <!-- //footer -->

</div>
<article>
    <h1>Login</h1>
    <form method="post" action="app?command=login">
        <fieldset>
            <legend></legend>
            <label>User ID</label>
            <input name="username" type="text" value="${username}"><br>
            <label>Password</label>
            <input name="password" type="password"><br>
        </fieldset>
        <div class="clear"></div>
        <div id="buttons">
            <input type="submit" value="로그인" class="submit">
            <input type="button" value="회원가입" class="cancel"
                   onclick="location='app?command=join_form'">

            <input type="button" value="아이디 비밀번호 찾기" class="submit"
                   onclick="location='app?command=find_id_form'">
        </div>
    </form>
</article>

<%--<%@ include file="../footer.jsp" %>--%>