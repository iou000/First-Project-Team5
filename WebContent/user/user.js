<!-- @author 김지혜 -->

function go_save() {
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
        document.join_form.action = "app?command=join";
        document.join_form.submit();
    }
}