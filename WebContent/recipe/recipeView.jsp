<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
</head>
<body>
	<div name="recipe_test" align="center">
		<h1>Recipe Contents Test</h1>
		<h2>${recipeVO.image}</h2>
		<h2>${recipeVO.category}</h2>
		<h2>${recipeVO.title}</h2>
		<h2>${recipeVO.grade}</h2>
		<h2>${recipeVO.author}</h2>
		<h2>${recipeVO.intro}</h2>
		<h2>${recipeVO.ingredients}</h2>
		<h2>${recipeVO.details}</h2>
		<h2>${recipeVO.updatedat}</h2>
	</div>
	<div name="comment_test" align="center">
		<h1>CommentList Test</h1>
		<h2>${commentList.author}</h2>
		<h2>${commentList.grade}</h2>
		<h2>${commentList.contents}</h2>
		<h2>${commentList.updatedat}</h2>	
	</div>
</body>
</html>