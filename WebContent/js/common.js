/*
* Description : cos 공통
* */
//스마트폰에서 다음과 같은 파라미터로 넘어오면 m.thehyundai.com으로 안보낸다.
var smartSitename = document.location.href;
var smartDir ="";
if(smartSitename.indexOf("?") >= 0){
 var cut_param =  smartSitename.split("?");
 if(cut_param[1].indexOf("dir") >= 0){
  smartDir="no";
 }
}

// IE version chk
function getInternetExplorerVersion() {
    var rv = -1;
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var ua = navigator.userAgent;
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null)
              rv = parseFloat(RegExp.$1);
    }

	if ( rv >= 7 ) {
        var trident = navigator.userAgent.match(/Trident\/(\d)/i);
        if(trident != null){
            var trident_ver = trident[0];
            if ( trident_ver == 4 ) {
                return 8
            }
            else if ( trident_ver == 5 ) {
                return 9
            }
            else if ( trident_ver == 6 ) {
                return 10;
            }
            else {
                return rv;
            }
        } else{
            return 7;
        }
    }
    return rv;
}

// 공통팝업 실행
function openPopup(link, name, width, height, scroll, screenWidth, screenHeight) {
	var left = (screenWidth - width) / 2,
		top = (screenHeight - height) / 2;

	var win = window.open(link, name, "width="+width+", height="+height+", left="+left+", top="+top+" toolbar=no, location=no, status=no, menubar=no, scrollbars="+scroll+", directories=no, resizable=no");
	win.focus();
	// Mute: 팝업창 감시를 위해 추가
	return win;
};

/**
 * null check
 * @param value
 * @returns {Boolean}
 */
function isEmpty(value) {
    return (value == null || value == undefined || value == "");
}

/**
 * 로그인 팝업 열기
 * @param redirectUrl 로그인 성공 후 이동할 URL
 * @param callType 호출하는 페이지에 따라 분기처리하기 위한 변수 - 'order' 일 경우 redirectUrl 에 callbackFunction 입력
 */
function openLoginPopup(redirectUrl, callType) {
    var link = serverHost + "/front/cob/loginForm.thd";
    if (!isEmpty(redirectUrl)) {
        link += "?redirectUrl=" + encodeURIComponent(redirectUrl) + (!isEmpty(callType) ? "&callType=" + callType : "");
    }
    location.href = link;
}

/**
 * 비회원 주문조회 팝업 열기
 * @param redirectUrl 로그인 성공 후 이동할 URL
 */
function openNonMemberOrderSearchPopup(redirectUrl) {
    var link = serverHost + "/kr/front/cob/loginPup.thd?nonMemberOrderSearch=true";
    if (!isEmpty(redirectUrl)) {
        link += "&redirectUrl=" + encodeURIComponent(redirectUrl);
    }
    openPopup(link, "loginPup", 580, 450, "yes", $(window).width(), $(window).height());
}

/**
 * 비회원 구매용 로그인 팝업
 * @param redirectUrl 로그인 성공 후 이동할 URL
 */
function openLoginNonMemberPopup(redirectUrl) {
    var link = "/front/cob/loginNonMember.thd";
    if (!isEmpty(redirectUrl)) {
        link += "?redirectUrl=" + encodeURIComponent(redirectUrl);
    }
    location.href = link;
}

function openAdultLoginPopup(redirectUrl) {
    var link = "/front/cob/loginForm.thd";
    if (!isEmpty(redirectUrl)) {
        link += "?redirectUrl=" + encodeURIComponent(redirectUrl) + "&adultCheckYn=Y";
    } else {
        link += "?adultCheckYn=Y"
    }
    location.href = link;
}

/**
 * 페이스북
 * @param title
 * @param image
 * @param shareUrl
 */
function shareFacebook(title, image, shareUrl) {
    if(isEmpty(shareUrl)) {
        shareUrl = location.href;
    }
    var url = "http://www.facebook.com/sharer.php?s=100&p[url]=" + shareUrl + "&p[images][0]=" + image + "&p[title]=" + title;
    url = url.split("#").join("%23");
    url = encodeURI(url);
    window.open(url);

    return false;
}

/**
 * 트위터
 * @param title
 * @param shareUrl
 * @returns {Boolean}
 */
function shareTwitter(title, shareUrl) {
    if(isEmpty(shareUrl)) {
		location.href.search(new RegExp('slitmCd=([^&]+)','g'));
		shareUrl = "http://hmall.kr/?i"+RegExp.$1;
    }
    var url = "http://twitter.com/share?text=";
    var result = window.open(url + encodeURIComponent(title) + " " + encodeURIComponent(shareUrl) , 'twitter', 'width=466, height=356');
    if (result) {
        result.focus();
    }

    return false;
}

/**
 * 미투데이
 * @param title
 * @param tag
 * @param postUrl
 * @returns {Boolean}
 */
