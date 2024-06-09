<!DOCTYPE html>
<%@ page import="entity.User" %>
<%@ page import="entity.Role" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Home Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="text flex justify-between items-center px-10 py-3">
    <a href="home">
        <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">
    </a>
    <form method="POST" action="allItems" class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100">
        <input name="search" type="text" class="text-lg bg-neutral-100 w-[44vw] italic outline-none" placeholder="Find a gift ...">
        <button type="submit">
            <img src="<%=request.getContextPath()%>/search-icon.svg" alt="search-icon" class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">
        </button>
    </form>
    <div class="text flex flex-row gap-5">
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="myProfile">My profile</a>
        </div>
        <%
            User user = (User) session.getAttribute("currentUser");
            if (user.getRole().equals(Role.ADMINISTRATOR)) {
        %>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/createCategory.svg" alt="createCategory" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="administrator/categories">Categories</a>
        </div>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/giftsProposed.svg" alt="giftsProposed" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="administrator/offeredGifts">Gifts</a>
        </div>
        <%
            }
            if (user.getRole().equals(Role.CLIENT)) {
        %>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/liked.svg" alt="liked-items" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="likedItems">Liked</a>
        </div>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/basket.svg" alt="basket-icon" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="itemsInCart">Basket</a>
        </div>
        <%
            }
        %>

        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/logout.svg" alt="logout-icon" class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="<%=request.getContextPath()%>/logout">Log Out</a>
        </div>
    </div>
</div>

<div class="text flex justify-between items-center text-xl font-medium mx-80 mt-12">
    <h4 id="category-1" class="cursor-pointer category">Books</h4>
    <h4 id="category-2" class="cursor-pointer category">Clothing</h4>
    <h4 id="category-3" class="cursor-pointer category">Home & Kitchen</h4>
</div>

<div class="h-[300px] w-screen bg-blue-100 mt-6 flex justify-between items-center px-56">
    <div class="flex flex-col items-center pl-40 pt-10 space-y-2">
        <button class="px-16 py-4 rounded-lg shadow-lg bg-white font-bold text-2xl transition duration-300 ease-in hover:ease-in hover:scale-[1.2] category">Generate gift</button>
        <button id="<%=user.getRole() == Role.CLIENT ? "create_item" : "administrator/create_item"%>" class="py-2 px-10 ml-16 rounded-lg shadow-md bg-white font-bold text-xl transition duration-300 ease-in hover:ease-in hover:scale-[1.1]">
            Create Gift
        </button>
    </div>
    <div>
        <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="gift-picture" class="rounded-[30px] shadow w-[420px] h-[250px] object-cover">
    </div>
</div>

<div class="text flex justify-between items-center text-xl font-normal mx-80 mt-8 text-neutral-500">
    <button id="category-4" class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 category">Building Sets</button>
    <button id="category-6" class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 category">Aesthetic gifts</button>
    <button id="category-8" class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 category">Self care</button>
</div>

<div class="text flex justify-between items-center text-xl font-normal mx-[33%] mt-5 text-neutral-500">
    <button id="category-5" class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 category">Toys</button>
    <button id="category-7" class="bg-neutral-200 p-4 rounded-lg transition duration-500 hover:opacity-70 category">Sweets</button>
</div>

<script>
    document.getElementById("<%=user.getRole() == Role.CLIENT ? "create_item" : "administrator/create_item"%>").addEventListener('click', function() {
        window.location.href = '/GiftMaker/<%=user.getRole() == Role.CLIENT ? "client/createItemDetails" : "administrator/createItemDetails"%>';
    });

    const categories = document.getElementsByClassName('category');
    for (let i = 0; i < categories.length; i++) {
        categories[i].addEventListener('click', function(event) {
            let category = event.target.id.replace('category-', '');
            window.location.href = '/GiftMaker/allItems?category=' + category;
        });
    }
</script>
</body>
</html>
