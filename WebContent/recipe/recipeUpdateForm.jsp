<!-- @author 송진호 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recipe Update Page</title>
    <link rel="stylesheet" type="text/css" href="./css/mypage.css">
    <link rel="stylesheet" type="text/css" href="./css/common.css?ver=12">
    <link rel="stylesheet" type="text/css" href="./css/library.css?ver=12">
</head>
<body>
<div id="wrap" class="mypage largeorder">
    <%@ include file="../header.jsp" %>
    <div id="contents">
        <div class="innercon">
            <section class="conarea">
                <h3 class="tit line">레시피 수정하기</h3>
                <form id="frmMassOrdInqrInf" method="POST" action="app?command=recipe_update"
                      enctype="multipart/form-data" onsubmit="return checkUpdateForm()">
                    <input type="hidden" name="recipeId" value="${recipeVO.id}"/>
                    <fieldset class="form-field">
                        <legend class="hide">레시피 수정하기</legend>
                        <dl>
                            <dt>레시피 제목 <span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <label class="form-entry">
                                    <input type="text" name="title" title="레시피 제목 입력" maxlength="20"
                                           value="${recipeVO.title}" placeholder="레시피 제목을 작성해주세요!">
                                </label>
                            </dd>
                        </dl>
                        <dl>
                            <dt>레시피 소개 <span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <label class="form-entry">
                                    <input type="text" name="intro" title="레시피 소개 입력" maxlength="40"
                                           value="${recipeVO.intro}" placeholder="레시피 소개를 작성해주세요!">
                                </label>
                            </dd>
                        </dl>
                        <dl>
                            <dt>레시피 분류 <span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <div class="col-input">
                                    <label>
                                        <input type="radio" name="category" value="한식" <c:if
                                                test='${recipeVO.category=="한식"}'> checked </c:if> />
                                        <span>한식</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="category" value="양식" <c:if
                                                test='${recipeVO.category=="양식"}'> checked </c:if> />
                                        <span>양식</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="category" value="일식" <c:if
                                                test='${recipeVO.category=="일식"}'> checked </c:if> />
                                        <span>일식</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="category" value="중식" <c:if
                                                test='${recipeVO.category=="중식"}'> checked </c:if> />
                                        <span>중식</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="category" value="분식" <c:if
                                                test='${recipeVO.category=="분식"}'> checked </c:if> />
                                        <span>분식</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="category" value="간식" <c:if
                                                test='${recipeVO.category=="간식"}'> checked </c:if> />
                                        <span>간식</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="category" value="디저트" <c:if
                                                test='${recipeVO.category=="디저트"}'> checked </c:if> />
                                        <span>디저트</span>
                                    </label>
                                </div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>식재료 <span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <textarea placeholder="예: 물 1L, 마늘 한 쪽, 돼지고기 300g" name="ingredients"
                                          maxlength="500">${recipeVO.ingredients}</textarea>
                                <div class="infotxt">
                                    <ul>
                                        <li>필요한 식재료를 쉼표 또는 Enter로 구분해서 작성해주세요!</li>
                                    </ul>
                                </div>
                            </dd>
                        </dl>
                        <dl>
                            <dt>조리법 <span class="need">*<span class="hide">필수</span></span></dt>
                            <dd>
                                <textarea placeholder="예: 물을 끓인다, 면을 넣는다, 소스를 넣는다" name="details"
                                          maxlength="500">${recipeVO.details}</textarea>
                                <div class="infotxt">
                                    <ul>
                                        <li>조리 단계를 Enter로 구분해서 작성해주세요!</li>
                                    </ul>
                                </div>
                            </dd>
                        </dl>
                        <dl class="btn-field">
                            <dt>대표 이미지 첨부</dt>
                            <dd>
                                <div class="form-file">
                                    <div class="upload-doc">
                                        <div class="upload-display">
                                            <span>${recipeVO.image}</span>
                                        </div>
                                        <label>
                                            <input type="file" id="atfl" name="image" accept="image/jpeg, image/png"
                                                   class="upload-hidden">
                                            <span class="btn fill gray">파일첨부</span>
                                        </label>
                                        <input type="hidden" name="fileNm" value="${recipeVO.image}">
                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <div class="btns">
                            <button type="button" class="btn fill black" onclick="recipeSubmit()">등록</button>
                            <button type="button" class="btn black" onclick="history.back()">취소</button>
                        </div>
                    </fieldset>
                </form>
            </section>
        </div>
    </div>
    <jsp:include page='<%="../footer.jsp" %>'/>
</div>
</body>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Javascript -->
<script type="text/javascript">
    $(document).ready(function () {
        $('.upload-hidden').on('change', function () {
            var filename = $(this)[0].files[0].name;
            var newFile = $('.upload-display span').text(filename);
            //$('input[name=image]').attr();
        });
    });

    function recipeSubmit() {
        $('#frmMassOrdInqrInf').submit();
    }

    /* submit 유효성 검사 @author 김경섭 */
    function checkUpdateForm() {
        if ($('input[name=title]').val() == null || $('input[name=title]').val() == "") {
            alert('레시피 제목을 입력해주세요!!!');
            $('input[name=title]').focus();
            return false;
        } else if ($('input[name=intro]').val() == null || $('input[name=intro]').val() == "") {
            alert('레시피 소개를 입력해주세요!!!');
            $('input[name=intro]').focus();
            return false;
        } else if ($('textarea[name=ingredients]').val() == null || $('textarea[name=ingredients]').val() == "") {
            alert('레시피에 필요한 식재료를 입력해주세요!!!');
            $('textarea[name=ingredients]').focus();
            return false;
        } else if ($('textarea[name=details]').val() == null || $('textarea[name=details]').val() == "") {
            alert('레시피 조리법을 단계별로 작성해주세요!!!');
            $('textarea[name=details]').focus();
            return false;
        } else if ($('input[name=image]').val() == null || $('input[name=image]').val() == "") {
            if (confirm('대표 이미지 없이 레시피를 수정할까요?')) return true;
            $('input[name=image]').focus();
            return false;
        } else {
            if (confirm('레시피를 수정할까요?')) return true;
            return false;
        }
    }
</script>
</html>