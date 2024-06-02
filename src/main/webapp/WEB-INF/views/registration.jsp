<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<%--REGISTRATION--%>
<div class="bg-blue-100 h-[100vh] flex justify-center items-center flex-col gap-1">

    <form class="text-center bg-white py-10 px-20 rounded-lg shadow">
        <h2 class="text-4xl font-bold ">Create account</h2>
        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">
            <h4>Already have an account?</h4>
            <a class="text-[#6AB7FF] underline" href="#">Log in</a>
        </div>

        <div class="text-lg flex flex-col gap-3 w-[20vw]">
            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="First name">
            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Last name">
            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">
            <input type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">
        </div>
        <button class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">
            Sign up
        </button>
    </form>
    <img src="<%=request.getContextPath()%>/logo.svg" alt="logo" class="w-40">
</div>
</body>
</html>
