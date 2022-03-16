//리뷰 조회(type A:초기화후 조회, B:초기화 하지 않고 조회)
function fnReviewAjaxPcList(type, vCurrentPage, vTotalPage){
    console.log("hello");

    // 판매상품코드
    var vSlitmCd = "";
    var vOptItemCd = "";
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

    $.ajax({
        type : 'get',
        url : 'app?command=comment_list&userId=4&pageNumber=' + reviewcurrentPage,
        dataType : 'json',
        cache : false,
        success : function(data, status, xhr) {
            console.log(data);
            // 조회된 리뷰 개수, 평점
            // var reviewCnt = data.reviewPcInfo.reviewCnt;
            // 리뷰 평점
            // var reviewAvg = data.reviewPcInfo.reviewAvg;
            // var reviewListCnt = data.reviewPcInfo.reviewListCnt;

            // 리뷰 개수(총수)
            // $('#reviewCnt').text(fnComma(reviewCnt));
            //
            // var tmpStr = '';			// 리뷰 리스트 스트링
            // var tmpTopStr = '';			// 리뷰평점, 격려메시지 출력 스트링
            // var tmpSelectStr = '';		// 상품 선택 팝업리스트 스트링

            // 노출 댓글에 대한 내용
            // tmpTopStr += '<span class="grade-star big">\n';
            // tmpTopStr += '    <span><span style="width:'+(reviewAvg/5*100)+'%;"></span></span>\n';
            // tmpTopStr += '    <strong><em>'+reviewAvg+'</em> <i class="bar">/</i> 5</strong>\n';
            // tmpTopStr += '</span>\n';

            // 리뷰 스크립트 작성
            let tmpStr = "";
            if (data.length == 0) {
                // 변수 초기화
                reviewcurrentPage = 1;	// 리뷰 수
                review_block = 1;		// 현재 블럭
                review_totalBlock = 1;	// 총 블럭
                review_totalPage = 1;	// 총 페이지
                review_startPage = 1;	// 시작 페이지
                review_endPage = 1;		// 마지막 페이지

                let tmpStr = "";
                tmpStr += '   <div class="nodata">\n';
                tmpStr += '등록된 리뷰가 없습니다.\n';
                tmpStr += '   </div>\n';

            } else {

                // 변수 초기화
                review_block = Math.ceil(reviewcurrentPage / 10); 			// 현재블럭, (현재페이지/10)을 ceil한 값
                review_totalPage = Math.ceil(vTotalPage / 5);	// 총 페이지 수 (조회 조건으로 나온 총 문의 수/한페이지의 글 수)를 ceil한 값
                review_totalBlock = Math.ceil(review_totalPage / 10);			// 총 블럭수 (총페이지/10)
                review_startPage = (review_block - 1) * 10 + 1;					// 시작 페이지
                review_endPage = review_startPage + 10 - 1;					// 마지막 페이지
                tmpStr += '<ul>\n';
                $(data).each(function (index) {
                    console.log(index);
                    tmpStr += '<a href=\"app?command=recipe_view&recipeId=' + data[index].recipe_id + '\">';
                    tmpStr += '   <li>';
                    tmpStr += '       <div class="star">';
                    tmpStr += '           <div class="grade-star"><span><span'
                    tmpStr += '                   style=\\"width:100%;\\">' + data[index].grade + '</span></span></div>';
                    tmpStr += '       </div>';
                    tmpStr += '       <div class="recont">';
                    tmpStr += '           <div class="ti">';
                    tmpStr += '               <span class="txt-review">' + data[index].contents + '</span>';
                    tmpStr += '           </div>';
                    tmpStr += '       </div>';
                    tmpStr += '       <div class="info">';
                    tmpStr += '           <span class="txt-date">' + data[index].updatedAt + '</span>';
                    tmpStr += '       </div>';
                    tmpStr += '   </li>';
                    tmpStr += '</a>';
                    console.log(tmpStr)
                });	 // <li>반복 끝

                tmpStr += '</ul>\n';
                // 네비게이션 스크립트 시작
                tmpStr += '<!-- pagination// -->\n';
                tmpStr += '<div class="pagination">\n';

                tmpStr += '   <span class="num">\n';
                console.log("===================================")
                console.log(review_startPage)
                console.log(review_endPage)
                console.log(review_totalPage)
                console.log("===================================")
                for(let i=0; i<=5; i++){

                    // i 값이 총 페이지 보다 클 경우 skip
                    if(i>review_totalPage) break;

                    // 현재 페이지는 active class 추가
                    if(i === reviewcurrentPage){
                        tmpStr += '<a href="javascript:fnReviewAjaxPcList(\'B\', \''+i+'\');" class="active">'+i+'</a><!-- 현재페이지 class="active" -->\n';
                        console.log("current page");
                    }else{
                        tmpStr += '<a href="javascript:fnReviewAjaxPcList(\'B\', \''+i+'\');">'+i+'</a>\n';
                        console.log("not a current page");
                    }
                }
                tmpStr += '   </span>\n';

                if(review_totalBlock > review_block){
                    tmpStr += '   <a href="javascript:fnBlockCnt(\'A\', \'B\');" class="next">다음</a>\n';
                }
                tmpStr += '</div>\n';
                tmpStr += '<!-- //pagination -->\n';
            }

            // 리뷰 리스트 출력
            $('#p_proReview').find('.review-list').html(tmpStr);
        }

    })

}