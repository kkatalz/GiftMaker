<%--
  Created by IntelliJ IDEA.
  User: Zlata
  Date: 02.06.2024
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%--ITEM DETAILED--%>
<div class="mx-[3%] my-6">

    <%--1.    header--%>
    <div class="flex justify-between items-center">
        <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">


        <div class="text flex flex-row gap-5">

            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">
                <a class="text-sm font-medium" href="#">My profile</a>
            </div>

            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/liked.svg" alt="liked-items" class="w-10 cursor-pointer">
                <a class="text-sm font-medium" href="#">Liked</a>

            </div>

            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/basket.svg" alt="basket-icon" class="w-10 cursor-pointer">
                <a class="text-sm font-medium" href="#">Basket</a>

            </div>
        </div>

    </div>

    <%--    main body--%>
    <div class="flex justify-between items-center gap-12 mx-[12%] my-[2%]">

        <div class="flex gap-12">
            <%--    jeft bar with images--%>
            <div class="flex flex-col gap-3 max-h-[700px] overflow-y-auto pr-4 text-6xl ">

                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="max-h-32 max-w-32 min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>


            </div>

            <%--        main image--%>
            <div class="flex items-center justify-center rounded-lg w-[600px] relative ">
                <img src="<%=request.getContextPath()%>/leftArrow.svg" alt="leftArrow" class="w-10 cursor-pointer shadow absolute left-6"/>
                <img src="<%=request.getContextPath()%>/harryPotter.svg" alt="harryPotter" class="rounded-lg shadow"/>
                <img src="<%=request.getContextPath()%>/rightArrow.svg" alt="rightArrow" class="w-10 cursor-pointer shadow absolute right-6"/>

            </div>

        </div>

        <%--right menu with details--%>
        <div class="flex flex-col gap-8">

            <div class="gap-12">
                <div class="flex gap-2">
                    <h4 class="text-xl font-light">id: </h4>
                    <h4 class="text-xl font-light">1000</h4>
                </div>
                <div class="space-y-4">
                    <h4 class="text-2xl font-medium">Harry Potter The Complete Collection: 7 Book Box Set</h4>
                    <h4 class="text-2xl font-bold mt-6">3200 UAH</h4>

                    <p class="text-xl">
                        Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling.<br>
                        Set consists of: <br>Philosopher's Stone (1997), Chamber of Secrets (1998), Prisoner of Azkaban
                        (1999),
                        Goblet of Fire (2000), Order of the Phoenix (2003), Half-Blood Prince (2005), Deathly Hallows
                        (2007).
                    </p>
                </div>
            </div>


            <div class="flex justify-content items-center gap-5 ">
                <button class="w-[50%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-between px-6 py-3 text-white text-3xl font-medium">
                    Buy
                    <img src="<%=request.getContextPath()%>/buyIcon.svg" alt="Buy Icon" class="w-8 h-8"/>
                </button>

                <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>
            </div>

        </div>
    </div>
</div>
</body>
</html>
