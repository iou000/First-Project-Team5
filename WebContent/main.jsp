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
				<img src="recipe/dup.imb"/>
				${recipeVO.title}
				${recipeVO.grade}
				${recipeVO.username}
			</a>
			<br>
		</c:forEach>
	</div>
</body>

<!-- jQuery 3.5.1 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

</html>