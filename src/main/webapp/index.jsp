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

        .custom-grid-offered-gifts {
            display: grid;
            grid-template-columns: 40% 20% 20% 20%;
        }
    </style>
</head>
<body>


<%--REGISTRATION--%>
<%--<div class="bg-blue-100 h-[100vh] flex justify-center items-center flex-col gap-1">--%>

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
<%--<div class="bg-blue-100 h-[100vh] flex justify-center items-center flex-col gap-1">--%>

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

<%--<div class="text flex justify-between items-center px-10 py-3">--%>
<%--    <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>

<%--    <div class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">--%>

<%--        <input type="text" class="text-lg bg-neutral-100 w-[44vw] italic outline-none"--%>
<%--               placeholder="Find a gift ...">--%>
<%--        <img src="search-icon.svg" alt="search-icon"--%>
<%--             class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">--%>

<%--    </div>--%>

<%--    <div class="text flex flex-row gap-5">--%>

<%--visible only for Manager--%>
<%--        <div class="flex justify-center items-center flex-col">--%>
<%--            <img src="giftsProposed.svg" alt="giftsProposed" class="w-10 cursor-pointer ">--%>
<%--            <a class="text-sm font-medium" href="#">Gifts</a>--%>
<%--        </div>--%>

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

<%--2.    main body--%>
<%--<div class="text flex justify-between items-center text-xl font-medium mx-80 mt-12 ">--%>
<%--    <h4 class="cursor-pointer">Mother day</h4>--%>
<%--    <h4 class="cursor-pointer">Certificates</h4>--%>
<%--    <h4 class="cursor-pointer">Top gifts this month</h4>--%>
<%--</div>--%>

<%--<div class="h-[45%] w-screen bg-blue-100 mt-6 flex justify-between items-center px-56">--%>

<%--    <div class="flex flex-col items-center pl-40 pt-10 space-y-2">--%>
<%--        <button class="px-16 py-4 rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">--%>
<%--            Generate gift--%>
<%--        </button>--%>
<%--        <button class="py-2 px-10 ml-16 rounded-lg shadow-md bg-white font-bold text-xl transition duration-300 ease-in hover:ease-in hover:scale-[1.1]">--%>
<%--            Create gift--%>
<%--        </button>--%>
<%--    </div>--%>

<%--    <div class="relative">--%>

<%--            <img src="gift-picture.svg" alt="gift-picture" class=" z-1 rounded-[30px] shadow w-5/7 ">--%>
<%--        <button class="z-2 py-2 absolute bottom-[-20px] left-[20%] w-2/3  rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">--%>
<%--            Form to send--%>
<%--        </button>--%>
<%--    </div>--%>

<%--</div>--%>

<%--<div class="text flex justify-between items-center text-xl font-normal mx-80 mt-8 text-neutral-500 ">--%>
<%--    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Ukrainian brands</button>--%>
<%--    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Trendy gifts</button>--%>
<%--    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Gifts for anyone</button>--%>
<%--</div>--%>

<%--<div class="text flex justify-between items-center text-xl font-normal mx-[33%] mt-5 text-neutral-500 ">--%>
<%--    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Aesthetic gifts</button>--%>
<%--    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70">Handy gifts</button>--%>
<%--</div>--%>


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
<%--<div class="custom-grid mt-12">--%>

<%--    <div class="flex items-center justify-center">--%>
<%--        <img src="bin.svg" alt="bin" class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--    </div>--%>

<%--    <div class="flex items-center justify-center gap-8">--%>

<%--<img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>


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
<%--<div class="custom-grid mt-12">--%>

<%--    <div class="flex items-center justify-center">--%>
<%--        <img src="bin.svg" alt="bin" class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--    </div>--%>

<%--    <div class="flex items-center justify-center gap-8">--%>

<%--<img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

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

<%-- ALL ITEMS PAGE
FILTERS--%>
<%--1.    header--%>

<%--<div class="bg-blue-100 h-[100vh]">--%>
<%--    <div class="text flex justify-between items-center px-10 py-3">--%>
<%--        <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>


<%--        &lt;%&ndash;3.  search input&ndash;%&gt;--%>
<%--        <div class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">--%>
<%--            <input type="text" class="text-lg bg-neutral-100 italic outline-none"--%>
<%--                   placeholder="Find ...">--%>


<%--            <img src="search-icon.svg" alt="search-icon"--%>
<%--                 class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">--%>

<%--        </div>--%>
<%--    </div>--%>


<%--    <div class="text flex justify-between items-center px-[10%] py-3 mt-4">--%>
<%--        &lt;%&ndash;Category&ndash;%&gt;--%>
<%--        <div class="relative w-64 ">--%>
<%--            <!-- Custom Dropdown Trigger -->--%>
<%--            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"--%>
<%--                 id="dropdownTrigger">--%>
<%--                <div>Category</div>--%>
<%--                <svg class="transform transition-transform h-4 w-4" xmlns="http://www.w3.org/2000/svg" fill="none"--%>
<%--                     viewBox="0 0 24 24" stroke="currentColor">--%>
<%--                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>--%>
<%--                </svg>--%>
<%--            </div>--%>

