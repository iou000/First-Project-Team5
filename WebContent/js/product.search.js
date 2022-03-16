/**
 * ONLINE_ITEM_S - 새벽투홈
 * ONLINE_EVENT - 이벤트
 * ONLINE_MAGAZINE - 매거진
 * ONLINE_GIFT - 선물하기
 * ONLINE_SBTCKT - 정기구독
 * ONLINE_SELLER - 샐러마켓 
 * 
 */
var vPDSearchType; 											// 검색타입
var vPDHistoryCookies = 'pdHistoryINfo';					// 뒤로가기를 위한 검색정보 쿠키
var vPDHistoryYn = "N";										// 뒤로가기인지 여부

//replaceAll prototype 선언
String.prototype.replaceAll = function(str, dest){
	return this.split(str).join(dest);
}

//검색어 글자수 제한
function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength) {
		el.value = el.value.substr(0, maxlength);
	}
}

//숫자에 콤마 찍기
function fnPDComma(str){
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//null 처리
function fnPDIsNull(str){
	var vStr = str;
	if(!str) vStr = "";
	return vStr;
}

//검색 타입에 따른 페이지 수 계산(gubun A:초기값, B:초기값 이후의 페이지당 로우수)
function fnPDRowsPerPage(gubun){
	if(vPDSearchType == 'ONLINE_ITEM_S'){ // 새벽투홈
		if(gubun == 'A') return '12'
		else return  '12';
	}else if(vPDSearchType == 'ONLINE_EVENT'){	// 이벤트
		if(gubun == 'A') return '12'
		else return  '12';			
	}else if(vPDSearchType == 'ONLINE_MAGAZINE'){	// 메거진
		if(gubun == 'A') return '12'
		else return  '12';			
	}else if(vPDSearchType == 'ONLINE_GIFT'){	// 선물하기
		if(gubun == 'A') return '12'
		else return  '12';			
	}else if(vPDSearchType == 'ONLINE_SBTCKT'){	// 정기구독
		if(gubun == 'A') return '12'
		else return  '12';			
	}else if(vPDSearchType == 'ONLINE_SELLER'){	// 샐러마켓
		if(gubun == 'A') return '12'
		else  return  '12';			
	}else if(vPDSearchType == 'ONLINE_TAG'){	// 태그그룹
		if(gubun == 'A') return '12'
		else return  '12';			
	}
	
}

//태그 이동
function fnPDTagMove(tagName){
	$('#pdSearchForm input[name="tagNm"]').val(tagName);

	var vUrl = contextPath+'/pd/pdf/searchTagInit.do';
	var newForm = $("#pdSearchForm");
	newForm.attr("method", 'post');
	newForm.attr("action", vUrl);
	newForm.submit();
	
}

//현재 카테고리에 데이터가 없을 경우 재조회
function fnPDBackSearch(vBackType){
	//console.log('fnPDBackSearch::: '+vBackType);
	vPDSearchType = vBackType;
	
	// 탭재조회
	fnPDSearchResultInit('A');
}

//검색 결과 페이지 초기화(ALL로 조회)
function fnPDSearchResultInit(mode){
	//console.log('fnPDSearchResultInit: '+mode);
	var vHtml = "";
	var vNoDataYn = 'N'; // 데이터가 없는지 여부

	// 페이지 넘버 초기화
	vPageNumber = 1;
	vPageNumberA = 1;	// MD'sPick 
	vPageNumberB = 1; 	// 추천상품
	vPageNumberC = 1; 	// 베스트 상품
	
	// 파라메터 설정 초기화
	fnPDSetInitParameter();	
	
	if(!vPDSearchType) vPDSearchType = "ONLINE_ITEM_S";
	
	// 페이지당 건수가 없을 경우 초기화
	if(!vRowsPerPage) vRowsPerPage = fnPDRowsPerPage('A');
	
	// 소팅
	var vSort = $('#sortObj').val(); // 정렬
	
	var vHisCookie = $.cookie(vPDHistoryCookies); // 쿠키 배열
	
	// 뒤로가기 시 처리(검색어가 없을 경우)
	var pKey = '';
	var pType = '';
	var pSort = '';		
	if(vHisCookie && vHisCookie != null){
		pKey = JSON.parse(vHisCookie).key;
		pType = JSON.parse(vHisCookie).type;
		pSort = JSON.parse(vHisCookie).sort;		
	}

	if(!vSearchTerm || vSearchTerm == pKey){ // 검색어가 넘어오지 않았거나 쿠키값과 같은 경우만 뒤로가기 쿠키 처리
		if(vHisCookie && vHisCookie != null){
			
			$('#pdSearchForm input[name="keyWord"]').val(pKey);
			$('#pdSearchForm input[name="searchTerm"]').val(pKey);	    			
			
			vSearchTerm = pKey;
			vPDSearchType = pType;
			vSort = pSort;
			
			vPDHistoryYn = "Y";	// 뒤로가기인지 여부			

		}else{
			vPDHistoryYn = "N";	// 뒤로가기인지 여부
			$.removeCookie(vPDHistoryCookies); // 쿠키 삭제
			$.removeCookie(vPDHistoryCookies, { path: '/'}); // 쿠키 삭제
		}		
	}else{
		vPDHistoryYn = "N";	// 뒤로가기인지 여부
		$.removeCookie(vPDHistoryCookies); // 쿠키 삭제
		$.removeCookie(vPDHistoryCookies, { path: '/'}); // 쿠키 삭제
	}

	$('#pdSearchForm input[name="searchTerm"]').val(vSearchTerm);
	$('#pdSearchForm input[name="category"]').val(vPDSearchType);
	$('#pdSearchForm input[name="pageNumber"]').val(vPageNumber);
	$('#pdSearchForm input[name="rowsPerPage"]').val(vRowsPerPage);		
	$('#pdSearchForm input[name="mode"]').val(mode);	
	$('#pdSearchForm input[name="sort"]').val(vSort);	
	
	$('#pdPcSearchForm input[name="keyWord"]').val(vSearchTerm);
	
	// 쿠키 만들기(최근 검색어 등록)
	if(vSearchTerm){
		fnPDMakeSearchCookie(vSearchTerm);
		fnPDMakeLastlySearch();
	} 		
	
	var vUrl = contextPath+'/pd/pdf/searchResultAllList.do';
	
	//console.log('#pdSearchForm:: '+$('form[name=pdSearchForm]').serialize());
	
	$.ajax({
		url : vUrl,		
		type : 'POST',
		data : $('form[name=pdSearchForm]').serialize(),
		dataType : 'json',
		cache : false,
		success : function(data, status, xhr) {	
			//console.log('data:: '+data.returnCode);
			if(data.returnCode != '1'){
				alert(data.returnCodeName); // 에러 메시지
				
			}else{
				//console.log('reDirectList: '+data.reDirectList);
				if(data.reDirectList){
					var reDirectArr = (data.reDirectList).split('^@');
					if(reDirectArr[0] != null){

						// 특정url 리다이렉트 시킴.
						location.href = reDirectArr[0];
					}	
					return false;
				}				
				
				//vSearchTerm = data.searchTerm;	// 검색어
				vPDSearchType = data.category;		// 카테고리
				vNoDataYn = data.noDataYn;		// no data 여부
				
				userId = data.userId;
				custNo = data.custNo;
				custName = data.custName;
				//custMobilePhone = data.custMobilePhone;				
				
				/*
				console.log('vSearchTerm: '+vSearchTerm);
				console.log('vPDSearchType: '+vPDSearchType);
				console.log('vNoDataYn: '+vNoDataYn);
				console.log('category: '+data.category);
				*/

				$('#pdSearchForm input[name="searchTerm"]').val(vSearchTerm);				

				if(vNoDataYn == 'N'){
					
					// html 포맷(A:검색모드, B:no data)
					fnPDSetFormat('A');
					
					/********************************************************************
					 * 공통태그
					 ********************************************************************/
					var vTagStr = ""; // 공통태그 html
					
					//console.log('tagCnt:: '+data.tagCnt);
					if(data.tagCnt > 0){
						$('#tagList_section').attr('style', 'display:block');
						
						vTagStr += '<em class="tit">인기 태그</em>\n';
						$(data.tagList).each(function(index) {
							if(index >= 10) return false; // 태그는 10개까지만	
							vTagStr += '    <a href="javascript:fnPDTagMove(\''+fnPDParseTag(this, 'B')+'\')">#'+fnPDParseTag(this, 'A')+'</a>\n';
							
						});
						//console.log('vTagStr: '+vTagStr);
						
					}else{
						$('#tagList_section').attr('style', 'display:none');
					}
					
					// 공통 태그 반영
					$('#tagList_section').html(vTagStr);
					
					/********************************************************************
					 * 필터(새벽투홈, 바로배달, 선물하기만 필터 있음.)
					 ********************************************************************/				
					// 필터 팝업 만들기
					fnPDMakeFilterPop(data);
					
					// 필터 초기화
					fn.filterNav();
					
					// 콤보 초기화
					fn.select(".select");
					
					// 필터 초기화
					fn.filterNavReset();

					if(vPDSearchType == 'ONLINE_ITEM_S' || vPDSearchType == 'ONLINE_GIFT'){
						$('#filter_sort').attr('style', 'visibility:visible');
						$('#popFilterNav').attr('style', 'visibility:visible');
					}else if(vPDSearchType == 'ONLINE_SELLER' ){
						$('#filter_sort').attr('style', 'visibility:visible');
						$('#popFilterNav').attr('style', 'visibility:hidden');
					}else{
						$('#filter_sort').attr('style', 'visibility:hidden');
						$('#popFilterNav').attr('style', 'visibility:hidden');	
					}
					
					// 검색된 개수 찍기
					$('#catagory_1 em').text(fnPDComma(data.itemCnt_S));
					$('#catagory_3 em').text(fnPDComma(data.eventCnt));
					$('#catagory_4 em').text(fnPDComma(data.magazineCnt));
					$('#catagory_5 em').text(fnPDComma(data.giftCnt));
					$('#catagory_6 em').text(fnPDComma(data.sbtcktCnt));
					$('#catagory_7 em').text(fnPDComma(data.sellerCnt));
					
					var vTotalCnt  = parseInt(data.itemCnt_S);
					    vTotalCnt += parseInt(data.eventCnt);
					    vTotalCnt += parseInt(data.magazineCnt);
					    vTotalCnt += parseInt(data.giftCnt);
					    vTotalCnt += parseInt(data.sbtcktCnt);
					    vTotalCnt += parseInt(data.sellerCnt);
					$('#titleName').text('\''+vSearchTerm+'\'');
					$('#titleCnt').text(fnPDComma(vTotalCnt));
					
					// 탭	
					fnPDTabSetClass(vPDSearchType);	
					
					// 현재 카테고리의 데이터가 없읅 경우 다시 조회
					var vBackType = "";	
					if(data.itemCnt_S != 0) vBackType = 'ONLINE_ITEM_S';
					if(vBackType == '' && data.eventCnt != 0 ) vBackType = 'ONLINE_EVENT';
					if(vBackType == '' && data.magazineCnt != 0 ) vBackType = 'ONLINE_MAGAZINE';
					if(vBackType == '' && data.giftCnt != 0 ) vBackType = 'ONLINE_GIFT';
					if(vBackType == '' && data.sbtcktCnt != 0 ) vBackType = 'ONLINE_SBTCKT';
					if(vBackType == '' && data.sellerCnt != 0 ) vBackType = 'ONLINE_SELLER';					
					
					// 건수가 없는 탭은 안보여줌.
					if(data.itemCnt_S == 0 && vPDSearchType != 'ONLINE_ITEM_S'){
						$('#catagory_1').attr('style', 'display:none');
					}else if(data.itemCnt_S == 0 && vPDSearchType == 'ONLINE_ITEM_S'){
						fnPDBackSearch(vBackType); // 재조회
					}
					
					if(data.eventCnt == 0 && vPDSearchType != 'ONLINE_EVENT'){
						$('#catagory_3').attr('style', 'display:none');
					}else if(data.eventCnt == 0 && vPDSearchType == 'ONLINE_EVENT'){
						fnPDBackSearch(vBackType); // 재조회
					}
					
					if(data.magazineCnt == 0 && vPDSearchType != 'ONLINE_MAGAZINE'){
						$('#catagory_4').attr('style', 'display:none');
					}else if(data.magazineCnt == 0 && vPDSearchType == 'ONLINE_MAGAZINE'){
						fnPDBackSearch(vBackType); // 재조회
					}
					
					if(data.giftCnt == 0 && vPDSearchType != 'ONLINE_GIFT'){
						$('#catagory_5').attr('style', 'display:none');
					}else if(data.giftCnt == 0 && vPDSearchType == 'ONLINE_GIFT'){
						fnPDBackSearch(vBackType); // 재조회
					}
					
					if(data.sbtcktCnt == 0 && vPDSearchType != 'ONLINE_SBTCKT'){
						$('#catagory_6').attr('style', 'display:none');
					}else if(data.sbtcktCnt == 0 && vPDSearchType == 'ONLINE_SBTCKT'){
						fnPDBackSearch(vBackType); // 재조회
					}
					
					if(data.sellerCnt == 0 && vPDSearchType != 'ONLINE_SELLER'){
						$('#catagory_7').attr('style', 'display:none');
					}else if(data.sellerCnt == 0 && vPDSearchType == 'ONLINE_SELLER'){
						fnPDBackSearch(vBackType); // 재조회
					}						
					
					/********************************************************************
					 * 리스트
					 ********************************************************************/	
					$(window).off('scroll'); // 스크롤 이벤트 중지
					$(window).scroll(function() {
						if (Math.ceil($(window).scrollTop()) >= parseInt($(document).height() - $(window).height())) {
							fnPDAddrowSelect(); // 페이지 더보기
						}
					});	

					// 새벽투홈
					if(vPDSearchType == 'ONLINE_ITEM_S'){
						fnPDMakeHtmlItemS(data);	

					// 이벤트
					}else if(vPDSearchType == 'ONLINE_EVENT'){
						fnPDMakeHtmlEvent(data);	
	
					// 메거진
					}else if(vPDSearchType == 'ONLINE_MAGAZINE'){
						fnPDMakeHtmlMagazine(data);
	
					// 선물하기
					}else if(vPDSearchType == 'ONLINE_GIFT'){
						fnPDMakeHtmlGift(data);
	
					//정기구독
					}else if(vPDSearchType == 'ONLINE_SBTCKT'){
						fnPDMakeHtmlSbtckt(data);
	
					//브랜드직송
					}else if(vPDSearchType == 'ONLINE_SELLER'){
						fnPDMakeHtmlSeller(data);
					}
					
					// 뒤로가기설정(쿠키가 있을 경우) 
					if(vHisCookie && vPDHistoryYn=='Y'){
						// 현재 탭을 다시 셋팅해서 조회
						fnPDTabClick(vPDSearchType);
					}else{
						vPDHistoryYn = "N";	// 뒤로가기인지 여부
						$.removeCookie(vPDHistoryCookies); // 쿠키 삭제	
						$.removeCookie(vPDHistoryCookies, { path: '/'}); // 쿠키 삭제
					}					
				// no data의 경우	
				}else{
					// 스크롤 이벤트 중지
					$(window).off('scroll');
					
					// no data html 만들기
					fnPDMakeNodata(data);
				}		
				
			} // else 끝
	
			
		}	
	})
}

//새벽투홈 html 만들기
function fnPDMakeHtmlItemS(obj, type){
	//console.log('fnPDMakeHtmlItemS:: '+type);
	
	// vType A:더보기가 아닌경우 B:더보기
	var vType = 'A';
	if(!type) type = 'A';
	else vType = type;
	
	var tObj; // 타겟
	
	if(vPDSearchType == 'ONLINE_GIFT') tObj = obj.giftList;
	else if(vPDSearchType == 'ONLINE_SELLER') tObj = obj.sellerList;
	else tObj = obj.itemList_S;
	
	var vHtml = '';
	$(tObj).each(function(index) {
		var vPckgItemYn = this.PCKG_ITEM_YN;
		var vSellGbcd = this.ITEM_SELL_GBCD_NM;	// 판매구분코드
		var vNrmlPrc = parseInt(this.NRML_PRC);			// 정상가
		var vSellPrc = parseInt(this.SELL_PRC);			// 판매가
		var vRishpNoftYn = this.RISHP_NOTF_YN;  // 재입고알람여부
		var vAdltItemYn = this.ADLT_ITEM_YN;    // 성인상품여부
		var vItemTypeGbcd = this.ITEM_TYPE_GBCD;	// 상품유형구분코드(0:일반상품, 1:예약판매상품, 2:정기구독상품, 3:명절상품, 4:현장결제상품)
		var vItemFormGbcd = this.ITEM_FORM_GBCD;	// 상품형태구분코드(ITEM_FORM_GBCD) - D:배달상품, F:사은품, G:그로서리상품, O:판매자배송상품, R:정기구독권, S:배송상품
		var vStokGbcd = this.STOCK_GBCD;		// 물류 재고, 0이면 품절처리
		var vDcRate = this.DC_RATE;				// 할인율
		var vOstkMarkTxtNm = this.OSTK_MARK_TXT_NM; // 품절표기문구
		
		var vBasktGbcd = "01"; // 장바구니 구분코드(01:일반배송, 02:정기배송, 03:선물배송, 04:명절배송, 05:브랜드직송, 06:배달, 07:예약배달, 08:테이크아웃, 09:테이블오더)
		if(vItemTypeGbcd == '3'){
			vBasktGbcd = "04";
		}else if(vItemFormGbcd == 'O'){
			vBasktGbcd = "05";
		}else{
			vBasktGbcd = "01";
		}
		
		var vBasktGbcd = "01"; // 장바구니 구분코드(01:일반배송, 02:정기배송, 03:선물배송, 04:명절배송, 05:브랜드직송, 06:배달, 07:예약배달, 08:테이크아웃, 09:테이블오더)
		if(vItemTypeGbcd == '3'){
			vBasktGbcd = "04";
		}else if(vItemFormGbcd == 'O'){
			vBasktGbcd = "05";
		}else{
			vBasktGbcd = "01";
		}		
		
		var vBadgeArr = '';
		var vBadgeNmae = '';
		if(this.SLITM_BNFT){ // 배지
			vBadgeArr = (this.SLITM_BNFT).split('^'); 
			
		}		
		var vLableArr = "";
		if(this.LEL_NM){ // 레이블
			vLableArr = (this.LEL_NM).split(','); 
		}

		vHtml += '    <li>\n';
		
		if(vSellGbcd == '11'){ // 판매중단
			//vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'" class="stop">\n';
			vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'\');return false;" class="stop">\n';
			vHtml += '            <span class="thumb">\n';
		}else if(vSellGbcd == '19'){ // 판매종료
			vHtml += '        <a href="#" class="end">\n';
			vHtml += '            <span class="thumb">\n';
		}else if(vSellGbcd == '09' || vStokGbcd == '0'){ // 품절
			if(vPDSearchType == 'ONLINE_GIFT'){
				//vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'&basktGbcd=03" class="soldout">\n';
				vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'&basktGbcd=03\');return false;" class="soldout">\n';
			}else{
				//vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'" class="soldout">\n';
				vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'\');return false;" class="soldout">\n';
			}			
			vHtml += '        	  <span class="thumb">\n';
			vHtml += '                <span class="state">\n';
			vHtml += '                    <strong>일시품절</strong>\n';
			if(this.OSTK_MARK_TXT_NM){
				vHtml += '                <em class="dayinfo">' + this.OSTK_MARK_TXT_NM + '</em>\n';
			}
			vHtml += '                </span>\n';
		}else{
			// 선물하기시 basktGbcd=03을 넣어줌.
			if(vPDSearchType == 'ONLINE_GIFT'){
				if(vAdltItemYn == 'Y' && vAdltCertYn == 'N'){
					//vHtml += '        <a href="'+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'&basktGbcd=03" class="adult">\n';
					vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'&basktGbcd=03\');return false;" class="adult">\n';
				}else{
					//vHtml += '        <a href="'+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'&basktGbcd=03">\n';
					vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'&basktGbcd=03\');return false;">\n';
				}
			}else{
				if(vAdltItemYn == 'Y' && vAdltCertYn == 'N'){
					//vHtml += '        <a href="'+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'" class="adult">\n';
					vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'\');return false;" class="adult">\n';
				}else{
					//vHtml += '        <a href="'+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'">\n';
					vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'\');return false;">\n';
				}				
			}			
			vHtml += '            <span class="thumb">\n';
		}		
		
		//vHtml += '            <span class="thumb">\n';
		vHtml += '                <img src="'+vContextImgPath+'/'+fnPDIsNull(this.IMG_URL)+'?RS=350x420" onerror="this.src=\'/UIUX/m/pjtCom/images/common/noimage_350x420.jpg\'" alt="">\n';
		
		
		// 할인율이 있고 정상가가 판매가 보다 클 경우 할인율 배지 붙여줌.
		if(vDcRate && (vNrmlPrc>vSellPrc)){
			vHtml += '        <span class="badge"><strong>'+vDcRate+'%</strong></span>\n';
		} else if(this.SLITM_BNFT){ // 배지
			for(var i =0; i<vBadgeArr.length;i++){
				vBadgeNmae = vBadgeArr[i].split('_');
				
				// 배지가 0001(추천은 미노출 시킨다)
				if(vBadgeNmae[0] != '0001' && vBadgeNmae[0] != '0018'){
					vHtml += '        <span class="badge"><strong>'+vBadgeNmae[1]+'</strong></span>\n';
					break;
				}
			}
		}
	
		vHtml += '            </span>\n';
		vHtml += '            <strong class="txt-ti ellipsis">'+this.DISP_SLITM_NM+'</strong>\n';
		vHtml += '        </a>\n';
		vHtml += '        <span class="info">\n';
		vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(vSellPrc)+'</em>원</strong>\n';
		if(vNrmlPrc != vSellPrc){
			vHtml += '            <del>'+fnPDComma(vNrmlPrc)+'</del>\n';
		}
		vHtml += '            </span>\n';
		
		// 판매구분코드가 정상(00)이고 물류재고가 있을 경우
		if((vSellGbcd == '00' && vStokGbcd != '0')){
			if(vPDSearchType == 'ONLINE_GIFT'){
				vHtml += '            <button type="button" class="btn-cart" onclick="fnPDProductBasketAdd(\'03\', \''+this.SLITM_CD+'\', \'\', \'#p_popCartAdd\');">장바구니 담기</button>\n';
			}else{
				if(vPDSearchType == 'ONLINE_SELLER'){
					vHtml += '            <button type="button" class="btn-cart" onclick="fnPDProductBasketAdd(\'05\', \''+this.SLITM_CD+'\', \'\', \'#p_popCartAdd\');">장바구니 담기</button>\n';
				}else{
					// 명절배송인 경우 로그인이 된 경우만 장바구니 노출
					if(vItemTypeGbcd == '3'){
						if(custNo){
							vHtml += '            <button type="button" class="btn-cart" onclick="fnPDProductBasketAdd(\''+vBasktGbcd+'\', \''+this.SLITM_CD+'\', \'\', \'#p_popCartAdd\');">장바구니 담기</button>\n';
						}
					}else{
						vHtml += '            <button type="button" class="btn-cart" onclick="fnPDProductBasketAdd(\''+vBasktGbcd+'\', \''+this.SLITM_CD+'\', \'\', \'#p_popCartAdd\');">장바구니 담기</button>\n';
					}
				}
			}
		}
		
		
		// 품절이고 패키지여부가 N이고 재입고알람여부가 Y인 경우 장바구니 담기
		if((vSellGbcd == '09' || vStokGbcd == '0') && vRishpNoftYn == 'Y' && vPckgItemYn == 'N'){ 
			vHtml += '            <button type="button" class="btn-weighting" onclick="javascript:arlim(\''+this.SLITM_CD+'\',\'\');return false;"">재입고 알림</button>\n';
		}
		
		vHtml += '        </span>\n';

		if(this.LEL_NM){ // 레이블
			vHtml += '        <span class="tag">\n';
			for(var i =0; i<vLableArr.length;i++){
				vHtml += '            <span>'+vLableArr[i]+'</span>\n';
			}		
			vHtml += '        </span>\n';
		}
		
		vHtml += '    </li>\n';
		
	});	
	
	var totHtml = '';
	if(vType == 'A'){ // 더보기가 아닌 경우
		totHtml += '<ul class="product-list">\n';
		totHtml += vHtml;
		totHtml += '</ul>\n';
		
		$('#list_section').html(totHtml);
		
		// 건수 업데이트
		if(vPDSearchType == 'ONLINE_GIFT'){
			$('#catagory_5 em').text(fnPDComma(obj.giftCnt));
			
		}else if(vPDSearchType == 'ONLINE_SELLER'){
			$('#catagory_7 em').text(fnPDComma(obj.sellerCnt));
			
		}else $('#catagory_1 em').text(fnPDComma(obj.itemCnt_S));

		
	}else{ // 더보기시 append
		$('#list_section ul').append(vHtml);
		
	}
	
	//console.log('vHtml: '+vHtml);
	//console.log('totHtml: '+totHtml);

}

//이벤트 html 만들기
function fnPDMakeHtmlEvent(obj, type){
	//console.log('fnPDMakeHtmlEvent');
	
	var vType = 'A';
	if(!type) type = 'A';
	else vType = type;	
	
	var vHtml = '';
	$(obj.eventList).each(function(index) {
		var vGubnu = this.GUBUN;
		var vImgUrl = this.IMG_PATH;
		
		if(vGubnu == '이벤트'){
			//vHtml += '    <a href="'+contextPath+'/mk/mkf/evnt.do?evntNo='+this.EVNT_NO+'">\n';
			vHtml += '    <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/mk/mkf/evnt.do?evntNo='+this.EVNT_NO+'\');return false;">\n';
		}else{
			//vHtml += '    <a href="'+contextPath+'/dp/dpc/spexSectDetailMain.do?sectId='+this.SECT_ID+'">\n';
			vHtml += '    <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/dp/dpc/spexSectDetailMain.do?sectId='+this.SECT_ID+'\');return false;">\n';
		}
		vHtml += '        <img src="'+vContextImgPath+'/'+fnPDIsNull(this.IMG_PATH)+'?RS=720x320" onerror="this.src=\'/UIUX/w/pjtCom/images/common/noimage_720x320.jpg\'" alt="">\n';
		vHtml += '        <span class="tag">\n';
		//vHtml += '            <span class="ing">참여중</span>\n';
		vHtml += '            <span class="div">'+vGubnu+'</span>\n';
		vHtml += '            <span class="dday">D-'+this.DDAY+'</span>\n';
		vHtml += '        </span>\n';
		vHtml += '    </a>\n';			
	
	});
	
	var totHtml = '';
	if(vType == 'A'){ // 더보기가 아닌 경우
		totHtml += '<div class="event-list">\n';
		totHtml += vHtml;
		totHtml += '</div>\n';
		
		$('#list_section').html(totHtml);
		$('#catagory_3 em').text(fnPDComma(obj.eventCnt));
		
	}else{ // 더보기시 append
		$('#list_section div').append(vHtml);
		
	}		

}

//메거진 html 만들기
function fnPDMakeHtmlMagazine(obj, type){
	//console.log('fnPDMakeHtmlMagazine');
	
	var vType = 'A';
	if(!type) type = 'A';
	else vType = type;		
	
	var vHtml = '';
	$(obj.magazineList).each(function(index) {
		//vHtml += '    <a href="'+vServerPath+'/dp/dpd/mgzDetail.do?mgzNo='+this.MGZ_NO+'">\n';
		vHtml += '    <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/dp/dpd/mgzDetail.do?mgzNo='+this.MGZ_NO+'\');return false;">\n';
		vHtml += '        <img src="'+vContextImgPath+'/'+fnPDIsNull(this.IMG_URL)+'?RS=720x350" onerror="this.src=\'/UIUX/w/pjtCom/images/common/noimage_720x450.jpg\'" alt="">\n';
		vHtml += '        <span>\n';
		vHtml += '            '+fnPDIsNull(this.SERIES_TITL)+'\n';
		vHtml += '            <strong>'+this.MGZ_TITL+'</strong>\n';
		vHtml += '        </span>\n';
		vHtml += '    </a>\n';		
	});

	var totHtml = '';
	if(vType == 'A'){ // 더보기가 아닌 경우
		totHtml += '<div class="magazine-list">\n';
		totHtml += vHtml;
		totHtml += '</div>\n';
		
		$('#list_section').html(totHtml);
		$('#catagory_4 em').text(fnPDComma(obj.magazineCnt));
		
	}else{ // 더보기시 append
		$('#list_section div').append(vHtml);
		
	}	

}

//선물하기 html 만들기
function fnPDMakeHtmlGift(obj, type){
	//console.log('fnPDMakeHtmlGift');
	
	// 새벽투홈과 동일
	fnPDMakeHtmlItemS(obj, type);

}

//정기구독 html 만들기
function fnPDMakeHtmlSbtckt(obj, type){
	//console.log('fnPDMakeHtmlSbtckt');
	
	var vType = 'A';
	if(!type) type = 'A';
	else vType = type;			
	
	var vHtml = '';
	vHtml += '<ul class="product-list">\n';
	$(obj.sbtcktList).each(function(index) {
		vHtml += '    <li>\n';
		//vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'">\n';
		vHtml += '        <a href="#" onclick="javascript:fnPDMovePath(\''+contextPath+'/pd/pdd/productDetail.do?slitmCd='+this.SLITM_CD+'\');return false;">\n';
		vHtml += '            <span class="thumb">\n';
		vHtml += '                <img src="'+vContextImgPath+'/'+fnPDIsNull(this.IMG_URL)+'?RS=350x420" onerror="this.src=\'/UIUX/w/pjtCom/images/common/noimage_350x420.jpg\'" alt="">\n';
		vHtml += '            </span>\n';
		vHtml += '            <strong class="txt-ti ellipsis">'+this.DISP_SLITM_NM+'</strong>\n';
		vHtml += '        </a>\n';
		vHtml += '        <span class="info">\n';
		vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.SELL_PRC)+'</em>원</strong></span>\n';
		vHtml += '        </span>\n';
		vHtml += '    </li>\n';
		
	});	
	vHtml += '</ul>\n';
	
	var totHtml = '';
	if(vType == 'A'){ // 더보기가 아닌 경우
		totHtml += '<ul class="product-list">\n';
		totHtml += vHtml;
		totHtml += '</ul>\n';
		
		$('#list_section').html(totHtml);
		$('#catagory_6 em').text(fnPDComma(obj.sbtcktCnt));
		
	}else{ // 더보기시 append
		$('#list_section ul').append(vHtml);
		
	}		
	
}

