<!-- 레시피 수정 폼 seop, 이미지 파일 업로드 SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Recipe Update Page</title>
	<style>
		.recipeUpdateForm {
			display:flex;
			flex-direction:column;
			margin: 6px;
		}
		.recipeUpdateLabel{
			display: flex;
			flex-direction: column;
			font-weight: bold;
		}
		.filebox input[type="file"] {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip:rect(0,0,0,0);
			border: 0;
		}
		.filebox label {
			display: inline-block;
			padding: .5em .75em;
			color: #999;
			font-size: inherit;
			line-height: normal;
			vertical-align: middle;
			background-color: #fdfdfd;
			cursor: pointer;
			border: 1px solid #ebebeb;
			border-bottom-color: #e2e2e2;
			border-radius: .25em;
		}
		/* named upload */
		.filebox .upload-name {
			display: inline-block;
			padding: .5em .75em;
			font-size: inherit;
			font-family: inherit;
			line-height: normal;
			vertical-align: middle;
			background-color: #f5f5f5;
			border: 1px solid #ebebeb;
			border-bottom-color: #e2e2e2;
			border-radius: .25em;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
		}
		.filebox.bs3-primary label {
			color: #fff;
			background-color: #337ab7;
			border-color: #2e6da4;
		}
	</style>
</head>
<body>
	 <div>
	 	<form name="form" method="post" action="app?command=recipe_update" enctype="multipart/form-data" onsubmit="return recipeUpdateSubmit()">
	 		<input type="hidden" name="recipeId" value="${recipeVO.id}" />
	 		<div class="recipeUpdateForm">
	 			<label class="recipeUpdateLabel"> 레시피 제목
	 				<input type="text" class="recipeInput" name="title" value="${recipeVO.title}" placeholder="레시피의 제목을 입력해주세요." />
	 			</label>
	 			
	 			<label class="recipeUpdateLabel"> 레시피 소개
	 				<textarea name="intro" placeholder="레시피에 대해서 소개해주세요."><c:out value="${recipeVO.intro}"></c:out></textarea>
	 			</label>
	 			
	 			<label class="recipeUpdateLabel"> 레시피 분류
	 				 <select class="recipeCategory" name="category">
                        <option>-- 레시피 분류 선택 --</option>
                        <option value="한식" <c:if test="${recipeVO.category == '한식'}"> selected</c:if>>한식</option>
                        <option value="양식" <c:if test="${recipeVO.category == '양식'}"> selected</c:if>>양식</option>
                        <option value="일식" <c:if test="${recipeVO.category == '일식'}"> selected</c:if>>일식</option>
                        <option value="중식" <c:if test="${recipeVO.category == '중식'}"> selected</c:if>>중식</option>
                        <option value="분식" <c:if test="${recipeVO.category == '분식'}"> selected</c:if>>분식</option>
                        <option value="간식" <c:if test="${recipeVO.category == '간식'}"> selected</c:if>>간식</option>
                        <option value="디저트" <c:if test="${recipeVO.category == '디저트'}"> selected</c:if>>디저트</option>
                    </select>
	 			</label>
	 			
	 			<label class="recipeUpdateLabel"> 레시피 재료
	 				<input type="text" class="recipeInput" name="ingredients" value="${recipeVO.ingredients}" placeholder="레시피에 사용되는 재료를 입력해주세요." />
	 			</label>
	 			
	 			<label class="recipeUpdateLabel"> 레시피 설명
	 				<textarea class="recipeInput" name="details" placeholder="이 레시피의 조리법을 알려주세요."><c:out value="${recipeVO.details}"></c:out></textarea>
	 			</label>
	 			
	 			<div class="filebox bs3-primary">대표 이미지 삽입<br>
		 			<input class="upload-name" value="" disabled="disabled">
		 			<label for="ex_filename">파일 선택</label>
		 			<input type="file" class="upload-hidden" id="ex_filename" name="image" accept="image/jpeg, image/png"> 
		 		</div>
		 		<!-- 
	 			<label class="recipeInsertLabel"> 대표 이미지 삽입
	 				<input type="file" class="recipeInput" name="image" accept="image/jpeg, image/png" onchange="fileUpload()"/>
	 			</label>
	 			-->
	 		</div>
 			<button type="submit">등록</button>
	 	</form>
	 </div>
</body>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Javascript -->
<script>
	/* submit 유효성 검사 @author seop */
	function recipeUpdateSubmit() {
		var title = $('input[name=title]').val();
		var intro = $('textarea[name=intro]').val();
		var category = $('select[name=category]').val();
		var ingredients = $('input[name=ingredients]').val();
		var details = $('textarea[name=details]').val();
		var image = $('input[name=image]').val();
		
		if(title == null || title == "") {
			alert('제목을 입력해주세요.');
			$('input[name=title]').focus();
			return false;
		}
		else if(intro == null || intro == ""){
			alert('레시피 소개를 입력해주세요.');
			$('input[name=intro]').focus();
			return false;
		}
		else if(category == null || category == ""){
			alert('레시피 분류 골라주세요.');
			$('input[name=category]').focus();
			return false;
		}
		else if(ingredients == null || ingredients == ""){
			alert('레시피 재료를 입력해주세요.');
			$('input[name=ingredients]').focus();
			return false;
		}
		else if(details == null || details == ""){
			alert('레시피 설명을 입력해주세요.');
			$('input[name=details]').focus();
			return false;
		}
		else if(image == null || image == ""){
			if(confirm('이미지 없이 레시피를 생성할까요?')){
				return true;
			}
			$('input[name=image]').focus();
			return false;
		}
		else{
			if(confirm('레시피를 수정 할까요?')){
				return true;
			}
			return false;
		}
	}
	
	/* 파일 업로드 @author SJH */
	$(document).ready(function() {
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function() {  // 값이 변경되면
			if(window.FileReader) {  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}
			// 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename);
		});
	});
</script>
</html>