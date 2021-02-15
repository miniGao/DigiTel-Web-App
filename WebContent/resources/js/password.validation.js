var password = document.getElementById("password")
var confirm_password = document.getElementById("confirm_password");

function checkPwd() {
    if (password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Passwords mismatch");
    } else {
        confirm_password.setCustomValidity('');
    }
}

password.onkeyup = checkPwd;
confirm_password.onkeyup = checkPwd;