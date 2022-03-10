<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
</head>
<body>
	<h1>recipeVO Test</h1>
	<h2>${recipeVO.title}</h2>
	<h2>${recipeVO.intro}</h2>
	<h2>${recipeVO.category}</h2>
	<h2>${recipeVO.ingredients}</h2>
	<h2>${recipeVO.details}</h2>
	<h2>${recipeVO.image}</h2>
	<h2>${recipeVO.createdAt}</h2>
	<h2>${recipeVO.updatedAt}</h2>
	<h2>${recipeVO.username}</h2>
	<h2>${recipeVO.viewcount}</h2>

	<c:forEach items="${commentList}"  var="commentVO">
		<tr>
			<td> ${commentVO.grade}</td>
			<td> ${commentVO.contents} </td>
			<td> ${commentVO.author} </td>
			<td> ${commentVO.createdAt} </td>
			<td> ${commentVO.updatedAt} </td>
		</tr>
	</c:forEach>
</body>
</html>