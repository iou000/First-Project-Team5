<!-- @author 김경섭 -->
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
    <!-- 페이징 ajax용 @김경섭-->
    <input type="hidden" name="keywordAjax" value="${keywordAjax}"/>
    <input type="hidden" name="categoryAjax" value="${categoryAjax}"/>
    <input type="hidden" name="sortTypeAjax" value="${sortTypeAjax}"/>
        <div class="innercon" id="reset_section">
			<c:choose>
				<c:when test="${not empty keywordAjax}">
					<section class="categorylist">
        				<strong class="txt-total">
        					<span class="word" id="titleName">'${keywordAjax}'</span>
        					레시피 검색결과
        					<em id="titleCnt">${totRecipeListCnt}</em>
        					건
        				</strong>
        			</section>
				</c:when>
				<c:when test="${not empty categoryAjax}">
					<section class="categorylist">
        				<strong class="txt-total">
        					<span class="word" id="titleName">'${categoryAjax}'</span>
        					레시피
        					<em id="titleCnt">${totRecipeListCnt}</em>
        					건
        				</strong>
        			</section>
				</c:when>
				<c:when test="${not empty sortTypeAjax}">
					<section class="categorylist">
        				<strong class="txt-total">
        					<span>레시피 검색결과 </span>
        					<em id="titleCnt">${totRecipeListCnt}</em>
        					건
        				</strong>
        			</section>
				</c:when>
				<c:otherwise>
					<section class="categorylist">
        				<strong class="txt-total">
        					<span class="word" id="titleName">'전체'</span>
        					레시피
        					<em id="titleCnt">${totRecipeListCnt}</em>
        					건
        				</strong>
        			</section>
				</c:otherwise>
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
                          <span>&nbsp;&nbsp;&nbsp;조회수 ${recipeVO.viewcount}</span>
                       </span>
                    </span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
<jsp:include page='<%="../footer.jsp" %>'/>


</div>
<script>
    var loading = false; // ajax 중복 요청 방지용
    var pageNO = 2; // 1페이지는 처음에 불러왔으니 2부터 시작.
    var pageSize = 8 // 불러올 데이터 갯수.
    
    /* AJAX로 데이터 요청 김경섭 */
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
                    node += "      <strong class='txt-ti ellipsis'>";
                    node += "         " + data[i].title;
                    +"";
                    node += "      </strong>";
                    node += "      <span id='user_by'>";
                    node += "         by. " + data[i].username;
                    node += "      </span>";
                    node += "   </a>";
                    node += "   <span class='info'>";
                    node += "      <span class='product_caption'>";
                    node += "         <span class='caption_star'>";
                    node += "            <img src='./images/common/star.png'>";
                    node += "         </span>";
                    node += "         <span>" + data[i].grade + "</span>";
                    node += "         <span>&nbsp;&nbsp;&nbsp;조회수 " + data[i].viewcount + "</span>";
                    node += "      </span>"
                    node += "   </span>";
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

    /* 무한 스크롤 김경섭 */
    $(window).scroll(() => {
        if ($(window).scrollTop() + 100 >= $(document).height() - $(window).height()) {
            if (!loading)    //실행 가능 상태라면?
            {
                next_recipes_load();
                loading = true; //실행 불가능 상태로 변경
            }
        }
    });


    /* 정렬조건 선택시 레시피 정보를 다시 받아옴 김경섭 */
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
    
    /* 메인페이지에서 평점순 or 조회순으로 들어왔을 경우 김경섭 */
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