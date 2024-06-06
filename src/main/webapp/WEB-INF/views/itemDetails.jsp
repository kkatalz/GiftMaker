<%@ page import="entity.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.LikedItem" %>
<%@ page import="entity.ItemInCart" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Item Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .clicked {
            background-color: #97CDFF !important;
        }
    </style>
</head>

<%@include file="header.jsp" %>

<%--    main body--%>

<%
    Item item = (Item) session.getAttribute("item");
    if (item != null) {
        List<LikedItem> likedItems = (List<LikedItem>) session.getAttribute("likedItems");
        List<ItemInCart> itemsInCart = (List<ItemInCart>) session.getAttribute("itemsInCart");
        boolean isLiked = false;
        boolean isInBasket = false;
        if (likedItems != null) {
            for (LikedItem likedItem : likedItems) {
                if (likedItem.getItem().getId() == item.getId()) {
                    isLiked = true;
                    break;
                }
            }
        }
        if (itemsInCart != null) {
            for (ItemInCart itemInCart : itemsInCart) {
                if (itemInCart.getItem().getId() == item.getId()) {
                    isInBasket = true;
                    break;
                }
            }
        }
%>

<div class="flex justify-between justify-center items-center gap-10 mx-[12%] my-[2%]">

    <div class="flex gap-10">
        <%--    left bar with images--%>
        <div class="flex flex-col gap-3 max-h-[540px] overflow-y-auto pr-4">
            <% if (item != null && item.getBase64Images() != null && !item.getBase64Images().isEmpty()) {
                List<String> base64Images = item.getBase64Images();
                for (int i = 1; i < base64Images.size(); i++) { %>
            <img src="data:image/png;base64,<%=base64Images.get(i)%>" alt="item"
                 class="sidebar-image max-h-32 max-w-32 min-h-32 w-32 rounded-lg object-cover cursor-pointer"/>
            <% }
            } else { %>
            <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image"
                 class="sidebar-image max-h-32 max-w-32 min-h-32 w-32 rounded-lg object-cover cursor-pointer"/>
            <% } %>
        </div>

        <%--        main image--%>
        <div class="flex items-center justify-center rounded-lg w-[540px] relative">

            <img src="<%=request.getContextPath()%>/leftArrow.svg" alt="leftArrow" id="leftArrow"
                 class="w-10 cursor-pointer absolute left-6 transition duration-500 hover:opacity-80"/>

            <% if (item != null && item.getBase64Images() != null && !item.getBase64Images().isEmpty()) { %>

            <img src="data:image/png;base64,<%=!item.getBase64Images().isEmpty() ? item.getBase64Images().get(0) : ""%>" alt="item" id="mainImage"
                 class="main-image h-[540px] w-full rounded-lg"/>

            <% } else { %>
            <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image" id="mainImage"
                 class="main-image h-[540px] w-full rounded-lg"/>
            <% } %>

            <img src="<%=request.getContextPath()%>/rightArrow.svg" alt="rightArrow" id="rightArrow"
                 class="w-10 cursor-pointer absolute right-6 transition duration-500 hover:opacity-80"/>

        </div>

    </div>

    <%--right menu with details--%>
    <div class="flex flex-col gap-8">

        <div class="gap-12">
            <div class="flex gap-2">
                <h4 class="text-xl font-light">id: </h4>
                <h4 class="text-xl font-light"><%=item.getId()%>
                </h4>
            </div>
            <div class="space-y-4">
                <h4 class="text-2xl font-medium max-h-32 overflow-y-auto"><%=item.getName()%>
                </h4>
                <h4 class="text-2xl font-bold mt-6"><%=item.getPrice()%> UAH</h4>

                <p class="text-xl max-h-72 overflow-y-auto">
                    <%=item.getDescription()%>
                </p>

            </div>
        </div>

        <div class="flex justify-content items-center gap-5 ">
            <button class="w-48  bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-90 flex items-center justify-between px-6 py-3 text-white text-3xl font-medium addedToBasket <%=isInBasket ? "clicked" : " "%>"
                    data-item-id="<%=item.getId()%>">
                Buy
                <img src="<%=request.getContextPath()%>/<%=isInBasket ? "basketFilled.svg" : "buyIcon.svg"%>"
                     alt="buyIcon" class="w-8 h-8 basket-icon"/>
            </button>

            <img src="<%=request.getContextPath()%>/<%=isLiked ? "likedFilled.svg" : "likedBlue.svg"%>"
                 alt="likedBlue" class="w-8 cursor-pointer likedItem" data-item-id="<%=item.getId()%>"/>

        </div>

    </div>
</div>

<%
} else {
%>
<div class="flex justify-center align-items text-xl font-light text-red-500">Item not found</div>
<%
    }
%>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        let currentImageIndex = 0;
        const base64Images = <%= item != null && item.getBase64Images() != null ? item.getBase64Images().stream().map(img -> "\"" + img + "\"").collect(Collectors.joining(",", "[", "]")) : "[]" %>;

        const mainImage = document.getElementById('mainImage');
        const leftArrow = document.getElementById('leftArrow');
        const rightArrow = document.getElementById('rightArrow');
        const sidebarImages = document.querySelectorAll('.sidebar-image');

        function updateMainImage(index) {
            if (index >= 0 && index < base64Images.length) {
                mainImage.src = "data:image/png;base64," + base64Images[index];
                currentImageIndex = index;
            }
        }

        leftArrow.addEventListener('click', () => {
            if (currentImageIndex > 0) {
                updateMainImage(currentImageIndex - 1);
            }
        });

        rightArrow.addEventListener('click', () => {
            if (currentImageIndex < base64Images.length - 1) {
                updateMainImage(currentImageIndex + 1);
            }
        });

        sidebarImages.forEach((img, index) => {
            img.addEventListener('click', () => {
                updateMainImage(index + 1);
            });
        });

        let likedItems = document.getElementsByClassName('likedItem');
        for (let i = 0; i < likedItems.length; i++) {
            likedItems[i].addEventListener('click', function () {
                const itemId = this.getAttribute('data-item-id');
                const currentElement = this;

                fetch('addLikedItem', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        'itemId': itemId
                    })
                })
                    .then(response => {
                        if (response.ok) {
                            return response.text();
                        } else {
                            throw new Error('Failed to like/unlike item');
                        }
                    })
                    .then(data => {
                        currentElement.src = currentElement.src.includes('likedBlue.svg') ? '<%=request.getContextPath()%>/likedFilled.svg' : '<%=request.getContextPath()%>/likedBlue.svg';
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            });
        }

        let basketButtons = document.getElementsByClassName('addedToBasket');
        for (let i = 0; i < basketButtons.length; i++) {
            basketButtons[i].addEventListener('click', function () {
                const itemId = this.getAttribute('data-item-id');
                const currentElement = this;

                fetch('updateBasketItem', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        'itemId': itemId
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            this.classList.toggle('clicked');
                            const icon = currentElement.querySelector('.basket-icon');
                            icon.src = icon.src.includes('buyIcon.svg') ? '<%=request.getContextPath()%>/basketFilled.svg' : '<%=request.getContextPath()%>/buyIcon.svg';
                        } else {
                            alert('Failed to update basket');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            });
        }
    });
</script>
