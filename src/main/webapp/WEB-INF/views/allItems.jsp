<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Item" %>
<%@ page import="entity.Category" %>
<%@ page import="entity.LikedItem" %>
<%@ page import="entity.ItemInCart" %>
<html>
<head>
    <title>All Items</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<form method="POST" action="<%=request.getContextPath()%>/allItems" class="bg-blue-100 min-h-[100vh] pb-20">
    <%@include file="header.jsp" %>


    <div class="flex justify-end mr-10">


        <%--    <div class="text flex justify-between items-center px-10 py-3">--%>
        <%--        <a href="home">--%>
        <%--            <img src="<%=request.getContextPath()%>/logoBlack.svg" alt="logo" class="w-40 cursor-pointer">--%>
        <%--        </a>--%>
        <div class="flex inline-flex mt-4 border-[#777777] border-2 p-3 rounded-lg bg-neutral-100 ml-12">
            <input name="search" type="text" class="text-lg bg-neutral-100 italic outline-none "
                   placeholder="Find ...">
            <img src="<%=request.getContextPath()%>/search-icon.svg" alt="search-icon"
                 class="w-5 transition duration-300 ease-in hover:ease-in hover:scale-[1.2]">
        </div>
    </div>

    <div class="text flex justify-between items-center mx-[16%] mt-8">
        <div class="flex gap-2 items-center">
            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded">
                <input name="fromPrice" type="number" class="text-gray-700 text-lg italic outline-none w-14" min=0
                       placeholder="From">
            </div>
            <h4 class="text-2xl font-semibold text-gray-700">-</h4>
            <div class="flex justify-between items-center bg-white border border-gray-300 py-3 px-4 rounded">
                <input name="toPrice" type="number" class="text-gray-700 text-lg italic outline-none w-14"
                       placeholder="To">
                <img src="<%=request.getContextPath()%>/currency.svg" alt="currency-icon" class="w-5 pt-1">
            </div>
        </div>
        <button id="dropdownCheckboxButton" data-dropdown-toggle="dropdownCheckbox"
                class="w-64 flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                type="button">
            <span id="selectedCategoriesText" class="truncate max-w-[90%]">Category</span>
            <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                 viewBox="0 0 10 6">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="m1 1 4 4 4-4"/>
            </svg>
        </button>
        <div id="dropdownCheckbox" class="z-10 hidden w-64 bg-white rounded-lg shadow">
            <ul class="p-3 space-y-1 text-sm text-gray-700" aria-labelledby="dropdownCheckboxButton">
                <%
                    List<Category> categories = (List<Category>) session.getAttribute("categories");
                    if (categories != null) {
                        for (Category cat : categories) {
                %>
                <li>
                    <div class="flex items-center p-2 rounded hover:bg-gray-100">
                        <input id="category-<%=cat.getId()%>" type="checkbox" value="<%=cat.getId()%>"
                               name="categoryIds" class="w-4 h-4 bg-gray-100 border-gray-300"
                               data-category-name="<%=cat.getName()%>" onclick="updateSelectedCategories()">
                        <label for="category-<%=cat.getId()%>"
                               class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300"><%=cat.getName()%>
                        </label>
                    </div>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
        <div class="flex gap-2 items-center">
            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 py-3 px-4 rounded">
                <input name="fromDate" type="number" class="text-lg italic outline-none w-16" min="0"
                       placeholder="From">
            </div>
            <h4 class="text-2xl font-semibold text-gray-700">-</h4>
            <div class="flex justify-between items-center bg-white border border-gray-300 text-gray-700 py-3 px-4 rounded">
                <input name="toDate" type="number" class="text-lg italic outline-none w-16" placeholder="To y.o."
                       max="120">
            </div>
        </div>
        <button type="submit"
                class="bg-[#6AB7FF] py-3 px-5 rounded-lg transition duration-500 hover:opacity-70 text-white text-xl font-medium">
            Search
        </button>
    </div>



    <div class="flex  space-y-6 mt-6 flex-col">
        <div class="mx-[16%] ">
            <h4 class="text-2xl font-semibold text-gray-600 ">
                Items found by your filters:
                <%
                    List<Item> items = (List<Item>) session.getAttribute("items");
                    int itemCount = (items != null) ? items.size() : 0;
                    out.print(itemCount);
                %>
            </h4>
        </div>


        <div class="flex mx-[10%] gap-12 flex-wrap justify-center items-center">
            <%
                if (items != null) {
                    List<LikedItem> likedItems = (List<LikedItem>) session.getAttribute("likedItems");
                    List<ItemInCart> itemsInCart = (List<ItemInCart>) session.getAttribute("itemsInCart");
                    for (Item item : items) {
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


            <%--        ITEMS--%>
            <div class="flex items-center justify-center bg-white relative h-56 w-56 p-4 rounded-lg border-gray-700 border shadow">
                <div class="flex items-center justify-center flex-col gap-2">
                    <% if (item != null && item.getBase64Images() != null && !item.getBase64Images().isEmpty()) { %>
                    <img src="data:image/png;base64,<%=item.getBase64Images().get(0)%>" alt="item" class="w-32 h-24 shadow-lg rounded-lg object-cover"/>
                    <% } else { %>
                    <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image" class="w-32 h-24 shadow-lg rounded-lg object-cover"/>
                    <% } %>
                    <a href="<%=request.getContextPath()%>/itemDetails?id_item=<%=item.getId()%>"><h4
                            class="text-base font-medium leading-5 line-clamp-2 min-h-[40px] w-48"><%=item.getName()%>
                    </h4>
                    </a>


                    <div class="flex gap-2 font-bold text-left w-full">
                        <h4 class="text-medium font-medium"><%=item.getPrice()%>
                        </h4>
                        <h4 class="text-medium font-medium">UAH</h4>
                    </div>
                </div>
                <%
                    if(user.getRole() == Role.CLIENT){
                %>
                <div class="flex flex-col absolute top-2 right-2 gap-1">
                    <img src="<%=request.getContextPath()%>/<%=isLiked ? "likedFilled.svg" : "likedBlue.svg"%>"
                         alt="likedBlue" class="w-8 cursor-pointer likedItem" data-item-id="<%=item.getId()%>"/>
                    <img src="<%=request.getContextPath()%>/<%=isInBasket ? "basketFilled.svg" : "basketBlue.svg"%>"
                         alt="basketBlue" class="w-8 cursor-pointer basketFilled" data-item-id="<%=item.getId()%>"/>
                </div>
                <%
                    }%>
            </div>
            <%

                    }
                }
            %>
        </div>
    </div>
</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script>
    function updateSelectedCategories() {
        const checkboxes = document.querySelectorAll('input[name="categoryIds"]:checked');
        let selectedCategoryNames = [];
        checkboxes.forEach((checkbox) => {
            selectedCategoryNames.push(checkbox.getAttribute('data-category-name'));
        });
        document.getElementById('selectedCategoriesText').innerText = selectedCategoryNames.join(', ') || 'Category';
    }

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

    let basketItems = document.getElementsByClassName('basketFilled');
    for (let i = 0; i < basketItems.length; i++) {
        basketItems[i].addEventListener('click', function () {
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
                        currentElement.src = currentElement.src.includes('basketBlue.svg') ? '<%=request.getContextPath()%>/basketFilled.svg' : '<%=request.getContextPath()%>/basketBlue.svg';
                    } else {
                        alert('Failed to update basket');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        });
    }
</script>

</body>
</html>