//브랜드직송 html 만들기
function fnPDMakeHtmlSeller(obj, type){
	//console.log('fnPDMakeHtmlSeller');
	
	// 새벽투홈과 동일
	fnPDMakeHtmlItemS(obj, type);	
}

//no data시 출력하기
function fnPDMakeNodata(obj){
	var vHtml = '';
	
	vHtml += '<!-- filter// -->\n';
	vHtml += '<section class="list-filter">\n';
	vHtml += '    <strong class="txt-total"><span class="word">‘'+vSearchTerm+'’</span> 검색결과 <em>0</em>건</strong>\n';
	vHtml += '</section>\n';
	vHtml += '<!-- //filter -->\n';
	
	vHtml += '<!-- nodata// -->\n';
	vHtml += '<div class="contarea">\n';
	vHtml += '    <div class="txt-nodata">\n';
	vHtml += '    검색된 상품이 없습니다.\n';
	vHtml += '    </div>\n';
	vHtml += '</div>\n';

	
	// 추천상품
	if($(obj.recommendList).length>0){
		vHtml += '<!-- 이런 상품 어떠세요?// -->\n';
		vHtml += '<div class="list-area">\n';
		vHtml += '    <h3>'+obj.custName+'님! 이런 상품 어떠세요?</h3>\n';
		vHtml += '    <ul class="product-list small" id="recommendNoDataList">\n';
		
		var vTotCnt = 0;
		var vCurrentCnt = parseInt(vPageNumberB*3);  // 현재 로우수			
		$(obj.recommendList).each(function(index) {
			if(index == 0) vTotCnt = this.totCnt;
			
			vHtml += '        <li>\n';
			vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.slitmCd+'">\n';
			vHtml += '            <span class="thumb">\n';
			vHtml += '                <img src="'+vContextImgPath+'/'+fnPDIsNull(this.imgPath)+'?RS=350x420" onerror="this.src=\'/UIUX/w/pjtCom/images/common/noimage_350x420.jpg\'" alt="">\n';
			if(this.badgeNm){
				vHtml += '                <span class="badge"><strong>'+this.badgeNm+'</strong></span>\n';
			}
			vHtml += '            </span>\n';
			vHtml += '            <strong class="txt-ti">'+this.slitmNm+'</strong>\n';
			vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.bbprcAmt)+'</em>원</strong></span>\n';
			
			vHtml += '        </a>\n';
			vHtml += '        </li>\n';
			
		});		
		vHtml += '    </ul>\n';
		
		// 데이터가 다 나온 경우 더보기 버튼 미노출 시킴.
		if(vCurrentCnt < vTotCnt){
			vHtml += '    <button type="button" class="btn more" onclick="fnPDmoreData(\'B\');">더보기</button>\n';
		}

		vHtml += '</div>';		
	}
	
	// MD'sPick
	if($(obj.mdPickList).length>0){
		vHtml += '<!-- MD’s choice// -->\n';
		vHtml += '<div class="list-area">\n\n';
		vHtml += '    <h3>MD’s choice</h3>\n';
		vHtml += '    <ul class="product-list small" id="mdPickList">\n';
		
		var vTotCnt = 0;
		var vCurrentCnt = parseInt(vPageNumberA*3);  // 현재 로우수		
		$(obj.mdPickList).each(function(index) {
			if(index == 0) vTotCnt = this.totCnt;
			
			vHtml += '        <li>\n';
			vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.slitmCd+'">\n';
			vHtml += '            <span class="thumb">\n';
			vHtml += '                <img src="'+vContextImgPath+'/'+fnPDIsNull(this.imgPath)+'?RS=350x420" onerror="this.src=\'/UIUX/w/pjtCom/images/common/noimage_350x420.jpg\'" alt="">\n';
			if(this.badgeNm){
				vHtml += '                <span class="badge"><strong>'+this.badgeNm+'</strong></span>\n';
			}
			vHtml += '            </span>\n';
			vHtml += '			  <strong class="txt-ti">'+this.slitmNm+'</strong>\n';
			vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.sellPrc)+'</em>원</strong></span>\n';
			vHtml += '        </a>\n';
			vHtml += '        </li>\n';			
			
		});
		vHtml += '    </ul>\n';

		// 데이터가 다 나온 경우 더보기 버튼 미노출 시킴.
		if(vCurrentCnt < vTotCnt){
			vHtml += '    <button type="button" class="btn more" onclick="fnPDmoreData(\'A\');">더보기</button>\n';
		}			
		
		vHtml += '</div>\n';		
		
	}

	// 요즘 뜨는 상품
	if($(obj.bestlList).length>0){
		vHtml += '<!-- 요즘 뜨는 상품// -->\n';
		vHtml += '<div class="list-area">\n';
		vHtml += '    <h3>요즘 뜨는 상품</h3>\n';
		vHtml += '    <ul class="product-list small" id="bestlList">\n';
		
		var vTotCnt = 0;
		var vCurrentCnt = parseInt(vPageNumberC*3);  // 현재 로우수
		$(obj.bestlList).each(function(index) {
			if(index == 0) vTotCnt = this.totCnt;
			vHtml += '        <li>\n';
			vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.slitmCd+'">\n';
			vHtml += '            <span class="thumb">\n';
			vHtml += '                <img src="'+vContextImgPath+'/'+fnPDIsNull(this.imgPath)+'?RS=350x420" onerror="this.src=\'/UIUX/w/pjtCom/images/common/noimage_350x420.jpg\'" alt="">\n';
			if(this.badgeNm){
				vHtml += '                <span class="badge"><strong>'+this.badgeNm+'</strong></span>\n';
			}
			vHtml += '            </span>\n';
			vHtml += '            <strong class="txt-ti">'+this.slitmNm+'</strong>\n';
			vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.bbprcAmt)+'</em>원</strong></span>\n';
			vHtml += '        </a>\n';
			vHtml += '        </li>\n';
			
		});		
		vHtml += '    </ul>\n';
		
		// 데이터가 다 나온 경우 더보기 버튼 미노출 시킴.
		if(vCurrentCnt < vTotCnt){
			vHtml += '    <button type="button" class="btn more" onclick="fnPDmoreData(\'C\');">더보기</button>\n';
		}		
		
		vHtml += '</div>';		
	}
	
	// html 반영
	$('#reset_section').html(vHtml);
	//console.log('reset_section: '+vHtml);
	
}


