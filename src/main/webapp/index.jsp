<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<div class="bg-blue-200 h-[100vh] flex justify-center items-center flex-col gap-1">

    <%--REGISTRATION--%>
    <%--    <form class="text-center bg-white py-10 px-20 rounded-lg shadow">--%>
    <%--        <h2 class="text-4xl font-bold ">Create account</h2>--%>
    <%--        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">--%>
    <%--            <h4>Already have an account?</h4>--%>
    <%--            <a class="text-[#6AB7FF] underline" href="#">Log in</a>--%>
    <%--        </div>--%>

    <%--        <div class="text-lg flex flex-col gap-3 w-[44vh]">--%>
    <%--            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="First name">--%>
    <%--            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Last name">--%>
    <%--            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">--%>
    <%--            <input type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">--%>
    <%--        </div>--%>
    <%--        <button class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">--%>
    <%--            Sign up--%>
    <%--        </button>--%>
    <%--    </form>--%>
    <%-- <img src="logo.svg" alt="logo" class="w-40">--%>

    <%--    WELCOME BACK--%>
    <form class="text-center bg-white py-10 px-20 rounded-lg shadow">
        <h2 class="text-4xl font-bold ">Welcome back!</h2>
        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">
            <h4>Don't have an account yet?</h4>
            <a class="text-[#6AB7FF] underline" href="#">Sign up</a>
        </div>

        <div class="text-lg flex flex-col gap-3 w-[44vh]">
            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">
            <input type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">
        </div>
        <button class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">
            Log in
        </button>
    </form>
    <img src="logo.svg" alt="logo" class="w-40">

</div>
</body>
</html>