<%--            <!-- Dropdown Menu -->--%>
<%--            <div class="absolute mt-1 w-full rounded-md bg-white shadow-lg hidden" id="dropdownMenu">--%>
<%--                <ul class="text-gray-700 max-h-60 overflow-auto">--%>
<%--                    <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer" onclick="toggleCheckbox(event)">--%>
<%--                        <input type="checkbox" class="form-checkbox h-4 w-4 text-green-600">--%>
<%--                        <span class="ml-2">Kitchen</span>--%>
<%--                    </li>--%>
<%--                    <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer" onclick="toggleCheckbox(event)">--%>
<%--                        <input type="checkbox" class="form-checkbox h-4 w-4 text-red-600">--%>
<%--                        <span class="ml-2">Literature</span>--%>
<%--                    </li>--%>
<%--                    <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer" onclick="toggleCheckbox(event)">--%>
<%--                        <input type="checkbox" class="form-checkbox h-4 w-4 text-yellow-600">--%>
<%--                        <span class="ml-2">Sport</span>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;Price&ndash;%&gt;--%>
<%--        <div class="flex gap-2 items-center">--%>
<%--            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded">--%>
<%--                <input type="text" class="text-gray-700 text-lg italic outline-none w-14"--%>
<%--                       placeholder="From">--%>
<%--            </div>--%>
<%--            <h4 class="text-2xl font-semibold text-gray-700">-</h4>--%>
<%--            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded">--%>
<%--                <input type="text" class=" text-gray-700 text-lg italic outline-none w-14"--%>
<%--                       placeholder="To">--%>
<%--                <img src="currency.svg" alt="currency-icon" class="w-5 pt-1">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        For who&ndash;%&gt;--%>
<%--        <div class="relative w-64">--%>
<%--            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded cursor-pointer"--%>
<%--                 id="dropdownTrigger1">--%>
<%--                <div class="text-lg text-gray-700">For</div>--%>
<%--                <svg class="transform transition-transform h-4 w-4" xmlns="http://www.w3.org/2000/svg" fill="none"--%>
<%--                     viewBox="0 0 24 24" stroke="currentColor">--%>
<%--                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>--%>
<%--                </svg>--%>
<%--            </div>--%>
<%--            <!-- Dropdown Menu -->--%>
<%--            <div class="absolute mt-1 w-full rounded-md bg-white shadow-lg hidden" id="dropdownMenu1">--%>
<%--                <ul class="text-gray-700 max-h-60 overflow-auto">--%>
<%--                    <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer" onclick="toggleCheckbox(event)">--%>
<%--                        <input type="checkbox" class="form-checkbox h-4 w-4 text-green-600">--%>
<%--                        <span class="ml-2">Female</span>--%>
<%--                    </li>--%>
<%--                    <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer" onclick="toggleCheckbox(event)">--%>
<%--                        <input type="checkbox" class="form-checkbox h-4 w-4 text-red-600">--%>
<%--                        <span class="ml-2">Male</span>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;Age range&ndash;%&gt;--%>
<%--        <div class="flex gap-2 items-center">--%>
<%--            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 py-3 px-4 rounded">--%>
<%--                <input type="text" class="text-lg italic outline-none w-14"--%>
<%--                       placeholder="From">--%>
<%--            </div>--%>
<%--            <h4 class="text-2xl font-semibold text-gray-700">-</h4>--%>
<%--            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 py-3 px-4 rounded">--%>
<%--                <input type="text" class="text-lg italic outline-none w-14"--%>
<%--                       placeholder="To y.o.">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <button class="bg-[#6AB7FF] py-3 px-5 rounded-lg transition duration-500 hover:opacity-70 text-white text-xl font-medium">--%>
<%--            Search--%>
<%--        </button>--%>
<%--    </div>--%>

<%--    &lt;%&ndash; main body&ndash;%&gt;--%>
<%--    <div>--%>
<%--        <h4 class="text-2xl font-semibold text-gray-600 ml-[10%] mt-6">--%>
<%--            6 items found by your filters--%>
<%--        </h4>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--        <h4 class="text-2xl font-semibold text-gray-600 ml-[10%] mt-6">--%>
<%--            Certificates for creative master classes--%>
<%--        </h4>--%>
<%--    </div>--%>


<%--    &lt;%&ndash;    all items in row&ndash;%&gt;--%>
<%--    <div class="flex gap-12 mx-[10%] flex-wrap">--%>
<%--        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">--%>

<%--            <div class="flex items-center justify-center flex-col gap-2">--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="w-28"/>--%>
<%--                <h4 class="text-base font-medium leading-5">--%>
<%--                    Harry Potter<br/>--%>
<%--                    The Complete Collection: 7 Book Box Set--%>
<%--                </h4>--%>

<%--                <div class="flex gap-2 font-bold text-left w-full">--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        3200--%>
<%--                    </h4>--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        UAH--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex flex-col absolute top-2 right-2 gap-1 ">--%>
<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                <img src="basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        2 item--%>
<%--        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">--%>

<%--            <div class="flex items-center justify-center flex-col gap-2">--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="w-28"/>--%>
<%--                <h4 class="text-base font-medium leading-5">--%>
<%--                    Harry Potter<br/>--%>
<%--                    The Complete Collection: 7 Book Box Set--%>
<%--                </h4>--%>

<%--                <div class="flex gap-2 font-bold text-left w-full">--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        3200--%>
<%--                    </h4>--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        UAH--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex flex-col absolute top-2 right-2 gap-1 ">--%>
<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                <img src="basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        3 item&ndash;%&gt;--%>
<%--        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">--%>

<%--            <div class="flex items-center justify-center flex-col gap-2">--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="w-28"/>--%>
<%--                <h4 class="text-base font-medium leading-5">--%>
<%--                    Harry Potter<br/>--%>
<%--                    The Complete Collection: 7 Book Box Set--%>
<%--                </h4>--%>

<%--                <div class="flex gap-2 font-bold text-left w-full">--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        3200--%>
<%--                    </h4>--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        UAH--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex flex-col absolute top-2 right-2 gap-1 ">--%>
<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                <img src="basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        4 item&ndash;%&gt;--%>
<%--        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">--%>

