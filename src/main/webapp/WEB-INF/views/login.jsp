<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Log in</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .error {
            border-color: red;
            border-width: 2px;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const form = document.getElementById("loginForm");
            form.addEventListener("submit", function (event) {
                // Prevent form submission
                event.preventDefault();

                // Clear previous error messages and styles
                const errorMessages = document.querySelectorAll(".error-message");
                errorMessages.forEach(function (error) {
                    error.remove();
                });

                const errorInputs = document.querySelectorAll(".error");
                errorInputs.forEach(function (input) {
                    input.classList.remove("error");
                });

                // Form validation logic
                let isValid = true;
                const username = form.elements["username"];
                const password = form.elements["password"];

                if (username.value.trim() === "") {
                    showError(username, "Username is required");
                    isValid = false;
                }

                if (password.value.trim() === "") {
                    showError(password, "Password is required");
                    isValid = false;
                }

                // If the form is valid, submit it
                if (isValid) {
                    form.submit();
                }
            });

            function showError(input, message) {
                input.classList.add("error");
                const error = document.createElement("div");
                error.className = "error-message text-red-500 text-sm text-left";
                error.textContent = message;
                input.parentNode.insertBefore(error, input.nextSibling);
            }
        });
    </script>
</head>

<%--LOG IN--%>
<div class="bg-blue-100 h-[100vh] flex justify-center items-center flex-col gap-1">

    <form id="loginForm" class="text-center bg-white py-10 px-20 rounded-lg shadow" action="./login" method="POST" role="form">
        <h2 class="text-4xl font-bold ">Welcome back!</h2>
        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">
            <h4>Don't have an account yet?</h4>
            <a class="text-[#6AB7FF] underline" href="register">Sign up</a>
        </div>

        <div class="text-lg flex flex-col gap-3  w-[20vw]">
            <input name="username" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">
            <input name="password" type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">
        </div>
        <c:if test="${not empty requestScope.errors}">
            <div class="alert alert-danger">
                    ${requestScope.errors}
            </div>
        </c:if>

        <button type="submit" class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">
            Log in
        </button>
    </form>
    <img src="<%=request.getContextPath()%>/logo.svg" alt="logo" class="w-40">
</div>
