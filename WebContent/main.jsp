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
<<<<<<< HEAD
<div align="center">
	<form id="searchForm" method="post" action="app?command=mainpage" onclick="searchWithKeyword()">
		<input type="text" name="keyword" value="" placeholder="키워드를 입력해주세요!"/>
		<input type="hidden" name="category" value=""/>
		<input type="submit" value="검색"/>
		<hr>
		<button type="button" id="1" value="" onclick="searchWithCategory(this.id)">전체sss</button>
		<button type="button" id="2" value="korean" onclick="searchWithCategory(this.id)">한식</button>
		<button type="button" id="3" value="western" onclick="searchWithCategory(this.id)">양식</button>
		<button type="button" id="4" value="japanese" onclick="searchWithCategory(this.id)">일식</button>
		<button type="button" id="5" value="chinese" onclick="searchWithCategory(this.id)">중식</button>
		<button type="button" id="6" value="flour-based" onclick="searchWithCategory(this.id)">분식</button>
		<button type="button" id="7" value="snack" onclick="searchWithCategory(this.id)">간식</button>
		<button type="button" id="8" value="dessert" onclick="searchWithCategory(this.id)">디저트</button>
	</form>
</div>

<!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
<div id="recipes" align="center">
	<c:forEach var="recipeVO" items="${recipeList}">
		<a href="app?command=mainpage&id=${recipeVO.id}">테스트</a>
		<!-- <img src="recipe_images/${recipeList.image}"/> -->
		${recipeVO.title}
		${recipeVO.grade}
		${recipeVO.username}
		<br>
	</c:forEach>
</div>
=======
	<!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
	<div id="recipes" align="center">
		<c:forEach var="recipeVO" items="${recipeList}">
			<a href="app?command=mainpage&id=${recipeVO.id}">테스트</a>
			<!-- <img src="recipe_images/${recipeVO.image}"/> -->
			${recipeVO.title}
			${recipeVO.grade}
			${recipeVO.username}
			<br> 
		</c:forEach>
	</div>
>>>>>>> origin/main
</body>

<!-- jQuery 3.5.1 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<!-- Javascript -->
<script type="text/javascript">
	function searchWithCategory(id) {
		var foodCategory = document.getElementById(id).value;
		$("input[name=category]").attr("value", foodCategory);
		$("#searchForm").submit();
	}

	function searchWithKeyword() {
		var foodKeyword = $("input[name=keyword]").val();
	}
</script>
</html>