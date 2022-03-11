<!-- author seop -->
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
	 				<textarea class="recipeInput" type="text" name="intro" value="" placeholder="레시피 소개 입력하세요"></textarea>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 분류
	 				 <select class="bikeStyle" name="category">
                        <option>-- 레시피 분류 선택 --</option>
                        <option value="한식">한식</option>
                        <option value="중식">중식</option>
                        <option value="일식">일식</option>
                        <option value="양식">양식</option>
                    </select>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 재료
	 				<input class="recipeInput" type="text" name="ingredients" value="" placeholder="레시피 재료을 입력하세요" />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 설명
	 				<textarea class="recipeInput" type="text" name="details" value="" placeholder="레시피를 설명해주세요"></textarea>
	 			</label>  
	 			<label class="recipeInsertLabel"> 이미지
	 				<input class="recipeInput" type="text" name="image" value="" placeholder="이미지" />
	 			</label>
	 		</div>
	 		<div>
	 			<button type="submit">등록d</button>
	 		</div>
	 	</form>
	 </div>
</body>
<script>
	/* submit 유효성 검사 */
	function recipeInsertSubmit(e) {
		var title = $('input[name=title]').val();
		console.log(title);
		if(title == null || title == "") {
			alert('제목을 입려해주세요');
			$('input[name=title]').focus();
			return false;
		}
		else{
			alert('레시피 생성 완료 제목 : '+title);
			return true;
		}
	}

</script>
</html>