function postMe2day(title, tag, postUrl) {
    if(isEmpty(postUrl)) {
        postUrl = location.href;
    }

    if(isEmpty(tag)) {
        tag = "";
    }

    var url = "http://me2day.net/posts/new?new_post[body]=" + encodeURIComponent(title) + " " + encodeURIComponent('"') + encodeURIComponent(postUrl) + encodeURIComponent('"') + "&new_post[tags]=" + encodeURIComponent(tag);
    window.open(url);
    return false;
}

/**
 * 싸이월드
 * @param title
 * @param image
 * @param price
 * @param postUrl
 * @returns {Boolean}
 */
function postCyworld(title, image, price, postUrl) {
    if(isEmpty(postUrl)) {
        postUrl = location.href;
    }

    var url = "http://csp.cyworld.com/bi/bi_recommend_pop.php?url=" + encodeURIComponent(postUrl) + "&title_nobase64=" + encodeURIComponent(title) +"&summary_nobase64=" + encodeURIComponent(title) +"&thumbnail="+ encodeURIComponent(image)+"&writer="+ encodeURIComponent('더현대닷컴')+"&div_code=shop&tag4="+price;
    var result = window.open(url, 'nate', 'width=400,height=364,scrollbars=no,resizable=no');
    if (result) {
        result.focus();
    }

    return false;
}

/**
 * Input will add commas to numbers.
 * @type void
 * @param nNumber   Input value
 * @param nDetail   Decimal places.(rounding)
 * @return          Number contained a comma.
 */
function gfn_appendComma(nNumber,nDetail) {
    if (nNumber == null)    return "";
    if (nDetail == null)    nDetail = 0;

    nNumber             = parseFloat(nNumber);
    nNumber             = Math.round(nNumber, nDetail);
    
    var minusFlag = false;
    if(nNumber < 0) {
    	nNumber = nNumber *-1;
    	minusFlag = true;
    }
    
    var strNumber       = new String(nNumber);
    var arrNumber       = strNumber.split(".");
    var strFormatNum    = "";
    var j = 0;

    for (var i = arrNumber[0].length - 1; i >= 0; i--) {
        if (i != strNumber.length && j == 3) {
            strFormatNum = arrNumber[0].charAt(i) + "," + strFormatNum;
            j = 0;
        } else {
            strFormatNum = arrNumber[0].charAt(i) + strFormatNum;
        }
        j++;
    }

    if (arrNumber.length > 1)   strFormatNum = strFormatNum + "." + arrNumber[1];
    
    if (minusFlag) strFormatNum = '-'+strFormatNum ;

    return strFormatNum;
}

function removeComma(val) {
    return val.replace(/,/g, '');
}

function removeCommaNumber(val) {
	if(val == undefined || val == '') return Number(0);
    return Number(val.replace(/,/g, ''));
}

// textarea id, 제한 글자 수, 입력 결과 메세지 저장 ID
function limitCharacters(textid, limit, limitid) {
    // 잆력 값 저장
    var text = $('#'+textid).val();
    // 입력값 길이 저장
    var textlength = text.length;
    if(textlength > limit) {
        alert('최대 '+limit+'자까지 입력가능합니다.');
        //$('#' + limitid).html('글내용을 '+limit+ '자 이상 쓸수 없습니다!');
        // 제한 글자 길이만큼 값 재 저장
        $('#'+textid).val(text.substr(0,limit));
        return false;
    } else {
        //$('#' + limitid).html('쓸수 있는 글자가 '+ (limit - textlength) + ' 자 남았습니다.');
        return true;
    }

    /* 하단을 , jsp상에서 코딩해서 사용하면 됨.
     *
     * // 공통 글자수 제한 체크
		$(function(){
			$('#prop1Cntn').keydown(function(){
    			limitCharacters('prop1Cntn', 10, 'charlimitid');
			})
		});

     */
}

//add comma
function Comma(Num) {
	Num += '';
	Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
	Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
	x = Num.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	    x1 = x1.replace(rgx, '$1' + ',' + '$2');
 return x1 + x2;
}

/**
 * 로그인 체크
 */
function isLogin() {
    var result = 'false';

    $.ajax({
        type: "get"
        ,url: hd.common.url("/cob/isLogin")
        ,dataType: "json"
        ,async: false
        ,success : function(data) {
            if (data.isLogin) {
                result = 'true';
            } else {
                result = 'false';
            }
        }
        ,error: function(data) {
        }
    });

    return result;
}

/**
 * 휴대폰 본인인증 팝업
 * @param formName
 */
function certByMobile(formName) {
    $("form[name='" + formName + "']").submit(function() {
//        window.open("", "DRMOKWindow", "width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250");
//        $(this).attr("target", "DRMOKWindow");
    }).trigger("submit");
}

/**
 * 공인인증서 팝업
 */