//태그이름 파싱하기
function fnPDParseTag(obj, type){
	var tagName = "";
	if(type == 'A'){
		tagName = (JSON.stringify(obj).split(':'))[0].replaceAll('{', '').replaceAll('"', '').replaceAll('#', '');
	}else{
		tagName = (JSON.stringify(obj).split(':'))[0].replaceAll('{', '').replaceAll('"', '');
	}
	//console.log('tagName: '+tagName);
	return tagName;
}

//클래스 변환
function fnPDTabSetClass(catagoryStr){
	vPDSearchType = catagoryStr;
	
	$('#tab_section a').removeClass('active');

	// 새벽투홈
	if(vPDSearchType == 'ONLINE_ITEM_S'){
		$('#catagory_1').attr('class', 'active');

	// 이벤트	
	}else  if(vPDSearchType == 'ONLINE_EVENT'){
		$('#catagory_3').attr('class', 'active');
	// 메거진
	}else if(vPDSearchType == 'ONLINE_MAGAZINE'){
		$('#catagory_4').attr('class', 'active');
	
	// 선물하기
	}else if(vPDSearchType == 'ONLINE_GIFT'){
		$('#catagory_5').attr('class', 'active');
	
	//정기구독
	}else if(vPDSearchType == 'ONLINE_SBTCKT'){
		$('#catagory_6').attr('class', 'active');
	
	//브랜드직송
	}else if(vPDSearchType == 'ONLINE_SELLER'){
		$('#catagory_7').attr('class', 'active');
	}		
} 