<%--            <div class="flex items-center justify-center flex-col gap-2">--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="w-28"/>--%>
<%--                <h4 class="text-base font-medium leading-5">--%>
<%--                    Harry Potter<br/>--%>
<%--                    The Complete Collection: 7 Book Box Set--%>
<%--                </h4>--%>

<%--                <div class="flex gap-2 font-bold text-left w-full">--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        3200--%>
<%--                    </h4>--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        UAH--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex flex-col absolute top-2 right-2 gap-1 ">--%>
<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                <img src="basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        5 item&ndash;%&gt;--%>
<%--        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">--%>

<%--            <div class="flex items-center justify-center flex-col gap-2">--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="w-28"/>--%>
<%--                <h4 class="text-base font-medium leading-5">--%>
<%--                    Harry Potter<br/>--%>
<%--                    The Complete Collection: 7 Book Box Set--%>
<%--                </h4>--%>

<%--                <div class="flex gap-2 font-bold text-left w-full">--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        3200--%>
<%--                    </h4>--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        UAH--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex flex-col absolute top-2 right-2 gap-1 ">--%>
<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                <img src="basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;        6 item&ndash;%&gt;--%>
<%--        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">--%>

<%--            <div class="flex items-center justify-center flex-col gap-2">--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="w-28"/>--%>
<%--                <h4 class="text-base font-medium leading-5">--%>
<%--                    Harry Potter<br/>--%>
<%--                    The Complete Collection: 7 Book Box Set--%>
<%--                </h4>--%>

<%--                <div class="flex gap-2 font-bold text-left w-full">--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        3200--%>
<%--                    </h4>--%>
<%--                    <h4 class="text-medium font-medium">--%>
<%--                        UAH--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex flex-col absolute top-2 right-2 gap-1 ">--%>
<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                <img src="basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

<%--ITEM DETAILED--%>
<%--<div class="mx-[3%] my-6">--%>

<%--    &lt;%&ndash;1.    header&ndash;%&gt;--%>
<%--    <div class="flex justify-between items-center">--%>
<%--        <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>


<%--        <div class="text flex flex-row gap-5">--%>

<%--            <div class="flex justify-center items-center flex-col">--%>
<%--                <img src="myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">--%>
<%--                <a class="text-sm font-medium" href="#">My profile</a>--%>
<%--            </div>--%>

<%--            <div class="flex justify-center items-center flex-col">--%>
<%--                <img src="liked.svg" alt="liked-items" class="w-10 cursor-pointer">--%>
<%--                <a class="text-sm font-medium" href="#">Liked</a>--%>

<%--            </div>--%>

<%--            <div class="flex justify-center items-center flex-col">--%>
<%--                <img src="basket.svg" alt="basket-icon" class="w-10 cursor-pointer">--%>
<%--                <a class="text-sm font-medium" href="#">Basket</a>--%>

<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>

<%--    main body--%>
<%--    <div class="flex justify-between items-center gap-12 mx-[12%] my-[2%]">--%>

<%--        <div class="flex gap-12">--%>
<%--            &lt;%&ndash;    jeft bar with images&ndash;%&gt;--%>
<%--            <div class="flex flex-col gap-3 max-h-[700px] overflow-y-auto pr-4 text-6xl ">--%>

<%--                <img src="harryPotter.svg" alt="harryPotter" class="max-h-32 max-w-32 min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>


<%--            </div>--%>

<%--            &lt;%&ndash;        main image&ndash;%&gt;--%>
<%--            <div class="flex items-center justify-center rounded-lg w-[600px] relative ">--%>
<%--                <img src="leftArrow.svg" alt="leftArrow" class="w-10 cursor-pointer shadow absolute left-6"/>--%>
<%--                <img src="harryPotter.svg" alt="harryPotter" class="rounded-lg shadow"/>--%>
<%--                <img src="rightArrow.svg" alt="rightArrow" class="w-10 cursor-pointer shadow absolute right-6"/>--%>

<%--            </div>--%>

<%--        </div>--%>

<%--        &lt;%&ndash;right menu with details&ndash;%&gt;--%>
<%--        <div class="flex flex-col gap-8">--%>

<%--            <div class="gap-12">--%>
<%--<div class="flex gap-2">--%>
<%--    <h4 class="text-xl font-light">id: </h4>--%>
<%--    <h4 class="text-xl font-light">1000</h4>--%>
<%--</div>--%>
<%--                <div class="space-y-4">--%>
<%--                    <h4 class="text-3xl font-medium">Harry Potter The Complete Collection: 7 Book Box Set</h4>--%>
<%--                    <h4 class="text-3xl font-bold mt-6">3200 UAH</h4>--%>

<%--                    <p class="text-xl">--%>
<%--                        Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling.<br>--%>
<%--                        Set consists of: <br>Philosopher's Stone (1997), Chamber of Secrets (1998), Prisoner of Azkaban--%>
<%--                        (1999),--%>
<%--                        Goblet of Fire (2000), Order of the Phoenix (2003), Half-Blood Prince (2005), Deathly Hallows--%>
<%--                        (2007).--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--            <div class="flex justify-content items-center gap-5 ">--%>
<%--                <button class="w-[50%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-between px-6 py-3 text-white text-3xl font-medium">--%>
<%--                    Buy--%>
<%--                    <img src="buyIcon.svg" alt="Buy Icon" class="w-8 h-8"/>--%>
<%--                </button>--%>

