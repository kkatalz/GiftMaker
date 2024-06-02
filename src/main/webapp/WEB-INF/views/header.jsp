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