//탭 클릭시
function fnPDTabClick(catagoryStr){
	console.log('fnPDTabClick: '+catagoryStr);

	// 페이지 넘버 초기화
	vPageNumber = 1;
	vPageNumberGr = 1;
	vPageNumberSe = 1; // 바로배달 매장
	vPageNumberTo = 1; // 테이크아웃 매장	
	
	// 정렬
	var vSort = $('#sortObj').val();	
	
	// 클래스 설정
	fnPDTabSetClass(catagoryStr);
	
	// 파라메터 설정 초기화
	fnPDSetInitParameter();

	// 뒤로가기설정(쿠키가 있을 경우) 값을 셋팅해줌.
	var vHisCookie = $.cookie(vPDHistoryCookies); // 쿠키 배열
	
	if(vHisCookie && vPDHistoryYn == 'Y'){
		fnPDSetCookiesParameter('A');
	}else{
    	// 탭이동시 scrollTop 찍어서 상단으로 보내기
    	$("html, body").animate({"scrollTop":0});
    	
    	vPDHistoryYn = "N";	// 뒤로가기인지 여부
    	$.removeCookie(vPDHistoryCookies); // 쿠키 삭제	
    	$.removeCookie(vPDHistoryCookies, { path: '/'}); // 쿠키 삭제
	}	
	
	$('#pdSearchForm input[name="searchTerm"]').val(vSearchTerm);
	$('#pdSearchForm input[name="category"]').val(catagoryStr);
	$('#pdSearchForm input[name="pageNumber"]').val('1');
	$('#pdSearchForm input[name="rowsPerPage"]').val(fnPDRowsPerPage('A'));	
	$('#pdSearchForm input[name="mode"]').val('B');
	$('#pdSearchForm input[name="sort"]').val(vSort);
	
	// 검색 
	var vUrl = vServerPath+'/pd/pdf/searchResultAllList.json';

	$.ajax({
		url : vUrl,
        type : 'POST',
        data : $('form[name=pdSearchForm]').serialize(),
        dataType : 'json',
        cache : false,
        success : function(data) {
        	
			// 탭	
			fnPDTabSetClass(vPDSearchType);        	
			/********************************************************************
			 * 필터(새벽투홈, 바로배달, 선물하기만 필터 있음.)
			 ********************************************************************/
			// 초기화
			fn.filterNav();
			fn.filterNavReset();
			
			// 새벽투홈과 선물하기일 경우만 필터 있음.
			if(vPDSearchType == 'ONLINE_ITEM_S' || vPDSearchType == 'ONLINE_GIFT'){
				$('#filter_sort').attr('style', 'visibility:visible');
				$('#popFilterNav').attr('style', 'visibility:visible');
				
				if(vHisCookie && vPDHistoryYn == 'Y'){
					// 쿠키로 필터 팝업 초기화 하기
					fnPDMakeFilterForCookie(data, 'A');
				}else{
					// 필터 팝업 만들기
					fnPDMakeFilterPop(data);					
				}				
						
			}else if(vPDSearchType == 'ONLINE_SELLER' ){
				$('#filter_sort').attr('style', 'visibility:visible');
				$('#popFilterNav').attr('style', 'visibility:hidden');

				// 필터 만들기
				fnPDMakeFilterPop(data);				
					
			}else{
				console.log('alert:: '+vPDSearchType);
				$('#filter_sort').attr('style', 'visibility:hidden');
				$('#popFilterNav').attr('style', 'visibility:hidden');	
				
				// 필터 만들기
				fnPDMakeFilterPop(data);							
			}			

    		vPDHistoryYn = "N";	// 뒤로가기인지 여부
    		$.removeCookie(vPDHistoryCookies); // 쿠키 삭제
    		$.removeCookie(vPDHistoryCookies, { path: '/'}); // 쿠키 삭제

			/********************************************************************
			 * 리스트
			 ********************************************************************/	
			$(window).off('scroll');
			$(window).scroll(function() {
				if (Math.ceil($(window).scrollTop()) >= parseInt($(document).height() - $(window).height())) {
					fnPDAddrowSelect(); // 페이지 더보기
				}
			});	
			
			
			// 새벽투홈
			if(vPDSearchType == 'ONLINE_ITEM_S'){
				fnPDMakeHtmlItemS(data);	
			
			// 이벤트
			}else if(vPDSearchType == 'ONLINE_EVENT'){
				fnPDMakeHtmlEvent(data);	

			// 메거진
			}else if(vPDSearchType == 'ONLINE_MAGAZINE'){
				fnPDMakeHtmlMagazine(data);

			// 선물하기
			}else if(vPDSearchType == 'ONLINE_GIFT'){
				fnPDMakeHtmlGift(data);

			//정기구독
			}else if(vPDSearchType == 'ONLINE_SBTCKT'){
				fnPDMakeHtmlSbtckt(data);

			//브랜드직송
			}else if(vPDSearchType == 'ONLINE_SELLER'){
				fnPDMakeHtmlSeller(data);
			}			   
        }	
	});	

}

// 더보기 클릭시
function fnPDmoreData(noDataMode){
	//console.log('fnPDmoreData: '+noDataMode);
	var tagetPage = 1;
	
	// MD'sPick
	if(noDataMode == 'A'){
		vPageNumberA++;
		tagetPage = vPageNumberA;
		
	// 추천상품
	}else if(noDataMode == 'B'){
		vPageNumberB++;
		tagetPage = vPageNumberB;
		
	// 베스트 상품
	}else{
		vPageNumberC++;
		tagetPage = vPageNumberC;
	}

	$('#pdSearchForm input[name="page"]').val(tagetPage);
	$('#pdSearchForm input[name="limit"]').val('3');
	$('#pdSearchForm input[name="NODATA_MODE"]').val(noDataMode);
	
	// 검색 
	var vUrl = vServerPath+'/pd/pdf/searchPcNoDataList.do';
	//console.log('fnSearchInit::: '+$('form[name=pdSearchForm]').serialize());

	$.ajax({
		url : vUrl,
        type : 'POST',
        data : $('form[name=pdSearchForm]').serialize(),
        dataType : 'json',
        success : function(data) {
     	   //console.log('data::: '+data);

        	/********************************************************************
			 * 리스트
			 ********************************************************************/	

			$(window).off('scroll');
			
			// 데이터 append
			fnPDmoreDataAppend(data, noDataMode);			
        }	
	});	

}

// 더보기 데이터 append
function fnPDmoreDataAppend(obj, noDataMode){
	
	var vHtml = '';
	var vTotCnt = 0;		// 총 카운트
	var vCurrentCnt = 0;  	// 현재 로우수

	// MD'sPick
	if(noDataMode == 'A'){
		vCurrentCnt = parseInt(vPageNumberA*3);  // 현재 로우수
		$(obj.mdPickList).each(function(index) {
			if(index == 0) vTotCnt = this.totCnt;
			
			vHtml += '        <li>\n';
			vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.slitmCd+'">\n';
			vHtml += '            <span class="thumb">\n';
			vHtml += '                <img src="'+vContextImgPath+'/'+this.imgPath+'" onerror="this.src=\'/UIUX/m/pjtCom/images/common/noimage_180x180.jpg\'" alt="">\n';
			if(this.badgeNm){
				vHtml += '                <span class="badge"><strong>'+this.badgeNm+'</strong></span>\n';
			}
			vHtml += '            </span>\n';
			vHtml += '			  <strong class="txt-ti">'+this.slitmNm+'</strong>\n';
			vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.sellPrc)+'</em>원</strong></span>\n';
			vHtml += '        </a>\n';
			vHtml += '        </li>\n';			
			
		});

		$('#mdPickList').append(vHtml);		
		
		// 데이터가 다 나온 경우 더보기 버튼 미노출 시킴.
		if(vCurrentCnt >= vTotCnt){
			$('#mdPickList').siblings('button').attr('style', 'display:none');
			
		}		

	// 추천상품	
	}else if(noDataMode == 'B'){
		vCurrentCnt = parseInt(vPageNumberB*3);  // 현재 로우수
		$(obj.recommendList).each(function(index) {
			if(index == 0) vTotCnt = this.totCnt;
			
			vHtml += '        <li>\n';
			vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.slitmCd+'">\n';
			vHtml += '            <span class="thumb">\n';
			vHtml += '                <img src="'+vContextImgPath+'/'+this.imgPath+'" onerror="this.src=\'/UIUX/m/pjtCom/images/common/noimage_180x180.jpg\'" alt="">\n';
			if(this.badgeNm){
				vHtml += '                <span class="badge"><strong>'+this.badgeNm+'</strong></span>\n';
			}
			vHtml += '            </span>\n';
			vHtml += '            <strong class="txt-ti">'+this.slitmNm+'</strong>\n';
			vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.bbprcAmt)+'</em>원</strong></span>\n';
			
			vHtml += '        </a>\n';
			vHtml += '        </li>\n';
			
		});

		$('#recommendNoDataList').append(vHtml);

		// 데이터가 다 나온 경우 더보기 버튼 미노출 시킴.
		if(vCurrentCnt >= vTotCnt){
			$('#recommendNoDataList').siblings('button').attr('style', 'display:none');
			
		}		
		
	// 베스트 상품
	}else{
		vCurrentCnt = parseInt(vPageNumberC*3);  // 현재 로우수
		$(obj.bestlList).each(function(index) {
			if(index == 0) vTotCnt = this.totCnt;
			
			vHtml += '        <li>\n';
			vHtml += '        <a href="'+vServerPath+'/pd/pdd/productDetail.do?slitmCd='+this.slitmCd+'">\n';
			vHtml += '            <span class="thumb">\n';
			vHtml += '                <img src="'+vContextImgPath+'/'+this.imgPath+'" onerror="this.src=\'/UIUX/m/pjtCom/images/common/noimage_180x180.jpg\'" alt="">\n';
			if(this.badgeNm){
				vHtml += '                <span class="badge"><strong>'+this.badgeNm+'</strong></span>\n';
			}
			vHtml += '            </span>\n';
			vHtml += '            <strong class="txt-ti">'+this.slitmNm+'</strong>\n';
			vHtml += '            <span class="txt-price"><strong><em>'+fnPDComma(this.bbprcAmt)+'</em>원</strong></span>\n';
			vHtml += '        </a>\n';
			vHtml += '        </li>\n';
			
		});	
		
		//console.log('bestlList: '+vHtml);
		$('#bestlList').append(vHtml);	

		// 데이터가 다 나온 경우 더보기 버튼 미노출 시킴.
		if(vCurrentCnt >= vTotCnt){
			$('#bestlList').siblings('button').attr('style', 'display:none');
			
		}			
		
	}	
	
}


//파라메터 초기화
function fnPDSetInitParameter(){
	$('#pdSearchForm input[name="itemFormGbcd"]').val('');
	$('#pdSearchForm input[name="itemTypeGbcd"]').val('');
	$('#pdSearchForm input[name="slitmTags"]').val('');
	$('#pdSearchForm input[name="tagYn"]').val('');
	$('#pdSearchForm input[name="lcat"]').val('');
	$('#pdSearchForm input[name="lmcat"]').val('');
	$('#pdSearchForm input[name="brnd"]').val('');
	$('#pdSearchForm input[name="bnft"]').val('');
	$('#pdSearchForm input[name="stPrc"]').val('');
	$('#pdSearchForm input[name="endPrc"]').val('');
	$('#pdSearchForm input[name="sort"]').val('');
	$('#pdSearchForm input[name="dawnDiv"]').val('');
	$('#pdSearchForm input[name="dsrvDlv"]').val('');
	$('#pdSearchForm input[name="openMkt"]').val('');
	$('#pdSearchForm input[name="rintrvDlvItem"]').val('');
	$('#pdSearchForm input[name="imdtDlivryPoss"]').val('');
	$('#pdSearchForm input[name="taouPoss"]').val('');
	$('#pdSearchForm input[name="tblOrdPoss"]').val('');
	$('#pdSearchForm input[name="groceryItem"]').val('');
	$('#pdSearchForm input[name="sect"]').val('');
	$('#pdSearchForm input[name="page"]').val('1');
	$('#pdSearchForm input[name="limit"]').val('1');
	$('#pdSearchForm input[name="NODATA_MODE"]').val('');

}