<%--                <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--CREATE ITEM DETAILED PAGE--%>
<%--<div class="mx-[3%] my-6">--%>

<%--    &lt;%&ndash;1.    header&ndash;%&gt;--%>
<%--    <div class="flex justify-between items-center">--%>
<%--        <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>


<%--        <div class="text flex flex-row gap-5">--%>

<%--            <div class="flex justify-center items-center flex-col">--%>
<%--                <img src="myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">--%>
<%--                <a class="text-sm font-medium" href="#">My profile</a>--%>
<%--            </div>--%>

<%--            <div class="flex justify-center items-center flex-col">--%>
<%--                <img src="liked.svg" alt="liked-items" class="w-10 cursor-pointer">--%>
<%--                <a class="text-sm font-medium" href="#">Liked</a>--%>

<%--            </div>--%>

<%--            <div class="flex justify-center items-center flex-col">--%>
<%--                <img src="basket.svg" alt="basket-icon" class="w-10 cursor-pointer">--%>
<%--                <a class="text-sm font-medium" href="#">Basket</a>--%>

<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>

<%--    &lt;%&ndash;main body&ndash;%&gt;--%>
<%--    <div class="flex justify-between items-center gap-12 mx-[12%] my-[2%]">--%>

<%--        <div class="flex gap-12">--%>
<%--            &lt;%&ndash;    jeft bar with images&ndash;%&gt;--%>
<%--            <div class="flex flex-col gap-3 max-h-[700px] overflow-y-auto pr-4 text-6xl ">--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>--%>


<%--            </div>--%>

<%--            &lt;%&ndash;        main image&ndash;%&gt;--%>
<%--            <div class="flex items-center justify-center rounded-lg w-[600px] relative">--%>
<%--                <img src="leftArrow.svg" alt="leftArrow" class="w-10 cursor-pointer  absolute left-6"/>--%>
<%--                <h4 class="flex justify-center items-center h-[600px] w-full text-9xl rounded-lg bg-neutral-200 ">+</h4>--%>
<%--                <img src="rightArrow.svg" alt="rightArrow" class="w-10 cursor-pointer  absolute right-6"/>--%>

<%--            </div>--%>

<%--        </div>--%>

<%--        &lt;%&ndash;right menu with details&ndash;%&gt;--%>
<%--        <div class="flex flex-col gap-16">--%>

<%--            <div class="relative w-64 ">--%>

<%--                <!-- Custom Dropdown Trigger -->--%>
<%--                <div class="w-[50%] flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"--%>
<%--                     id="dropdownTrigger">--%>
<%--                    <div>Category</div>--%>
<%--                    <svg class="transform transition-transform h-4 w-4" xmlns="http://www.w3.org/2000/svg" fill="none"--%>
<%--                         viewBox="0 0 24 24" stroke="currentColor">--%>
<%--                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>--%>
<%--                    </svg>--%>
<%--                </div>--%>

<%--                <!-- Dropdown Menu -->--%>
<%--                <div class="absolute mt-1 w-full rounded-md bg-white shadow-lg hidden" id="dropdownMenu">--%>
<%--                    <ul class="text-gray-700 max-h-60 overflow-auto">--%>
<%--                        <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"--%>
<%--                            onclick="toggleCheckbox(event)">--%>
<%--                            <input type="checkbox" class="form-checkbox h-4 w-4 text-green-600">--%>
<%--                            <span class="ml-2">Kitchen</span>--%>
<%--                        </li>--%>
<%--                        <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"--%>
<%--                            onclick="toggleCheckbox(event)">--%>
<%--                            <input type="checkbox" class="form-checkbox h-4 w-4 text-red-600">--%>
<%--                            <span class="ml-2">Literature</span>--%>
<%--                        </li>--%>
<%--                        <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"--%>
<%--                            onclick="toggleCheckbox(event)">--%>
<%--                            <input type="checkbox" class="form-checkbox h-4 w-4 text-yellow-600">--%>
<%--                            <span class="ml-2">Sport</span>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            &lt;%&ndash; info&ndash;%&gt;--%>
<%--            <div>--%>
<%--                <div class="flex gap-2">--%>
<%--                    <h4 class="text-xl font-light">id: </h4>--%>
<%--                    <h4 class="text-xl font-light">x</h4>--%>
<%--                </div>--%>

<%--                <div class="gap-12">--%>
<%--                    <label>--%>
<%--                        <input type="text"--%>
<%--                               class="text-2xl font-medium p-3 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"--%>
<%--                               placeholder="Title">--%>
<%--                    </label>--%>

<%--                    <div class="flex items-center p-3 text-2xl font-bold mt-6 rounded-lg border border-neutral-200 w-[60%]">--%>
<%--                        <div class="flex-grow relative ">--%>
<%--                            <label>--%>
<%--                                <input type="text" class="w-full placeholder:italic outline-none "--%>
<%--                                       placeholder="Price">--%>
<%--                            </label>--%>
<%--                            <h4 class="absolute inset-y-0 right-0">--%>
<%--                                UAH--%>
<%--                            </h4>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <label>--%>
<%--                        <input type="text"--%>
<%--                               class="w-full text-xl placeholder:italic outline-none p-3 mt-8 rounded-lg border border-neutral-200"--%>
<%--                               placeholder="Description">--%>
<%--                    </label>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--            <button class="w-[50%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-center py-3 text-white text-3xl font-medium">--%>
<%--                Publish--%>
<%--            </button>--%>


<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--BASKET PAGE FINAL --%>
<%--<div>--%>
<%--    <div class="mx-[3%] my-6">--%>

