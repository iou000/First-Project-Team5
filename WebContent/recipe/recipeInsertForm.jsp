<!-- 레시피 생성 폼 @author seop -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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

</style>
</head>
<body>
	 <div>
	 	<form name="form" method="post" action="app?command=recipe_insert" onsubmit="return recipeInsertSubmit()">
	 		<div class="recipeInsertForm">
	 			<label class="recipeInsertLabel"> 레시피 제목
	 				<input class="recipeInput"type="text" name="title" value="" placeholder="레시피 제목을 입력하세요" />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 소개
	 				<textarea class="recipeInput" name="intro" placeholder="레시피 소개 입력하세요"></textarea>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 분류
	 				 <select class="recipeCategory" name="category">
                        <option>-- 레시피 분류 선택 --</option>
                        <option value="한식">한식</option>
                        <option value="중식">양식</option>
                        <option value="일식">일식</option>
                        <option value="양식">중식</option>
                        <option value="양식">분식</option>
                        <option value="양식">간식</option>
                        <option value="양식">디저트</option>
                    </select>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 재료
	 				<input class="recipeInput" type="text" name="ingredients" value="" placeholder="레시피 재료을 입력하세요" />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 설명
	 				<textarea class="recipeInput" name="details" placeholder="레시피를 설명해주세요"></textarea>
	 			</label>  
	 			<label class="recipeInsertLabel"> 이미지
	 				<input class="recipeInput" type="text" name="image" value="" placeholder="이미지" />
	 			</label>
	 		</div>
	 		<div>
	 			<button type="submit">레시피 등록하기</button>
	 		</div>
	 	</form>
	 </div>
</body>
<script>
	/* submit 유효성 검사 @author seop */
	function recipeInsertSubmit(e) {
		var title = $('input[name=title]').val();
		var intro = $('input[name=intro]').val();
		var category = $('input[name=category]').val();
		var ingredients = $('input[name=ingredients]').val();
		var details = $('input[name=details]').val();
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
			if(confirm('레시피를 생성 할까요?')){
				return true;
			}
			return false;
		}
	}

</script>
</html>