//필터 팝업 html 만들기
function fnPDMakeFilterPop(obj){
	console.log('fnPDMakeFilterPop');
	
	var vHtml = '';

	// 새벽투홈일 경우
	if(vPDSearchType == 'ONLINE_ITEM_S'){
		
		vHtml += '<!-- 새벽투홈 filternav// -->\n';
		vHtml += '<div class="scrollbox">\n';
		
		// 혜택
		var vBnftStr = '';
		var vBnftCd = '';
		var vBnftNm = '';
		if($(obj.bnftGrList_S).length>0){
			vHtml += '    <div class="benefit">\n';
			vHtml += '        <strong class="ti">혜택</strong>\n';
			vHtml += '        <div class="con" id="benefitList">\n';
			
			$(obj.bnftGrList_S).each(function(index) {
				vBnftStr = (JSON.stringify(this)).replaceAll('{', '').replaceAll('}', '').replaceAll('"', '');
				vBnftCd = vBnftStr.split(':')[0];
				vBnftNm = vBnftCd.split('_')[1];
				
				// 혜택코드가 0001(추천)은 미노출 시킨다.
				if(vBnftCd != '0001_추천'){
					vHtml += '            <label><input type="checkbox" name="benefit'+(index+1)+'" data-active-ti="benefit" data-bnft-cd="'+vBnftCd+'"><span>'+vBnftNm+' </span></label>\n';
				}
			});	
			
			vHtml += '        </div>\n';
			vHtml += '    </div>\n';
		}
		vHtml += '    \n';			
		
		
		// 카테고리
		if($(obj.lcatGrList_S).length>0){
			vHtml += '    <div class="category">\n';
			vHtml += '        <strong class="ti">카테고리</strong>\n';
			vHtml += '        <div class="con" >\n';
			vHtml += '            <ul>\n';
			
			var vMode = '2';
			$(obj.lcatGrList_S).each(function(index) {
				vLIdx = index;
				if(vMode == '1') vMode = '2';
				else vMode = '1';
				
				vLArr = (JSON.stringify(this).split(':'))[0].replaceAll('{', '').replaceAll('"', '');
				vLcnt = (JSON.stringify(this).split(':'))[1].replaceAll('}', '').replaceAll('"', '');
				vLCd = (vLArr.split('_'))[0];
				vLNm = (vLArr.split('_'))[1];				
				
				vHtml += '             <li>\n';
				vHtml += '                 <button type="button" class="btn small lightgray category'+(vMode)+'"><strong>'+vLNm+'</strong><em>'+fnPDComma(vLcnt)+'</em></button>\n';
				vHtml += '                 <div class="con">\n';
				vHtml += '                     \n';
				
				$(obj.lmcatGrList_S).each(function(index) {
					vCompareLcd = (JSON.stringify(this).split('_'))[0].replaceAll('{', '').replaceAll('"', '');
					if(vLCd == vCompareLcd){
						vTempStr = JSON.stringify(this).replaceAll('{', '').replaceAll('}', '').replaceAll('"', '');
						vMArr = ((vTempStr.split('>'))[1]).split(':');
						vMCd = ((vMArr[0]).split('_'))[0];
						vMNm = ((vMArr[0]).split('_'))[1];
						vMcnt = vMArr[1];
						vHtml += '                    <label><input type="radio" name="category" data-active-ti="category category'+(vLIdx+1)+'" data-lcd="'+vLArr+'" data-mcd="'+vMArr[0]+'"><span>'+vMNm+' <em>'+fnPDComma(vMcnt)+'</em></span></label>\n';	
					}
				});				
				vHtml += '                 </div>\n';
				vHtml += '             </li >\n';
			});

			vHtml += '            </ul>\n';
			vHtml += '        </div>\n';
			vHtml += '    </div>\n';

			// 가격
			vHtml += '    <div class="price">\n';
			vHtml += '        <strong class="ti">가격</strong>\n';
			vHtml += '        <div class="con form-price">\n';
			vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="null, 5000"><span class="btn small balck">~5천원</span></label>\n';
			vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="5000, 10000"><span class="btn small balck">5천원~1만원</span></label>\n';
			vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="10000, 20000"><span class="btn small balck">1~2만원</span></label>\n';
			vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="20000, 30000"><span class="btn small balck">2~3만원</span></label>\n';
			vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="30000, 40000"><span class="btn small balck">3~4만원</span></label>\n';
			vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="50000, null"><span class="btn small balck">5만원~</span></label>\n';
			vHtml += '                <span class="txt">직접입력</span>\n';
			vHtml += '                <input type="number" name="pricemin" id="pricemin" title="최소 가격 입력" placeholder="0" data-active-ti="price">\n';
			vHtml += '                <span class="txt-won">원 &nbsp; ~ &nbsp; </span>\n';
			vHtml += '                <input type="number" name="pricemax" id="pricemax" title="최대 가격 입력" placeholder="0" data-active-ti="price">\n';
			vHtml += '                <span class="txt-won">원</span>\n';
			vHtml += '        </div>\n';
			vHtml += '    </div>\n';	

			// 브랜드
			var vBrndStr = '';
			var vBrndCd = '';
			var vBrndNm = '';
			var vBrndcnt = '';
			var vBrndIdx = 1;
			
			if($(obj.brndGrList_S).length>0){
				vHtml += '    <div class="brand">\n';
				vHtml += '        <strong class="ti">브랜드</strong>\n';
				vHtml += '        <div class="con" id="brndList">\n';
				$(obj.brndGrList_S).each(function(index) {
					vBrndArr = (JSON.stringify(this)).replaceAll('{', '').replaceAll('}', '').replaceAll('"', '');
					vBrndCd = vBrndArr.split(':')[0];
					vBrndNm = vBrndCd.split('_')[1];
					vBrndcnt = vBrndArr.split(':')[1];
					
					if(vBrndNm){ // 브랜드명 있는 것만
						vHtml += '            <label><input type="checkbox" name="brand'+(vBrndIdx)+'" data-active-ti="brand" data-brnd-cd="'+vBrndCd+'"><span>'+vBrndNm+' <em>'+fnPDComma(vBrndcnt)+'</em></span></label>\n';
						vBrndIdx++;
					}
					
					// 우선 10개만 하자...
					if(vBrndIdx > 20) return false;
				});					
				
				vHtml += '        </div>\n';
				vHtml += '    </div>\n';
			}

			// 배송구분
			vHtml += '    <div class="delivery">\n';
			vHtml += '        <strong class="ti">배송구분</strong>\n';
			vHtml += '        <div class="con">\n';
			vHtml += '            <label><input type="radio" name="deliverydiv" data-active-ti="deliverydiv" value="A" checked><span>전체</span></label>\n';
			vHtml += '            <label><input type="radio" name="deliverydiv" data-active-ti="deliverydiv" value="B"><span>새벽투홈</span></label>\n';
			vHtml += '            <label><input type="radio" name="deliverydiv" data-active-ti="deliverydiv" value="C"><span>택배배송</span></label>\n';
			vHtml += '            <label><input type="radio" name="deliverydiv" data-active-ti="deliverydiv" value="D"><span>정기배송</span></label>\n';
			vHtml += '            <label><input type="radio" name="deliverydiv" data-active-ti="deliverydiv" value="E"><span>예약배송</span></label>\n';
			vHtml += '        </div>\n';
			vHtml += '    </div>\n';
			vHtml += '    \n';			
			
		}

		vHtml += '</div>\n';
		
		vHtml += '<div class="btns">\n';
		vHtml += '    <button type="button" class="btn black btn-reset" onclick="fn.filterNavReset();fnPDChangeSelect();return false;">초기화</button>\n';
		vHtml += '    <button type="button" class="btn fill black btn-apply" onclick="fn.toggleClass(\'.btn-filter\');fn.toggleClass(\'.filternav\');fnPDChangeSelect();">확인</button>\n';
		vHtml += '</div>\n';
		

		//console.log('popFilterNav 새벽투홈:: '+vHtml);
		$('#popFilterNav').html(vHtml);
		
	// 선물하기	
	}else if(vPDSearchType == 'ONLINE_GIFT'){
		
		vHtml += '<!-- 선물하기 filternav// -->\n';
		vHtml += '    <div class="scrollbox">\n';
		vHtml += '        \n';
		
		if($(obj.bnftGrList_S).length>0){
			var vBrndStr = '';
			var vBrndCd = '';
			var vBrndNm = '';
			var vBrndcnt = '';
			var vBrndIdx = 1;
			
			vHtml += '        <div class="brand">\n';
			vHtml += '            <strong class="ti">브랜드</strong>\n';
			vHtml += '            <div class="con" id="brndList">\n';
			
			$(obj.brndGrList_GIFT).each(function(index) {
				vBrndArr = (JSON.stringify(this)).replaceAll('{', '').replaceAll('}', '').replaceAll('"', '');
				vBrndCd = vBrndArr.split(':')[0];
				vBrndNm = vBrndCd.split('_')[1];
				vBrndcnt = vBrndArr.split(':')[1];
				
				if(vBrndNm){ // 브랜드명 있는 것만
					vHtml += '            <label><input type="checkbox" name="brand'+(vBrndIdx)+'" data-active-ti="brand"><span>'+vBrndNm+' <em>'+fnPDComma(vBrndcnt)+'</em></span></label>\n';
					vBrndIdx++;
				}
				
				// 우선 10개만 하자...
				if(vBrndIdx > 10) return false;
			});				

			vHtml += '            </div>\n';
			vHtml += '        </div>\n';
			
		}
			
		// 가격
		vHtml += '        <div class="price">\n';
		vHtml += '            <strong class="ti">가격</strong>\n';
		vHtml += '            <div class="con form-price">\n';
		vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="null, 5000"><span class="btn small balck">~5천원</span></label>\n';
		vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="5000, 10000"><span class="btn small balck">5천원~1만원</span></label>\n';
		vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="10000, 20000"><span class="btn small balck">1~2만원</span></label>\n';
		vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="20000, 30000"><span class="btn small balck">2~3만원</span></label>\n';
		vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="30000, 40000"><span class="btn small balck">3~4만원</span></label>\n';
		vHtml += '                <label><input type="radio" name="price" data-active-ti="price" data-value="50000, null"><span class="btn small balck">5만원~</span></label>\n';
		vHtml += '                <span class="txt">직접입력</span>\n';
		vHtml += '                <input type="number" name="pricemin" id="pricemin" title="최소 가격 입력" placeholder="0" data-active-ti="price">\n';
		vHtml += '                <span class="txt-won">원 &nbsp; ~ &nbsp; </span>\n';
		vHtml += '                <input type="number" name="pricemax" id="pricemax" title="최대 가격 입력" placeholder="0" data-active-ti="price">\n';
		vHtml += '                <span class="txt-won">원</span>\n';
		vHtml += '            </div>\n';
		vHtml += '        </div>\n';			
		vHtml += '    </div>\n';	
		
		vHtml += '<div class="btns">\n';
		vHtml += '    <button type="button" class="btn black btn-reset" onclick="fn.filterNavReset();fnPDChangeSelect();">초기화</button>\n';
		vHtml += '    <button type="button" class="btn fill black btn-apply" onclick="fn.toggleClass(\'.btn-filter\');fn.toggleClass(\'.filternav\');fnPDChangeSelect();">확인</button>\n';
		vHtml += '</div>\n';		
		
		//console.log('popFilterNav 선물하기:: '+vHtml);
		$('#popFilterNav').html(vHtml);

	}else{
		$('#popFilterNav').html(vHtml);

	}
	// 필터 초기화
	//fn.filterNavReset();
	fn.filterNav();
	
}

//필터 변경시 - 약간의 딜레이타임을 줌.
function fnPDFiter(){
	//console.log('fnPDFiter');
	setTimeout(function () {
		fnPDAddrowSelect('D');
	}, 200);	
	
}