<%--        &lt;%&ndash;1.    header&ndash;%&gt;--%>
<%--        <div class="flex justify-between items-center">--%>
<%--            <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>


<%--            <div class="text flex flex-row gap-5">--%>

<%--                <div class="flex justify-center items-center flex-col">--%>
<%--                    <img src="myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">--%>
<%--                    <a class="text-sm font-medium" href="#">My profile</a>--%>
<%--                </div>--%>

<%--                <div class="flex justify-center items-center flex-col">--%>
<%--                    <img src="liked.svg" alt="liked-items" class="w-10 cursor-pointer">--%>
<%--                    <a class="text-sm font-medium" href="#">Liked</a>--%>

<%--                </div>--%>

<%--                <div class="flex justify-center items-center flex-col">--%>
<%--                    <img src="basket.svg" alt="basket-icon" class="w-10 cursor-pointer">--%>
<%--                    <a class="text-sm font-medium" href="#">Basket</a>--%>

<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--        &lt;%&ndash;    main body&ndash;%&gt;--%>
<%--        <div class="flex justify-between items-center gap-12 mx-[12%] my-[2%]">--%>

<%--            <div class="flex gap-12">--%>
<%--                &lt;%&ndash;    jeft bar with images&ndash;%&gt;--%>
<%--                <div class="flex flex-col gap-3 max-h-[700px] overflow-y-auto pr-4 text-6xl ">--%>

<%--                    <img src="harryPotter.svg" alt="harryPotter" class="max-h-32 max-w-32 min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>--%>


<%--                </div>--%>

<%--                &lt;%&ndash;        main image&ndash;%&gt;--%>
<%--                <div class="flex items-center justify-center rounded-lg w-[600px] relative ">--%>
<%--                    <img src="leftArrow.svg" alt="leftArrow" class="w-10 cursor-pointer shadow absolute left-6"/>--%>
<%--                    <img src="harryPotter.svg" alt="harryPotter" class="rounded-lg shadow"/>--%>
<%--                    <img src="rightArrow.svg" alt="rightArrow" class="w-10 cursor-pointer shadow absolute right-6"/>--%>

<%--                </div>--%>

<%--            </div>--%>

<%--            &lt;%&ndash;right menu with details&ndash;%&gt;--%>
<%--            <div class="flex flex-col gap-8">--%>

<%--                <div class="gap-12">--%>
<%--                    <div class="flex gap-2">--%>
<%--                        <h4 class="text-xl font-light">id: </h4>--%>
<%--                        <h4 class="text-xl font-light">1000</h4>--%>
<%--                    </div>--%>
<%--                    <div class="space-y-4">--%>
<%--                        <h4 class="text-3xl font-medium">Harry Potter The Complete Collection: 7 Book Box Set</h4>--%>
<%--                        <h4 class="text-3xl font-bold mt-6">3200 UAH</h4>--%>

<%--                        <p class="text-xl">--%>
<%--                            Harry Potter is a series of seven fantasy novels written by British author J. K.--%>
<%--                            Rowling.<br>--%>
<%--                            Set consists of: <br>Philosopher's Stone (1997), Chamber of Secrets (1998), Prisoner of--%>
<%--                            Azkaban--%>
<%--                            (1999),--%>
<%--                            Goblet of Fire (2000), Order of the Phoenix (2003), Half-Blood Prince (2005), Deathly--%>
<%--                            Hallows--%>
<%--                            (2007).--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>


<%--                <div class="flex justify-content items-center gap-5 ">--%>
<%--                    <button data-modal-target="default-modal" data-modal-toggle="default-modal"--%>
<%--                            class="w-[50%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-between px-6 py-3 text-white text-3xl font-medium">--%>
<%--                        Buy--%>
<%--                        <img src="buyIcon.svg" alt="Buy Icon" class="w-8 h-8"/>--%>
<%--                    </button>--%>

<%--                    <img src="likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


<%--    <!-- Main modal -->--%>
<%--    <div id="default-modal" tabindex="-1" aria-hidden="true"--%>
<%--         class="absolute flex hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center h-[calc(100%-1rem)]">--%>
<%--        <div class=" p-4  max-w-7xl max-h-[90vh]">--%>
<%--            <!-- Modal content -->--%>
<%--            <div class="relative bg-white rounded-lg shadow">--%>
<%--                <!-- Modal header -->--%>
<%--                <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">--%>
<%--                    <h3 class="text-2xl font-semibold text-black">--%>
<%--                        Basket--%>
<%--                    </h3>--%>
<%--                    <button type="button"--%>
<%--                            class="text-gray-400 bg-transparent transition-all duration-300 hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"--%>
<%--                            data-modal-hide="default-modal">--%>
<%--                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"--%>
<%--                             viewBox="0 0 14 14">--%>
<%--                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"--%>
<%--                                  d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>--%>
<%--                        </svg>--%>
<%--                        <span class="sr-only">Close modal</span>--%>
<%--                    </button>--%>
<%--                </div>--%>

<%--                <!-- Modal body -->--%>
<%--                <div class="flex gap-16">--%>
<%--                    <div class="flex flex-col m-4 p-4 gap-y-12 max-h-[70vh] overflow-y-scroll">--%>

<%--                        &lt;%&ndash;1st item&ndash;%&gt;--%>
<%--                        <div class="flex items-center justify-center gap-8">--%>
<%--                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

<%--                            <div class="flex flex-col gap-4">--%>
<%--                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set--%>
<%--                                </h4>--%>

<%--                                <div class="flex flex-row gap-2">--%>
<%--                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                        ---%>
<%--                                    </div>--%>
<%--                                    <h4 class="flex justify-center items-center text-lg">--%>
<%--                                        1--%>
<%--                                    </h4>--%>
<%--                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                        +--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>--%>

