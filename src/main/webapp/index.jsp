<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>


<%--REGISTRATION--%>
<%--<div class="bg-blue-200 h-[100vh] flex justify-center items-center flex-col gap-1">--%>

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
<%--</div>--%>


<%--    WELCOME BACK--%>
<%--<div class="bg-blue-200 h-[100vh] flex justify-center items-center flex-col gap-1">--%>

<%--    <form class="text-center bg-white py-10 px-20 rounded-lg shadow">--%>
<%--        <h2 class="text-4xl font-bold ">Welcome back!</h2>--%>
<%--        <div class="text-lg flex justify-center gap-3 mb-4 mt-1">--%>
<%--            <h4>Don't have an account yet?</h4>--%>
<%--            <a class="text-[#6AB7FF] underline" href="#">Sign up</a>--%>
<%--        </div>--%>

<%--        <div class="text-lg flex flex-col gap-3 w-[44vh]">--%>
<%--            <input type="text" class="p-3 rounded-lg bg-neutral-100" placeholder="Username">--%>
<%--            <input type="password" class="p-3 rounded-lg bg-neutral-100" placeholder="Password">--%>
<%--        </div>--%>
<%--        <button class="p-3 rounded-lg bg-[#6AB7FF] text-white font-bold w-full mt-4 text-lg transition-all duration-300 hover:opacity-80">--%>
<%--            Log in--%>
<%--        </button>--%>
<%--    </form>--%>
<%--    <img src="logo.svg" alt="logo" class="w-40">--%>
<%--</div>--%>


<%--    HOME PAGE--%>
<div class="bg-blue-200 h-screen">
    <div class="text flex justify-between items-center px-10 py-3">
        <img src="logoBlack.svg" alt="logo" class="w-40">

        <div class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">

            <input type="text" class="text-lg bg-neutral-100 w-[44vw]"
                   placeholder="Find a gift">
            <img src="search-icon.svg" alt="search-icon" class="w-5">

        </div>

        <div class="text flex flex-row gap-5">

            <div class="flex justify-center items-center flex-col">
                <img src="myProfile.svg" alt="profile-icon" class="w-10">
                <a class="text-base font-medium" href="#">My profile</a>
            </div>

            <div class="flex justify-center items-center flex-col">
                <img src="liked.svg" alt="liked-items" class="w-10">
                <a class="text-base font-medium" href="#">Liked</a>

            </div>

            <div class="flex justify-center items-center flex-col">
                <img src="basket.svg" alt="basket-icon" class="w-10">
                <a class="text-base font-medium" href="#">Basket</a>

            </div>
        </div>

    </div>
</div>

</body>
</html>
