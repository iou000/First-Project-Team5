<!-- author seop -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
	
<style>
	.container{
		display:flex;
	}
	.content {
		display:flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin: 0 auto;
		width: 1024px;
	}
	.imageArea {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 720px;
		height: 360px;
		margin: 2px;
		border: 5px soild black;
	}
	.imageArea img {
		width: 100%;
		height: 100%;
		object-fit: fill;
	}
	.grade {
		width: 720px;
		height: 50px;
		margin: 24px 0;
	}
	
	.recipeInfo {
		display:flex;
		flex-direction:column;
		width: 1024px;
		margin-bottom: 150px;
	}
	.recipeInfo h2{
		margin: 22px 0 12px;
		font-size: 24px;
	}
	.recipeInfo .subText{
		font-size: 16px;
		padding-left: 4px;
		color: #ccc;
		font-style: italic;
	}
	
	.title {
		display:flex;
		align-items:center;
		position: relative;
	}
	.title > h1{
		margin: 18px 0 12px 0;
		font-size: 34px;
		letter-spacing: -0.05em;
		
	}
	.title > span {
		font-size: 18px;
		margin-top: 18px;
		margin-left : 8px;
		color: darkgray;
		font-style: italic;
	}
	.updateAndDelete {
		position: absolute;
		right: 20px;
		color : gray;
	}
	.updateAndDelete > a{
		text-decoration : none;
		color : gray;
	}
	.intro {
		margin: 0;
		padding-bottom: 16px;
		border-bottom: 1px solid #aea7a2;
	}
	.intro > h4 {
		margin: 0;
		padding: 12px;
		font-size: 16px;
		color: #aaa;
	}
	.ingredients {
		margin-top: 32px;
		margin-bottom: 16px;
	}
	.details {
		margin-top: 16px;
		margin-bottom: 16px;
	}
	.card {
		border-radius: 6px;
		border: solid 1px rgb(70, 153, 70);
		padding: 14px;
		margin: 0 8px;
	}
	.card span {
		font-size: 16px;
	}
	
	
	
	
</style>
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
	</div>
</body>
</html>