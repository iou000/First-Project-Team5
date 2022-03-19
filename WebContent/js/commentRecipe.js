/**
 *
 *함수 : fnReviewAjaxPcList
 *작성자 : 김지혜
 *작성일 : 3/16/22
 * 내용 : 레시피 상세보기 댓글 페이징 액션 함수
 *
 **/
function fnReviewAjaxPcList(vCurrentPage, vTotalComments, recipe_id){
    location.href = '#p_proReview';
    // ** 페이징 옵션 변수 **

    // 현재 페이지
    let currentPage = vCurrentPage;
    // 전체 댓글 수
    let totalComments = vTotalComments;
    // 한 페이지 당 댓글 수 (페이지 당 5개씩 보여주는 것으로 고정)
    let commentPerBlock = 5;
    // 전체 블럭 수
    let commentBlock = Math.ceil(totalComments / commentPerBlock);

    // 레시피 아이디와 페이지 옵션 변수를 바탕으로 댓글 리스트 get 요청 ajax를 통해 보내고 data 변수에 리스트 저장
    $.ajax({
        type : 'get',
        url : 'app?command=comment_list&recipeId=' + recipe_id + '&pageNumber=' + currentPage + '&pageSize=' + commentPerBlock,
        dataType : 'json',
        cache : false,
        success : function(data) {
            let tmpStr = "";
            if (data.length === 0) {
                // 변수 초기화
                currentPage = 1;	// 리뷰 수
                totalComments = 1;		// 현재 블럭
                commentPerBlock = 1;	// 총 블럭
                commentBlock = 1;	// 총 페이지

                let tmpStr = "";
                tmpStr += '   <div class="nodata">\n';
                tmpStr += '등록된 리뷰가 없습니다.\n';
                tmpStr += '   </div>\n';

            } else {
                // 받아온 댓글 리스트를 HTML 태그로 변환
                tmpStr += '<ul>\n';
                $(data).each(function (index) {
                    tmpStr += '<a href=\"app?command=recipe_view&recipeId=' + data[index].recipe_id + '\">';
                    tmpStr += '   <li>';
                    tmpStr += '       <div class="star">';
                    tmpStr += '           <div class="grade-star"><span><span'
                    tmpStr += '                   id=\"star-span\" style=\"width:' + data[index].grade * 20 + '%\">' + data[index].grade + '</span></span></div>';
                    tmpStr += '       </div>';
                    tmpStr += '       <div class="recont">';
                    tmpStr += '           <div class="ti">';
                    tmpStr += '               <span class="txt-review">' + data[index].contents + '</span>';
                    tmpStr += '           </div>';
                    tmpStr += '       </div>';
                    tmpStr += '       <div class="info">';
                    tmpStr += '           <span class="txt-date">' + data[index].createdAt + '</br>by. ' + data[index].author +'</span>';
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
                for(let i = 1; i <= commentBlock; i++){
                    // 현재 페이지는 active class 추가
                    if(i === currentPage){
                        tmpStr += '<a href="javascript:fnReviewAjaxPcList(' + i + ',' + totalComments + ',' + recipe_id + ');" class="active">' + i + '</a><!-- 현재페이지 class="active" -->\n';
                    }else{
                        tmpStr += '<a href="javascript:fnReviewAjaxPcList(' + i + ',' + totalComments + ',' + recipe_id + ');">' + i + '</a>\n';
                    }
                }
                tmpStr += '   </span>\n';
                tmpStr += '</div>\n';
                tmpStr += '<!-- //pagination -->\n';
            }

            // HTML 태그 제이쿼리 문법을 통해 원래 HTML 태그에 붙여준다.
            $('#p_proReview').find('.review-list').html(tmpStr);
        }

    })

}
