<%--
  Created by IntelliJ IDEA.
  User: Zlata
  Date: 02.06.2024
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%--MY PROFILE PAGE--%>
<div class="bg-blue-100 h-[100vh] ">

    <%--header--%>
    <div class="text flex justify-between items-center px-10 py-3">
        <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

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

    <div class="flex justify-center mt-16 ">
        <form class="flex items-center flex-col text-center bg-white py-10 rounded-lg shadow w-[40vw]">
            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/myProfile.svg" alt="myProfile" class="w-16">
                <h4 class="font-bold text-2xl">My profile</h4>
            </div>

            <div class="text-lg flex flex-col gap-3 w-[60%] mt-6">
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">Administator</h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">Akuna</h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">Matata</h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">@matata</h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">********</h4>
            </div>
        </form>
    </div>

</div>
</body>
</html>
