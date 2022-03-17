<!-- @author 송진호 -->
<%--
  작성자: 김지혜
  작성일자: 3/15/22
  내용: 댓글 작성 & 조회
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recipe View Page</title>
    <link href="css/common.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
    <link href="css/library.css" rel="stylesheet">
    <link href="css/magazine.css" rel="stylesheet">
    <style>
        #contents .lnbarea + .conarea > h3 {
            padding: 3px 0 23px;
            color: #101010;
            font-size: 24px;
            font-weight: 200 !important;
        }
    </style>
</head>
<body>
<div id="wrap" class="magazine detail">
    <jsp:include page='<%="../header.jsp" %>'/>
    <div id="contents">
        <div class="innercon">
            <!-- 컨텐츠 상세// -->
            <div class="detailarea">
                <div class="title-area">
                    <div class="title">
                        <div class="inner">
                            <!-- 레시피 제목 및 조회수 표시// -->
                            <h2>${recipeVO.title}</h2>
                            <p align="right">조회수 : ${recipeVO.viewcount}</p>
                            <!-- //레시피 제목 및 조회수 표시 -->
                        </div>
                    </div>
                </div>

                <!-- 레시피 정보 표시// -->
                <div class="recipe-info">
                    <dl class="author">
                        <dt>작성자</dt>
                        <dd>${recipeVO.username}</dd>
                    </dl>
                    <dl class="category">
                        <dt>카테고리</dt>
                        <dd>${recipeVO.category}</dd>
                    </dl>
                    <dl class="grade">
                        <dt>평점</dt>
                        <dd>
							<div class="star">
	                    		<div class="grade-star">
	                    			<span>
	                    				<span id="star-span" style="width:20%">${recipeVO.grade}</span>
	                    			</span>
	                    		</div>
	                    	</div>
						</dd>
                    </dl>
                </div>
                <!-- //레시피 정보 표시 -->

                <!-- 레시피 대표 이미지 표시// -->
                <div class="recipe-view">
                    <img src="./images/recipe/${recipeVO.image}" alt="이미지없음">
                </div>
                <!-- //레시피 대표 이미지 표시 -->

                <!-- 레시피 소개 표시// -->
                <div class="recipe-info">
                    <h2>레시피 소개</h2><br>
                    ${recipeVO.intro}
                </div>
                <!-- //레시피 소개 표시 -->

                <!-- 관리자 등록 영역// -->
                <div class="edit-recipe">
                    <div class="magazinedetail m12">
                        <div class="mbox tab">
                            <ul class="menu">
                                <li class="active">
                                    <a href="#" id="ingredients" onclick="return false;"><em>재료</em></a>
                                </li>
                                <li class="">
                                    <a href="#" id="details" onclick="return false;"><em>조리법</em></a>
                                </li>
                            </ul>
                            <ul class="cont">
                                <li class="active">
                                    <!-- 문자열에 포함된 '\r\n'을 모두 '<br/>으로 변환 -->
                                    <c:set var='convertedIngredients'
                                           value='${fn:replace(recipeVO.ingredients, LF, "<br>")}'/>
                                    <!-- 문자열에 포함된 쉼표(',')를 모두 '<br/>으로 변환 -->
                                    <c:set var='replacedIngredients'
                                           value='${fn:replace(convertedIngredients, ",", "<br>")}'/>
                                    <!-- '<br/>'을 기준으로 문자열을 구분해서 각각 배열에 삽입 -->
                                    <ul class="list">
                                        <c:forEach var='item' items='${fn:split(replacedIngredients, "<br>")}'>
                                            <li>${item}</li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li class="">
                                    <!-- 문자열에 포함된 '\r\n'을 모두 '<br>으로 변환 -->
                                    <c:set var='convertedDetails' value='${fn:replace(recipeVO.details, LF, "<br>")}'/>
                                    <!-- 문자열에 포함된 쉼표(',')를 모두 '<br>으로 변환 -->
                                    <c:set var='replacedDetails' value='${fn:replace(convertedDetails, ",", "<br>")}'/>
                                    <ol class="step">
                                        <c:forEach var='item' items='${fn:split(replacedDetails, "<br>")}'
                                                   varStatus="status">
                                            <li>
                                                <strong>STEP <c:out value='${status.count}'/></strong>
                                                <p>${item}</p>
                                            </li>
                                        </c:forEach>
                                    </ol>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- //관리자 등록 영역 -->
                <div class="cont-info">
                    <span class="date"></span>
                </div>
            </div>
        </div>
        <c:choose>
            <%--        로그인 했다면 댓글 작성하는 화면 노출--%>
        <c:when test="${empty loginUser.username}">
        </c:when>
        <c:otherwise>
        <section class="conarea" style="
        float: left;
        width: 100%;
        padding: 20px 280px;
        font-size: 1.5rem;">
            <h3 class="tit" style="    font-weight: bold;
    font-size: 2rem;
    color: black;
    padding-bottom: 20px;">댓글 작성</h3>

            <div class="infotxt big">
                <ul>
                    <li style="font-size: 1.2rem;">레시피에 대한 댓글과 1 ~ 5 점 사이의 평점을 남겨주세요</li>
                </ul>
            </div>

            <form name="comment_insert_form" method="post" action="app?command=insert_comment">
                <input type='hidden' name='user_id' id='userid' value='${loginUser.id}'/>
                <input type='hidden' name='recipe_id' id='recipeid' value='${recipeVO.id}'/>
                <fieldset class="qna-write">
                    <legend class="hide">댓글 작성</legend>

                    <div class="default-write">
                        <label class="form-default">
                            <span class="counter">평점</span>
                            <input name="grade" type="number"><br>
                        </label>
                        <label class="form-default">
                            <span class="counter">내용</span>
                            <textarea name="contents" title="리뷰 입력" placeholder="레시피에 대한 의견을 남겨주세요"
                                      maxlength="500"></textarea>
                        </label>
                        <div class="btns">
                            <button type="button" class="btn fill black btn-confirm" id="btn-confirm"
                                    onclick="insert_comment()" style="width: 100px;">확인
                            </button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </section>
        </c:otherwise>
        </c:choose>
        <section id="p_proReview" class="tab-contents proreview active" style="idth: 100%;
    padding: 20px 280px;">
            <header class="header">
                <h4><span style="font-weight: bold;
    font-size: 2rem;
    color: black;
    margin-bottom: 40px;">레시피 댓글</span></h4>
            </header>

            <div class="list-top" style="padding-top: 15px;
    font-size: 1.2rem;">
                <p>
                    레시피의 댓글들을 확인해보세요!<br>의
                    로그인을 하면 댓글을 작성할 수 있습니다.
                </p>
            </div>
            <!-- 리뷰 리스트 동적 구현 -->
            <div class="review-list">
                <ul>

                    <a href="app?command=recipe_view&amp;recipeId=18">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">3</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">댓글작성 form 테스트를 해봅시다2222</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-10</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=18">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">333</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-10</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=17">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">444</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-11</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=17">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">444</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-11</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=17">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">444</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-11</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=17">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">2</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">recipeId 17 22</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-11</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=17">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">3</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">fdfdfd</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-16</span>
                            </div>
                        </li>
                    </a>

                    <a href="app?command=recipe_view&amp;recipeId=17">
                        <li>
                            <div class="star">
                                <div class="grade-star"><span><span style="width:100%;">3</span></span></div>
                            </div>
                            <div class="recont">
                                <div class="ti">
                                    <span class="txt-review">fdfdfd</span>
                                </div>
                            </div>
                            <div class="info">
                                <span class="txt-date">2022-03-16</span>
                            </div>
                        </li>
                    </a>

                </ul>
                <!-- pagination// -->
                <div class="pagination">
                            <span class="num">
                                <a href="javascript:fnReviewAjaxPcList(1, 28);" class="active">1</a>
                                <a href="javascript:fnReviewAjaxPcList(2, 28);">2</a>
                                <a href="javascript:fnReviewAjaxPcList(3, 28);">3</a>
                                <a href="javascript:fnReviewAjaxPcList(4, 28);">4</a>
                                <a href="javascript:fnReviewAjaxPcList(5, 28);">5</a>
                                <a href="javascript:fnReviewAjaxPcList(6, 28);">6</a>
                            </span>
                </div>
                <!-- //pagination -->
            			</div>
        			</section>
				</article>
			</div>
		<jsp:include page='<%="../footer.jsp" %>'/>
	</div>
