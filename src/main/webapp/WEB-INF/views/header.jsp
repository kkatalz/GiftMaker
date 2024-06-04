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