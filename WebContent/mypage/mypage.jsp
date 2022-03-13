<!-- @author 김지혜 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
	<link href="css/mypage.css" rel="stylesheet">
</head>
<body class="mypage">
    <div class="side">
        <h2>My Page</h2>
    </div>
    <div class="contents">
        <p> 안녕하세요 ${loginUser.username} 님!! </p>
        <a href="app?command=recipe_insert_form">레시피 만들기</a>
        <h2> 내가 올린 레시피 </h2>
        <div id="myrecipe">
            <c:forEach items="${recipeVOS }" var="recipeVO">
                <div id="item">
                    <a href="app?command=recipe_view&recipeId=${recipeVO.id}">
                        <img src="images/don.jpg"/>
                        <p>${recipeVO.title} ${recipeVO.image} ${recipeVO.viewcount} ${recipeVO.username}</p>
                    </a>
                </div>
            </c:forEach>
        </div>
        <hr>

        <h2> 나의 댓글 </h2>
        <div id="bestProduct">
            <c:forEach items="${recipeVOS }" var="recipeVO">
                <div id="item">
                    <a href="app?command=recipe_view">
                        <img src="images/don.jpg"/>
                        <p>${recipeVO.title} ${recipeVO.image} ${recipeVO.viewcount} ${recipeVO.username} </p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

<%--    <form name="form" method="post">--%>

<%--      <table id="cartList">--%>
<%--      <tr>--%>
<%--        <th>id</th>  <th>name</th>  <th>password</th>--%>
<%--      </tr>--%>
<%--        <div>--%>
<%--          ${user.id}, ${user.username}, ${user.password}--%>
<%--        </div>--%>

<%--&lt;%&ndash;      <c:forEach items="${userList}"  var="UserVO">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <td> ${UserVO.id}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <td> ${UserVO.username} </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <td> ${userVO.password} </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;         <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        	<a href="NonageServlet?command=order_detail&oseq=${orderVO.oseq}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        	  조회 </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;         </td> &ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;      </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </c:forEach>&ndash;%&gt;--%>
<%--      </table>--%>

<%--      <div class="clear"></div>--%>
<%--      <div id="buttons" style="float: right">--%>
<%--       <input type="button"    value="쇼핑 계속하기"--%>
<%--        class="cancel"  onclick="location.href='NonageServlet?command=index'">--%>
<%--      </div>--%>
<%--    </form>--%>


<%-- <%@ include file="../footer.jsp" %> --%>