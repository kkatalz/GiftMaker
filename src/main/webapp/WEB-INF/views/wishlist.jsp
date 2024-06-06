<%@ page import="java.util.List" %>
<%@ page import="entity.LikedItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        .clicked {
            background-color: #BFDBFE !important; /* Change to your desired color */
        }
    </style>
</head>
<%--WISHLIST--%>

<div class="min-h-[100vh] pb-20">

    <jsp:include page="header.jsp" />

    <div class="flex justify-center items-center flex-col">
        <img src="<%= request.getContextPath() %>/liked.svg" alt="liked-items" class="w-16">
        <h4 class="font-bold text-2xl">Wishlist</h4>
    </div>

    <div class="custom-grid text-2xl font-medium mt-12">
        <div></div>
        <h4 class="flex items-center justify-center">Item</h4>
        <h4 class="flex items-center justify-center">Price (UAH)</h4>
    </div>
    <hr class="border-neutral-500 mt-6"/>

    <%
        List<LikedItem> likedItems = (List<LikedItem>) session.getAttribute("likedItems");
        if (likedItems != null) {
            for (LikedItem likedItem : likedItems) {
    %>
    <div class="custom-grid mt-12">
        <div class="flex items-center justify-center">
            <form action="<%= request.getContextPath() %>/deleteLikedItem" method="post" onsubmit="return confirm('Are you sure you want to delete this item?');">
                <input type="hidden" name="idItem" value="<%= likedItem.getItem().getId() %>"/>
                <button type="submit" class="w-10 cursor-pointer flex items-center justify-center">
                    <img src="<%= request.getContextPath() %>/bin.svg" alt="bin" />
                </button>
            </form>
        </div>
        <div class="flex items-center gap-8">
            <% if (likedItem.getItem() != null && likedItem.getItem().getBase64Images() != null && !likedItem.getItem().getBase64Images().isEmpty()) { %>
            <img src="data:image/png;base64,<%=likedItem.getItem().getBase64Images().get(0)%>" alt="item" class="min-w-[150px] max-w-[150px] rounded-lg h-[100px] object-cover"/>
            <% } else { %>
            <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image" class="min-w-[150px] max-w-[150px] rounded-lg h-[100px] object-cover"/>
            <% } %>
            <div class="flex flex-col">
                <h5 class="text-lg font-light">id: <%= likedItem.getItem().getId() %></h5>
                <h4 class="text-2xl font-medium line-clamp-3"><%= likedItem.getItem().getName() %></h4>
            </div>
        </div>
        <h4 class="text-2xl font-medium flex items-center justify-center"><%= likedItem.getItem().getPrice() %></h4>
        <button class="w-[70%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex self-center p-3 items-center justify-between px-4 text-white text-3xl font-medium flex-shrink addedToBasket">
            Buy
            <img src="<%= request.getContextPath() %>/buyIcon.svg" alt="buyIcon"/>
        </button>
    </div>
    <%
            }
        }
    %>
</div>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        let basketButtons = document.getElementsByClassName('addedToBasket');
        for (let i = 0; i < basketButtons.length; i++) {
            basketButtons[i].addEventListener('click', function () {
                this.classList.toggle('clicked');
            });
        }
    });
</script>
