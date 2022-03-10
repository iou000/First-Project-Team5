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
	<div id="search">
		<form method="post" action="app?command=mainpage">
			<input type="text" id="keyword" value=""/>
			<input type="hidden" id="category" value=""/>
			<input type="submit" value="검색"/>
		</form>
		<script>
		</script>
	</div>
	
	<!-- 카테고리를 통해서 레시피 목록 조회 -->
	<div id="categories">
		<button type="button" id="item" value="all">전체</button>
		<button type="button" id="item" value="korean">한식</button>
		<button type="button" id="item" value="western">양식</button>
		<button type="button" id="item" value="japanese">일식</button>
		<button type="button" id="item" value="chinese">중식</button>
		<button type="button" id="item" value="flour-based">분식</button>
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

<!-- jQuery 3.5.1 -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<!-- Javascript -->
<script type="text/javascript">
	/*
	$("button[name=testbtn]").click(function() {
		var testVal = $("button[name=testbtn]").val();
		alert(testVal);
	});
	*/
	$("#item").click(function() {
		var foodCategory = $("#item").val(); // id=item인 butoon 값 받아오기
		$("#category").attr("value", foodCategory); // id=category인 input에 값 넣기
		$.ajax({
			url : 'app?command=mainpage',
			type : 'POST',
			data : {
				category : foodCategory
			},
			dataType : 'JSON',
			success:function(result) {
				if(result=='1') {
					alert('성공');
				}
			}
		});
	});
</script>
</html>