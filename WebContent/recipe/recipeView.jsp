<!-- @author 김지혜 + 김경섭 + 송진호 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>레시피 상세 페이지</title>
    <!-- <link rel="stylesheet" type="text/css" href="css/recipeView.css"> -->
    <link rel="stylesheet" type="text/css" href="./css/common.css?ver=17">
    <link rel="stylesheet" type="text/css" href="./css/library.css?ver=17">
    <link rel="stylesheet" type="text/css" href="./css/magazine.css?ver=1517">
</head>

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
	                <dl class="grade" >
	                    <dt>평점</dt>
	                    <dd>${recipeVO.grade}</dd>
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
									<ul class="list"> 
										<li>사과 ½개</li> 
										<li>계절 과일</li>
										<li>물 270g</li>
										<li>자스민차 7g</li>
										<li>레몬즙 60g</li>
										<li>설탕 50g</li>
										<li>고수 4장</li> 
										<li>라임 ½개</li>
										<li>민트잎 약간</li>
										<li>식용 꽃 약간</li>
									</ul>
								</li>
								<li class="">
									<ol class="step">
										<li>
											<strong>STEP 1</strong>
											<p>자스민차를 3분 우린 후 차가 식기 전에 설탕을 넣어 녹이고 레몬즙을 섞습니다.</p>
											<div class="tip">
												<em>tip</em>
												<p>홍차 또는 가향차 종류를 추천합니다.</p>
											</div>
										</li>
										<li>
											<strong>STEP 2</strong> 
											<p>사과와 과일을 한 입 사이즈로 손질하고 고수는 잘게 채를 썹니다. 라임은 깨끗이 세척 후 제스터로 껍질을 긁어주세요.</p> 
											<div class="tip">
												<em>tip</em>
												<p>과일은 무화과, 키위, 망고 등 취향껏 골라주세요.</p>
											</div>
										</li>
										<li>
											<strong>STEP 3</strong>
											<p>수프 그릇에 과일과 고수를 넣고 자스민차 시럽을 붓습니다.</p>
										</li> 
										<li>
											<strong>STEP 4</strong>
											<p>라임 제스트를 넣어 밀봉 후 냉장고에서 하룻밤 차갑게 식혀주세요.</p>
										</li> 
										<li>
											<strong>STEP 5</strong> 
											<p>다음날, 민트잎과 식용 꽃으로 장식하면 완성입니다. 과일과 시럽을 함께 떠서 한입에 즐겨주세요.</p>
										</li>
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
    </div>
    <jsp:include page='<%="../footer.jsp" %>'/>
</div>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Javascript -->
<script type="text/javascript">
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
</script>
</html>