function certByPub(formName) {
    $("form[name='" + formName + "']").submit(function() {
        window.open('', 'DRMOKWindow', 'width=420, height=576, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250' );
        $(this).attr("target", "DRMOKWindow");
    }).trigger("submit");
}

/**
 * 아이핀 인증 팝업
 */
function certByIpin(formName, ipinCompany) {
    $("form[name='" + formName + "']").submit(function() {
//        if (ipinCompany == "sci") {
//            window.open('', 'ipinWindow', 'width=450, height=500, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=300, top=200' );
//        } else {
//            window.open('', 'ipinWindow', 'width=450,height=550,top=100,left=100,fullscreen=no,menubar=no,status=no,toolbar=no,titlebar=yes,location=no,scrollbar=no');
//        }
//        $(this).attr("target", "ipinWindow");
    }).trigger("submit");
}


/**
 * 입력창 Byte 체크 최대 까지만 입력가능하게.
 * @param inputObjId
 * @param limitByte
 * @returns {Boolean}
 */
function limitBytes(inputObjId, limitByte){

    /**
     * $(function(){
            $('#atclCntn').keyup(function(){
                limitBytes('atclCntn', 1000);
            })
        });
     */

    var iByteLength = getByteLength($("#" + inputObjId).val());

    if(iByteLength > limitByte){
        alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
        $("#" + inputObjId).val("");
        return false;
    }
}

/**
 * 이메일 형식 유효성 검사
 * @param email
 * @returns {Boolean} 유효한 이메일 형식이면 true, 유효하지 않으면 false
 */
function validateEmail(email) {
    var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

    if(!pattern.test(email)){
        return false;
    }

    return true;
}

/**
 * 입력값에 숫자만 허용하는 경우
 * @param value
 * @returns {Boolean} 숫자이외 값이 있으면 false, 숫자만 있으면 true
 */
function onlyNum(value) {
    var pattern = /\D/g;

    if (pattern.test(value)) {
        return false;
    }

    return true;
}

/**
 * 전화번호 유효성 검사1
 * @param num1 필수
 * @param num2 필수
 * @param num3 필수
 * @param num4 선택
 * @returns {Boolean} 유효하면 true, 유효하지 않으면 false
 */
function validatePhoneNum(num1, num2, num3, num4) {
    if (isEmpty(num4)) {
        if (onlyNum(num1) && onlyNum(num2) && onlyNum(num3)) {
            return true;
        } else {
            return false;
        }
    } else {
        if (onlyNum(num1) && onlyNum(num2) && onlyNum(num3) && onlyNum(num4)) {
            return true;
        } else {
            return false;
        }
    }
}


/**
 * 휴대폰 유효성 검사
 * @param no1 필수
 * @param no2 필수
 * @param no3 필수
 * @returns {int} 유효하면 1, no1이 유효하지 않으면 1, no2이 유효하지 않으면 2, no3이 유효하지 않으면 3
 */
function validateHpNo(no1, no2, no3) {
    var pattern1 = /^[\d]{3,4}$/;
    var pattern2 = /^[\d]{3,4}$/;
    var pattern3 = /^[\d]{4}$/;
    if ( !pattern1.test(no1) ) {
        return 1;
    }
    if ( !pattern2.test(no2) ) {
        return 2;
    }
    if ( !pattern3.test(no3) ) {
        return 3;
    }
    return 0;
}

/**
 * 사업자번호 체크
 *
 * @param  str
 * @return boolean
 */
function isRgno(str) {
  var sum = 0;
  var getlist =new Array(10);
  var chkvalue =new Array("1","3","7","1","3","7","1","3","5");

  for(var i=0; i<10; i++) {
    getlist[i] = str.substring(i, i+1);
  }
  for(var i=0; i<9; i++) {
    sum += getlist[i]*chkvalue[i];
  }
  sum = sum + parseInt((getlist[8]*5)/10);
  sidliy = sum % 10;
  sidchk = 0;
  if (sidliy != 0) {
    sidchk = 10 - sidliy;
  } else {
    sidchk = 0;
  }
  if (sidchk != getlist[9]) {
    return false;
  }

    return true;
}

/**
 * 즐겨찾기 자동설치
 */
function autoBookMark(){
	var url="http://www.thehyundai.com";
	var title="더현대닷컴";

	if (document.all)
	window.external.AddFavorite(url,title)
}

/**
 * 포커스 조정
 * @param obj
 */
function focusObj(obj) {
    obj.focus();
    $("body, html").animate({scrollTop : obj.offset().top - 30}, 1);
}


/**
 * 블럭 로딩바 노출
 */
function showBlockLoadingBar() {
	loadingBar.start();
}

/**
 * 블럭 로딩바 감추기
 */
function hideBlockLoadingBar() {
	loadingBar.stop();
}

