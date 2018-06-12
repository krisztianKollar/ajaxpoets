<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <c:url value="/style.css" var="styleUrl"/>
        <c:url value="/index.js" var="indexScriptUrl"/>
        <c:url value="/login.js" var="loginScriptUrl"/>
        <c:url value="/profile.js" var="profileScriptUrl"/>
        <c:url value="/work.js" var="workScriptUrl"/>

        <c:url value="/logout.js" var="logoutScriptUrl"/>
        <link rel="stylesheet" type="text/css" href="${styleUrl}">
        <script src="${indexScriptUrl}"></script>
        <script src="${loginScriptUrl}"></script>
        <script src="${profileScriptUrl}"></script>
        <script src="${workScriptUrl}"></script>
        <script src="${logoutScriptUrl}"></script>
        <title>Ajax Poets</title>
    </head>
<body>
<div id="logout-content" class="hidden content">
    <button id="logout-button">Logout</button>
        <input type= "text" id="searchcountfield" placeholder="Type a word to count">
        <button id="submitcount" class="button">Count</button>
</div>
<div id="login-content" class="content">
    <h1>Login</h1>
    <form id="login-form" onsubmit="return false;">
        <input type="text" name="name">
        <input type="password" name="password">
        <button id="login-button">Login</button>
    </form>
</div>
<div id="profile-content" class="hidden content">
    <h1>Ajax Poets Webapp</h1>
    <h2>Welcome, <span id="user-name"></span>! </h2>
    <p>Password: <span id="user-password"></span></p>
</div>
<div id="works" class="hidden content">
        <h2>Poems</h2>
        <div id="works-content">
        </div>
    </div>
</div>
</body>
</html>
