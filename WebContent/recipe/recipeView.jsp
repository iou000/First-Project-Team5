<!-- @author 송진호 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	pageContext.setAttribute("LF", "\r\n");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recipe View Page</title>
    <!-- 
    <link rel="stylesheet" type="text/css" href="./css/common.css">
    <link rel="stylesheet" type="text/css" href="./css/library.css">
     -->
    <link rel="stylesheet" type="text/css" href="./css/magazine.css">
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
		                <dl class="grade" >
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
										<c:set var='convertedIngredients' value='${fn:replace(recipeVO.ingredients, LF, "<br>")}' />
										<!-- 문자열에 포함된 쉼표(',')를 모두 '<br/>으로 변환 -->
										<c:set var='replacedIngredients' value='${fn:replace(convertedIngredients, ",", "<br>")}' />
										<!-- '<br/>'을 기준으로 문자열을 구분해서 각각 배열에 삽입 -->
										<ul class="list">
											<c:forEach var='item' items='${fn:split(replacedIngredients, "<br>")}'>
												<li>${item}</li>
											</c:forEach>
										</ul>
									</li>
									<li class="">
										<!-- 문자열에 포함된 '\r\n'을 모두 '<br>으로 변환 -->
										<c:set var='convertedDetails' value='${fn:replace(recipeVO.details, LF, "<br>")}' />
										<!-- 문자열에 포함된 쉼표(',')를 모두 '<br>으로 변환 -->
										<c:set var='replacedDetails' value='${fn:replace(convertedDetails, ",", "<br>")}' />
										<ol class="step">
											<c:forEach var='item' items='${fn:split(replacedDetails, "<br>")}' varStatus="status">
												<li>
													<strong>STEP <c:out value='${status.count}' /></strong>
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
</script>
</html>