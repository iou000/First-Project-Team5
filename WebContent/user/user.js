<<<<<<< HEAD
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

function username_check() {
  if (document.join_form.username.value === "") {
    alert('아이디를 입력하여 주십시오.');
    document.join_form.username.focus();
    return;
  }
  var app"app?command=username_check_form&username="
+ document.join_form.username.value;
  window.open( url, "_blank_1",
"toolbar=no, menubar=no, scrollbars=yes, resizable=no, wusernameth=330, height=200");
=======
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

function username_check() {
  if (document.join_form.username.value === "") {
    alert('아이디를 입력하여 주십시오.');
    document.join_form.username.focus();
    return;
  }
  var url = "app?command=username_check_form&username="
+ document.join_form.username.value;
  window.open( url, "_blank_1",
"toolbar=no, menubar=no, scrollbars=yes, resizable=no, wusernameth=330, height=200");
>>>>>>> origin/main
}