<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
	<link rel="stylesheet" type="text/css" href="./recipeView.css">
</head>
<body>
	<div class="container">
		<!-- 레시피 상세 뷰 //-->
		<div class="content">
			<!-- 레시피 이미지 영역 //-->
			<div class="imageArea">
				<img src="../images/don.jpg" alt="">
			</div>
			<!-- // 레시피 이미지 영억 -->
			
			<!-- ??? 영역 //-->
			<div class="grade">
				<span>grade?</span>
			</div>
			<!-- // ??? 영역 -->
			
			<!-- 레시피 상세 내용 영역 //-->
			<div class="recipeInfo">
				<div class="title">
					<h1>${recipeVO.title}</h1>
					<span> by. ${recipeVO.username}</span>
					<div class="updateAndDelete">
						<a href="#">수정</a> | <a href="#">삭제</a>
					</div>
				</div>
				<div class="intro">
					<h4>${recipeVO.intro}</h4>
				</div>
				<div class="ingredients">
					<h2>재료<span class="subText">Ingredients</span></h2>
					<div class="card">
						<span>${recipeVO.ingredients}</span>
					</div>
				</div>
				<div class="details">
					<h2>조리법<span class="subText">Step</span></h2>
					<div class="card">
						<span>${recipeVO.details}</span>
					</div>
				</div>
			</div>
			<!-- // 레시피 상세 내용 영역 -->
			
		</div>
		<!-- // 레시피 상세 뷰 -->
		<div>
			<h1>댓글 작성 form</h1>
			<form method="post" action="app?command=insert_comment">
				<fieldset>
					<legend></legend>
					<label>Content</label>
					<input name="contents" type="text"><br>
					<label>Grade</label>
					<input name="grade" type="number" ><br>
					<input type='hidden' name='user_id' id='userid' value='${loginUser.id}' />
					<input type='hidden' name='recipe_id' id='recipeid' value=${recipeVO.id} />
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="댓긇작성" class="submit">
				</div>
			</form>
			<c:forEach items="${commentList}"  var="commentVO">
				<tr>
					<td> ${commentVO.grade}</td>
					<td> ${commentVO.contents} </td>
					<td> ${commentVO.author} </td>
					<td> ${commentVO.createdAt} </td>
					<td> ${commentVO.updatedAt} </td>
				</tr>
				<br>
			</c:forEach>
		</div>
</div>
