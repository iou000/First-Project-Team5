<!-- @author 김지혜 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<%--<%@ include file="sub_img.html"%> --%>
<%--<%@ include file="sub_menu.html" %>   --%>


<article>
    <h2>Join Us</h2>
    <form id="join" action="app?command=join" method="post" name="join_form">
        <fieldset>
            <legend>Basic Info</legend>
            <label>User ID</label>
            <input type="text" name="username" size="12">
            <input type="hidden" name="reid"><br>
            <label>Password</label>
            <input type="password" name="password"><br>
            <label>Retype Password</label>
            <input type="password" name="pwdCheck"><br>
        </fieldset>

        <div id="buttons">
            <input type="button" value="회원가입" class="submit" onclick="go_save()">
            <input type="reset" value="취소" class="cancel">
        </div>
    </form>
</article>
<script type="text/javascript" src="js/join.js"></script>

<%--<%@ include file="../footer.jsp" %>--%>
  