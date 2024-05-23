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

<%--    header--%>
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
            <a class="text-sm font-medium" href="#">My profile</a>
        </div>

        <div class="flex justify-center items-center flex-col">
            <img src="liked.svg" alt="liked-items" class="w-10">
            <a class="text-sm font-medium" href="#">Liked</a>

        </div>

        <div class="flex justify-center items-center flex-col">
            <img src="basket.svg" alt="basket-icon" class="w-10">
            <a class="text-sm font-medium" href="#">Basket</a>

        </div>
    </div>

</div>

<%--    main body--%>
<div class="text flex justify-between items-center text-xl font-medium mx-80 mt-12">
    <h4>Mother day</h4>
    <h4>Certificates</h4>
    <h4>Top gifts this month</h4>
</div>

<div class="h-[35%] w-screen bg-blue-200 mt-8 flex justify-between items-center px-56">

    <div class="flex flex-col items-center pl-40 pt-10 space-y-2">
        <button class="px-16 py-4 rounded-lg shadow-lg bg-white font-bold text-2xl duration-300 hover:opacity-80">
            Generate gift
        </button>
        <button class="py-2 px-10  ml-10 rounded-lg shadow-md bg-white font-bold text-xl duration-300 hover:opacity-80">
            Create gift
        </button>
    </div>

    <div>
        <img src="gift-picture.svg" alt="gift-picture" class="w-3/4 z-0">
        <button class="z-40 px-10 py-2 rounded-lg shadow-lg bg-white font-bold text-2xl duration-300 hover:opacity-80">
            Form to send
        </button>
    </div>

</div>




</body>
</html>
