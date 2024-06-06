<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.PossibleItem" %>
<%@ page import="entity.Category" %>

<html>
<head>
    <title>Offered gifts</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .custom-grid-offered-gifts {
            display: grid;
            grid-template-columns: 40% 20% 20% 20%;
        }
    </style>
</head>
<body>
<%--PROPOSED GIFTS PAGE--%>
<div>
    <%@include file="header.jsp" %>
    <div class="flex justify-center items-center flex-col">
        <img src="<%=request.getContextPath()%>/giftsProposed.svg" alt="giftsProposed" class="w-16">
        <h4 class="font-bold text-2xl">Offered gifts</h4>
    </div>
    <div class="mx-8">
        <div class="custom-grid-offered-gifts text-2xl font-medium mt-8">
            <h4 class="flex items-center justify-center">Item</h4>
            <h4 class="flex items-center justify-center">Category</h4>
            <h4 class="flex items-center justify-center">Price (UAH)</h4>
        </div>
        <hr class="border-neutral-500 mt-6"/>

        <%-- all items container --%>
        <div class="grid mt-8 gap-12 pb-20 ">
            <%
                List<PossibleItem> possibleItems = (List<PossibleItem>) session.getAttribute("possibleItems");
                List<Category> categories = (List<Category>) session.getAttribute("categories");
                for(PossibleItem item : possibleItems) {
            %>
            <div class="custom-grid-offered-gifts px-12 ">
                <div class="flex items-center justify-center gap-6">
                    <form method="post" action="<%=request.getContextPath()%>/deletePossibleItem" class="flex items-center justify-center">
                        <input type="hidden" name="possibleItemId" value="<%= item.getId() %>">
                        <button type="submit" class="flex items-center justify-center w-12">
                            <img src="<%=request.getContextPath()%>/bin.svg" alt="bin" class="w-12 h-12 cursor-pointer"/>
                        </button>
                    </form>
                    <% if (item != null && item.getBase64Image() != null && !item.getBase64Image().isEmpty()) { %>
                    <img src="data:image/png;base64,<%=item.getBase64Image().get(0)%>" alt="item" class="w-40 h-24 object-cover rounded-lg shadow-lg rounded-lg"/>
                    <% } else { %>
                    <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image" class="w-40 h-24 object-cover rounded-lg shadow-lg rounded-lg" />
                    <% } %>
                    <div class="flex flex-col w-40">
                        <h5 class="text-lg font-light">id: <%= item.getId() %></h5>
                        <h4 class="text-xl font-medium"><%= item.getName() %></h4>
                    </div>
                </div>
                <div class="relative flex justify-center items-center">
                    <button id="dropdownRadioBgHoverButton<%= item.getId() %>" data-dropdown-toggle="dropdownRadioBgHover<%= item.getId() %>"
                            class="w-[50%] flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                            type="button">Category
                        <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                        </svg>
                    </button>

                    <!-- Dropdown menu -->
                    <div id="dropdownRadioBgHover<%= item.getId() %>" class="z-10 hidden w-[50%] bg-white rounded-lg shadow">
                        <ul class="p-3 space-y-1 text-sm text-gray-700" aria-labelledby="dropdownRadioBgHoverButton<%= item.getId() %>">
                            <% for(Category category : categories) { %>
                            <li>
                                <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                    <input id="default-radio-<%= category.getId() %>" type="radio" value="<%= category.getName() %>" name="default-radio-<%= item.getId() %>"
                                           class="w-4 h-4 bg-gray-100 border-gray-300">
                                    <label for="default-radio-<%= category.getId() %>" class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">
                                        <%= category.getName() %>
                                    </label>
                                </div>
                            </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <h4 class="text-2xl font-medium flex items-center justify-center"><%= item.getPrice() %> UAH</h4>
                <div class="flex items-center justify-center">
                    <button class="flex justify-center w-[50%] cursor-pointer bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70  p-3 px-4 text-white text-3xl font-medium">
                        Publish
                    </button>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</body>
</html>
