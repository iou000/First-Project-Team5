//리뷰 조회(type A:초기화후 조회, B:초기화 하지 않고 조회)
function fnReviewAjaxPcList(type, vCurrentPage){
    console.log("hello");

    // 판매상품코드
    var vSlitmCd = "";
    var vOptItemCd = "";
    if(pckgItemYn == 'Y'){
        vSlitmCd = pckgSlitmCd;
        vOptItemCd = $("#reviewOptionList option:selected").val();
    }else{
        vSlitmCd = slitmCd
        vOptItemCd = "";
    }

    //포토만 보기여부(Y:포토있는것만 보기 N:모두 보기)
    var vImgYn = $('input[name="pic"]:checked').val();
    if(vImgYn) vImgYn = 'Y'
    else vImgYn = 'N'

    //정렬순서(1:베스트, 2:최신순)
    var vSort = $('#reviewImgYn input[name="sort"]:checked').val();
    // 베스트 1, 최신순 2
    if(vSort == '1') vSort = "RCMM_CNT";
    else vSort = "CHG_DTM";

    var vReviewPage = 0;

    // 페이지 순번 증가
    if(type == 'A'){
        vReviewPage = 0; // 초기화 시킴.
        reviewcurrentPage = 1;
    }else{
        // 위치이동
        location.href = '#p_proReview';

        vReviewPage = parseInt(vCurrentPage) -1;
        reviewcurrentPage = parseInt(vCurrentPage);
    }

    var vUrl = vServerPath+'/pd/pdd/selectReviewAjaxPcList.do?UseCache=N';

    $.ajax({
        type : 'get',
        url : vUrl,
        data : 'page=' + vReviewPage + '&limit=' + reviewLimit+'&baseCnt='+reviewBaseCnt +'&imgYn='+vImgYn+'&sort='+vSort+'&pckgItemYn='+pckgItemYn+'&convertSlitmCd='+vSlitmCd+'&optItemCd='+vOptItemCd+'&custNo='+custNo+'&rintSlitmCd='+vRintSlitmCd ,
        dataType : 'json',
        cache : false,
        success : function(data, status, xhr) {

            // 조회된 리뷰 개수, 평점
            var reviewCnt = data.reviewPcInfo.reviewCnt;
            var reviewAvg = data.reviewPcInfo.reviewAvg;
            var reviewListCnt = data.reviewPcInfo.reviewListCnt;

            // 리뷰 개수(총수)
            $('#reviewCnt').text(fnComma(reviewCnt));

            var tmpStr = '';			// 리뷰 리스트 스트링
            var tmpTopStr = '';			// 리뷰평점, 격려메시지 출력 스트링
            var tmpSelectStr = '';		// 상품 선택 팝업리스트 스트링

            // 리뷰 - 상품 선택 팝업리스트
            tmpSelectStr += '<div><ul>\n';
            $(data.reviewOrderList).each(function(index) {

                tmpSelectStr += '<li data-ord-no="'+fnIsNull(this.ordNo)+'" data-pckg-cd="'+fnIsNull(this.pckgSlitmCd)+'" data-slitm-cd="'+this.slitmCd+'" data-img-path="'+fnIsNull(this.imgPath)+'" data-slitm-nm=\''+fnIsNull(this.dispSlitmNm)+'\' data-slitm-desc=\''+fnIsNull(this.slitmDesc)+'\'>\n';
                tmpSelectStr += '    <label>\n';
                if(index == 0){
                    tmpSelectStr += '        <input type="radio" name="selectCd" checked>\n';
                }else{
                    tmpSelectStr += '        <input type="radio" name="selectCd">\n';
                }

                tmpSelectStr += '        <span>\n';
                tmpSelectStr += '            '+fnIsNull(this.dispSlitmNm)+'';
                tmpSelectStr += '            <small>'+fnIsNull(this.slitmDesc)+'</small>';
                tmpSelectStr += '        </span>\n';
                tmpSelectStr += '    </label>\n';
                tmpSelectStr += '</li>\n';

            });

            tmpSelectStr += '</ul></div>\n';
            tmpSelectStr += '<button type="button" class="btn fill black" onclick="fnReviewSelectPopupOpen(this, \'B\');">확인</button>\n';


            // 리뷰 상단
            tmpTopStr += '<button type="button" class="btn black btn-review" onclick="fnReviewSelectPopupOpen(this, \'A\');">리뷰 작성</button>\n';

            // 리뷰 수가 20개보다 작을 경우 리뷰 작성 격려 문구를 표시하고 리뷰 평점은 미노출한다.
            if(reviewCnt < 20 ){

                tmpTopStr += '<p>\n';
                tmpTopStr += '    고객님들의 소중한 상품 리뷰를 남겨주세요!<br>\n';
                tmpTopStr += '    리뷰 작성 시 포인트 혜택을 드립니다.\n';
                tmpTopStr += '</p>\n';

                // 작성된 리뷰가 20개 이상인 경우
            }else{

                tmpTopStr += '<span class="grade-star big">\n';
                tmpTopStr += '    <span><span style="width:'+(reviewAvg/5*100)+'%;"></span></span>\n';
                tmpTopStr += '    <strong><em>'+reviewAvg+'</em> <i class="bar">/</i> 5</strong>\n';
                tmpTopStr += '</span>\n';
            }

            // 리뷰 스크립트 작성
            if(data.reviewPcList.length == 0){

                // 변수 초기화
                reviewcurrentPage = 1;	// 리뷰 수
                review_block = 1;		// 현재 블럭
                review_totalBlock = 1;	// 총 블럭
                review_totalPage = 1;	// 총 페이지
                review_startPage = 1;	// 시작 페이지
                review_endPage = 1;		// 마지막 페이지

                tmpStr += '   <div class="nodata">\n';
                tmpStr += '      등록된 리뷰가 없습니다.\n';
                tmpStr += '   </div>\n';

            }else{

                // 변수 초기화
                review_block = Math.ceil(reviewcurrentPage/10); 			// 현재블럭, (현재페이지/10)을 ceil한 값
                review_totalPage = Math.ceil(reviewListCnt/reviewLimit);	// 총 페이지 수 (조회 조건으로 나온 총 문의 수/한페이지의 글 수)를 ceil한 값
                review_totalBlock = Math.ceil(review_totalPage/10);			// 총 블럭수 (총페이지/10)
                review_startPage = (review_block-1)*10 + 1;					// 시작 페이지
                review_endPage = review_startPage + 10 -1;					// 마지막 페이지

                tmpStr += '<ul>\n';
                if(itemEvalAtclExpsYn == 'Y'){
                    $(data.reviewPcList).each(function(index) {
                        tmpStr += '<li data-no="'+this.itemEvalAtclNo+'" data-wrt-id="'+this.wrtItntId+'"  data-ord-no="'+this.ordNo+'"  data-slitm-cd="'+this.slitmCd+'"  data-opt-cd="'+fnIsNull(this.optItemCd)+'"  data-img-path="'+fnIsNull(this.imgPath)+'" data-contents=\''+fnIsNull(this.itemEvalCntn)+'\'\n';
                        tmpStr += '    data-img-path1="'+fnIsNull(this.imgPath1)+'" data-img-path2="'+fnIsNull(this.imgPath2)+'" data-img-path3="'+fnIsNull(this.imgPath3)+'" data-slitm-nm=\''+fnIsNull(this.slitmNm)+'\' data-slitm-desc=\''+fnIsNull(this.slitmDesc)+'\' \n';
                        tmpStr += '    data-atfl-no="'+fnIsNull(this.atflNo)+'" data-scrg="'+fnIsNull(this.itemEvalScrg)+'">\n';

                        if(this.banYn == 'Y') {
                            tmpStr += '    <div class="recont">\n';

                            tmpStr += '        <div class="ti">\n';
                            tmpStr += '            <span class="txt-option">\n';
                            tmpStr += '            '+fnIsNull(this.slitmDesc)+'\n';
                            tmpStr += '            </span>\n';

                            tmpStr += '            <span class="txt-review"></br>'+'신고로 인해 삭제된 상품평입니다'+'</span>\n';
                            tmpStr += '        </div>\n';

                            tmpStr += '		   </div>\n';
                            tmpStr += '    </div>\n';

                            tmpStr += '        <div class="info">\n';
                            tmpStr += '            <span class="txt-id">'+this.wrtItntNm+'</span>\n';
                            tmpStr += '            <span class="txt-date">'+this.chgDtmNm+'</span>\n';
                            tmpStr += '        </div>\n';
                            tmpStr += '        \n';

                            tmpStr += '</li>\n'
                        } else {
                            tmpStr += '    <div class="star">\n';
                            tmpStr += '        <div class="grade-star"><span><span style="width:'+(this.itemEvalScrg*100/5)+'%;">'+this.itemEvalScrg+'</span></span></div>\n';

                            // 베스트 상품인 경우
                            if(this.bestYn == 'Y'){
                                tmpStr += '        <span class="best">BEST</span><!-- best 추가 -->\n';
                            }
                            tmpStr += '    </div>\n';

                            tmpStr += '    <div class="recont">\n';
                            // 이미지가 하나 이상일때만 표시
                            if(parseInt(this.imgCnt) > 0){
                                tmpStr += '        <div class="pic" data-menu=\''+fnIsNull(this.slitmNm)+'\' data-star="'+this.itemEvalScrg+'" data-option=\''+fnIsNull(this.slitmDesc)+'\'>\n';
                                if(this.imgPath1 != '' && this.imgPath1 != null){
                                    //tmpStr += '				<button type="button" data-picidx="1"><img src="'+vServerPath+'/pd/pdc/displayImg.do?name='+fnIsNull(this.imgPath1)+'"></button>\n';
                                    tmpStr += '				<button type="button" data-picidx="1"><img src="'+vContextImgPath+'/'+fnIsNull(this.imgPath1)+'?RS=720&AO=1"></button>\n';
                                }

                                if(this.imgPath2 != '' && this.imgPath2 != null){
                                    //tmpStr += '				<button type="button" data-picidx="2"><img src="'+vServerPath+'/pd/pdc/displayImg.do?name='+fnIsNull(this.imgPath2)+'"></button>\n';
                                    tmpStr += '				<button type="button" data-picidx="2"><img src="'+vContextImgPath+'/'+fnIsNull(this.imgPath2)+'?RS=720&AO=1"></button>\n';
                                }

                                if(this.imgPath3 != '' && this.imgPath3 != null){
                                    //tmpStr += '				<button type="button" data-picidx="3"><img src="'+vServerPath+'/pd/pdc/displayImg.do?name='+fnIsNull(this.imgPath3)+'"></button>\n';
                                    tmpStr += '				<button type="button" data-picidx="3"><img src="'+vContextImgPath+'/'+fnIsNull(this.imgPath3)+'?RS=720&AO=1"></button>\n';
                                }
                                tmpStr += '        </div>\n';
                            }


                            tmpStr += '        <div class="ti">\n';
                            tmpStr += '            <span class="txt-option">\n';
                            tmpStr += '            '+fnIsNull(this.slitmDesc)+'\n';
                            tmpStr += '            </span>\n';

                            var vItemEvalCntn = (this.itemEvalCntn).replaceAll("\r\n", "</br>");
                            tmpStr += '            <span class="txt-review">'+vItemEvalCntn+'</span>\n';
                            tmpStr += '        </div>\n';

                            tmpStr += '		   <div class="like">\n';
                            if(this.bestItemEvalYn == 'Y'){
                                tmpStr += '		       <button type="button" class="btn smaller gray btn-reviewlike active" onclick="fnToggleClass(this);">'+fnComma(parseInt(this.rcmmCnt))+'</button>\n';
                            }else{
                                tmpStr += '		       <button type="button" class="btn smaller gray btn-reviewlike" onclick="fnToggleClass(this);">'+fnComma(parseInt(this.rcmmCnt))+'</button>\n';
                            }
                            tmpStr += '			   리뷰가 도움이 되었나요?\n';
                            tmpStr += '		   </div>\n';
                            tmpStr += '    </div>\n';

                            tmpStr += '        <div class="info">\n';
                            tmpStr += '            <span class="txt-id">'+this.wrtItntNm+'</span>\n';
                            tmpStr += '            <span class="txt-date">'+this.chgDtmNm+'</span>\n';
                            tmpStr += '        </div>\n';
                            tmpStr += '        \n';

                            tmpStr += '		<div class="btnwrap">\n';
                            if(userId == this.wrtItntId){
                                tmpStr += '        <!-- 본인작성글일때 수정버튼 추가 -->\n';
                                tmpStr += '        <button type="button" class="btn-modify" onclick="fnReviewPopupOpen(this, \'B\');">수정</button>\n';
                            }
                            tmpStr += '		<button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고</button>\n';
                            tmpStr += '		</div>\n';


                            tmpStr += '</li>\n'

                        }
                    });	 // <li>반복 끝
                }else{
                    tmpStr += '    <div class="nodata txt-star">\n';
                    tmpStr += '        개인별 주관적인 의견으로 인해 상품의 기능 및 효과에 대한<br>\n';
                    tmpStr += '        오해의 소지가 있을 수 있어 상품평을 게시하지 않고 있습니다.\n';
                    tmpStr += '    </div>\n';

                }

                tmpStr += '</ul>\n';

                if(itemEvalAtclExpsYn == 'Y'){
                    // 네비게이션 스크립트 시작
                    tmpStr += '<!-- pagination// -->\n';
                    tmpStr += '<div class="pagination">\n';

                    if(qna_block > 1){
                        tmpStr += '   <a href="javascript:fnBlockCnt(\'A\', \'A\');" class="prev">이전</a>\n';
                    }

                    tmpStr += '   <span class="num">\n';
                    for(var i=review_startPage; i<=review_endPage; i++){

                        // i 값이 총 페이지 보다 클 경우 skip
                        if(i>review_totalPage) break;

                        // 현재 페이지는 active class 추가
                        if(i == reviewcurrentPage){
                            tmpStr += '   <a href="javascript:fnReviewAjaxPcList(\'B\', \''+i+'\');" class="active">'+i+'</a><!-- 현재페이지 class="active" -->\n';
                        }else{
                            tmpStr += '   <a href="javascript:fnReviewAjaxPcList(\'B\', \''+i+'\');">'+i+'</a>\n';
                        }
                    }
                    tmpStr += '   </span>\n';

                    if(review_totalBlock > review_block){
                        tmpStr += '   <a href="javascript:fnBlockCnt(\'A\', \'B\');" class="next">다음</a>\n';
                    }
                    tmpStr += '</div>\n';
                    tmpStr += '<!-- //pagination -->\n';
                }
            }

            // 리뷰 작성팝업의 옵션
            $('#p_proSelectReview').find('.contents').html(tmpSelectStr);

            // 평점 또는 리뷰 작성 격려 메시지 출력
            $('#p_proReview').find('.list-top').html(tmpTopStr);

            // 리뷰 리스트 출력
            $('#p_proReview').find('.review-list').html(tmpStr);

            // 상품평가글노출여부(노출여부가 N일 경우 리뷰를 숨기고 리뷰 숫자를 '' 처리)
            if(itemEvalAtclExpsYn == 'N'){
                $('#reviewCnt').text('');
                $('#p_proReview').find('.list-sort').hide();
                //$('#p_proReview').find('.review-list').hide();

            }else{
                //$('#p_proReview').find('.review-list').show();
            }

            //리뷰 더보기 클릭(리뷰 추가시 append 후 "fn.reviewInit();" 호출해주세요.
            fn.reviewInit();

        }

    })

}