<%--                            <div class="flex items-center justify-center">--%>
<%--                                <img src="bin.svg" alt="bin"--%>
<%--                                     class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        &lt;%&ndash;  2nd item&ndash;%&gt;--%>
<%--                        <div class="flex items-center justify-center gap-8">--%>
<%--                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

<%--                            <div class="flex flex-col gap-4">--%>
<%--                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set--%>
<%--                                </h4>--%>

<%--                                <div class="flex flex-row gap-2">--%>
<%--                                    <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">--%>
<%--                                        ---%>
<%--                                    </div>--%>
<%--                                    <h4 class="flex justify-center items-center text-lg">--%>
<%--                                        2--%>
<%--                                    </h4>--%>
<%--                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                        +--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>--%>

<%--                            <div class="flex items-center justify-center">--%>
<%--                                <img src="bin.svg" alt="bin"--%>
<%--                                     class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                            <div class="flex items-center justify-center gap-8">--%>
<%--                                <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

<%--                                <div class="flex flex-col gap-4">--%>
<%--                                    <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set--%>
<%--                                    </h4>--%>

<%--                                    <div class="flex flex-row gap-2">--%>
<%--                                        <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">--%>
<%--                                            ---%>
<%--                                        </div>--%>
<%--                                        <h4 class="flex justify-center items-center text-lg">--%>
<%--                                            2--%>
<%--                                        </h4>--%>
<%--                                        <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                            +--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                                <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>--%>

<%--                                <div class="flex items-center justify-center">--%>
<%--                                    <img src="bin.svg" alt="bin"--%>
<%--                                         class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="flex items-center justify-center gap-8">--%>
<%--                                <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

<%--                                <div class="flex flex-col gap-4">--%>
<%--                                    <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set--%>
<%--                                    </h4>--%>

<%--                                    <div class="flex flex-row gap-2">--%>
<%--                                        <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">--%>
<%--                                            ---%>
<%--                                        </div>--%>
<%--                                        <h4 class="flex justify-center items-center text-lg">--%>
<%--                                            2--%>
<%--                                        </h4>--%>
<%--                                        <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                            +--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                                <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>--%>

<%--                                <div class="flex items-center justify-center">--%>
<%--                                    <img src="bin.svg" alt="bin"--%>
<%--                                         class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="flex items-center justify-center gap-8">--%>
<%--                                <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

<%--                                <div class="flex flex-col gap-4">--%>
<%--                                    <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set--%>
<%--                                    </h4>--%>

<%--                                    <div class="flex flex-row gap-2">--%>
<%--                                        <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">--%>
<%--                                            ---%>
<%--                                        </div>--%>
<%--                                        <h4 class="flex justify-center items-center text-lg">--%>
<%--                                            2--%>
<%--                                        </h4>--%>
<%--                                        <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                            +--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                                <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>--%>

<%--                                <div class="flex items-center justify-center">--%>
<%--                                    <img src="bin.svg" alt="bin"--%>
<%--                                         class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="flex items-center justify-center gap-8">--%>
<%--                                <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>--%>

<%--                                <div class="flex flex-col gap-4">--%>
<%--                                    <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set--%>
<%--                                    </h4>--%>

<%--                                    <div class="flex flex-row gap-2">--%>
<%--                                        <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">--%>
<%--                                            ---%>
<%--                                        </div>--%>
<%--                                        <h4 class="flex justify-center items-center text-lg">--%>
<%--                                            2--%>
<%--                                        </h4>--%>
<%--                                        <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">--%>
<%--                                            +--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                                <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>--%>

<%--                                <div class="flex items-center justify-center">--%>
<%--                                    <img src="bin.svg" alt="bin"--%>
<%--                                         class=" w-10 cursor-pointer flex items-center justify-center"/>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                    </div>--%>

<%--                    &lt;%&ndash;right info purchase panel &ndash;%&gt;--%>
<%--                    <div class="flex flex-col gap-16 bg-neutral-100 w-[35%] h-full m-4 p-4 rounded-lg max-h-[70vh] overflow-y-scroll">--%>

<%--                        <div class="flex flex-col gap-8">--%>
<%--                            &lt;%&ndash;1st item&ndash;%&gt;--%>
<%--                            <div class="flex items-center justify-between ">--%>
<%--                                <div class="flex justify-center items-center gap-8">--%>
<%--                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                        Set--%>
<%--                                    </h4>--%>
<%--                                    <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                        <div class="flex items-center justify-between">--%>
<%--                                            <h4 class="text-lg font-medium">x</h4>--%>
<%--                                            <h4 class="text-xl font-bold">1</h4>--%>
<%--                                        </div>--%>
<%--                                        <h4 class="text-xl font-bold">3200</h4>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>

<%--                            &lt;%&ndash; 2nd item&ndash;%&gt;--%>
<%--                            <div class="flex items-center justify-between ">--%>
<%--                                <div class="flex justify-center items-center gap-8">--%>
<%--                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                        Set--%>
<%--                                    </h4>--%>
<%--                                    <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                        <div class="flex items-center justify-between font-medium ">--%>
<%--                                            <h4 class="text-lg font-medium">x</h4>--%>
<%--                                            <h4 class="text-xl font-bold">2</h4>--%>
<%--                                        </div>--%>
<%--                                        <h4 class="text-xl font-bold">6400</h4>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>

