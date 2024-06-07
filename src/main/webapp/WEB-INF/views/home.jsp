<%@ page import="entity.User" %>
<%@ page import="entity.Role" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Home Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<%--    HOME PAGE--%>
<%--1.    header--%>

<%@include file="header.jsp"%><%--2. main body--%>
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
        window.location.href = '/GiftMaker/client/createItemDetails';
    });


    let changePage = document.getElementsByClassName('goToAllItems');
    for (let i = 0; i < changePage.length; i++) {
        changePage[i].addEventListener('click', function () {
            window.location.href = '/GiftMaker/allItems';
        });
    }

</script>