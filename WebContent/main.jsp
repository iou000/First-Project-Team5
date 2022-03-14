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
		<ul class="recipe-list">
			<c:forEach var="recipeVO" items="${recipeList}">
				<li style='height: 200px'>
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
var pageNO = 2; // 1페이지는 처음에 불러왔으니 2부터 시작.
var pageSize = 5; // 불러올 데이터 갯수.


/* AJAX로 데이터 요청 @seop */
function next_recipes_load()
{
	$.ajax({
			type:"POST",
			url:"app?command=recipe_paging_ajax",
			dataType: "json", //json형식으로 데이터를 보냄
			data: {
					'pageNO': pageNO,
					'pageSize' : pageSize
			},
			success: function(data, textStatus) {
				
				//서버로부터 받아온 데이터(레시피들)을 추가
				for(var i = 0; i< data.length; i++){
					var node = "";
					node += "<li style='height: 200px'>";
					node += "	<a href='app?command=recipe_view&recipeId="+data[i].id+"'>";
					node += "       <img src='./image/recipe/"+data[i].image+"' alt='이미지 없음' style='width:50px; height: 50px'>"
					node += 		data[i].title + data[i].grade + data[i].username;
					node += "	</a>";
					node += "</li>";

					$('.recipe-list').append(node);
				}
				
				pageNO++; //페이지 증가
                loading = false;    //실행 가능 상태로 변경
			}
			,error: function(request, status, error) 
            {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
	
	
	});
}


/* 무한 스크롤 @seop */
$(window).scroll(() => {
    if($(window).scrollTop()+100>=$(document).height() - $(window).height())
    {
        if(!loading)    //실행 가능 상태라면?
        {
        	next_recipes_load(); 
            loading = true; //실행 불가능 상태로 변경
        }
    }
});





</script>


<%@ include file="./footer.jsp" %>
</html>