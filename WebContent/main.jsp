<!-- author SJH -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
</head>
<body>
	<!-- 레시피 목록에서 레시피 각각의 정보(이미지, 제목, 작성자) 확인 -->
	<div id="list-area" id="list_section" align="center" style="min-height:800px">
		<ul class-="recipe-list">
			<c:forEach var="recipeVO" items="${recipeList}">
				<li>
					<a href="app?command=recipe_view&recipeId=${recipeVO.id}">
						<img src="./image/recipe/${recipeVO.image}" alt="이미지 없음" style='width:50px; height: 50px'>
						${recipeVO.title}
						${recipeVO.grade}
						${recipeVO.username}
					</a>
				</li>
		</c:forEach>
		</ul>
	</div>
</body>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var loading = false; // 중복 확인용
var pageNO = 2; // 1페이지는 처음에 불러왔으니 2부터 시작해야함.
var pageSize = 5; // 불러올 데이터 갯수

function next_load()
{
	$.ajax({
			type:"POST",
			url:"app?command=recipe_paging",
			dataType: "json",
			data: {
					'pageNO': pageNO,
					'pageSize' : pageSize
			},
			success: function(data, textStatus) {
				
				console.log(data);

				pageNO++; //페이지 증가
				console.log(pageNO);
                loading = false;    //실행 가능 상태로 변경
			}
	
	
	});
}

$(window).scroll(() => {
    if($(window).scrollTop()>=$(document).height() - $(window).height())
    {
        if(!loading)    //실행 가능 상태라면?
        {
            loading = true; //실행 불가능 상태로 변경
            next_load(); 
        }
        else            //실행 불가능 상태라면?
        {
            alert('다음페이지를 로딩중입니다.');  
        }
    }
});



</script>


<%@ include file="./footer.jsp" %>
</html>