<%--                                <div class="flex items-center justify-between ">--%>
<%--                                    <div class="flex justify-center items-center gap-8">--%>
<%--                                        <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                            Set--%>
<%--                                        </h4>--%>
<%--                                        <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                            <div class="flex items-center justify-between font-medium ">--%>
<%--                                                <h4 class="text-lg font-medium">x</h4>--%>
<%--                                                <h4 class="text-xl font-bold">2</h4>--%>
<%--                                            </div>--%>
<%--                                            <h4 class="text-xl font-bold">6400</h4>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>


<%--                                <div class="flex items-center justify-between ">--%>
<%--                                    <div class="flex justify-center items-center gap-8">--%>
<%--                                        <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                            Set--%>
<%--                                        </h4>--%>
<%--                                        <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                            <div class="flex items-center justify-between font-medium ">--%>
<%--                                                <h4 class="text-lg font-medium">x</h4>--%>
<%--                                                <h4 class="text-xl font-bold">2</h4>--%>
<%--                                            </div>--%>
<%--                                            <h4 class="text-xl font-bold">6400</h4>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>


<%--                                <div class="flex items-center justify-between ">--%>
<%--                                    <div class="flex justify-center items-center gap-8">--%>
<%--                                        <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                            Set--%>
<%--                                        </h4>--%>
<%--                                        <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                            <div class="flex items-center justify-between font-medium ">--%>
<%--                                                <h4 class="text-lg font-medium">x</h4>--%>
<%--                                                <h4 class="text-xl font-bold">2</h4>--%>
<%--                                            </div>--%>
<%--                                            <h4 class="text-xl font-bold">6400</h4>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>


<%--                                <div class="flex items-center justify-between ">--%>
<%--                                    <div class="flex justify-center items-center gap-8">--%>
<%--                                        <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                            Set--%>
<%--                                        </h4>--%>
<%--                                        <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                            <div class="flex items-center justify-between font-medium ">--%>
<%--                                                <h4 class="text-lg font-medium">x</h4>--%>
<%--                                                <h4 class="text-xl font-bold">2</h4>--%>
<%--                                            </div>--%>
<%--                                            <h4 class="text-xl font-bold">6400</h4>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="flex items-center justify-between ">--%>
<%--                                    <div class="flex justify-center items-center gap-8">--%>
<%--                                        <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box--%>
<%--                                            Set--%>
<%--                                        </h4>--%>
<%--                                        <div class="flex flex-col gap-2 items-center justify-center">--%>
<%--                                            <div class="flex items-center justify-between font-medium ">--%>
<%--                                                <h4 class="text-lg font-medium">x</h4>--%>
<%--                                                <h4 class="text-xl font-bold">2</h4>--%>
<%--                                            </div>--%>
<%--                                            <h4 class="text-xl font-bold">6400</h4>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                </div>--%>
<%--                        </div>--%>


<%--                        <div class="flex flex-col gap-4">--%>
<%--                            <div class="flex justify-between">--%>
<%--                                <h4 class="text-lg font-medium">Total: </h4>--%>
<%--                                <h4 class="text-xl font-bold">9600 UAH</h4>--%>
<%--                            </div>--%>

<%--                            <div class="flex justify-center rounded-lg bg-neutral-300 transition-all duration-300 hover:opacity-80">--%>
<%--                                <button data-modal-hide="default-modal" type="button"--%>
<%--                                        class="font-medium text-lg p-4  ">--%>
<%--                                    Purchase--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>


