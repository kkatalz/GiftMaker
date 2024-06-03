<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WishList</title>
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
<%--WISHLIST--%>

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
            <a class="text-sm font-medium" href="">Liked</a>

        </div>

        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/basket.svg" alt="basket-icon" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="itemsInCart">Basket</a>

        </div>
    </div>

</div>

<div class="flex justify-center items-center flex-col">
    <img src="<%=request.getContextPath()%>/liked.svg" alt="liked-items" class="w-16">
    <h4 class="font-bold text-2xl">Wishlist</h4>
</div>

<div class="custom-grid text-2xl font-medium  mt-12">
    <div></div>
    <h4 class="flex items-center justify-center">Item</h4>
    <h4 class="flex items-center justify-center">Price (UAH)</h4>

</div>
<hr class="border-neutral-500 mt-6"/>

<%--Contaier with 1st item--%>
<div class="custom-grid mt-12">

    <div class="flex items-center justify-center">
        <img src="<%=request.getContextPath()%>/bin.svg" alt="bin"
             class=" w-10 cursor-pointer flex items-center justify-center"/>
    </div>

    <div class="flex items-center justify-center gap-8">

        <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>


        <div class="flex flex-col">
            <h5 class="text-lg font-light">id: 1000</h5>


            <h4 class="text-2xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>
        </div>


    </div>
    <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>

    <button class="w-[70%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex self-center p-3 items-center justify-between px-4 text-white text-3xl font-medium flex-shrink">
        Buy
        <img src="<%=request.getContextPath()%>/buyIcon.svg" alt="buyIcon"/>
    </button>

</div>

<%--Container with 2nd item--%>
<div class="custom-grid mt-12">

    <div class="flex items-center justify-center">
        <img src="<%=request.getContextPath()%>/bin.svg" alt="bin"
             class=" w-10 cursor-pointer flex items-center justify-center"/>
    </div>

    <div class="flex items-center justify-center gap-8">

        <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

        <div class="flex flex-col">
            <h5 class="text-lg font-light">id: 1000</h5>
            <h4 class="text-2xl font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set </h4>
        </div>


    </div>
    <h4 class="text-2xl font-medium flex items-center justify-center">3200</h4>

    <button class="w-[70%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex self-center p-3 items-center justify-between px-4 text-white text-3xl font-medium flex-shrink">
        Buy
        <img src="<%=request.getContextPath()%>/buyIcon.svg" alt="buyIcon"/>
    </button>

</div>
</body>
</html>