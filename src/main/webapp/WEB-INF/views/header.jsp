<%@ page import="entity.User" %>
<%@ page import="entity.Role" %>
<div class="text flex justify-between items-center px-10 py-3">
    <a href="<%= request.getContextPath() %>/home">
        <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

    </a>

    <form method="POST" action="allItems" class="text inline-flex border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ">
        <input name="search" type="text" class="text-lg bg-neutral-100 w-[44vw] italic outline-none"
               placeholder="Find a gift ...">
        <button type="submit">
            <img src="<%=request.getContextPath()%>/search-icon.svg" alt="search-icon"
                 class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">
        </button>


    </form>
    <div class="text flex flex-row gap-5">

        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">

            <a class="text-sm font-medium" href="<%= request.getContextPath() %>/myProfile">My profile</a>
        </div>

        <%
            User user = (User) session.getAttribute("currentUser");

            if(user.getRole().equals(Role.ADMINISTRATOR)) {
        %>
        <div class="flex justify-center items-center flex-col">
            <img src="<%=request.getContextPath()%>/giftsProposed.svg" alt="giftsProposed" class="w-10 cursor-pointer ">
            <a class="text-sm font-medium" href="administrator/offeredGifts">Gifts</a>
        </div>
        <%
            }
        %>

        <%

            if(user.getRole().equals(Role.CLIENT)) {
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
            }%>
    </div>

</div>