<!-- author seop -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Recipe Insertion Page</title>
	<style>
		.recipeInsertForm {
			display:flex;
			flex-direction:column;
			margin: 6px;
		}
		.recipeInsertLabel{
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
	 	<form name="form" method="post" action="app?command=recipe_insert" enctype="multipart/form-data" onsubmit="return recipeInsertSubmit()">
	 		<div class="recipeInsertForm">
	 			<label class="recipeInsertLabel"> 레시피 제목
	 				<input type="text" class="recipeInput" name="title" placeholder="레시피의 제목을 입력해주세요." />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 소개
	 				<input type="text" class="recipeInput" name="intro" placeholder="레시피에 대해서 소개해주세요."/>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 분류
	 				 <select class="recipeCategory" name="category">
                        <option>-- 레시피 분류 선택 --</option>
                        <option value="한식">한식</option>
                        <option value="양식">양식</option>
                        <option value="일식">일식</option>
                        <option value="중식">중식</option>
                        <option value="분식">분식</option>
                        <option value="간식">간식</option>
                        <option value="디저트">디저트</option>
                    </select>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 재료
	 				<input type="text" class="recipeInput" name="ingredients" placeholder="레시피에 사용되는 재료를 입력해주세요." />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 설명
	 				<textarea class="recipeInput" name="details" placeholder="조리법을 설명해주세요."></textarea>
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
	<!-- submit 유효성 검사 -->
	function recipeInsertSubmit() {
		var title = $('input[name=title]').val();
		if(title == null || title == "") {
			alert('레시피 제목을 입력해주세요!!!');
			$('input[name=title]').focus();
			return false;
		}
		else {
			alert("'" + title + "' 레시피가 생성되었습니다!!!");
			return true;
		}
	}
	
	<!-- 파일 업로드 -->
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