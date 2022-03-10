<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<article>
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
</article>
String contents = request.getParameter("contents");
int grade = Integer.parseInt(request.getParameter("grade"));
int userId = Integer.parseInt(request.getParameter("user_id"));
int recipeId = Integer.parseInt(request.getParameter("recipe_id"));
<article>
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
</article>