/**
 * 입력창 Byte 계산
 * @param input
 * @returns {Number}
 */
function getByteLength(input) {
    var iByteLength = 0;
    for (var i = 0; i < input.length; i++) {
        var sChar = escape(input.charAt(i));
        if (sChar.length == 1 ) {
            iByteLength ++;
        } else if (sChar.indexOf("%u") != -1) {
            iByteLength += 2;
        } else if (sChar.indexOf("%") != -1) {
            iByteLength += sChar.length/3;
        }
    }
    return iByteLength;
}

/**
 * [THD사용]뒤로가기 기능
 *
 * 2016.06.13 김태동 수정
 * 2016.11.25 정희석 수정(삼성페이 뒤로가기)
 *
 * @param isApp
 */
function historyBack(){
	if(isApp == "Y"){
		location.href = "thehyundai://back";
	} else {
		// 뒤로갈 히스토리가 있으면, 뒤로가기
		// 타 사이트 referrer일 경우, 메인 페이지로 이동
		// 히스토리가 없으면,
		// 메인 페이지로
		// 삼성에서 접속한 레퍼코드인 경우
		var referCode = popGetCookie("EHReferCode");
		if(referCode == "B01"){
			history.back();
		}
		else {
			document.referrer && -1 != document.referrer.indexOf("thehyundai.com") ? history.back() : location.href="http://tohome.thehyundai.com/front";
		}
	}
}

/**
 * [THD] 인자값의 쿠키 정보를 가져온다.
 * @param  name 쿠키 이름
 */
function popGetCookie( name ){
	var nameOfcookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ){
		var y = (x+nameOfcookie.length);
		if ( document.cookie.substring( x, y ) == nameOfcookie ) {
			if ( (endOfcookie=document.cookie.indexOf( ";", y )) == -1 )
				endOfcookie = document.cookie.length;

			return unescape( document.cookie.substring( y, endOfcookie ) );
		}
		x = document.cookie.indexOf( " ", x ) + 1;

		if ( x == 0 )
			break;
	}

	return "";
}

/**
 * LPAD
 * @param str
 * @param padLen
 * @param padStr
 * @returns
 */
function fnLpad(str, padLen, padStr){
	str +='';
	padStr +='';

	if(str.length >= padLen){
		return str;
	}
	while(str.length < padLen){
		str = padStr+str;
		str = str.length >= padLen? str.substring(0,padLen) : str;
		return str;
	}
}


/**
 * RPAD
 * @param str
 * @param padLen
 * @param padStr
 * @returns
 */
function fnRpad(str, padLen, padStr){
	str +='';
	padStr +='';

	if(str.length >= padLen){
		return str;
	}
	while(str.length < padLen){
		str += padStr;
		str = str.length >= padLen? str.substring(0,padLen) : str;
		return str;
	}
}

/**
 * 입력창 Byte 체크 최대 까지만 입력가능하게.
 * @param inputObjId
 * @param limitByte
 * @returns {Boolean}
 */
function limitBytes(inputObjId, limitByte){
    var iByteLength = getByteLength($("#" + inputObjId).val());

    if(iByteLength > limitByte){
        alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
        $("#" + inputObjId).val(tempStr);
        return false;
    }
    tempStr = $("#" + inputObjId).val();
}

/**
 * 주소 검색 팝업 호출
 * 
 * @path : 호출 경로(PC화면에서 호출 시 'pc' 인수전달 필요)
 * @returns
 */
function showSearchAddressPop(path) {
    $.ajax({
          type : "POST"
        , url : contextPath + "/co/coa/searchAddress.ajax"
        , dataType : "html"
        , success : function(data) {
            if (data) {
                if (path == 'pc') {
                    if ($("#p_popDeliveryAddr").length <= 0) {
                        $("body").append($("<div id=\"p_popDeliveryAddr\" class=\"popup popdeliveryaddr\"></div>"));
                    }
                    $("#p_popDeliveryAddr").html(data);
                    
                    $("#p_popDeliveryAddr").keypress(function(e) {
                        if (e.which == 13) {
                            searchAddressPC('1');
                            e.preventDefault();
                        }
                    });
                    
                    fn.popupOpen("#p_popDeliveryAddr");
                } else {
                    if ($("#popDeliveryAddr").length <= 0) {
                        $("body").append($("<div id=\"popDeliveryAddr\" class=\"popup full popdeliveryaddr\"></div>"));
                    }
                    $("#popDeliveryAddr").html(data);
                    
                    $("#frmSearchAddress").keypress(function(e) {
                        if (e.which == 13) {
                        	e.preventDefault();
                            searchAddress('search');
                        }
                    });
                    
                    fn.safePopupArea();
                    fn.popupOpen("#popDeliveryAddr");
                }
            }
        }
        , error: function(xhr, status, error) {
            alert("처리중 오류가 발생하였습니다.");
        }
    });
}



