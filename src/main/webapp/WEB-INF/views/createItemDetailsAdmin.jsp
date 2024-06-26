<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Category" %>
<html>
<head>
    <title>Create Item</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="overflow-hidden min-h-[100vh]">
    <%@include file="header.jsp" %>
    <form method="post" action="<%=request.getContextPath()%>/administrator/createItemDetails"
          enctype="multipart/form-data" class="flex justify-center items-start gap-8 mx-[6%] my-[1.5%] mt-16"
          onsubmit="return validateCategory()">

        <div class="flex gap-8">
            <div id="image-container" class="flex flex-col gap-3 max-h-[450px] overflow-y-auto pr-4 text-6xl max-w-32">
                <div id="image-list" class="flex flex-col gap-3"></div>
                <div class="flex justify-center items-center min-h-32 min-w-32 max-w-32 max-h-32 rounded-lg bg-neutral-200 cursor-pointer add-image">
                    <span class="text-6xl">+</span>
                </div>
            </div>
            <input type="file" name="file-main" id="file-main" class="hidden" accept="image/*" multiple/>
            <div class="flex items-center justify-center rounded-lg w-[450px] relative">
                <img src="<%=request.getContextPath()%>/leftArrow.svg" alt="leftArrow"
                     class="w-10 cursor-pointer absolute left-6" id="left-arrow"/>
                <div class="flex justify-center items-center h-[450px] w-full text-9xl rounded-lg bg-neutral-200 cursor-pointer"
                     id="main-image-container">
                    <img id="main-image" class=" shadow hidden w-full h-full object-cover h-[450px] w-full rounded-lg"/>
                    <span id="main-plus" class="text-9xl">+</span>
                </div>
                <img src="<%=request.getContextPath()%>/rightArrow.svg" alt="rightArrow"
                     class="w-10 cursor-pointer absolute right-6 rounded-lg" id="right-arrow"/>
            </div>
        </div>

        <%--        right panel--%>
        <div class="flex flex-col gap-4 w-[25vw]">
            <button id="dropdownRadioBgHoverButton1" data-dropdown-toggle="dropdownRadioBgHover1"
                    class="w-64 flex justify-between items-center bg-white border border-gray-300 text-gray-700 text-lg py-3 px-4 rounded cursor-pointer"
                    type="button">Category
                <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                     viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="m1 1 4 4 4-4"/>
                </svg>
            </button>
            <div id="dropdownRadioBgHover1" class="z-10 hidden w-64 bg-white rounded-lg shadow">
                <ul class="p-3 space-y-1 text-sm text-gray-700" aria-labelledby="dropdownRadioBgHoverButton1">
                    <%
                        List<Category> categories = (List<Category>) session.getAttribute("categories");
                        if (categories != null) {
                            for (Category category : categories) {
                    %>
                    <li>
                        <div class="flex items-center p-2 rounded hover:bg-gray-100">
                            <input id="category-<%=category.getId()%>" type="radio" value="<%=category.getId()%>"
                                   name="category"
                                   class="w-4 h-4 bg-gray-100 border-gray-300">
                            <label for="category-<%=category.getId()%>"
                                   class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300"><%=category.getName()%>
                            </label>
                        </div>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>
            </div>
            <input type="hidden" name="selectedCategory" id="selectedCategory" value="">
            <div>

                <div class="flex flex-col space-y-4">
                    <textarea name="name" placeholder="Title" rows="1"
                              class="text-xl p-2 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"
                              required></textarea>
                    <div class="flex items-center p-3 rounded-lg border border-neutral-200 w-[60%]">
                        <div class="flex-grow relative">
                            <label>
                                <input type="text" name="price" class="w-full placeholder:italic outline-none text-xl"
                                       placeholder="Price" maxlength="8" required>
                            </label>
                            <h4 class="absolute inset-y-0 right-0 font-bold text-2xl">UAH</h4>
                        </div>
                    </div>
                    <textarea name="description" placeholder="Description" rows="1"
                              class="text-xl p-2 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"
                              required></textarea>
                    <div class="flex flex-col space-y-4">
                        <div class="flex items-center p-3 text-xl rounded-lg border border-neutral-200 w-[60%]">
                            <label>
                                <input type="number" name="age" class="w-full placeholder:italic outline-none "
                                       placeholder="Age" min="0" max="120" required>
                            </label>
                        </div>

                    </div>
                    <div class="flex flex-col space-y-4">
                        <div class="flex items-center p-3 text-xl rounded-lg border border-neutral-200 w-[60%]">
                            <label>
                                <input type="number" name="amount" class="w-full placeholder:italic outline-none "
                                       placeholder="Amount" min="1" required>
                            </label>
                        </div>

                    </div>
                </div>
            </div>
            <button type="submit"
                    class="w-[55%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-center py-3 text-white text-3xl font-medium">
                Publish
            </button>
        </div>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const mainFileInput = document.getElementById('file-main');
        const mainImageContainer = document.getElementById('main-image-container');
        const mainImage = document.getElementById('main-image');
        const mainPlus = document.getElementById('main-plus');
        const imageContainer = document.getElementById('image-list');
        const addImageButton = document.querySelector('.add-image');

        let imageList = [];
        let currentIndex = 0;

        mainImageContainer.addEventListener('click', function () {
            mainFileInput.click();
        });

        addImageButton.addEventListener('click', function () {
            mainFileInput.click();
        });

        mainFileInput.addEventListener('change', function (event) {
            imageList = [];
            Array.from(event.target.files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function (e) {
                    imageList.push(e.target.result);
                    updateMainImage(0);
                    updateImageContainer();
                };
                reader.readAsDataURL(file);
            });
        });

        function updateMainImage(index) {
            if (imageList.length > 0) {
                mainImage.src = imageList[index];
                mainImage.classList.remove('hidden');
                mainPlus.classList.add('hidden');
            }
        }

        function updateImageContainer() {
            imageContainer.innerHTML = '';
            imageList.forEach((src, index) => {
                const imageWrapper = document.createElement('div');
                imageWrapper.className = 'flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 cursor-pointer';
                const image = document.createElement('img');
                image.src = src;
                image.className = 'w-full h-full object-cover rounded-lg';
                imageWrapper.appendChild(image);
                imageContainer.appendChild(imageWrapper);
                imageWrapper.addEventListener('click', function () {
                    currentIndex = index;
                    updateMainImage(index);
                });
            });
        }

        document.getElementById('left-arrow').addEventListener('click', function () {
            if (imageList.length > 0) {
                currentIndex = (currentIndex - 1 + imageList.length) % imageList.length;
                updateMainImage(currentIndex);
            }
        });

        document.getElementById('right-arrow').addEventListener('click', function () {
            if (imageList.length > 0) {
                currentIndex = (currentIndex + 1) % imageList.length;
                updateMainImage(currentIndex);
            }
        });

        // JavaScript for category selection and validation
        document.querySelectorAll('input[name="category"]').forEach(radio => {
            radio.addEventListener('change', (event) => {
                let selectedCategory = event.target.nextElementSibling.innerText;
                document.getElementById('selectedCategory').value = event.target.value;
                document.getElementById('dropdownRadioBgHoverButton1').innerText = selectedCategory;
            });
        });
    });

    function validateCategory() {
        const selectedCategory = document.getElementById('selectedCategory').value;
        if (!selectedCategory) {
            alert('Please select a category before publishing.');
            return false;
        }
        return true;
    }
</script>
</body>
</html>
