<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Item</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%--CREATE ITEM DETAILED PAGE--%>

    <%@include file="header.jsp" %>

    <%--main body--%>
    <div class="flex justify-between items-center gap-10 mx-[12%] my-[2%]">

        <div class="flex gap-10">
            <%--    jeft bar with images--%>
            <div class="flex flex-col gap-3 max-h-[700px] overflow-y-auto pr-4 text-6xl ">
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>
                <h4 class="flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 ">+</h4>


            </div>

            <%--        main image--%>
                <div class="flex items-center justify-center rounded-lg w-[540px] relative">
                <img src="<%=request.getContextPath()%>/leftArrow.svg" alt="leftArrow"
                     class="w-10 cursor-pointer absolute left-6"/>
                <h4 class="flex justify-center items-center h-[540px] w-full text-9xl rounded-lg bg-neutral-200 ">+</h4>
                <img src="<%=request.getContextPath()%>/rightArrow.svg" alt="rightArrow"
                     class="w-10 cursor-pointer absolute right-6"/>

            </div>

        </div>

        <%--right menu with details--%>
        <div class="flex flex-col gap-4 w-[25vw]">

            <%--Category--%>
            <button id="dropdownRadioBgHoverButton1" data-dropdown-toggle="dropdownRadioBgHover1"
                    class="w-64 flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                    type="button">Category
                <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                     viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="m1 1 4 4 4-4"/>
                </svg>
            </button>

            <!-- Dropdown menu -->
            <div id="dropdownRadioBgHover1"
                 class="z-10 hidden w-64 bg-white rounded-lg shadow">
                <ul class="p-3 space-y-1 text-sm text-gray-700"
                    aria-labelledby="dropdownRadioBgHoverButton1">
                    <li>
                        <div class="flex items-center p-2 rounded hover:bg-gray-100">
                            <input id="default-radio-7" type="radio" value="" name="default-radio"
                                   class="w-4 h-4 bg-gray-100 border-gray-300">
                            <label for="default-radio-7"
                                   class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Kitchen</label>
                        </div>
                    </li>
                    <li>
                        <div class="flex items-center p-2 rounded hover:bg-gray-100">
                            <input id="default-radio-8" type="radio" value="" name="default-radio"
                                   class="w-4 h-4 bg-gray-100 border-gray-300">
                            <label for="default-radio-8"
                                   class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Sport</label>
                        </div>
                    </li>
                    <li>
                        <div class="flex items-center p-2 rounded hover:bg-gray-100">
                            <input id="default-radio-9" type="radio" value="" name="default-radio"
                                   class="w-4 h-4 bg-gray-100 border-gray-300">
                            <label for="default-radio-9"
                                   class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300">Literature</label>
                        </div>
                    </li>
                </ul>
            </div>

            <%-- info--%>
            <div>
                <div class="flex gap-2">
                    <h4 class="text-xl font-light">id: </h4>
                    <h4 class="text-xl font-light">x</h4>
                </div>

                <div class="flex flex-col space-y-4">
                    <textarea name="text" placeholder="Title (max. 68 words)" rows="2"
                              class="text-2xl font-medium p-2 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"
                              maxlength="68"></textarea>


                    <div class="flex items-center p-3 text-2xl font-bold rounded-lg border border-neutral-200 w-[60%]">
                        <div class="flex-grow relative ">
                            <label>
                                <input type="text" class="w-full placeholder:italic outline-none "
                                       placeholder="Price" maxlength="8">
                            </label>
                            <h4 class="absolute inset-y-0 right-0">
                                UAH
                            </h4>
                        </div>
                    </div>

                    <textarea name="text" placeholder="Description (max. 291 words)" rows="8"
                              class="text-xl p-2 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"
                              maxlength="291"></textarea>

                </div>
            </div>


            <button class="w-[55%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-center py-3 text-white text-3xl font-medium">

                <a href="home">
                    Publish
                </a>
            </button>


        </div>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

</body>
</html>