/**
 *  주소검색시 배송형태 가져오기 func
 *  상품, 회원, 주문에서 사용
 *  @param #frmSearchAddress
 *  @returns
 *  Array
 *  	commonResult - 주소 api 결과
 *  	dlvYnArray - 배송형태 조회 결과
 */
function fn_searchDlvYn(){
	
	var commonResult = '';
	var zip = '';
	var dlvYnArray = new Array();

	//행안부 주소 API
	$.ajax({
		url : addrSearchServer
		, type : "GET"
		, data : $("#frmSearchAddress").serialize()
		, clossDomain : true
		, dataType : "json"
		, async : false
		, success : function(obj){
			commonResult = obj.results.common;
			zip = obj.results.juso;
		}
		, error : function(xhr, status,error) {
            alert("처리중 오류가 발생하였습니다.");
		}
	});
	
		//API로 가져온 우편번호로 배송형태 조회
		$.ajax({
			   type : "POST"
	         , url : "/front/co/coa/searchDlvYn.ajax"
	         , data : JSON.stringify(zip)
	         , dataType : "json"
	         , contentType : "application/json; charset=utf-8"	 
	         , async : false
	    	 , success : function(data) {
	    		 dlvYnArray = data;
	    	 }
			, error : function(xhr, status,error) {
	            alert("처리중 오류가 발생하였습니다.");
	        }
		});
		
	return {
	 	 commonResult : commonResult
	 	, dlvYnArray : dlvYnArray
	};
}

/**
 * 주소 검색
 * 
 * @param searchType(search : 검색, more : 더보기)
 * @returns
 */
function searchAddress(searchType) {
    var keywd = $.trim($("#frmSearchAddress input[name=keyword]").val());
    if (keywd == null || keywd == undefined || keywd == '') {
        alert("검색하려는 주소정보를 입력해주세요.");
        $("#frmSearchAddress input[name=keyword]").focus();
        return;
    }
    $("#frmSearchAddress input[name=keyword]").val(keywd);
    
    var currentPage = 1;
    if (searchType == "more") {
        currentPage = Number($("#frmSearchAddress input[name=currentPage]").val()) + 1;
    }
    $("#frmSearchAddress input[name=currentPage]").val(currentPage);
    
    //배송형태 조회 펑션 호출
	var dlvYnArray = fn_searchDlvYn();
	if(!jQuery.isEmptyObject(dlvYnArray)){
		
		//주소검색 결과
		var commonResult = dlvYnArray.commonResult;
		var zipDlvYn = dlvYnArray.dlvYnArray;
   
        if (searchType == 'search') {
            var listAreaHtml = ""; 
            var totalCount = Number(commonResult.totalCount);
            if (totalCount > 0) {
                listAreaHtml = "<h4>검색한 결과 총 <strong><em><span>" + gfn_appendComma(totalCount) + "</span></em>건</strong></h4>";
                listAreaHtml += "<ul ></ul>";
                if (totalCount > Number($("#frmSearchAddress input[name=countPerPage]").val())) {
                    // 검색결과가 페이징 갯수 보다 큰 경우에만 더보기 버튼 노출
                    listAreaHtml += "<button type=\"button\" class=\"btn more\" onclick=\"searchAddress('more');\">더보기</button>";
                }
            } else {
                listAreaHtml = "<div class=\"nodata\">검색결과가 없습니다.</div>";
            }
            $("#divSearchAddressList").html(listAreaHtml);
        } else {
            var totalCount = Number(commonResult.totalCount);
            var searchCount = Number($("#frmSearchAddress input[name=currentPage]").val()) * Number($("#frmSearchAddress input[name=countPerPage]").val());
            if (searchCount >= totalCount) {
                //  현재 페이지가 검색 마지막 페이지인 경우, 더보기 버튼 제거
                $("#divSearchAddressList button.more").remove();
            }
        }
        
        var addAddrHtml = "";
        $(zipDlvYn).each(function() {
            addAddrHtml += "<li>";
            addAddrHtml += "    <button type=\"button\" ";
            addAddrHtml += "        data-post_no=\"" + this.zipNo + "\" ";
            addAddrHtml += "        data-rdnm_base_adr=\"" + this.roadAddr + "\" ";
            addAddrHtml += "        data-dstn_base_adr=\"" + this.jibunAddr + "\"";
            addAddrHtml += "        onclick=\"selectAddress(this);\">";
            addAddrHtml += "        <span class=\"txt-zipcode\">" + this.zipNo + "</span>";
            addAddrHtml += "        <strong>" + this.roadAddr + "</strong>";
            addAddrHtml += "        <span class=\"txt-zipaddr\">지번</span>" + this.jibunAddr;
            addAddrHtml += "		 <div class=\"shippingstate\">"
				if(this.dawnDlvYn == 'Y'){
					addAddrHtml += "	 	<span class=\"btn orange\">새벽배송</span>";
				}
				if(this.owntrckDlvYn == 'Y'){
					addAddrHtml += "		<span class=\"btn orange\">일요일배송</span>";
				}
				if(this.dsrvDlvYn == 'Y'){
					addAddrHtml += "		<span class=\"btn darkgray\">택배배송</span>";
				}
				addAddrHtml += "	 	</div>"
            addAddrHtml += "    </button>";
            addAddrHtml += "</li>";
        });
        
        if ($("#divSearchAddressList ul").length > 0) {
            $("#divSearchAddressList ul").append(addAddrHtml);
        }
        
        fnHideKeyboard();
        
    } else {
    	alert("처리중 오류가 발생하였습니다.");
    }
       
}



