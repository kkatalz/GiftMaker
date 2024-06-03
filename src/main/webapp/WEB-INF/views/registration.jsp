<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Sign up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<%--REGISTRATION--%>
<div class="bg-blue-100 h-[100vh] flex justify-center items-center flex-col gap-1">

    <form class="text-center bg-white py-10 px-20 rounded-lg shadow" action="./register" method="POST" role="form">
        <h2 class="text-4xl font-bold ">Create account</h2>
        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">
            <h4>Already have an account?</h4>
            <a class="text-[#6AB7FF] underline" href="login">Log in</a>
        </div>

        <div class="text-lg flex flex-col gap-3 w-[20vw]" >
            <input name="firstName" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="First Name">
            <input name="lastName" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Last Name">
            <input name="dateOfBirth" type="date" class="p-3 rounded-lg bg-neutral-100" placeholder="Date of birth">
<%--            <select name="role" class="p-3 rounded-lg bg-neutral-100 ">--%>
<%--                <option value="USER">User</option>--%>
<%--                <option value="ADMIN">Admin</option>--%>
<%--            </select>--%>
            <input name="username" type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">
            <input name="password" type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">
        </div>
        <button type="submit" class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">
            Sign up
        </button>
    </form>
    <img src="<%=request.getContextPath()%>/logo.svg" alt="logo" class="w-40">
</div>
