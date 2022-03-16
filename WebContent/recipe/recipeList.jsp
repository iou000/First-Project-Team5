<!-- author @seop -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
        <link rel="stylesheet" type="text/css" href="css/product.css">
</head>
<body>
<div id="wrap" class="product category">
    <!-- header// -->
    <jsp:include page='<%="../header.jsp" %>'/>
    <!-- header// -->
	
    <!-- //contents -->
    <!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
    <div id="contents">
    <!-- 페이징 ajax용 @seop-->
    <input type="hidden" name="keywordAjax" value="${keywordAjax}"/>
    <input type="hidden" name="categoryAjax" value="${categoryAjax}"/>
    <input type="hidden" name="sortTypeAjax" value="${sortTypeAjax}"/>
        <div class="innercon" id="reset_section">
			<c:choose>
				<c:when test="${not empty keywordAjax}">
					<section class="categorylist">
        				<strong class="txt-total">
        					<span class="word" id="titleName">'${keywordAjax}'</span>
        					레시피
        					<em id="titleCnt">380</em>
        					건
        				</strong>
        			</section>
				</c:when>
				<c:when test="${not empty categoryAjax}">
					<section class="categorylist">
        				<strong class="txt-total">
        					<span class="word" id="titleName">'${categoryAjax}'</span>
        					레시피
        					<em id="titleCnt">380</em>
        					건
        				</strong>
        			</section>
				</c:when>
				<c:when test="${not empty sortTypeAjax}">
					<section class="categorylist">
        				<strong class="txt-total">
        					<span class="word" id="titleName">'전체'</span>
        					레시피
        					<em id="titleCnt">380</em>
        					건
        				</strong>
        			</section>
				</c:when>
			</c:choose>
        	
        	<!-- 정렬조건 선택 -->
        	<section class="list-filter">
        		<strong class="txt-total"></strong>
        		<div class="filter-wrapper">
        			<div class="form-filter">
	                    <ul class="btn-group" id="sortType">
	                        <li>
	                            <button id="sort_grade" type="button" class="active" onclick="fnSortType(this.id)">평점순</button>
	                        </li>
	                        <li><button id="sort_viewcount" type="button" onclick="fnSortType(this.id)">조회순</button></li>
	                    </ul>
	                </div>
        		</div>
        	</section>
        	
        	<!-- 레시피 리스트 받을 공간 -->
            <ul class="product-list" id="ulItemList">
                <c:forEach var="recipeVO" items="${recipeList}">
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
                          <span>(총 댓글수)</span>
                          <span>조회수 ${recipeVO.viewcount}</span>
                       </span>
                    </span>
                    </li>
                </c:forEach>
            </ul>
        </div>
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
<script>
    var loading = false; // ajax 중복 요청 방지용
    var pageNO = 2; // 1페이지는 처음에 불러왔으니 2부터 시작.
    var pageSize = 8 // 불러올 데이터 갯수.

    /* AJAX로 데이터 요청 @seop */
    function next_recipes_load() {
        var keywordAjax = $("input[name=keywordAjax]").val();
        var categoryAjax = $("input[name=categoryAjax]").val();
        var sortTypeAjax = $("input[name=sortTypeAjax]").val();


        console.log("키워드 :",keywordAjax);
        console.log("카테고리 :",categoryAjax);
        console.log("정렬 :",sortTypeAjax);
        
        $.ajax({
            type    : "POST",
            url     : "app?command=recipe_paging_ajax",
            dataType: "json", //json형식으로 데이터를 보냄
            data    : {
                'keywordAjax' : keywordAjax,
                'categoryAjax': categoryAjax,
                'sortTypeAjax': sortTypeAjax,
                'pageNO'      : pageNO,
                'pageSize'    : pageSize
            },
            success : function (data, textStatus) {
            
                //서버로부터 받아온 데이터(레시피들)을 추가
                for (var i = 0; i < data.length; i++) {
                    var node = "";
                    node += "<li>";
                    node += "   <a href='app?command=recipe_view&recipeId=" + data[i].id + "'>";
                    node += "      <span class='thumb'>";
                    node += "          <img src='./images/recipe/" + data[i].image + "' alt='이미지 없음'>";
                    node += "      </span>";
                    node +=   "      <strong class='txt-ti ellipsis'>";
                    node +=   "         "+data[i].title;+"";
                    node +=   "      </strong>";
                    node +=   "      <span id='user_by'>";
                    node +=   "         by. "+data[i].username;
                    node +=   "      </span>";
                    node += "   </a>";
                    node +=   "   <span class='info'>";
                    node +=   "      <span class='product_caption'>";
                    node +=   "         <span class='caption_star'>";
                    node +=   "            <img src='./images/common/star.png'>";
                    node +=   "         </span>";
                    node +=   "         <span>("+data[i].grade+")</span>";
                    node +=   "         <span>(총 댓글수)</span>";
                    node +=   "         <span>조회수 "+data[i].viewcount+"</span>";
                    node +=   "      </span>"
                    node +=   "   </span>";
                    node += "</li>";
                    

                    $('#ulItemList').append(node);
                }

                console.log(pageNO, data);
                pageNO++; //페이지 증가


                loading = false;    //실행 가능 상태로 변경

                //받아올 데이터가 없으면 ajax 닫음
                if (data.length == 0) {
                    loading = true;
                }

            }
            , error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }

        });
    }

    /* 무한 스크롤 @seop */
    $(window).scroll(() => {
        if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
            if (!loading)    //실행 가능 상태라면?
            {
                next_recipes_load();
                loading = true; //실행 불가능 상태로 변경
            }
        }
    });
    
    

    /* 정렬조건 선택시 레시피 정보를 다시 받아옴 @seop */
    function fnSortType(sort_type) {
		//평점순 선택시
		if(sort_type == 'sort_grade') {
			$("input[name=sortTypeAjax]").val('grade');
			
			$("#sort_grade").addClass("active");
			$("#sort_viewcount").removeClass("active");
			
			//1페이지부터 다시불러와야함
			pageNO = 1;
			//현재 있는 레시피 리스트 모두 삭제
			$('#ulItemList').empty();
			//조건에 맞는 레시피 리스트를 불러옴
			next_recipes_load();
			
		//조회순 선택시
		} else if(sort_type == 'sort_viewcount') {
			$("input[name=sortTypeAjax]").val('viewcount');
			
			$("#sort_grade").removeClass("active");
			$("#sort_viewcount").addClass("active");
			
			//1페이지부터 다시불러와야함
			pageNO = 1;
			//현재 있는 레시피 리스트 모두 삭제
			$('#ulItemList').empty();
			//조건에 맞는 레시피 리스트를 불러옴
			next_recipes_load();
		}
	}
    
    /* 메인페이지에서 평점순 or 조회순으로 들어왔을 경우 */
     $(window).ready(function(){
    	if($("input[name=sortTypeAjax]").val() == 'grade') {
    		console.log('평점순');
    		$("#sort_grade").addClass("active");
			$("#sort_viewcount").removeClass("active");
    	} else if($("input[name=sortTypeAjax]").val() == 'viewcount'){
    		console.log('조회순');
    		$("#sort_grade").removeClass("active");
			$("#sort_viewcount").addClass("active");
    	}}); 
    
    
    
    

</script>

</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</html>