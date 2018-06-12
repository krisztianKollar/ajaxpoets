
function onProfileLoad(user) {
    clearMessages();
    showContents(['profile-content', 'logout-content', 'works']);

    const userNameSpandEl = document.getElementById('user-name');
    const userPasswordSpanEl = document.getElementById('user-password');

    userNameSpandEl.textContent = user.name;
    userPasswordSpanEl.textContent = user.password;

    onLoadWorks();
}