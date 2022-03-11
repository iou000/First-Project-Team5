<!-- @author 김지혜 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- <%@ include file="sub_img.html"%>  --%>
<%-- <%@ include file="sub_menu.jsp" %>    --%>

  <article>
    <h2> My Page </h2>
    <p> 안녕하세요 ${loginUser.username} 님!!  </p>

    <div id="front">
      <h2> 내가 올린 레시피 </h2>
      <div id="bestProduct">
        <c:forEach items="${recipeVOS }"  var="recipeVO">
          <div id="item">
            <a href="app?command=recipe_view">
              <img src="product_images/don.jpg" />
              <h3> ${recipeVO.id} </h3>
              <p>${recipeVO.title} </p>
              <p>${recipeVO.image} </p>
              <p>${recipeVO.viewcount} </p>
              <p>${recipeVO.username} </p>
            </a>
          </div>
        </c:forEach>
      </div>
      <div class="clear"></div>

      <h2> 나의 댓글 </h2>
      <div id="bestProduct">
        <c:forEach items="${recipeVOS }"  var="recipeVO">
          <div id="item">
            <a href="app?command=recipe_view">
              <img src="product_images/don.jpg" />
              <h3> ${recipeVO.id} </h3>
              <p>${recipeVO.title} </p>
              <p>${recipeVO.image} </p>
              <p>${recipeVO.viewcount} </p>
              <p>${recipeVO.username} </p>
            </a>
          </div>
        </c:forEach>
      </div>
      <div class="clear"></div>
    </div>


    
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
  </article>

<%-- <%@ include file="../footer.jsp" %> --%>