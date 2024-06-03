<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Items</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%-- ALL ITEMS PAGE FILTERS--%>
<%--1.    header--%>

<div class="bg-blue-100 h-[100vh]">
    <div class="text flex justify-between items-center px-10 py-3">
        <a href="home">
            <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

        </a>

        <%--3.  search input--%>
        <div class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">
            <input type="text" class="text-lg bg-neutral-100 italic outline-none"
                   placeholder="Find ...">


            <img src="<%=request.getContextPath()%>/search-icon.svg" alt="search-icon"
                 class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">

        </div>
    </div>


    <div class="text flex justify-between items-center px-[15%] mt-8">

        <%--Price--%>
        <div class="flex gap-2 items-center">
            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded">
                <input type="text" class="text-gray-700 text-lg italic outline-none w-14"
                       placeholder="From">
            </div>
            <h4 class="text-2xl font-semibold text-gray-700">-</h4>
            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded">
                <input type="text" class=" text-gray-700 text-lg italic outline-none w-14"
                       placeholder="To">
                <img src="<%=request.getContextPath()%>/currency.svg" alt="currency-icon" class="w-5 pt-1">
            </div>
        </div>

        <%--Category--%>
        <button id="dropdownRadioBgHoverButton" data-dropdown-toggle="dropdownRadioBgHover"
                class="w-64 flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                type="button">Category
            <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                 viewBox="0 0 10 6">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="m1 1 4 4 4-4"/>
            </svg>
        </button>

        <!-- Dropdown menu -->
        <div id="dropdownRadioBgHover"
             class="z-10 hidden w-64 bg-white rounded-lg shadow">
            <ul class="p-3 space-y-1 text-sm text-gray-700"
                aria-labelledby="dropdownRadioBgHoverButton">
                <li>
                    <div class="flex items-center p-2 rounded hover:bg-gray-100">
                        <input id="default-radio-4" type="radio" value="" name="default-radio"
                               class="w-4 h-4 bg-gray-100 border-gray-300">
                        <label for="default-radio-4"
                               class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Kitchen</label>
                    </div>
                </li>
                <li>
                    <div class="flex items-center p-2 rounded hover:bg-gray-100">
                        <input id="default-radio-5" type="radio" value="" name="default-radio"
                               class="w-4 h-4 bg-gray-100 border-gray-300">
                        <label for="default-radio-5"
                               class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Sport</label>
                    </div>
                </li>
                <li>
                    <div class="flex items-center p-2 rounded hover:bg-gray-100">
                        <input id="default-radio-6" type="radio" value="" name="default-radio"
                               class="w-4 h-4 bg-gray-100 border-gray-300">
                        <label for="default-radio-6"
                               class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Literature</label>
                    </div>
                </li>
            </ul>
        </div>


        <%--Age range--%>
        <div class="flex gap-2 items-center">
            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 py-3 px-4 rounded">
                <input type="text" class="text-lg italic outline-none w-14"
                       placeholder="From">
            </div>
            <h4 class="text-2xl font-semibold text-gray-700">-</h4>
            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 py-3 px-4 rounded">
                <input type="text" class="text-lg italic outline-none w-14"
                       placeholder="To y.o." maxlength="3">
            </div>
        </div>

        <button class="bg-[#6AB7FF] py-3 px-5 rounded-lg transition duration-500 hover:opacity-70 text-white text-xl font-medium">
            Search
        </button>
    </div>

    <%-- main body--%>
    <div>
        <h4 class="text-2xl font-semibold text-gray-600 ml-[10%] mt-6">
            6 items found by your filters
        </h4>
    </div>
    <div>
        <h4 class="text-2xl font-semibold text-gray-600 ml-[10%] mt-6">
            Certificates for creative master classes
        </h4>
    </div>


    <%--    all items in row--%>
    <div class="flex gap-12 mx-[10%] flex-wrap">

        <%--item 1--%>
        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow">

            <div class="flex items-center justify-center flex-col gap-2">
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-28"/>
                <h4 class="text-base font-medium leading-5">
                    Harry Potter<br/>
                    The Complete Collection: 7 Book Box Set
                </h4>

                <div class="flex gap-2 font-bold text-left w-full">
                    <h4 class="text-medium font-medium">
                        3200
                    </h4>
                    <h4 class="text-medium font-medium">
                        UAH
                    </h4>
                </div>
            </div>


            <div class="flex flex-col absolute top-2 right-2 gap-1 ">
                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue"
                     class="w-8 cursor-pointer likedItem"/>
                <img src="<%=request.getContextPath()%>/basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer basketFilled"/>
            </div>
        </div>

        <%--        2 item--%>
        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">

            <div class="flex items-center justify-center flex-col gap-2">
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-28"/>
                <h4 class="text-base font-medium leading-5">
                    Harry Potter<br/>
                    The Complete Collection: 7 Book Box Set
                </h4>

                <div class="flex gap-2 font-bold text-left w-full">
                    <h4 class="text-medium font-medium">
                        3200
                    </h4>
                    <h4 class="text-medium font-medium">
                        UAH
                    </h4>
                </div>
            </div>


            <div class="flex flex-col absolute top-2 right-2 gap-1 ">
                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue"
                     class="w-8 cursor-pointer likedItem"/>
                <img src="<%=request.getContextPath()%>/basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer basketFilled"/>
            </div>
        </div>

        <%--3 item--%>
        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">

            <div class="flex items-center justify-center flex-col gap-2">
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-28"/>
                <h4 class="text-base font-medium leading-5">
                    Harry Potter<br/>
                    The Complete Collection: 7 Book Box Set
                </h4>

                <div class="flex gap-2 font-bold text-left w-full">
                    <h4 class="text-medium font-medium">
                        3200
                    </h4>
                    <h4 class="text-medium font-medium">
                        UAH
                    </h4>
                </div>
            </div>


            <div class="flex flex-col absolute top-2 right-2 gap-1 ">
                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue"
                     class="w-8 cursor-pointer likedItem"/>
                <img src="<%=request.getContextPath()%>/basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer basketFilled"/>
            </div>
        </div>

        <%--        4 item--%>
        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">

            <div class="flex items-center justify-center flex-col gap-2">
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-28"/>
                <h4 class="text-base font-medium leading-5">
                    Harry Potter<br/>
                    The Complete Collection: 7 Book Box Set
                </h4>

                <div class="flex gap-2 font-bold text-left w-full">
                    <h4 class="text-medium font-medium">
                        3200
                    </h4>
                    <h4 class="text-medium font-medium">
                        UAH
                    </h4>
                </div>
            </div>


            <div class="flex flex-col absolute top-2 right-2 gap-1 ">
                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue"
                     class="w-8 cursor-pointer likedItem"/>
                <img src="<%=request.getContextPath()%>/basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer basketFilled"/>
            </div>
        </div>

        <%--        5 item--%>
        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">

            <div class="flex items-center justify-center flex-col gap-2">
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-28"/>
                <h4 class="text-base font-medium leading-5">
                    Harry Potter<br/>
                    The Complete Collection: 7 Book Box Set
                </h4>

                <div class="flex gap-2 font-bold text-left w-full">
                    <h4 class="text-medium font-medium">
                        3200
                    </h4>
                    <h4 class="text-medium font-medium">
                        UAH
                    </h4>
                </div>
            </div>


            <div class="flex flex-col absolute top-2 right-2 gap-1 ">
                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue"
                     class="w-8 cursor-pointer likedItem"/>
                <img src="<%=request.getContextPath()%>/basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer basketFilled"/>
            </div>
        </div>

        <%--        6 item--%>
        <div class="flex items-center justify-center bg-white relative mt-6 h-56 w-56 p-4 rounded-lg border-gray-700 border shadow ">

            <div class="flex items-center justify-center flex-col gap-2">
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-28"/>
                <h4 class="text-base font-medium leading-5">
                    Harry Potter<br/>
                    The Complete Collection: 7 Book Box Set
                </h4>

                <div class="flex gap-2 font-bold text-left w-full">
                    <h4 class="text-medium font-medium">
                        3200
                    </h4>
                    <h4 class="text-medium font-medium">
                        UAH
                    </h4>
                </div>
            </div>


            <div class="flex flex-col absolute top-2 right-2 gap-1 ">
                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue"
                     class="w-8 cursor-pointer likedItem"/>
                <img src="<%=request.getContextPath()%>/basketBlue.svg" alt="basketBlue" class="w-8 cursor-pointer basketFilled"/>
            </div>
        </div>
    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script>

    let likedItems = document.getElementsByClassName('likedItem');

    // Loop through the collection and add an event listener to each element
    for (let i = 0; i < likedItems.length; i++) {
        likedItems[i].addEventListener('click', function () {
            this.src = this.src.includes('likedBlue.svg') ? '<%=request.getContextPath()%>/likedFilled.svg' : '<%=request.getContextPath()%>/likedBlue.svg';
        });
    }

    let basketItems = document.getElementsByClassName('basketFilled');

    for (let i = 0; i < basketItems.length; i++) {
        basketItems[i].addEventListener('click', function () {
            this.src = this.src.includes('basketBlue.svg') ? '<%=request.getContextPath()%>/basketFilled.svg' : '<%=request.getContextPath()%>/basketBlue.svg';
        });
    }


</script>

</body>
</html>