</body>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Javascript -->
<script type="text/javascript">
	/* 재료 & 조리법 전환 SJH */
	$(document).ready(function () {
		$('#ingredients').on("click", function() {
			if($(this).parent().hasClass('active') == false) {
				$(this).parent().addClass('active');
				$('.list').parent().addClass('active');
	   			$('#details').parent().removeClass('active');
	   			$('.step').parent().removeClass('active');	
			}
		});
		$('#details').on("click", function() {
	   		if($(this).parent().hasClass('active') == false) {
	   			$(this).parent().addClass('active');
	   			$('.step').parent().addClass('active');
	   			$('#ingredients').parent().removeClass('active');
	   			$('.list').parent().removeClass('active');
	   		}
		});
	});
	
	/* 레시피의 평점에 따라 Width의 퍼센트 값을 받아서 별 출력 SJH  */
	window.onload = function() {
		var spanId = document.getElementById("star-span");
	    var grade = $('#star-span').text();
	    console.log(grade);
	    var percent = 20 * grade + "%";
	    spanId.style.width = percent;
	}
	
    /* 레시피 삭제 seop */
    function fnDeleteRecipe() {
        if (confirm("삭제하시겠습니까?")) {
            $('form[name=udform]').attr({action: "app?command=recipe_delete", method: 'post'}).submit();
        }
    }

    /* 레시피 수정 seop */
    function fnUpdateRecipe() {
        if (confirm("수정하시겠습니까?")) {
            $('form[name=udform]').attr({action: "app?command=recipe_update_form", method: 'post'}).submit();
        }
    }

    /* 재료 & 조리법 전환 SJH */
    $(document).ready(function () {
        $('#ingredients').on("click", function () {
            if ($(this).parent().hasClass('active') == false) {
                $(this).parent().addClass('active');
                $('.list').parent().addClass('active');
                $('#details').parent().removeClass('active');
                $('.step').parent().removeClass('active');
            }
        });
        $('#details').on("click", function () {
            if ($(this).parent().hasClass('active') == false) {
                $(this).parent().addClass('active');
                $('.step').parent().addClass('active');
                $('#ingredients').parent().removeClass('active');
                $('.list').parent().removeClass('active');
            }
        });
    });

    function insert_comment() {
        document.comment_insert_form.submit();
    }
</script>
</html>