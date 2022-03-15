<!-- @author 김지혜 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
    <link rel="stylesheet" href="css/member.css">
</head>
<body>
<div id="wrap" class="member joinstep2">

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

    <!-- contents// -->
    <div id="contents">
        <div class="innercon">
            <h2>현대식품관 회원가입</h2>

            <div class="linearea">
                <h3>가입정보를 입력해 주세요.</h3>
                <form name="mainform" method="post" action="app?command=join">
                    <fieldset class="form-field hpoint">
                        <legend class="tit">회원정보<small><span class="need">*</span> 필수입력사항</small></legend>

                        <ul>
                            <li>
                                <label class="form-entry inline">
                                    <strong class="ti">이메일<span class="need">*<span
                                            class="hide">필수</span></span></strong>
                                    <input type="text" class="big" id="ITNT_ID" name="username" title="아이디"
                                           placeholder="아이디">
                                    <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                    <!--
                                        메세지 띄우기 : fn.inputMsg('input ID명', '에러 메세지'); / fn.inputMsg('input ID명', '긍정 메세지', true);
                                        특정 메세지 지우기 : fn.inputMsgClear('input ID명');
                                        전체 메세지 지우기 : fn.inputMsgClear();
                                    -->
                                    <button type="button" class="btn fill big gray" onclick="javascript:idCheck();">
                                        중복확인
                                    </button>
                                </label>
                                <div class="infotxt">
                                    <ul>
                                        <li>아이디 중복 확인은 필수입니다.</li>
                                    </ul>
                                </div>
                            </li>

                            <li>
                                <label class="form-entry">
                                    <strong class="ti">비밀번호<span class="need">*<span
                                            class="hide">필수</span></span></strong>
                                    <input type="password" class="big" name="password" id="PWD" title="비밀번호 입력"
                                           placeholder="비밀번호">
                                    <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                </label>
                                <div class="infotxt">
                                    <ul>
                                        <li>영문, 숫자, 특수문자를 포함하여 8~30자 사용 가능</li>
                                        <li>연속된3자리 이상의 숫자,문자는 사용 불가</li>
                                    </ul>
                                </div>
                            </li>

                            <li class="pw">
                                <label class="form-entry">
                                    <input type="password" class="big" name="pwdCheck" id="PWD2" title="비밀번호 확인 입력"
                                           placeholder="비밀번호 확인">
                                    <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                </label>
                                <div class="infotxt">
                                    <ul>
                                        <li>비밀번호를 다시 입력해주세요.</li>
                                    </ul>
                                </div>
                            </li>

                            <input type="hidden" id="EMAIL_ADR" name="EMAIL_ADR" title="이메일 입력" placeholder="이메일">

                            <input type="hidden" name="POST_NO">
                            <input type="hidden" name="BASE_ADR">
                            <input type="hidden" name="PTC_ADR">

                            <input type="hidden" id="RCMM_CUST_NO" name="RCMM_CUST_NO" value="">
                            <input type="hidden" id="CHK_SEARCH_RCMM" name="CHK_SEARCH_RCMM" value="">
                        </ul>
                    </fieldset>

                    <!--
                        메세지 띄우기 : fn.inputMsg('input ID명', '에러 메세지'); / fn.inputMsg('input ID명', '긍정 메세지', true);
                        특정 메세지 지우기 : fn.inputMsgClear('input ID명');
                        전체 메세지 지우기 : fn.inputMsgClear();
                    -->
                    <div class="btns">
                        <button type="reset" class="btn big black">취소
                        </button>
                        <button type="button" class="btn fill big black" onclick="go_save()">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- //contents -->

    <!-- 팝업 : 주소찾기// -->
    <script>
        $(document).ready(function () {
            $("#noDateDiv").show();
            $("#dateDiv").hide();

            $(document).keypress(function (e) {
                if (e.keyCode == 13)
                    e.preventDefault();
            });

            $("#keyword").keypress(function (e) {
                if (e.which == 13)
                    fnSearch('1');
            });

            $("#onSearchBtn").click(function () {
                fnSearch('1');
            });

            $("#searchMore").click(function () {
                fnSearch();
            });

            if ('1' == '1') {
                $('#male').addClass("active");
            } else if ('1' == '2') {
                $('#female').addClass("active");
            }

            $("#SEARCH_RCMM_TXT").keypress(function (e) {
                if (e.which == 13)
                    recommendCustSearch();
            });

            $('#RDNM_PTC_ADR').change(function () {
                var zipno = $('input[name=POST_NO]').val();
                if (zipno != '') {
                    $('#ADD_DSTN').prop("checked", true);
                    $('#ADD_DSTN').prop("disabled", false);
                } else {
                    $('#ADD_DSTN').prop("checked", false);
                    $('#ADD_DSTN').prop("disabled", true);
                }
                $('input[name=PTC_ADR]').val($('input[name=RDNM_PTC_ADR]').val());       // 도로명 지번 상세주소 동일하게 변경
                $('#addAddrListLabel').show();
            });
        });

        $('#male').click(function () {
            $('#male').addClass("active");
            $('#female').removeClass("active");
            $('input[name=SEX_GBCD]').val('1');

        });
        $('#female').click(function () {
            $('#female').addClass("active");
            $('#male').removeClass("active");
            $('input[name=SEX_GBCD]').val('2');
        });

        function fnSearch(currentPage) {
            if (currentPage == undefined) {
                currentPage = Number($("input[name=currentPage]").val()) + 1;
            }
            $("input[name=currentPage]").val(currentPage);

            $.ajax({
                url : "https://tohome.thehyundai.com/front/cob/selectRoadNameAddressList.do",
                type: "get",
                data: $("#form").serialize()
                //,dataType:"jsonp"
                ,
                clossDomain: true,
                async      : false,
                success    : function (obj) {
                    console.log(obj);

                    if (currentPage == 1) {
                        $("#shippingUl").html('');
                        $("#dataCnt").text($(obj).find('totalCount').text());
                        if ($(obj).find('totalCount').text() > 0) {
                            $("#noDateDiv").hide();
                            $("#dateDiv").show();
                            $("#addrtip").hide();
                        } else {
                            $("#noDateDiv").show();
                            $("#dateDiv").hide();
                        }

                    }
                    var objItem = '';
                    $(obj).find('juso').each(function () {
                        objItem += '<li onclick="javascript:setAddr(\'' + $(this).find('zipNo').text() + '\', \'' + $(this).find('roadAddr').text() + '\', \'' + $(this).find('jibunAddr').text() + '\')">                                                   ';
                        objItem += '    <button type="button">                                ';
                        objItem += '        <span class="txt-zipcode">' + $(this).find('zipNo').text() + '</span>            ';
                        objItem += '        <strong>' + $(this).find('roadAddr').text() + '</strong> ';
                        objItem += '        <span class="txt-zipaddr">지번</span>' + $(this).find('jibunAddr').text() + '';
                        objItem += '    </button>                                             ';
                        objItem += '</li>                                                     ';

                    });
                    $("#shippingUl").append(objItem);
                },
                error      : function (xhr, status, error) {

                }
            });
        }

        function setAddr(zipno, roadAddr, jibunAddr) {
            $('input[name=POST_NO]').val(zipno);
            $('input[name=BASE_ADR]').val(jibunAddr);
            //$('input[name=PTC_ADR]').val('');
            $('input[name=RDNM_POST_NO]').val(zipno);
            $('input[name=RDNM_BASE_ADR]').val(roadAddr);
            $('input[name=RDNM_PTC_ADR]').val('');
            if (zipno != '') {
                $('#ADD_DSTN').prop("checked", true);
                $('#ADD_DSTN').prop("disabled", false);
            } else {
                $('#ADD_DSTN').prop("checked", false);
                $('#ADD_DSTN').prop("disabled", true);
            }

            fn.popupClose();
        }

        function callbackAddress(addrObj) {

            setAddr(addrObj.rdnmPostNo, addrObj.rdnmBaseAdr, addrObj.dstnBaseAdr);
        }
    </script>
    <div id="popDeliveryAddr" class="popup popdeliveryaddr">
        <div class="inner">
            <button type="button" class="btn-close" onclick="javascript:fn.popupClose();">닫기</button>

            <header>
                <h2>주소찾기</h2>
            </header>

            <div class="contents">
                <form id="form" name="form">
                    <input type="hidden" name="currentPage" value="1">
                    <input type="hidden" name="countPerPage" value="10">

                    <fieldset>
                        <legend class="hide">주소 검색</legend>
                        <div class="contarea zipsearch">

                            <!-- 앱에서만 버튼 노출 -->
                            <label class="form-entry">
                                <input type="text" id="keyword" name="keyword" class="big" title="도로명, 지번, 건물명 입력"
                                       placeholder="도로명, 지번, 건물명">
                                <button type="button" class="btn-del" tabindex="-1">삭제</button>
                                <button type="button" class="btn-search" id="onSearchBtn">검색</button>
                            </label>

                            <div class="infotxt active" id="addrtip">
                                <strong>주소검색 TIP</strong>
                                <ul>
                                    <li>도로명+건물번호 : 압구정로 201</li>
                                    <li>지번 : 압구정동458</li>
                                    <li>건물명 : 현대백화점</li>
                                </ul>
                            </div>
                        </div>
                    </fieldset>
                </form>

                <!-- 검색 결과 없을때// -->
                <div class="contarea zip-list" id="noDateDiv" style="display: block;">
                    <div class="nodata">검색결과가 없습니다.</div>
                </div>
                <!-- //검색 결과 없을때 -->

                <!-- 검색 결과// -->
                <div class="contarea zip-list" id="dateDiv" style="display: none;">
                    <h4>
                        검색한 결과 총
                        <strong>
                            <em>
                                <span id="dataCnt">0</span>
                            </em>
                            건
                        </strong>
                    </h4>
                    <div class="scrollbox">
                        <ul id="shippingUl">
                        </ul>
                    </div>
                    <button type="button" class="btn more" id="searchMore">더보기</button>
                </div>
                <!-- //검색 결과 -->
            </div>
        </div>
    </div>
    <!-- //팝업 : 주소찾기 -->

    <!-- 팝업 : 추천인 확인 결과// -->
    <div id="popRecomResult" class="popup small poprecomresult">
        <!-- <div class="inner" style="top: 178px;"> -->
        <div class="inner">
            <div class="contents">
                <h3>
                    <strong>
                        <span id="rcmmSearchResultCnt"></span>
                        명의 추천인이 존재합니다.
                    </strong>
                </h3>

                <div class="id">
                    <div>
                        <div id="rcmmSearchResult">
                            <span>추천인 아이디</span>

                        </div>
                    </div>
                </div>
                <p class="txt">
                    찾는 추천인이 맞으시면<br>선택 후 "추천인등록" 버튼을 눌러주세요.
                </p>
            </div>

            <footer>
                <div class="btns">
                    <button type="button" class="btn fill middle lightgray btn-cancel"
                            onclick="javascript:fn.popupClose();">취소
                    </button>
                    <button type="button" class="btn fill middle black btn-confirm"
                            onclick="javascript:selectRcmmCust()">확인
                    </button>
                </div>
            </footer>
        </div>
    </div>
    <!-- //팝업 : 추천인 확인 결과 -->
</div>
<jsp:include page='<%="../footer.jsp" %>'/>
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
<script>
    function go_save() {
        if (document.mainform.username.value === "") {
            alert("아이디를 입력하여 주세요.");
            document.mainform.username.focus();
        } else if (document.mainform.password.value === "") {
            alert("비밀번호를 입력해 주세요.");
            document.mainform.password.focus();
        } else if ((document.mainform.password.value !== document.mainform.pwdCheck.value)) {
            alert("비밀번호가 일치하지 않습니다.");
            document.mainform.password.focus();
        } else {
            document.mainform.action = "app?command=join";
            document.mainform.submit();
        }
    }
</script>
</body>
</html>