/**
 * 주소 검색(PC ver.)
 * 
 * @param nextPage
 * @returns
 */
function searchAddressPC(currentPage, e) {

    if (e) {
        e.preventDefault();
    } 
    
    var keywd = $.trim($("#frmSearchAddress input[name=keyword]").val());
    if (isEmpty(keywd)) {
        alert("검색하려는 주소정보를 입력해주세요.");
        $("#frmSearchAddress input[name=keyword]").focus();
        return;
    }
    $("#frmSearchAddress input[name=keyword]").val(keywd);
    
    if (isEmpty(currentPage)) {
        currentPage = 1;
    }
    $("#frmSearchAddress input[name=currentPage]").val(currentPage);
    
    
    //배송형태 조회 펑션 호출
	var dlvYnArray = fn_searchDlvYn();
	
	if(!jQuery.isEmptyObject(dlvYnArray)){
		
		//주소검색 및 배송형태조회 결과
		var commonResult = dlvYnArray.commonResult;
		var zipDlvYn = dlvYnArray.dlvYnArray;
            
        if ($(".zipsearch .infotxt").is(".active")) {
            $(".zipsearch .infotxt").removeClass("active");
        }
        
        var totalCount = Number(commonResult.totalCount);
        
        var listAreaHtml = "<h4>검색한 결과 <strong>총 <em>" + gfn_appendComma(totalCount) + "</em>건</strong></h4>"; 
        listAreaHtml += "<div class=\"scrollbox\">";
        
        if (totalCount > 0) {
//                var jusoArr = obj.results.juso;
            listAreaHtml += "<ul>";
            $(zipDlvYn).each(function() {
                listAreaHtml += "<li>";
                listAreaHtml += "    <button type=\"button\" ";
                listAreaHtml += "        data-post_no=\"" + this.zipNo + "\" ";
                listAreaHtml += "        data-rdnm_base_adr=\"" + this.roadAddr + "\" ";
                listAreaHtml += "        data-dstn_base_adr=\"" + this.jibunAddr + "\"";
                listAreaHtml += "        onclick=\"selectAddress(this);\">";
                listAreaHtml += "        <span class=\"txt-zipcode\">" + this.zipNo + "</span>";
                listAreaHtml += "        <strong>" + this.roadAddr + "</strong>";
                listAreaHtml += "        <span class=\"txt-zipaddr\">지번</span>" + this.jibunAddr;
                listAreaHtml += "		 <div class=\"shippingstate\">"
    				if(this.dawnDlvYn == 'Y'){
    					listAreaHtml += "	 	<span class=\"btn orange\">새벽배송</span>";
    				}
    				if(this.owntrckDlvYn == 'Y'){
    					listAreaHtml += "		<span class=\"btn orange\">일요일배송</span>";
    				}
    				if(this.dsrvDlvYn == 'Y'){
    					listAreaHtml += "		<span class=\"btn darkgray\">택배배송</span>";
    				}
    				listAreaHtml += "	 	</div>"
                listAreaHtml += "    </button>";
                listAreaHtml += "</li>";
            });
            listAreaHtml += "</ul>";
        } else {
            listAreaHtml += "<div class=\"nodata\">";
            listAreaHtml += "검색결과가 없습니다.";
            listAreaHtml += "</div>";
        }
        listAreaHtml += "</div>";
        
        // 페이징 처리
        if (totalCount > 0) {
            var pageSize = 5;
            var currentPage = Number($("#frmSearchAddress input[name=currentPage]").val());
            var endPage = (Math.ceil((currentPage / pageSize)) * pageSize); 
            var startPage = (endPage - pageSize) + 1;
            var lastPage = Math.ceil(totalCount / Number($("#frmSearchAddress input[name=countPerPage]").val()));
            if (endPage > lastPage) {
                endPage = lastPage;
            }
            
            listAreaHtml += "<div class=\"pagination\">";
            if (startPage > 1) {
                listAreaHtml += "<a href=\"#\" class=\"prev\" onclick=\"javascript:searchAddressPC(" + (startPage - 1) + ", event);\">이전</a>";
            }
            listAreaHtml += "<span class=\"num\">";
            for (var i = startPage; i <= endPage; i++) {
                listAreaHtml += "<a href=\"#\"";
                if (i == currentPage) {
                    listAreaHtml += " class=\"active\"";
                }
                listAreaHtml += " onclick=\"javascript:searchAddressPC(" + i + ", event);\">" + i + "</a>";
            }
            listAreaHtml += "</span>";
            if (endPage < lastPage) {
                listAreaHtml += "<a href=\"#\" class=\"next\" onclick=\"javascript:searchAddressPC(" + (endPage + 1) + ", event);\">다음</a>";
                
            }
            listAreaHtml += "</div>";
        }
        
        $("#divSearchAddressList").html(listAreaHtml);
        
        if (!$("#divSearchAddressList").is(".active")) {
            $("#divSearchAddressList").addClass("active");
        }
            
	} else {
		alert("처리중 오류가 발생하였습니다.");
	}
}