<%--PROPOSED GIFTS PAGE--%>
<div>
    <div class="text flex justify-between items-center px-10 py-3">
        <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">


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


    <div class="flex justify-center items-center flex-col">
        <img src="giftsProposed.svg" alt="giftsProposed" class="w-16">
        <h4 class="font-bold text-2xl">Offered gifts</h4>
    </div>

    <div class="mx-8">
        <div class="custom-grid-offered-gifts text-2xl font-medium mt-8">
            <h4 class="flex items-center justify-center">Item</h4>
            <h4 class="flex items-center justify-center">Category</h4>
            <h4 class="flex items-center justify-center">Price (UAH)</h4>
        </div>
        <hr class="border-neutral-500 mt-6"/>

        <%--all items container--%>
        <div class="grid mt-8 gap-12 ">
            <%--Contaier with 1st item--%>
            <div class="custom-grid-offered-gifts px-12 ">


                <div class="flex items-center justify-center gap-6">

                    <div class="flex items-center justify-center">
                        <img src="bin.svg" alt="bin" class="w-12 cursor-pointer"/>
                    </div>


                    <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>
                    <div class="flex flex-col">
                        <h5 class="text-lg font-light">id: 1000</h5>
                        <h4 class="text-xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>
                    </div>

                </div>

                <%--category--%>
                <div class="relative flex justify-center items-center">
                    <div class="relative w-[50%]">
                        <!-- Custom Dropdown Trigger -->
                        <div class=" flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                             id="dropdownTriggerFirst">
                            <div>Category</div>
                            <svg class="transform transition-transform h-4 w-4" xmlns="http://www.w3.org/2000/svg"
                                 fill="none"
                                 viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M19 9l-7 7-7-7"/>
                            </svg>
                        </div>

                        <!-- Dropdown Menu -->
                        <div class="absolute mt-1 w-full rounded-md bg-white shadow-lg hidden" id="dropdownMenuFirst">
                            <ul class="text-gray-700 max-h-60 overflow-auto">
                                <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"
                                    onclick="toggleCheckbox(event)">
                                    <input type="checkbox" class="form-checkbox h-4 w-4 text-green-600">
                                    <span class="ml-2">Kitchen</span>
                                </li>
                                <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"
                                    onclick="toggleCheckbox(event)">
                                    <input type="checkbox" class="form-checkbox h-4 w-4 text-red-600">
                                    <span class="ml-2">Literature</span>
                                </li>
                                <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"
                                    onclick="toggleCheckbox(event)">
                                    <input type="checkbox" class="form-checkbox h-4 w-4 text-yellow-600">
                                    <span class="ml-2">Sport</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>

                <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>

                <div class="flex items-center justify-center">
                    <button class="flex w-[50%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70  self-center p-3 justify-between px-4 text-white text-3xl font-medium flex-shrink">
                        Buy
                        <img src="buyIcon.svg" alt="buyIcon"/>
                    </button>
                </div>

            </div>

            <%--Container with 2nd item--%>
            <div class="custom-grid-offered-gifts px-12 ">


                <div class="flex items-center justify-center gap-6">

                    <div class="flex items-center justify-center">
                        <img src="bin.svg" alt="bin" class="w-12 cursor-pointer"/>
                    </div>


                    <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>
                    <div class="flex flex-col">
                        <h5 class="text-lg font-light">id: 1000</h5>
                        <h4 class="text-xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>
                    </div>

                </div>

                <%--category--%>
                <div class="relative flex justify-center items-center">
                    <div class="relative w-[50%]">
                        <!-- Custom Dropdown Trigger -->
                        <div class=" flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                             id="dropdownTriggerSecond">
                            <div>Category</div>
                            <svg class="transform transition-transform h-4 w-4" xmlns="http://www.w3.org/2000/svg"
                                 fill="none"
                                 viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M19 9l-7 7-7-7"/>
                            </svg>
                        </div>

                        <!-- Dropdown Menu -->
                        <div class="absolute mt-1 w-full rounded-md bg-white shadow-lg hidden" id="dropdownMenuSecond">
                            <ul class="text-gray-700 max-h-60 overflow-auto">
                                <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"
                                    onclick="toggleCheckbox(event)">
                                    <input type="checkbox" class="form-checkbox h-4 w-4 text-green-600">
                                    <span class="ml-2">Kitchen</span>
                                </li>
                                <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"
                                    onclick="toggleCheckbox(event)">
                                    <input type="checkbox" class="form-checkbox h-4 w-4 text-red-600">
                                    <span class="ml-2">Literature</span>
                                </li>
                                <li class="flex items-center p-2 hover:bg-gray-100 cursor-pointer"
                                    onclick="toggleCheckbox(event)">
                                    <input type="checkbox" class="form-checkbox h-4 w-4 text-yellow-600">
                                    <span class="ml-2">Sport</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>

                <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>

                <div class="flex items-center justify-center">
                    <button class="flex w-[50%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70  self-center p-3 justify-between px-4 text-white text-3xl font-medium flex-shrink">
                        Buy
                        <img src="buyIcon.svg" alt="buyIcon"/>
                    </button>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>


<script>
    // const dropdownTrigger = document.getElementById('dropdownTrigger');
    // const dropdownMenu = document.getElementById('dropdownMenu');
    //
    // // Toggle the dropdown menu and arrow rotation
    // dropdownTrigger.addEventListener('click', function () {
    //     dropdownMenu.classList.toggle('hidden');
    //     this.querySelector('svg').style.transform = dropdownMenu.classList.contains('hidden') ? 'rotate(0deg)' : 'rotate(180deg)';
    // });
    //
    // // Close dropdown when clicking outside
    // document.addEventListener('click', function (event) {
    //     if (!dropdownTrigger.contains(event.target) && !dropdownMenu.contains(event.target)) {
    //         dropdownMenu.classList.add('hidden');
    //         dropdownTrigger.querySelector('svg').style.transform = 'rotate(0deg)';
    //     }
    // });

    //
    const dropdownTriggerFirst = document.getElementById('dropdownTriggerFirst');
    const dropdownMenuFirst = document.getElementById('dropdownMenuFirst');

    // Toggle the dropdown menu and arrow rotation
    dropdownTriggerFirst.addEventListener('click', function () {
        console.log("clicked");
        dropdownMenuFirst.classList.toggle('hidden');
        this.querySelector('svg').style.transform = dropdownMenuFirst.classList.contains('hidden') ? 'rotate(0deg)' : 'rotate(180deg)';
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function (event) {
        if (!dropdownTriggerFirst.contains(event.target) && !dropdownMenuFirst.contains(event.target)) {
            dropdownMenuFirst.classList.add('hidden');
            dropdownTriggerFirst.querySelector('svg').style.transform = 'rotate(0deg)';
        }
    });

    //
    const dropdownTriggerSecond = document.getElementById('dropdownTriggerSecond');
    const dropdownMenuSecond = document.getElementById('dropdownMenuSecond');

    // Toggle the dropdown menu and arrow rotation
    dropdownTriggerSecond.addEventListener('click', function () {
        dropdownMenuSecond.classList.toggle('hidden');
        this.querySelector('svg').style.transform = dropdownMenuSecond.classList.contains('hidden') ? 'rotate(0deg)' : 'rotate(180deg)';
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function (event) {
        if (!dropdownTriggerSecond.contains(event.target) && !dropdownMenuSecond.contains(event.target)) {
            dropdownMenuSecond.classList.add('hidden');
            dropdownTriggerSecond.querySelector('svg').style.transform = 'rotate(0deg)';
        }
    });

    // Function to toggle checkbox when clicking on the text or checkbox itself
    function toggleCheckbox(event) {
        const target = event.target;
        if (target.tagName !== 'INPUT') {
            const checkbox = target.querySelector('input') || target.parentElement.querySelector('input');
            checkbox.checked = !checkbox.checked;
        }
    }
</script>

