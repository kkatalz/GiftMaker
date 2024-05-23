<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .custom-grid {
            display: grid;
            grid-template-columns: 10% 40% 30% 20%;
            padding-inline: 100px;
        }
    </style>
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
<%--1.    header--%>

<div class="text flex justify-between items-center px-10 py-3">
    <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

    <div class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">

        <input type="text" class="text-lg bg-neutral-100 w-[44vw] italic outline-none"
               placeholder="Find a gift ...">
        <img src="search-icon.svg" alt="search-icon"
             class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">

    </div>

    <div class="text flex flex-row gap-5">

        <div class="flex justify-center items-center flex-col">
            <img src="myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">
            <a class="text-sm font-medium" href="#">My profile</a>
        </div>

        <div class="flex justify-center items-center flex-col">
            <img src="liked.svg" alt="liked-items" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="#">Liked</a>

        </div>

        <div class="flex justify-center items-center flex-col">
            <img src="basket.svg" alt="basket-icon" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="#">Basket</a>

        </div>
    </div>

</div>

<%--2.    main body--%>
<div class="text flex justify-between items-center text-xl font-medium mx-80 mt-12 ">
    <h4 class="cursor-pointer">Mother day</h4>
    <h4 class="cursor-pointer">Certificates</h4>
    <h4 class="cursor-pointer">Top gifts this month</h4>
</div>

<div class="h-[45%] w-screen bg-blue-200 mt-6 flex justify-between items-center px-56">

    <div class="flex flex-col items-center pl-40 pt-10 space-y-2">
        <button class="px-16 py-4 rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">
            Generate gift
        </button>
        <button class="py-2 px-10 ml-16 rounded-lg shadow-md bg-white font-bold text-xl transition duration-300 ease-in hover:ease-in hover:scale-[1.1]">
            Create gift
        </button>
    </div>

    <div class="relative">

            <img src="gift-picture.svg" alt="gift-picture" class=" z-1 rounded-[30px] shadow w-5/7 ">
        <button class="z-2 py-2 absolute bottom-[-20px] left-[20%] w-2/3  rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">
            Form to send
        </button>
    </div>

</div>

<div class="text flex justify-between items-center text-xl font-normal mx-80 mt-8 text-neutral-500 ">
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Ukrainian brands</button>
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Trendy gifts</button>
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Gifts for anyone</button>
</div>

<div class="text flex justify-between items-center text-xl font-normal mx-[33%] mt-5 text-neutral-500 ">
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Aesthetic gifts</button>
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Handy gifts</button>
</div>


<%--WISHLIST--%>

<%--<div class="text flex justify-between items-center px-10 py-3">--%>
<%--    <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>


<%--    <div class="text flex flex-row gap-5">--%>

<%--        <div class="flex justify-center items-center flex-col">--%>
<%--            <img src="myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">--%>
<%--            <a class="text-sm font-medium" href="#">My profile</a>--%>
<%--        </div>--%>

<%--        <div class="flex justify-center items-center flex-col">--%>
<%--            <img src="liked.svg" alt="liked-items" class="w-10 cursor-pointer">--%>
<%--            <a class="text-sm font-medium" href="#">Liked</a>--%>

<%--        </div>--%>

<%--        <div class="flex justify-center items-center flex-col">--%>
<%--            <img src="basket.svg" alt="basket-icon" class="w-10 cursor-pointer">--%>
<%--            <a class="text-sm font-medium" href="#">Basket</a>--%>

<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

<%--<div class="flex justify-center items-center flex-col">--%>
<%--    <img src="liked.svg" alt="liked-items" class="w-16">--%>
<%--    <h4 class="font-bold text-2xl">Wishlist</h4>--%>
<%--</div>--%>

<%--<div class="custom-grid text-2xl font-medium  mt-12">--%>
<%--    <div></div>--%>
<%--    <h4 class="flex items-center justify-center">Item</h4>--%>
<%--    <h4 class="flex items-center justify-center">Price (UAH)</h4>--%>

<%--</div>--%>
<%--<hr class="border-neutral-500 mt-6"/>--%>

<%--&lt;%&ndash;Contaier with 1st item&ndash;%&gt;--%>
<%--<div class="custom-grid mt-8">--%>

<%--    <div class="flex items-center justify-center">--%>
<%--        <img src="bin.svg" alt="bin" class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--    </div>--%>

<%--    <div class="flex items-center justify-center gap-8">--%>

<%--        <img src="harryPotterBooks.svg" alt="harryPotterBooks" class="w-40"/>--%>

<%--        <div class="flex flex-col">--%>
<%--            <h5 class="text-lg font-light">id: 1000</h5>--%>
<%--            <h4 class="text-2xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>--%>
<%--        </div>--%>


<%--    </div>--%>
<%--    <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>--%>

<%--    <button class="w-[70%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex self-center p-3 items-center justify-between px-4 text-white text-3xl font-medium flex-shrink">--%>
<%--        Buy--%>
<%--        <img src="buyIcon.svg" alt="buyIcon"/>--%>
<%--    </button>--%>

<%--</div>--%>

<%--&lt;%&ndash;Container with 2nd item&ndash;%&gt;--%>
<%--<div class="custom-grid mt-8">--%>

<%--    <div class="flex items-center justify-center">--%>
<%--        <img src="bin.svg" alt="bin" class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--    </div>--%>

<%--    <div class="flex items-center justify-center gap-8">--%>

<%--        <img src="harryPotterBooks.svg" alt="harryPotterBooks" class="w-40"/>--%>

<%--        <div class="flex flex-col">--%>
<%--            <h5 class="text-lg font-light">id: 1000</h5>--%>
<%--            <h4 class="text-2xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>--%>
<%--        </div>--%>


<%--    </div>--%>
<%--    <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>--%>

<%--    <button class="w-[70%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex self-center p-3 items-center justify-between px-4 text-white text-3xl font-medium flex-shrink">--%>
<%--        Buy--%>
<%--        <img src="buyIcon.svg" alt="buyIcon"/>--%>
<%--    </button>--%>

<%--</div>--%>


</body>
</html>
