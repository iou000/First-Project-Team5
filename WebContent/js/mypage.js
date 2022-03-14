<!-- @author 김지혜 -->

var custTndcGbcd = '99';

$(document).ready(function () {
    if (window.location.pathname.toString().indexOf("prmsBoxList") > -1) $("li[name=prmsBoxList]").addClass("active");

});

function fn_mtmInqrClick() {
    if (custTndcGbcd == "20" || custTndcGbcd == "30" || custTndcGbcd == "40" || custTndcGbcd == "50") {
        alert("1:1 웹문의 접수가 불가합니다. 문의사항은 고객센터 전화상담을 이용해주시기 바랍니다.");
        return false;
    } else {
        location.href = "/front/mp/mpc/mtmInqrList.do";
    }
}

function go_recipe_view(recipe_id) {
    if (document.join_form.username.value === "") {
        alert("아이디를 입력하여 주세요.");
        document.join_form.username.focus();
    } else if (document.join_form.password.value === "") {
        alert("비밀번호를 입력해 주세요.");
        document.join_form.password.focus();
    } else if ((document.join_form.password.value !== document.join_form.pwdCheck.value)) {
        alert("비밀번호가 일치하지 않습니다.");
        document.join_form.password.focus();
    } else {
        document.join_form.action = `app?command=recipe_view&recipeId=${recipe_id}`;
        document.join_form.submit();
    }
}