/*<script>
$(document).ready(function(){
	//배송지 추가 팝업 호출
	fn.popupOpen("#popShippingInput");
	//배송지 추가 팝업 호출
	fn.popupOpen("#popServiceConfirm");
});
</script>*/


/**
 * 주소 목록에서 검색 주소 클릭
 * 
 * @param btn
 * @returns
 */
function selectAddress(btn) {
	
     var addrObj = {
              rdnmPostNo : $(btn).data("post_no")
            , rdnmBaseAdr : $(btn).data("rdnm_base_adr")
            , dstnBaseAdr : $(btn).data("dstn_base_adr")
    };
    
     try {
        callbackAddress(addrObj);	//회원, 주문 등에서 func 새로 선언하여 사용중
        
    } catch(err) {
        console.log("callback함수 callbackAddress 정의되지 않음");
    }
    
    if ($("#popDeliveryAddr").length > 0) {
        fn.popupCloseId($("#popDeliveryAddr"));
    }
    
    if ($("#p_popDeliveryAddr").length > 0) {
        fn.popupCloseId($("#p_popDeliveryAddr"));
    }
    
}

/**
 * 새벽배송 안내 페이지(event)에서 사용
 * 
 */
function PDshowSearchAddressPop() {
	
	var userAgentObj = navigator.userAgent.toLowerCase();
	var pcYn = "N"
	if(userAgentObj.indexOf('hdm-mall-ios') > -1 || userAgentObj.indexOf('hdm-mall-android') > -1 ){ 
	} else if ( userAgentObj.indexOf("ipod") > -1 
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
	          || userAgentObj.indexOf("samsung") > -1 ) {
	} else {
		pcYn = "Y";
	}
	
	if (pcYn == "Y") {
		
		showSearchAddressPop('pc');	//common.js
		
	} else {
	
		showSearchAddressPop('');	//common.js
	}
}


//Native 호출(공통 모듈)
function commonNativeCall(callData) {

    if (window.navigator.userAgent.match(/hdm-mall-android/)) {

        // Android

        window.hdmMall.callNative(callData);

    }

    else if (window.navigator.userAgent.match(/hdm-mall-ios/)) {

        // iOS

        window.webkit.messageHandlers.hdmMall.postMessage(callData);

    }

    else {

        console.log("skip native call in browser.");

    }

}

function commonDeepLink(deepLinkUrl) {
	var userAgent = navigator.userAgent.toLowerCase(); 
	    if ( userAgent.indexOf('android') > -1) {
	        //안드로이드 브라우저
	    	window.location = 'intent://' + deepLinkUrl + '#Intent;scheme=thehyundaitohome;action=android.intent.action.VIEW;category=android.intent.category.BROWSABLE;package=com.thehyundai.tohome;end';
	    } else if ( userAgent.indexOf("iphone") > -1||userAgent.indexOf("ipad") > -1||userAgent.indexOf("ipod") > -1 ) {
	    	
	    	try {
		    	//iOS 브라우저
		        window.location = 'thehyundaitohome://' + deepLinkUrl + '';
		    	
		        //iOS 앱 안이 아닐때
		    	if(!window.navigator.userAgent.match(/hdm-mall-ios/)){
					setTimeout(function () {window.location = 'itms-apps://itunes.apple.com/kr/app/id1511894889';}, 500);
		    	}
		    	
	    	} catch(e) {}
	    } else {
	        //iOS, 안드로이드 외
	    }
}