//html 포맷(A:검색모드, B:no data)
function fnPDSetFormat(str){
	// 뒤로가기시 정렬 셋팅해줌.
	var vHisCookie = $.cookie(vPDHistoryCookies); // 쿠키 배열
	var pSort = ''; // 정렬
	if(vHisCookie != null){
		pSort = JSON.parse(vHisCookie).sort; 
	}
	if(!pSort) pSort = 'WEIGHT'; // 없으면 추천순
	
	var vHtml = '';
	
	// 타이틀
	vHtml += '<!-- filter// -->\n';
	vHtml += '<section class="list-filter">\n';
	vHtml += '    <strong class="txt-total"><span class="word" id="titleName">‘’</span> 검색결과 <em id="titleCnt">0</em>건</strong>\n';
	vHtml += '</section>\n';
	vHtml += '<!-- //filter -->\n';
	vHtml += '\n';
	
	// 태그
	vHtml += '<!-- hashtag(태그 리스트)// -->\n';
	vHtml += '<div class="hashtag" id="tagList_section"></div>\n';
	
	// 필터 섹션
	vHtml += '<!-- search-result// -->\n';
	vHtml += '<section class="search-result list-filter" id="filter_section">\n';
	vHtml += '    <div class="lnblist tab-menu" id="tab_section">\n';
	vHtml += '        <a href="javascript:fnPDTabClick(\'ONLINE_ITEM_S\');" class="active" id="catagory_1">새벽투홈 <em>0</em></a>\n';
	/*vHtml += '        <a href="javascript:fnPDTabClick(\'ONLINE_EVENT\');" id="catagory_3">이벤트 <em>0</em></a>\n';*/
	vHtml += '        <a href="javascript:fnPDTabClick(\'ONLINE_MAGAZINE\');" id="catagory_4">매거진 <em>0</em></a>\n';
	vHtml += '        <a href="javascript:fnPDTabClick(\'ONLINE_GIFT\');" id="catagory_5" >선물하기 <em>0</em></a>\n';
	vHtml += '        <a href="javascript:fnPDTabClick(\'ONLINE_SBTCKT\');" id="catagory_6">정기구독 <em>0</em></a>\n';
	vHtml += '        <a href="javascript:fnPDTabClick(\'ONLINE_SELLER\');" id="catagory_7">브랜드직송 <em>0</em></a>\n';
	vHtml += '    </div>\n';
	vHtml += '    \n';
	vHtml += '    <div class="form-filter" id="filter_sort">\n';
	vHtml += '        <div class="popinline recominfo">\n';
	vHtml += '            <button type="button" class="icon question" onclick="fn.toggleClass(\'#p_popRecomInfo\');">?</button>\n';
	vHtml += '            <div id="p_popRecomInfo" class="popinner">\n';
	vHtml += '                <button type="button" class="btn-close" onclick="fn.toggleClass(\'#p_popRecomInfo\');">닫기</button>\n';
	vHtml += '                추천순의상품은 판매량, 리뷰, 많이 본 상품 등의 수치를 합산하여 정렬되며, 일부 광고상품의 경우 별도의 기준으로 상단에 노출될 수 있습니다.\n';
	vHtml += '            </div>\n';
	vHtml += '        </div>\n';
	vHtml += '        \n';
	vHtml += '        <div class="select type2">\n';
	vHtml += '            <select title="정렬 조건 선택" onChange="fnPDChangeSelect()" id="sortObj">\n';
	
	// 쿠키로 정렬 셋팅(뒤로가기시에 발생)
	if(pSort == 'WEIGHT') vHtml += '                <option value="WEIGHT" selected>추천순</option>\n';
	else vHtml += '                <option value="WEIGHT">추천순</option>\n';

	if(pSort == 'SALE_CNT') vHtml += '                <option value="SALE_CNT" selected>인기상품순</option>\n';
	else vHtml += '                <option value="SALE_CNT">인기상품순</option>\n';
	
	if(pSort == 'NEW_ITEM') vHtml += '                <option value="NEW_ITEM" selected>신상품순</option>\n';
	else vHtml += '                <option value="NEW_ITEM">신상품순</option>\n';
	
	if(pSort == 'SELL_PRC_ASC') vHtml += '                <option value="SELL_PRC_ASC" selected>낮은가격순</option>\n';
	else vHtml += '                <option value="SELL_PRC_ASC">낮은가격순</option>\n';	
	
	if(pSort == 'SELL_PRC_DESC') vHtml += '                <option value="SELL_PRC_DESC" selected>높은가격순</option>\n';
	else vHtml += '                <option value="SELL_PRC_DESC">높은가격순</option>\n';		

	vHtml += '            </select>\n';
	vHtml += '        </div>\n';
	vHtml += '        <button type="button" class="btn small black btn-filter" onclick="fn.toggleClass(\'.btn-filter\');fn.toggleClass(\'.filternav\');">필터</button>\n';
	vHtml += '    </div>\n';
	vHtml += '    \n';
	vHtml += '    \n';
	
	// 동적 필터
	vHtml += '    <div class="filternav" id="popFilterNav" onChange="fnPDChangeSelect();return false;"></div>\n';
	vHtml += '    \n';
	vHtml += '    <div class="select-filter" onClick="fnPDFiter();return false;">\n';
	vHtml += '        <div class="con"></div>\n';
	vHtml += '        <button type="button" class="btn small black btn-reset" onclick="fn.filterNavReset();fnPDChangeSelect();">초기화</button>\n';
	vHtml += '        \n';
	vHtml += '    </div>\n';
	vHtml += '    \n';
	vHtml += '    \n';
	vHtml += '\n';
	vHtml += '\n';
	vHtml += '</section>\n';
	
	// 리스트
	vHtml += '<div class="list-area" id="list_section"></div>\n';

	//console.log('vHtml: '+vHtml);
	$('#reset_section').html(vHtml);
	
}

//더보기 클릭(스크롤시), 조회조건 변경시(D)
function fnPDAddrowSelect(modeStr){
	//console.log('fnPDAddrowSelect:: '+vPDSearchType);

	var vKeyWord = vSearchTerm;
	vPageNumber = $('#pdSearchForm input[name="pageNumber"]').val();
	// 파라메터 설정
	fnPDSetInitParameter();
	fnPDSetParameter();
	
	// 조회조건 변경시(D) 더보기
	if(modeStr == 'D'){
		// 필터 조건 변경시 페이지넘버 초기화
		vPageNumberA = 1;
		vPageNumberB = 1;
		vPageNumberC = 1;
		vPageNumber = 1;
		$('#pdSearchForm input[name="pageNumber"]').val(vPageNumber);
		$('#pdSearchForm input[name="rowsPerPage"]').val(fnPDRowsPerPage('A'));	
		modeStr = 'D';

	}else{
		vPageNumber++;
		$('#pdSearchForm input[name="pageNumber"]').val(vPageNumber);
		$('#pdSearchForm input[name="rowsPerPage"]').val(fnPDRowsPerPage('B'));	
		modeStr = 'C';
	}	
	
	$('#pdSearchForm input[name="searchTerm"]').val(vKeyWord);
	$('#pdSearchForm input[name="category"]').val(vPDSearchType);
	//$('#pdSearchForm input[name="rowsPerPage"]').val(fnPDRowsPerPage('A'));	
	$('#pdSearchForm input[name="mode"]').val(modeStr);
	

	// 검색 
	var vUrl = vServerPath+'/pd/pdf/searchResultAllList.json';
	//console.log('fnSearchInit::: '+$('form[name=pdSearchForm]').serialize());
	
	$.ajax({
		url : vUrl,
        type : 'POST',
        data : $('form[name=pdSearchForm]').serialize(),
        dataType : 'json',
        success : function(data) {
     	   //console.log('data::: '+data);
			
			// 새벽투홈
			if(vPDSearchType == 'ONLINE_ITEM_S'){
				if(modeStr == 'D'){
					fnPDMakeHtmlItemS(data);	
				}else{
					fnPDMakeHtmlItemS(data, 'B');	
				}
				
			// 이벤트
			}else if(vPDSearchType == 'ONLINE_EVENT'){
				if(modeStr == 'D'){
					fnPDMakeHtmlEvent(data);	
				}else{
					fnPDMakeHtmlEvent(data, 'B');	
				}				

			// 메거진
			}else if(vPDSearchType == 'ONLINE_MAGAZINE'){
				if(modeStr == 'D'){
					fnPDMakeHtmlMagazine(data);
				}else{
					fnPDMakeHtmlMagazine(data, 'B');	
				}				

			// 선물하기
			}else if(vPDSearchType == 'ONLINE_GIFT'){
				if(modeStr == 'D'){
					fnPDMakeHtmlGift(data);
				}else{
					fnPDMakeHtmlGift(data, 'B');
				}				
			//정기구독
			}else if(vPDSearchType == 'ONLINE_SBTCKT'){
				if(modeStr == 'D'){
					fnPDMakeHtmlSbtckt(data);
				}else{
					fnPDMakeHtmlSbtckt(data, 'B');
				}				
			//브랜드직송
			}else if(vPDSearchType == 'ONLINE_SELLER'){
				if(modeStr == 'D'){
					fnPDMakeHtmlSeller(data);
				}else{
					fnPDMakeHtmlSeller(data, 'B');
				}						
				
			}			   
        }	
	});		
}


//파라메터 초기화
function fnPDSetParameter(){
	console.log('fnPDSetParameter');
	
	// 정렬
	var vSort = $('#sortObj').val();
	var vGubun = '';
	
	var itemFormGbcd = '';
	var itemTypeGbcd = '';
	var dawnDiv = '';
	var dsrvDlv = '';
	var rintrvDlvItem = '';
	var vLcat = ''
	var vLmcat = '';
	
	var vObj;
	var vBrndStr = '';
	var vBenefitStr = '';
	var vSectStr = '';
	var pricemin = '';
	var pricemax = '';
	
	// 새벽투홈
	if(vPDSearchType == 'ONLINE_ITEM_S'){
		vSort = $('#sortObj').val();
		vGubun = $('input[name="deliverydiv"]:checked').val();
		
		if(vGubun == 'B'){ // 새벽투홈여부
			dawnDiv = 'Y';
		}else if(vGubun == 'C'){ // 택배배송여부
			dsrvDlv = 'Y';
		}else if(vGubun == 'D'){ // 정기배송여부
			rintrvDlvItem = 'Y';
		}else if(vGubun == 'E'){ // 예약배송여부
			itemTypeGbcd = '1';  
		}		
		
		// 카테고리
		vObj = $('input[name="category"]:checked');
		vLcat = vObj.data('lcd');
		if(vLcat && vObj.data('mcd')){
			vLmcat = vLcat+'>'+vObj.data('mcd');
		}

		// 브랜드
		vObj = $('#brndList input[type="checkbox"]:checked');
		$(vObj).each(function(index) {
			if(index == 0) vBrndStr = $(this).data('brndCd');
			else vBrndStr += ('^@' + $(this).data('brndCd'));
		});
		
		// 혜택
		vObj = $('#benefitList input[type="checkbox"]:checked');
		$(vObj).each(function(index) {
			if(index == 0) vBenefitStr = $(this).data('bnftCd');
			else vBenefitStr += ('^@' + $(this).data('bnftCd'));
		});
		
		// 가격
		pricemin = $('#pricemin').val();
		pricemax = $('#pricemax').val();
		
	}else if(vPDSearchType == 'ONLINE_GIFT'){
		// 가격
		pricemin = $('#pricemin').val();
		pricemax = $('#pricemax').val();
		
		// 브랜드
		vObj = $('#brndList input[type="checkbox"]:checked');
		$(vObj).each(function(index) {
			if(index == 0) vBrndStr = $(this).data('brndCd');
			else vBrndStr += ('^@' + $(this).data('brndCd'));
		});		
	} 

	$('#pdSearchForm input[name="itemFormGbcd"]').val(itemFormGbcd);
	$('#pdSearchForm input[name="itemTypeGbcd"]').val(itemTypeGbcd);
	$('#pdSearchForm input[name="slitmTags"]').val('');
	$('#pdSearchForm input[name="tagYn"]').val('');
	$('#pdSearchForm input[name="lcat"]').val(vLcat);
	$('#pdSearchForm input[name="lmcat"]').val(vLmcat);
	$('#pdSearchForm input[name="brnd"]').val(vBrndStr);
	$('#pdSearchForm input[name="bnft"]').val(vBenefitStr);
	$('#pdSearchForm input[name="stPrc"]').val(pricemin);
	$('#pdSearchForm input[name="endPrc"]').val(pricemax);
	$('#pdSearchForm input[name="sort"]').val(vSort);
	$('#pdSearchForm input[name="dawnDiv"]').val(dawnDiv);
	$('#pdSearchForm input[name="dsrvDlv"]').val(dsrvDlv);
	$('#pdSearchForm input[name="openMkt"]').val('');
	$('#pdSearchForm input[name="rintrvDlvItem"]').val(rintrvDlvItem);
	$('#pdSearchForm input[name="imdtDlivryPoss"]').val('');
	$('#pdSearchForm input[name="taouPoss"]').val('');
	$('#pdSearchForm input[name="tblOrdPoss"]').val('');
	$('#pdSearchForm input[name="groceryItem"]').val('');
	$('#pdSearchForm input[name="sect"]').val(vSectStr);
	$('#pdSearchForm input[name="page"]').val('');
	$('#pdSearchForm input[name="limit"]').val('');
	$('#pdSearchForm input[name="NODATA_MODE"]').val('');	
	
	//console.log('#pdSearchForm:: '+$('form[name=pdSearchForm]').serialize());
}

//조회 조건 변경시
function fnPDChangeSelect(){
	console.log('fnPDChangeSelect');
	fnPDAddrowSelect('D');
}

//장바구니 클릭시
function fnPdShippingBasketList(){
	//console.log('fnPdShippingBasketList::'+vServerPath+'/od/odc/shippingBasketList.do');
	if (vServerPath.indexOf('event') != -1) {
		location.href = '/front/od/odc/shippingBasketList.do';
	} else {
		location.href = vServerPath+'/od/odc/shippingBasketList.do';
	}
}

