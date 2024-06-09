<%@ page import="entity.User" %>
<%@ page import="entity.Role" %>
<div class="text flex justify-between items-center px-10 py-3">
    <a href="<%=request.getContextPath()%>/home">
        <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

    </a>

    <div class="text flex flex-row gap-5">

        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/myProfile.svg" alt="profile-icon"
                 class="w-10 cursor-pointer ">

            <a class="text-sm font-medium" href="<%=request.getContextPath()%>/myProfile">My profile</a>
        </div>

        <% User user = (User) session.getAttribute("currentUser");
            if (user.getRole().equals(Role.ADMINISTRATOR)) {
        %>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/createCategory.svg" alt="createCategory"
                 class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="<%=request.getContextPath()%>/administrator/categories">Categories</a>
        </div>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/giftsProposed.svg" alt="giftsProposed"
                 class="w-10 cursor-pointer ">
            <a class="text-sm font-medium"
               href="<%=request.getContextPath()%>/administrator/offeredGifts">Gifts</a>
        </div>
        <% } %>

        <% if (user.getRole().equals(Role.CLIENT)) { %>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/liked.svg" alt="liked-items"
                 class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="<%=request.getContextPath()%>/likedItems">Liked</a>

        </div>


        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/basket.svg" alt="basket-icon"
                 class="w-10 cursor-pointer">
            <a class="text-sm font-medium"
               href="<%=request.getContextPath()%>/itemsInCart">Basket</a>

        </div>
        <% }%>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/logout.svg" alt="logout-icon"
                 class="w-10 cursor-pointer">
            <a class="text-sm font-medium" href="<%=request.getContextPath()%>/logout">Log
                Out</a>
        </div>
    </div>

</div>