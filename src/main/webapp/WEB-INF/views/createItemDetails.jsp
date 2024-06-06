<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Category" %>
<html>
<head>
    <title>Create Item</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .image-transition {
            transition: opacity 0.5s ease-in-out;
        }
        .image-hide {
            opacity: 0;
        }
        .image-show {
            opacity: 1;
        }
    </style>
</head>
<body>
<div class="overflow-hidden min-h-[100vh] pb-20">
    <%@include file="header.jsp" %>
    <form method="post" action="createItemDetails" enctype="multipart/form-data" class="flex justify-center items-start gap-8 mx-[6%] my-[1.5%]">
        <div class="flex gap-8 mt-8">
            <div id="image-container" class="flex flex-col gap-3 max-h-[450px] overflow-y-auto pr-4 text-6xl max-w-36">
                <div class="flex justify-center items-center min-h-32 min-w-32 max-w-32 max-h-32 rounded-lg bg-neutral-200 cursor-pointer add-image hover:bg-neutral-300 transition">
                    <span class="text-6xl">+</span>
                    <input type="file" name="file-0" class="hidden file-input rounded-lg" accept="image/*" />
                </div>
            </div>
            <div class="flex items-center justify-center rounded-lg w-[450px] relative">
                <img src="<%=request.getContextPath()%>/leftArrow.svg" alt="leftArrow"
                     class="w-10 cursor-pointer absolute left-6" id="left-arrow"/>
                <div class="flex justify-center items-center h-[450px] w-full text-9xl rounded-lg bg-neutral-200 cursor-pointer" id="main-image-container">
                    <img id="main-image" class="image-transition image-hide shadow-lg hidden w-full h-full object-cover rounded-lg" />
                    <span id="main-plus" class="text-9xl">+</span>
                </div>
                <img src="<%=request.getContextPath()%>/rightArrow.svg" alt="rightArrow"
                     class="w-10 cursor-pointer absolute right-6 rounded-lg" id="right-arrow"/>
            </div>
        </div>
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
                            <input id="category-<%=category.getId()%>" type="radio" value="<%=category.getId()%>" name="category"
                                   class="w-4 h-4 bg-gray-100 border-gray-300">
                            <label for="category-<%=category.getId()%>"
                                   class="w-full ms-2 text-sm font-medium rounded dark:text-gray-300"><%=category.getName()%></label>
                        </div>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>
            </div>
            <div>
                <div class="flex gap-2">
                    <h4 class="text-xl font-light">id: </h4>
                    <h4 class="text-xl font-light">x</h4>
                </div>
                <div class="flex flex-col space-y-4">
                    <textarea name="name" placeholder="Title (max. 68 words)" rows="2"
                              class="text-2xl font-medium p-2 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"
                              maxlength="68" required></textarea>
                    <div class="flex items-center p-3 text-2xl font-bold rounded-lg border border-neutral-200 w-[60%]">
                        <div class="flex-grow relative">
                            <label>
                                <input type="text" name="price" class="w-full placeholder:italic outline-none "
                                       placeholder="Price" maxlength="8" required>
                            </label>
                            <h4 class="absolute inset-y-0 right-0">UAH</h4>
                        </div>
                    </div>
                    <textarea name="description" placeholder="Description (max. 291 words)" rows="8"
                              class="text-xl p-2 mt-3 rounded-lg placeholder:italic outline-none border border-neutral-200"
                              maxlength="291" required></textarea>
                    <div class="flex flex-col space-y-4">
                        <div class="flex items-center p-3 text-2xl font-bold rounded-lg border border-neutral-200 w-[60%]">
                            <label>
                                <input type="number" name="age" class="w-full placeholder:italic outline-none "
                                       placeholder="Age" min="0" max="120" required>
                            </label>
                        </div>
                        <div class="flex items-center p-3 text-2xl font-bold rounded-lg border border-neutral-200 w-[60%]">
                            <label>
                                <input type="number" name="amount" class="w-full placeholder:italic outline-none "
                                       placeholder="Amount" min="0" required>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="w-[55%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-center py-3 text-white text-3xl font-medium">
                Publish
            </button>
        </div>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const mainImageContainer = document.getElementById('main-image-container');
        const mainImage = document.getElementById('main-image');
        const mainPlus = document.getElementById('main-plus');
        const mainFileInput = document.createElement('input');
        mainFileInput.type = 'file';
        mainFileInput.accept = 'image/*';
        mainFileInput.name = "file-main";
        mainFileInput.classList.add('hidden');
        mainImageContainer.appendChild(mainFileInput);

        let imageList = [];
        let currentIndex = 0;

        mainImageContainer.addEventListener('click', function() {
            mainFileInput.click();
        });

        mainFileInput.addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    mainImage.src = e.target.result;
                    mainImage.classList.remove('hidden', 'image-hide');
                    mainImage.classList.add('image-show');
                    mainPlus.classList.add('hidden');
                    addImageToList(e.target.result);
                };
                reader.readAsDataURL(file);
            }
        });

        function addImageToList(src) {
            imageList.push(src);
            updateImageContainer();
        }

        function updateImageContainer() {
            const imageContainer = document.getElementById('image-container');
            imageContainer.innerHTML = '';
            imageList.forEach((src, index) => {
                const imageWrapper = document.createElement('div');
                imageWrapper.className = 'flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 cursor-pointer hover:bg-neutral-300 transition';
                const image = document.createElement('img');
                image.src = src;
                image.className = 'w-full h-full object-cover rounded-lg shadow-lg';
                imageWrapper.appendChild(image);
                imageContainer.appendChild(imageWrapper);
            });
            const addButton = document.createElement('div');
            addButton.className = 'flex justify-center items-center min-h-32 min-w-32 w-full rounded-lg bg-neutral-200 cursor-pointer add-image hover:bg-neutral-300 transition';
            const addIcon = document.createElement('span');
            addIcon.className = 'text-6xl';
            addIcon.innerText = '+';
            const addInput = document.createElement('input');
            addInput.type = 'file';
            addInput.accept = 'image/*';
            addInput.name = "file-" + (imageList.length + 1);
            addInput.classList.add('hidden', 'file-input');
            addButton.appendChild(addIcon);
            addButton.appendChild(addInput);
            imageContainer.appendChild(addButton);

            addButton.addEventListener('click', function() {
                addInput.click();
            });

            addInput.addEventListener('change', function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        addImageToList(e.target.result);
                    };
                    reader.readAsDataURL(file);
                }
            });
        }

        document.getElementById('left-arrow').addEventListener('click', function() {
            if (imageList.length > 0) {
                mainImage.classList.add('image-hide');
                setTimeout(() => {
                    currentIndex = (currentIndex - 1 + imageList.length) % imageList.length;
                    mainImage.src = imageList[currentIndex];
                    mainImage.classList.remove('image-hide');
                    mainImage.classList.add('image-show');
                }, 500);
            }
        });

        document.getElementById('right-arrow').addEventListener('click', function() {
            if (imageList.length > 0) {
                mainImage.classList.add('image-hide');
                setTimeout(() => {
                    currentIndex = (currentIndex + 1) % imageList.length;
                    mainImage.src = imageList[currentIndex];
                    mainImage.classList.remove('image-hide');
                    mainImage.classList.add('image-show');
                }, 500);
            }
        });

        // Category dropdown handling
        document.querySelectorAll('input[name="category"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const selectedCategory = document.querySelector('input[name="category"]:checked + label').innerText;
                document.getElementById('dropdownRadioBgHoverButton1').innerText = selectedCategory;
                document.getElementById('dropdownRadioBgHover1').classList.add('hidden');
            });
        });

        updateImageContainer();
    });
</script>
</body>
</html>
