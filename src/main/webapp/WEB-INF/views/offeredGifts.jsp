<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Offered gifts</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .custom-grid-offered-gifts {
            display: grid;
            grid-template-columns: 40% 20% 20% 20%;
        }
    </style>
</head>


<body>
<%--PROPOSED GIFTS PAGE--%>
<div>
    <div class="text flex justify-between items-center px-10 py-3">
        <a href="home">
            <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

        </a>


        <div class="text flex flex-row gap-5">

            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">
                <a class="text-sm font-medium" href="myProfile">My profile</a>
            </div>

            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/liked.svg" alt="liked-items" class="w-10 cursor-pointer">
                <a class="text-sm font-medium" href="likedItems">Liked</a>

            </div>

            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/basket.svg" alt="basket-icon" class="w-10 cursor-pointer">
                <a class="text-sm font-medium" href="itemsInCart">Basket</a>

            </div>
        </div>

    </div>


    <div class="flex justify-center items-center flex-col">
        <img src="<%=request.getContextPath()%>/giftsProposed.svg" alt="giftsProposed" class="w-16">
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
                        <img src="<%=request.getContextPath()%>/bin.svg" alt="bin" class="w-12 cursor-pointer"/>
                    </div>


                    <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>
                    <div class="flex flex-col">
                        <h5 class="text-lg font-light">id: 1000</h5>
                        <h4 class="text-xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>
                    </div>

                </div>

                <%--category--%>
                <div class="relative flex justify-center items-center">
                    <button id="dropdownRadioBgHoverButton2" data-dropdown-toggle="dropdownRadioBgHover2"
                            class="w-[50%] flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                            type="button">Category
                        <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                             viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="m1 1 4 4 4-4"/>
                        </svg>
                    </button>

                    <!-- Dropdown menu -->
                    <div id="dropdownRadioBgHover2"
                         class="z-10 hidden w-[50%] bg-white rounded-lg shadow">
                        <ul class="p-3 space-y-1 text-sm text-gray-700"
                            aria-labelledby="dropdownRadioBgHoverButton2">
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-10" type="radio" value="" name="default-radio"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-10"
                                           class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Kitchen</label>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-11" type="radio" value="" name="default-radio"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-11"
                                           class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Sport</label>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-12" type="radio" value="" name="default-radio"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-12"
                                           class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Literature</label>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>

                <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>

                <div class="flex items-center justify-center">
                    <button class="flex w-[50%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70  self-center p-3 justify-between px-4 text-white text-3xl font-medium flex-shrink">
                        Buy
                        <img src="<%=request.getContextPath()%>/buyIcon.svg" alt="buyIcon"/>
                    </button>
                </div>

            </div>

            <%--Container with 2nd item--%>
            <div class="custom-grid-offered-gifts px-12 ">


                <div class="flex items-center justify-center gap-6">

                    <div class="flex items-center justify-center">
                        <img src="<%=request.getContextPath()%>/bin.svg" alt="bin" class="w-12 cursor-pointer"/>
                    </div>


                    <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>
                    <div class="flex flex-col">
                        <h5 class="text-lg font-light">id: 1000</h5>
                        <h4 class="text-xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>
                    </div>

                </div>

                <%--category--%>
                <div class="relative flex justify-center items-center">
                    <button id="dropdownRadioBgHoverButton3" data-dropdown-toggle="dropdownRadioBgHover3"
                            class="w-[50%] flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                            type="button">Category
                        <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                             viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="m1 1 4 4 4-4"/>
                        </svg>
                    </button>

                    <!-- Dropdown menu -->
                    <div id="dropdownRadioBgHover3"
                         class="z-10 hidden w-[50%] bg-white rounded-lg shadow">
                        <ul class="p-3 space-y-1 text-sm text-gray-700"
                            aria-labelledby="dropdownRadioBgHoverButton3">
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-13" type="radio" value="" name="default-radio"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-13"
                                           class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Kitchen</label>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-14" type="radio" value="" name="default-radio"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-14"
                                           class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Sport</label>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-15" type="radio" value="" name="default-radio"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-15"
                                           class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Literature</label>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>

                <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>

                <div class="flex items-center justify-center">
                    <button class="flex w-[50%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70  self-center p-3 justify-between px-4 text-white text-3xl font-medium flex-shrink">
                        Buy
                        <img src="<%=request.getContextPath()%>/buyIcon.svg" alt="buyIcon"/>
                    </button>
                </div>

            </div>

        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>
