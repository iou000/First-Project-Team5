<!-- @author 김지혜 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
	<link href="css/mypage.css" rel="stylesheet">
</head>
<body>
	<div class="wr">
    	<h2>My Page</h2>
    	<p> 안녕하세요 ${loginUser.username} 님!!  </p>
		<a href="app?command=recipe_insert_form">레시피 만들기</a>
		<div id="front">
			<div id="myRecipe">
				<h2> 내가 만든 레시피 </h2>
	        	<c:forEach items="${recipeList}" var="recipeVO">
		        	<div id="item">
			            <a href="app?command=recipe_view&recipeId=${recipeVO.id}">
			            	<img src="./image/recipe/${recipeVO.image}" alt="이미지가 존재하지 않습니다!!!">
			            	${recipeVO.title}
			            	${recipeVO.image}
			            	${recipeVO.viewcount}
			            </a>
		            </div>
	        	</c:forEach>
	       	</div>
			<hr>
			<!-- author SJH -->
	       	<div id="myComment">
	       		<h2> 내가 작성한 댓글 </h2>
	       		<c:forEach items="${commentList}" var="commentVO">
	       			<div id="item">
	       				<!-- 댓글을 작성한 레시피의 주소로 이동해야 함 -->
	       				<a href="app?command=recipe_view&recipeId=${commentVO.recipe_id}">
	       					평점 : ${commentVO.grade}, 내용 : ${commentVO.contents} (수정일자 : ${commentVO.updatedAt})
	       					<br>
	      				</a>
	     			</div>
	    		</c:forEach>
	    	</div>
	    </div>
    </div>
</body>
</html>
