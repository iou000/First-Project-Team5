<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
</head>
<body>
	<!-- 검색어를 통해서 레시미 목록 조회 -->
	<form name="search" method="get" action="app?command=search&item=menu">
		<input type="text" name="menu">
		<input type="submit" value="검색">
	</form>

	<!-- 카테고리를 통해서 레시피 목록 조회 -->
	<div id="categories">
		<a href="main.jsp">전체</a>
		<a href="app?command=category&item=korean">한식</a>
		<a href="app?command=category&item=western">양식</a>
		<a href="app?command=category&item=japanese">일식</a>
		<a href="app?command=category&item=chinese">중식</a>
		<a href="app?command=category&item=flour-based">분식</a>
	</div>
	
	<!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
	<div id="recipes">         
		<c:forEach items="${recipeList}" var="recipeVO">
			<div id="item">
				<a href="app?command=recipe_view&id=${recipeList.id}">
					<img src="recipe_images/${recipeList.image}"/>
					<h3>${recipeVO.title}</h3>    
					<p>${recipeVO.author}</p>
				</a>    
			</div>
		</c:forEach>      
	</div>
</body>
</html>