// 장바구니 콜백함수
function fnPdTotalCntCallBackFn(cnt){
	//console.log('fnPdTotalCntCallBackFn::: '+cnt);
	$('#basketCnt').text(cnt);

}

function fnPDProductDetailMove(slitmCd, sectId, ctgrId, basktGbcd, rintrvSubscrbSeqnSeq){
	sectId = sectId=="undefined" ? "":sectId;
	sectId = sectId==null ? "":sectId;
	
	ctgrId = ctgrId=="undefined" ? "":ctgrId;
	ctgrId = ctgrId==null ? "":ctgrId;
	
	basktGbcd = basktGbcd=="undefined" ? "":basktGbcd;
	basktGbcd = basktGbcd==null ? "":basktGbcd;
	if(basktGbcd != ""){
		basktGbcd = "&basktGbcd="+basktGbcd;
	}
	
	rintrvSubscrbSeqnSeq = rintrvSubscrbSeqnSeq=="undefined" ? "":rintrvSubscrbSeqnSeq;
	rintrvSubscrbSeqnSeq = rintrvSubscrbSeqnSeq==null ? "":rintrvSubscrbSeqnSeq;
	if(rintrvSubscrbSeqnSeq != ""){
		rintrvSubscrbSeqnSeq = "&rintrvSubscrbSeqnSeq="+rintrvSubscrbSeqnSeq;
	}
	
	location.href = vServerPath+"/pd/pdd/productDetail.do?slitmCd="+slitmCd+rintrvSubscrbSeqnSeq+"&sectId="+sectId+"&ctgrId="+ctgrId+basktGbcd;
}

//장바구니
function fnPDProductBasketAdd(basktGbcd, slitmCd, sectId, str){

	sectId = sectId=="undefined" ? "":sectId;
	sectId = sectId==null ? "":sectId;
	
	basktGbcd = basktGbcd=="undefined" ? "":basktGbcd;
	basktGbcd = basktGbcd==null ? "":basktGbcd;
	
	var slitmInf = [];
	//상품 상세 조회
	var returnCd = fnPDItemDetailInfo(slitmCd);
	if(returnCd == "01"){
		if (confirm("상품 옵션을 선택해주세요.\n상세로 이동하시겠습니까?")) {
			fnPDProductDetailMove(slitmCd, sectId, '', basktGbcd);
		}
	}else if(returnCd == "02"){
		if (confirm("이 상품은 예약배송 상품입니다.\n상품 상세에서 예약배송일을 선택해주세요.\n상세로 이동하시겠습니까?")) {
			fnPDProductDetailMove(slitmCd, sectId, '', basktGbcd);
		}
	}else if(returnCd == "03"){
		alert("해당상품이 품절되어 장바구니에 담을 수 없습니다.");
	}else if(returnCd == "04"){
		alert("상품이 품절되었습니다.");
		//location.reload();
	}else if(returnCd == "19"){
		fnPDProductDetailMove(slitmCd, sectId, '', basktGbcd);
	}else{
		returnCd1 = returnCd.split(":")[0];
		if(returnCd1 == "00"){
			returnCd2 = returnCd.split(":")[1];
			returnCd3 = returnCd.split(":")[2];
			if(basktGbcd == "03"){
				slitmInf.push(slitmCd+"::"+returnCd2+":"+returnCd3+":"+sectId+":1");
			}else if(basktGbcd == "06"){
				if(dlivryRsvDt != "" && dlivryRsvTimeGbcd !=""){
					slitmInf.push(slitmCd+":::"+returnCd2+":"+returnCd3+":"+sectId+":1:Y:"+dlivryRsvDt+":"+dlivryRsvTimeGbcd);
				}else{
					slitmInf.push(slitmCd+":::"+returnCd2+":"+returnCd3+":"+sectId+":1:N");
				}
				
			}else{
				slitmInf.push(slitmCd+"::"+returnCd2+":"+returnCd3+":"+sectId+":1:N");
			}
			console.log('slitmInf: '+slitmInf);
			console.log('basktGbcd: '+basktGbcd);
			basketInf.add(basktGbcd, slitmInf, function() {
				//fn.popupOpen(str); // #p_popCartAdd
				fn.popupOpen(str);

			});
		}
	}
}

function fnPDItemDetailInfo(slitmCd){
	var returnCd = "99";
	var returnCdFlag = true;
	 $.ajax({
         type : "GET"
       , url : vServerPath + "/pd/pdc/itemDetailInfo.json?UseCache=N"
       , data : "slitmCd="+slitmCd
       , dataType : "json"
       , async : false
       , success : function(data) {
           if (data.slitmCd != null) {
               //옵션상품여부
        	   if(data.pckgItemYn == "Y"){
        		   returnCd = "01";
        		   returnCdFlag = false;
        	   }
        	   
        	   //예약배송상품여부
        	   if(data.itemTypeGbcd == "1"){
        		   returnCd = "02";
        		   returnCdFlag = false;
        	   }else if(data.itemTypeGbcd == "2"){
        		   	//정기구독상품여부
        		   returnCd = "05";
        		   returnCdFlag = false;
        	   }
        	   
        	   
        	   //품절
        	   if(data.itemStatus == "01" || data.itemStatus == "01"){
        		   returnCd = "04";
        		   returnCdFlag = false;
        	   }
        	   
        	   //수량제한 & 재고부족
         	   if(data.itemStatus != "00" ){
         		   returnCd = "03";
         		   returnCdFlag = false;
         	   }
         	   
         	   //성인상품
         	   if(data.itemStatus == "04" ){
         		   if(data.pckgItemYn == "Y"){
	           		   returnCd = "01";
	           	   } else {
	           	       returnCd = "19";
	           	   }
         		   returnCdFlag = false;
         	   }
        	   
        	   if(returnCdFlag){
        		   returnCd = "00"+":"+data.dptsBrnCd+":"+data.venCd;
        	   }
        	   
           }
           
         }
       , error: function(xhr, status, error) {
    	   alert("처리중 오류가 발생하였습니다.");
         }
   });
	 
	 return returnCd;
}

/* 재입고알림 신청 팝업 호출 */
function arlim(slitmCd, pckgSlitmCd) {
	
	
	if(!custNo){
		if(confirm('재입고알림 신청시 로그인이 필요합니다.\n로그인하시겠습니까?')){
			location.href = contextPath+'/cua/login.do';
			return true;
		}else return false;			
	}		

	var param = {
            	slitmCd : slitmCd
            	, pckgSlitmCd : pckgSlitmCd
				};
	
	var vUrl = "";
	if (contextPath.indexOf('event') != -1) {
		vUrl = "/front/od/odc/rishpNtReqPopupAjax.do";
	} else {
		vUrl = contextPath + "/od/odc/rishpNtReqPopupAjax.do";
	}

	$.ajax({
	type : "POST"
	, url : vUrl
	, data : param
	, dataType : "html"
	, async : false
	, success : function(data) {
		
	      $("#p_popWeightingNight").html(data);
	      
	      if ($("#p_popWeightingNight input[name=rishpNtreqYn]").val() == "Y") {
	          alert("이미 재입고 알림 신청이 된 상품입니다.");
	          return;
	      } else {
	          fn.popupOpen('#p_popWeightingNight');
	      }
	    }
	, error: function(xhr, status, error) {
			alert("처리중 오류가 발생하였습니다.");
		}
	});
}

/* 재입고 알림 신청 */
function rishpNotfReq() {
    if ($("#frmRishpNtReqInf input[name=mngtNotfSetupChecked]").length > 0) {
        if ($("#frmRishpNtReqInf input[name=mngtNotfSetupChecked]").is(":checked")) {
            $("#frmRishpNtReqInf input[name=mngtNotfSetupYn]").val("Y");
        } else {
            $("#frmRishpNtReqInf input[name=mngtNotfSetupYn]").val("N");
        }
    }
    
    var vUrl = "";
	if (contextPath.indexOf('event') != -1) {
		vUrl = "/front/od/odc/saveRishpNtreqInf.ajax";
	} else {
		vUrl = contextPath + "/od/odc/saveRishpNtreqInf.ajax";
	}
    
    $.ajax({
          type : "POST"
        , url : vUrl
        , data : $("#frmRishpNtReqInf").serialize()
        , dataType : "json"
        , async : false
        , success : function(data) {
            if (data.result.Msg) {
                alert(data.result.Msg);
            }
            fn.popupClose();
          }
        , error: function(xhr, status, error) {
            alert("처리중 오류가 발생하였습니다.");
          }
    });
}

//뒤로가기 쿠키설정 - 파라메터 초기화(mode A:pdSearchForm에 셋팅, 그외  쿠키생성)
function fnPDSetCookiesParameter(mode){
	console.log('fnPDSetCookiesParameter');

	// 탭 조회시 파라메터 셋팅
	if(mode && mode == 'A'){

		var vHisCookie = $.cookie(vPDHistoryCookies);
		var jsonObj = JSON.parse(vHisCookie); // 쿠키 가져오기
		if(vHisCookie){
			var pDawnDiv = jsonObj.dawnDiv; // 새벽투홈 여부
			var pDsrvDlv = jsonObj.dsrvDlv; // 택배배송여부
			var pItemTypeGbcd = jsonObj.itemTypeGbcd; // '1'이면 예약배송
			var pItemFormGbcd = jsonObj.itemFormGbcd; // 판매자배송여부(현재 안씀)
			var pRintrvDlvItem = jsonObj.rintrvDlvItem; // 정기배송여부
			var pLcd = jsonObj.lcd; // 대카테고리
			var pMcd = jsonObj.mcd; // 중카테고리
			var pBrndCd = jsonObj.brndCd; // 브랜드
			var pBnftCd = jsonObj.bnftCd; // 혜택
			var pPricemin = jsonObj.pricemin; // 최소가격
			var pPricemax = jsonObj.pricemax; // 최대가격
			
			var pSectId = jsonObj.sectId; // 지점		
			
			$('#pdSearchForm input[name="itemFormGbcd"]').val(pItemFormGbcd);
			$('#pdSearchForm input[name="itemTypeGbcd"]').val(pItemTypeGbcd);
			$('#pdSearchForm input[name="slitmTags"]').val('');
			$('#pdSearchForm input[name="tagYn"]').val('');
			$('#pdSearchForm input[name="lcat"]').val(pLcd);
			$('#pdSearchForm input[name="lmcat"]').val(pMcd);
			$('#pdSearchForm input[name="brnd"]').val(pBrndCd);
			$('#pdSearchForm input[name="bnft"]').val(pBnftCd);
			$('#pdSearchForm input[name="stPrc"]').val(pPricemin);
			$('#pdSearchForm input[name="endPrc"]').val(pPricemax);
			$('#pdSearchForm input[name="dawnDiv"]').val(pDawnDiv);
			$('#pdSearchForm input[name="dsrvDlv"]').val(pDsrvDlv);
			$('#pdSearchForm input[name="openMkt"]').val('');
			$('#pdSearchForm input[name="rintrvDlvItem"]').val(pRintrvDlvItem);
			$('#pdSearchForm input[name="imdtDlivryPoss"]').val('');
			$('#pdSearchForm input[name="taouPoss"]').val('');
			$('#pdSearchForm input[name="tblOrdPoss"]').val('');
			$('#pdSearchForm input[name="groceryItem"]').val('');
			$('#pdSearchForm input[name="dptsBrn"]').val(pSectId);			
		}
		//console.log('fnPDSetCookiesParameter #pdSearchForm:: '+$('form[name=pdSearchForm]').serialize());		
		
	// 뒤로가기 조회를 위한 쿠키 설정.	
	}else{
		// 정렬
		var vSort = $('#sortObj').val();
		var vGubun = '';
		
		var itemFormGbcd = '';		// 판매자배송 여부(O일 경우)
		var itemTypeGbcd = '';		// '1'일 경우 예약배송
		
		var dawnDiv = '';			// 새벽투홈 여부
		var dsrvDlv = '';			// 택배배송여부
		var rintrvDlvItem = '';		// 정기배송 여부
		
		var vLcat = ''				// 대카테고리
		var vLmcat = '';			// 중카테고리
		
		var vObj;
		var vBrndStr = '';
		var vBenefitStr = '';
		var vDptsBrnStr = '';
		var pricemin = '';
		var pricemax = '';
		
		// 뒤로가기 쿠키설정
		var vKey = $('#header input[name="keyValue"]').val(); // 검색어
		if(!vKey) vKey = $('#pdSearchForm input[name="searchTerm"]').val();
		var vType = vPDSearchType;
		var jsonObj = new Object();		
		
		jsonObj.key = vKey;
		jsonObj.type = vType;
		jsonObj.sort = vSort;	
		
		// 새벽투홈
		if(vPDSearchType == 'ONLINE_ITEM_S'){
			vSort = $('#sortObj').val();
			vGubun = $('input[name="deliverydiv"]:checked').val();
			
			jsonObj.sort = vSort; 	// 정렬
			jsonObj.gubun = vGubun; // 구분
			
			if(vGubun == 'B'){ // 새벽투홈여부
				dawnDiv = 'Y';
				jsonObj.dawnDiv = 'Y'; // 새벽투홈 여부
			}else if(vGubun == 'C'){ // 택배배송여부
				dsrvDlv = 'Y';
				jsonObj.dsrvDlv = 'Y';
			}else if(vGubun == 'D'){ // 정기배송여부
				rintrvDlvItem = 'Y';
				jsonObj.rintrvDlvItem = 'Y';
			}else if(vGubun == 'E'){ // 예약배송
				itemTypeGbcd = 'Y';
				jsonObj.itemTypeGbcd = 'Y';				
			}
			
			// 카테고리
			vObj = $('input[name="category"]:checked');
			vLcat = vObj.data('lcd');
			if(vLcat && vObj.data('mcd')){
				vLmcat = vLcat+'>'+vObj.data('mcd');
			}
			//console.log('vLmcat:: '+vLmcat);
			if(vLcat && vLmcat){
				jsonObj.lcd = vLcat;
				jsonObj.mcd = vLmcat;				
			}

			// 브랜드
			vObj = $('#brndList input[type="checkbox"]:checked');
			$(vObj).each(function(index) {
				if(index == 0) vBrndStr = $(this).data('brndCd');
				else vBrndStr += ('^@' + $(this).data('brndCd'));
			});
			jsonObj.brndCd = vBrndStr;
			
			// 혜택
			vObj = $('#benefitList input[type="checkbox"]:checked');
			$(vObj).each(function(index) {
				if(index == 0) vBenefitStr = $(this).data('bnftCd');
				else vBenefitStr += ('^@' + $(this).data('bnftCd'));
			});
			jsonObj.bnftCd = vBenefitStr;
			
			// 가격
			pricemin = $('#pricemin').val();
			pricemax = $('#pricemax').val();
			jsonObj.pricemin = pricemin;
			jsonObj.pricemax = pricemax;
			

		}else if(vPDSearchType == 'ONLINE_GIFT'){
			// 가격
			pricemin = $('#pricemin').val();
			pricemax = $('#pricemax').val();
			
			jsonObj.pricemin = pricemin;
			jsonObj.pricemax = pricemax;		
			
			// 브랜드
			vObj = $('#brndList input[type="checkbox"]:checked');
			$(vObj).each(function(index) {
				if(index == 0) vBrndStr = $(this).data('brndCd');
				else vBrndStr += ('^@' + $(this).data('brndCd'));
			});	
			jsonObj.brndCd = vBrndStr;
		} 		
		
		// 기존 쿠키 삭제	
		$.removeCookie(vPDHistoryCookies); // 기존 쿠키 삭제
		$.removeCookie(vPDHistoryCookies, { path: '/'}); // 쿠키 삭제
		
		// 뒤로가기를 위한 쿠키 설정.
		var jsonData = JSON.stringify(jsonObj);
		//$.cookie(vPDHistoryCookies, jsonData);
		$.cookie(vPDHistoryCookies, jsonData, { path: '/'});
		
		var vCookie = $.cookie(vPDHistoryCookies); // 쿠키 배열
		
		console.log('fnPDSetCookiesParameter jsonData: '+jsonData);
		console.log('fnPDSetCookiesParameter vCookie: '+vCookie);		
	}
}

