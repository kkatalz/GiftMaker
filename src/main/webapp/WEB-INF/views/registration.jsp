<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Sign up</title>
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
            const form = document.getElementById("signupForm");
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
                const firstName = form.elements["firstName"];
                const lastName = form.elements["lastName"];
                const dateOfBirth = form.elements["dateOfBirth"];
                const username = form.elements["username"];
                const password = form.elements["password"];

                if (firstName.value.trim() === "") {
                    showError(firstName, "First Name is required");
                    isValid = false;
                }

                if (lastName.value.trim() === "") {
                    showError(lastName, "Last Name is required");
                    isValid = false;
                }


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
                error.className = "error-message text-red-500 text-sm mt-[-1] text-left";
                error.textContent = message;
                input.parentNode.insertBefore(error, input.nextSibling);
            }
        });
    </script>
</head>

<%--REGISTRATION--%>
<div class="bg-blue-100 h-[100vh] flex justify-center items-center flex-col gap-1">

    <form id="signupForm" class="text-center bg-white py-10 px-20 rounded-lg shadow max-h-[100vh] overflow-y-auto mt-4" action="./register" method="POST" role="form">
        <h2 class="text-4xl font-bold">Create account</h2>
        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">
            <h4>Already have an account?</h4>
            <a class="text-[#6AB7FF] underline" href="login">Log in</a>
        </div>

        <div class="text-lg flex flex-col gap-3 w-full">
            <input name="firstName" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="First Name">
            <input name="lastName" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Last Name">
            <input name="dateOfBirth" type="date" class="p-3 rounded-lg bg-neutral-100" placeholder="Date of birth">
            <input name="username" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">
            <input name="password" type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">
        </div>

        <!-- Display Validation Errors -->
        <%
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null && !errors.isEmpty()) {
        %>
        <div class="mt-4 text-red-500 text-lg">
            <ul>
                <%
                    for (String error : errors) {
                %>
                <li><%= error %></li>
                <%
                    }
                %>
            </ul>
        </div>
        <%
            }
        %>
        <button type="submit" class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">
            Sign up
        </button>

    </form>
    <img src="<%=request.getContextPath()%>/logo.svg" alt="logo" class="w-40">
</div>
