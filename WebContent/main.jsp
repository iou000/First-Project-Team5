<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
</head>
<body>
	<!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
	<div id="recipes" align="center">
		<c:forEach var="recipeVO" items="${recipeList}">
			<a href="app?command=recipe_view&recipeId=${recipeVO.id}">
				<!-- <img src="recipe/${recipeVO.image}"/> -->
				<img src="images/recipe/dup.jpg"/>
				${recipeVO.title}
				${recipeVO.grade}
				${recipeVO.username}
			</a>
			<br>
		</c:forEach>
	</div>
</body>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</html>