//화면이동시 
function fnPDMovePath(path){
	console.log('fnPDMovePath: '+path);
	// 뒤로가기 스크롤 저장을 위한 세션 설정
	setSessionStorage();

	// 뒤로가기를 위한 쿠키 설정
	fnPDSetCookiesParameter();	
	
	// 화면이동
	location.href = path;
	
	return false;
}

//현재시간을 리턴한다.
function fnPDGetCurrent(){
	var dateStr = '';
	var d = new Date();
	var month = (d.getMonth()+1);
	if(month <10) month = "0"+month;
	
	dateStr = d.getFullYear();
	dateStr += month;
	dateStr += d.getDate();
	dateStr += d.getHours();
	dateStr += d.getMinutes();
	dateStr += d.getSeconds();

	return dateStr;
}

// 카테고리 클릭시 css 적용
function fnPDfilternav(obj){
	var vObj = $(obj);
    var vParent = vObj.parent("li");
	var ti = vObj.attr("data-active-ti");
	
	//console.log('vObj: '+vObj.html());
	//console.log('vParent: '+vParent.html());
	
	if( vParent.hasClass("active") ){
		//$(".filternav .con ul li").removeClass("active");
		//vParent.addClass("active");
		//vParent.css({"height":+(vParent.find("button").outerHeight()+vParent.find(".con").outerHeight())+"px"})
	}

}

//필터 팝업 html 만들기(뒤로가기로 인한 셋팅)
function fnPDMakeFilterForCookie(obj, mode){
	//console.log('fnPDMakeFilterForCookie');
	
	var vHtml = '';
	var vBnftCnt = 0;
	var vObj;			// 비교 오브젝트
	var vTestStr='';	// 비교 문자열
	
	var vHisCookie = $.cookie(vPDHistoryCookies);
	var jsonObj = JSON.parse(vHisCookie); // 쿠키 가져오기
	var vActiveYn = 'N';
	var vActiveCnt = 0;
	
	var pKey = jsonObj.key;
	var pType = jsonObj.type;
	var pSort = jsonObj.sort;	
	var pGubun = jsonObj.gubun; // 구분
	var pDawnDiv = jsonObj.dawnDiv; // 새벽투홈 여부
	var pDsrvDlv = jsonObj.dsrvDlv; // 택배배송여부
	var pItemTypeGbcd = jsonObj.itemTypeGbcd; // 예약배송
	//var pItemFormGbcd = jsonObj.itemFormGbcd; // 판매자배송여부
	var pRintrvDlvItem = jsonObj.rintrvDlvItem; // 정기배송여부
	var pLcd = jsonObj.lcd; // 대카테고리
	var pMcd = jsonObj.mcd; // 중카테고리
	var pBrndCd = jsonObj.brndCd; // 브랜드
	var pBnftCd = jsonObj.bnftCd; // 혜택
	var pPricemin = jsonObj.pricemin; // 최소가격
	var pPricemax = jsonObj.pricemax; // 최대가격
	
	var pSectId = jsonObj.sectId; // 지점
/*
	console.log('***********************************');
	console.log('pKey: '+pKey);
	console.log('pType: '+pType);
	console.log('pSort: '+pSort);
	console.log('pGubun: '+pGubun);
	console.log('pDawnDiv: '+pDawnDiv);
	console.log('pDsrvDlv: '+pDsrvDlv);
	console.log('pItemTypeGbcd: '+pItemTypeGbcd);
	console.log('pRintrvDlvItem: '+pRintrvDlvItem);
	console.log('pLcd: '+pLcd);
	console.log('pMcd: '+pMcd);
	console.log('pBrndCd: '+pBrndCd);
	console.log('pBnftCd: '+pBnftCd);
	console.log('pPricemin: '+pPricemin);
	console.log('pPricemax: '+pPricemax);
	console.log('pSectId: '+pSectId);
	console.log('***********************************');
*/
	if(mode == 'A'){
		// 새벽투홈일 경우
		if(vPDSearchType == 'ONLINE_ITEM_S'){
			
			// 혜택
			if(pBnftCd){
				vObj = $('#benefitList input[type="checkbox"]');
				$(vObj).each(function(index) {
					vTestStr = $(this).data('bnftCd');
					if(pBnftCd.indexOf(vTestStr) > -1){
						$(this).prop('checked', true);
						
						// 필터 영역 추가
						vHtml += fnPDfilternavAdd($(this));
						vActiveCnt++;
					}
				});
			}

			// 카테고리
			if(pMcd){
				console.log('pMcd: '+pMcd);
				vObj = $('input[name="category"]');
				$(vObj).each(function(index) {
					vTestStr = $(this).data('mcd');
					if(vTestStr && pMcd.indexOf('>'+vTestStr) > -1){
						$(this).prop('checked', true);

						// 카테고리 클릭시 css 적용
						//fnPDfilternav($(this));
						// 필터 영역 추가
						vHtml += fnPDfilternavAdd($(this));						
						vActiveCnt++;
					}
				});	
			}
			
			// 가격
			if(pPricemin) $('#pricemin').val(pPricemin);
			if(pPricemax) $('#pricemax').val(pPricemax);
			if(pPricemin || pPricemax) {
				vActiveCnt++;
				
				// 필터 영역 추가
				vHtml += fnPDfilternavAddPrice(pPricemin, pPricemax);				
			}
			
			// 브랜드
			if(pBrndCd){
				vObj = $('#brndList input[type="checkbox"]');
				$(vObj).each(function(index) {
					vTestStr = $(this).data('brndCd');
					if(pBrndCd.indexOf(vTestStr) > -1){
						$(this).prop('checked', true);
						
						// 필터 영역 추가
						vHtml += fnPDfilternavAdd($(this));							
						vActiveYn = 'Y';
						vActiveCnt++;
					}				
				});
			}
			
			// 구분
			if(pGubun){
				vObj = $('input[name="deliverydiv"]');
				$(vObj).each(function(index) {
					vTestStr = $(this).val();
					if(pGubun == vTestStr){
						$(this).prop('checked', true);
						
						// 필터 영역 추가
						vHtml += fnPDfilternavAdd($(this));
						vActiveCnt++;						
					}				
				});		
			
			}
			
		// 선물하기일 경우	
		}else if(vPDSearchType == 'ONLINE_GIFT'){
			// 브랜드
			if(pBrndCd){
				vObj = $('#brndList input[type="checkbox"]');
				$(vObj).each(function(index) {
					vTestStr = $(this).data('brndCd');
					if(pBrndCd.indexOf(vTestStr) > -1){
						$(this).prop('checked', true);
						vActiveCnt++;
						
						// 필터 영역 추가
						vHtml += fnPDfilternavAdd($(this));							
					}
				});
			}
			
			// 가격
			if(pPricemin) $('#pricemin').val(pPricemin);
			if(pPricemax) $('#pricemax').val(pPricemax);	
			if(pPricemin || pPricemax) {
				vActiveCnt++;
				
				// 필터 영역 추가
				vHtml += fnPDfilternavAddPrice(pPricemin, pPricemax);		
			}			
		}
		
		// 필터 영역 적용
		if(vHtml){
			$(".select-filter .con").prepend(vHtml);
			fn.filterNav();
		}
		
		// 필터 액티브 시켜줌
		if(vActiveCnt > 0){
			$(".select-filter").addClass("active");
		}
	}
}

//필터 html 생성
function fnPDfilternavAdd(obj){
	var vHtml = '';
	var $obj = $(obj),
	$id = $(obj).attr("name"),
	$val = $(obj).next("span").html(),
	$ti = $(obj).attr("data-active-ti");
	
	vHtml += '<button type="button" class="btn fill small lightgray '+$id+'" data-active-input="'+$id+'" data-active-ti="'+$ti+'">'+$val+'</button>';
	return vHtml;
}

//필터 html 생성
function fnPDfilternavAddPrice(minval, maxval){
	var vHtml = '';
	if(minval && maxval){
		vHtml += '<button type="button" class="pricearea btn fill small lightgray" data-active-input="pricearea" data-active-ti="price">'+minval+'~'+maxval+'</button>';
	}else if(minval && !maxval){
		vHtml += '<button type="button" class="pricearea btn fill small lightgray" data-active-input="pricearea" data-active-ti="price">'+minval+'~</button>';
	}else if(!minval && maxval){
		vHtml += '<button type="button" class="pricearea btn fill small lightgray" data-active-input="pricearea" data-active-ti="price">~'+maxval+'</button>'
	}
	return vHtml;
}

//상품상세 페이지 클릭시 sessionStorage에 데이터 저장 
function setSessionStorage(){
	
	var pageNumber = $("#pdSearchForm input[name='pageNumber']").val();
	var category = $("#pdSearchForm input[name='category']").val();
	
	// ONLINE_ITEM_S - 새벽투홈
	// ONLINE_ITEM_D - 바로투홈
	// ONLINE_EVENT - 이벤트
	// ONLINE_MAGAZINE - 매거진
	// ONLINE_GIFT - 선물하기
	// ONLINE_SBTCKT - 정기구독
	// ONLINE_SELLER - 샐러마켓
	if(category != 'ONLINE_ITEM_D') {
		window.sessionStorage.setItem('pcSearchProdList', $('#list_section').html());
	    window.sessionStorage.setItem('pcScrollHeight', $(window).scrollTop());
	    window.sessionStorage.setItem('pcPageNumber', pageNumber);
	    window.sessionStorage.setItem('pcCategory', category);
	}
}     