function commonQrDeepLink(qrDeepLinkUrl) {
	var userAgent = navigator.userAgent.toLowerCase(); 
    if ( userAgent.indexOf('android') > -1) {
        //안드로이드 브라우저
    	window.location = 'intent://' + qrDeepLinkUrl + '#Intent;scheme=thehyundaitohome;action=android.intent.action.VIEW;category=android.intent.category.BROWSABLE;package=com.thehyundai.tohome;end';
    } else if ( userAgent.indexOf("iphone") > -1||userAgent.indexOf("ipad") > -1||userAgent.indexOf("ipod") > -1 ) {
    	try {
	    	//iOS 브라우저
	        window.location = 'thehyundaitohome://' + qrDeepLinkUrl + '';
	    	
	        //iOS 앱 안이 아닐때
	    	if(!window.navigator.userAgent.match(/hdm-mall-ios/)){
				setTimeout(function () {window.location = 'itms-apps://itunes.apple.com/kr/app/id1511894889';}, 500);
	    	}
	    	
    	} catch(e) {}
    } else {
        //iOS, 안드로이드 외
    }
}


// 매장앱
function commonStoreDeepLink(deepLinkUrl) {

	var userAgent
	 = navigator.userAgent.toLowerCase(); 
	    if ( userAgent.indexOf('android') > -1) {
	        // 안드로이드 브라우저
	window.location = 'intent://' + deepLinkUrl + '#Intent;scheme=thehyundaistore;action=android.intent.action.VIEW;category=android.intent.category.BROWSABLE;package=com.thehyundai.store;end';
	    } 
}

/**
 * 전화번호 형식으로 치환하여 반환(- 붙여서)
 * @param num
 * @param type : 0 인 경우, 가운데 자리 * 처리
 * @returns
 */
function fnFormatPhoneNo(num, type) {
    var formatNum = "";
    
    num = num.replace(/-/g, '');
    
    if (num.length == 11) {
        var regExp = /(\d{3})(\d{4})(\d{4})/;
        if (type == 0) {
            formatNum = num.replace(regExp, '$1-****-$3');
        } else {
            formatNum = num.replace(regExp, '$1-$2-$3');
        }
    } else if (num.length == 8) {
        var regExp = /(\d{4})(\d{4})/;
        formatNum = num.replace(regExp, '$1-$2');
    } else {
        if (num.indexOf("02") == 0) {
            if (num.length == 9) {
                var regExp = /(\d{2})(\d{3})(\d{4})/;
                if (type == 0) {
                    formatNum = num.replace(regExp, '$1-***-$3');
                } else {
                    formatNum = num.replace(regExp, '$1-$2-$3');
                }
            } else {
                var regExp = /(\d{2})(\d{4})(\d{4})/;
                if (type == 0) {
                    formatNum = num.replace(regExp, '$1-****-$3');
                } else {
                    formatNum = num.replace(regExp, '$1-$2-$3');
                }
            }
        } else {
            var regExp = /(\d{3})(\d{3})(\d{4})/;
            if (type == 0) {
                formatNum = num.replace(regExp, '$1-***-$3');
            } else {
                formatNum = num.replace(regExp, '$1-$2-$3');
            }
        }
    }
    
    return formatNum;
}


//문자가 날짜형이 맞는지 체크  예시)20180101           
function isDate(txtDate) {
    var currVal = txtDate;
    if (currVal == '')
        return false;
 
    var rxDatePattern = /^(\d{4})(\d{1,2})(\d{1,2})$/; //Declare Regex                  
    var dtArray = currVal.match(rxDatePattern); // is format OK?
 
    if (dtArray == null)
        return false;
 
    dtYear = dtArray[1];
    dtMonth = dtArray[2];
    dtDay = dtArray[3];
 
    if (dtMonth < 1 || dtMonth > 12)
        return false;
    else if (dtDay < 1 || dtDay > 31)
        return false;
    else if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11) && dtDay == 31)
        return false;
    else if (dtMonth == 2) {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay > 29 || (dtDay == 29 && !isleap))
            return false;
    }
    return true;
}



//키보드 숨기기
function fnHideKeyboard(){
	const callData = encodeURIComponent(JSON.stringify({
        cmd: "hideKeyboard", // 미리 협의한 호출ID
        param: { }, // 파라미터. 파라미터가 없다면 param: {}
        callback: "" // 콜백 함수명. 콜백이 필요없다면 callback: ""
    }));
    commonNativeCall(callData);
}

function adbrixToNative(event, data){
	const callData = encodeURIComponent(JSON.stringify({
        cmd: "adbrix", // 미리 협의한 호출ID
        param: { // 파라미터. 파라미터가 없다면 param: {}
        	event_type: event,
            data: data
        },
        callback: "" // 콜백 함수명. 콜백이 필요없다면 callback: ""
    }));
	commonNativeCall(callData);
}

function fnRedirectUrl(){
    const callData = encodeURIComponent(JSON.stringify({
        cmd: "redirectUrl", // 미리 협의한 호출ID
        param: {"url":"/sm/sma/createQrInfo.do?expired=D" }, // 파라미터. 파라미터가 없다면 param: {}
        callback: "" // 콜백 함수명. 콜백이 필요없다면 callback: ""
    }));
    commonNativeCall(callData);
}