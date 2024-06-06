<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Home Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<%--    HOME PAGE--%>
<%--1.    header--%>

<div class="text flex justify-between items-center px-10 py-3">
    <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

    <form method="POST" action="allItems" class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">
        <input name="search" type="text" class="text-lg bg-neutral-100 w-[44vw] italic outline-none"
               placeholder="Find a gift ...">
        <button type="submit">
            <img src="<%=request.getContextPath()%>/search-icon.svg" alt="search-icon"
                 class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">
        </button>


    </form>

    <div class="text flex flex-row gap-5">

        <%--        visible only for Manager--%>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/giftsProposed.svg" alt="giftsProposed" class="w-10 cursor-pointer ">
            <a class="text-sm font-medium" href="offeredGifts">Gifts</a>
        </div>

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

<%--2. main body--%>
<div class="text flex justify-between items-center text-xl font-medium mx-80 mt-12 ">
    <h4 class="cursor-pointer goToAllItems">Books</h4>
    <h4 class="cursor-pointer goToAllItems">Clothing</h4>
    <h4 class="cursor-pointer goToAllItems">Home & Kitchen</h4>


</div>

<div class="h-[45%] w-screen bg-blue-100 mt-6 flex justify-between items-center px-56">

    <div class="flex flex-col items-center pl-40 pt-10 space-y-2">

        <button
                class="px-16 py-4 rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2] goToAllItems">
            Generate gift
        </button>
        <button id="create_item"
                class="py-2 px-10 ml-16 rounded-lg shadow-md bg-white font-bold text-xl transition duration-300 ease-in hover:ease-in hover:scale-[1.1]">
            Create gift
        </button>
    </div>

    <div class="relative">

        <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="gift-picture"
             class="rounded-[30px] shadow w-[420px] h-[280px] object-cover ">
        <%--        <button class="z-2 py-2 absolute bottom-[-20px] left-[20%] w-2/3  rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">--%>
        <%--            Form to send--%>
        <%--        </button>--%>
    </div>

</div>

<div class="text flex justify-between items-center text-xl font-normal mx-80 mt-8 text-neutral-500 ">
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 goToAllItems">Building Sets
    </button>
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 goToAllItems"> Aesthetic
        gifts
    </button>
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 goToAllItems">Self care
    </button>
</div>

<div class="text flex justify-between items-center text-xl font-normal mx-[33%] mt-5 text-neutral-500 ">
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 goToAllItems">Toys
    </button>
    <button class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 goToAllItems">Sweets
    </button>
</div>


<script>


    document.getElementById('create_item').addEventListener('click', function () {
        window.location.href = '/GiftMaker/createItemDetails';
    });


    let changePage = document.getElementsByClassName('goToAllItems');
    for (let i = 0; i < changePage.length; i++) {
        changePage[i].addEventListener('click', function () {
            window.location.href = '/GiftMaker/allItems';
        });
    }

</script>