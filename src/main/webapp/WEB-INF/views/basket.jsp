<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Basket</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%--BASKET PAGE FINAL --%>
<div>
    <div class="mx-[3%] my-6">

        <%--1.    header--%>
        <div class="flex justify-between items-center">
            <a href="home">
                <img src="logoBlack.svg" alt="logo" class="w-40 cursor-pointer">

            </a>


            <div class="text flex flex-row gap-5">

                <div class="flex justify-center items-center flex-col">
                    <img src="myProfile.svg" alt="profile-icon" class="w-10 cursor-pointer ">
                    <a class="text-sm font-medium" href="myProfile">My profile</a>
                </div>

                <div class="flex justify-center items-center flex-col">
                    <img src="liked.svg" alt="liked-items" class="w-10 cursor-pointer">
                    <a class="text-sm font-medium" href="likedItems">Liked</a>

                </div>

                <div class="flex justify-center items-center flex-col">
                    <img src="basket.svg" alt="basket-icon" class="w-10 cursor-pointer">
                    <a class="text-sm font-medium" href="">Basket</a>

                </div>
            </div>

        </div>

        <%--    main body--%>
        <div class="flex justify-between items-center gap-12 mx-[12%] my-[2%]">

            <div class="flex gap-12">
                <%--    jeft bar with images--%>
                <div class="flex flex-col gap-3 max-h-[700px] overflow-y-auto pr-4 text-6xl ">

                    <img src="harryPotter.svg" alt="harryPotter" class="max-h-32 max-w-32 min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>
                    <img src="harryPotter.svg" alt="harryPotter" class="min-h-32 w-32 rounded-lg "/>


                </div>

                <%--        main image--%>
                <div class="flex items-center justify-center rounded-lg w-[600px] relative ">
                    <img src="leftArrow.svg" alt="leftArrow" class="w-10 cursor-pointer shadow absolute left-6"/>
                    <img src="harryPotter.svg" alt="harryPotter" class="rounded-lg shadow"/>
                    <img src="rightArrow.svg" alt="rightArrow" class="w-10 cursor-pointer shadow absolute right-6"/>

                </div>

            </div>

            <%--right menu with details--%>
            <div class="flex flex-col gap-8">

                <div class="gap-12">
                    <div class="flex gap-2">
                        <h4 class="text-xl font-light">id: </h4>
                        <h4 class="text-xl font-light">1000</h4>
                    </div>
                    <div class="space-y-4">
                        <h4 class="text-3xl font-medium">Harry Potter The Complete Collection: 7 Book Box Set</h4>
                        <h4 class="text-3xl font-bold mt-6">3200 UAH</h4>

                        <p class="text-xl">
                            Harry Potter is a series of seven fantasy novels written by British author J. K.
                            Rowling.<br>
                            Set consists of: <br>Philosopher's Stone (1997), Chamber of Secrets (1998), Prisoner of
                            Azkaban
                            (1999),
                            Goblet of Fire (2000), Order of the Phoenix (2003), Half-Blood Prince (2005), Deathly
                            Hallows
                            (2007).
                        </p>
                    </div>
                </div>


                <div class="flex justify-content items-center gap-5 ">
                    <button data-modal-target="default-modal" data-modal-toggle="default-modal"
                            class="w-[50%] bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-between px-6 py-3 text-white text-3xl font-medium">
                        Buy
                        <img src="buyIcon.svg" alt="Buy Icon" class="w-8 h-8"/>
                    </button>

                    <img src="likedBlue.svg" alt="likedBlue" id="likedItem" class="w-8 cursor-pointer"/>
                </div>

            </div>
        </div>
    </div>


    <!-- Main modal -->
    <div id="default-modal" tabindex="-1" aria-hidden="true"
         class="absolute flex hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center h-[calc(100%-1rem)]">
        <div class=" p-4  max-w-7xl max-h-[90vh]">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow">
                <!-- Modal header -->
                <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                    <h3 class="text-2xl font-semibold text-black">
                        Basket
                    </h3>
                    <button type="button"
                            class="text-gray-400 bg-transparent transition-all duration-300 hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                            data-modal-hide="default-modal">
                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                             viewBox="0 0 14 14">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                        </svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                </div>

                <!-- Modal body -->
                <div class="flex gap-16">
                    <div class="flex flex-col m-4 p-4 gap-y-12 max-h-[70vh] overflow-y-scroll">

                        <%--1st item--%>
                        <div class="flex items-center justify-center gap-8">
                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

                            <div class="flex flex-col gap-4">
                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set
                                </h4>

                                <div class="flex flex-row gap-2">
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        -
                                    </div>
                                    <h4 class="flex justify-center items-center text-lg">
                                        1
                                    </h4>
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        +
                                    </div>
                                </div>

                            </div>
                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>

                            <div class="flex items-center justify-center">
                                <img src="bin.svg" alt="bin"
                                     class=" w-10 cursor-pointer flex items-center justify-center"/>
                            </div>
                        </div>

                        <%--  2nd item--%>
                        <div class="flex items-center justify-center gap-8">
                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

                            <div class="flex flex-col gap-4">
                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set
                                </h4>

                                <div class="flex flex-row gap-2">
                                    <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">
                                        -
                                    </div>
                                    <h4 class="flex justify-center items-center text-lg">
                                        2
                                    </h4>
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        +
                                    </div>
                                </div>

                            </div>
                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>

                            <div class="flex items-center justify-center">
                                <img src="bin.svg" alt="bin"
                                     class=" w-10 cursor-pointer flex items-center justify-center"/>
                            </div>
                        </div>


                        <div class="flex items-center justify-center gap-8">
                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

                            <div class="flex flex-col gap-4">
                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set
                                </h4>

                                <div class="flex flex-row gap-2">
                                    <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">
                                        -
                                    </div>
                                    <h4 class="flex justify-center items-center text-lg">
                                        2
                                    </h4>
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        +
                                    </div>
                                </div>

                            </div>
                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>

                            <div class="flex items-center justify-center">
                                <img src="bin.svg" alt="bin"
                                     class=" w-10 cursor-pointer flex items-center justify-center"/>
                            </div>
                        </div>
                        <div class="flex items-center justify-center gap-8">
                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

                            <div class="flex flex-col gap-4">
                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set
                                </h4>

                                <div class="flex flex-row gap-2">
                                    <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">
                                        -
                                    </div>
                                    <h4 class="flex justify-center items-center text-lg">
                                        2
                                    </h4>
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        +
                                    </div>
                                </div>

                            </div>
                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>

                            <div class="flex items-center justify-center">
                                <img src="bin.svg" alt="bin"
                                     class=" w-10 cursor-pointer flex items-center justify-center"/>
                            </div>
                        </div>
                        <div class="flex items-center justify-center gap-8">
                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

                            <div class="flex flex-col gap-4">
                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set
                                </h4>

                                <div class="flex flex-row gap-2">
                                    <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">
                                        -
                                    </div>
                                    <h4 class="flex justify-center items-center text-lg">
                                        2
                                    </h4>
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        +
                                    </div>
                                </div>

                            </div>
                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>

                            <div class="flex items-center justify-center">
                                <img src="bin.svg" alt="bin"
                                     class=" w-10 cursor-pointer flex items-center justify-center"/>
                            </div>
                        </div>
                        <div class="flex items-center justify-center gap-8">
                            <img src="harryPotter.svg" alt="harryPotter" class="w-40 rounded-lg"/>

                            <div class="flex flex-col gap-4">
                                <h4 class="text-lg font-medium">Harry Potter<br> The Complete Collection: 7 Book Box Set
                                </h4>

                                <div class="flex flex-row gap-2">
                                    <div class="flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8 cursor-pointer">
                                        -
                                    </div>
                                    <h4 class="flex justify-center items-center text-lg">
                                        2
                                    </h4>
                                    <div class="cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                                        +
                                    </div>
                                </div>

                            </div>
                            <h4 class="text-lg font-bold flex items-center justify-center">3200</h4>

                            <div class="flex items-center justify-center">
                                <img src="bin.svg" alt="bin"
                                     class=" w-10 cursor-pointer flex items-center justify-center"/>
                            </div>
                        </div>

                    </div>

                    <%--right info purchase panel --%>
                    <div class="flex flex-col gap-16 bg-neutral-100 w-[35%] h-full m-4 p-4 rounded-lg max-h-[70vh] overflow-y-scroll">

                        <div class="flex flex-col gap-8">
                            <%--1st item--%>
                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">1</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">3200</h4>
                                    </div>

                                </div>
                            </div>

                            <%-- 2nd item--%>
                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between font-medium ">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">2</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">6400</h4>
                                    </div>

                                </div>
                            </div>

                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between font-medium ">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">2</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">6400</h4>
                                    </div>

                                </div>
                            </div>


                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between font-medium ">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">2</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">6400</h4>
                                    </div>

                                </div>
                            </div>


                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between font-medium ">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">2</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">6400</h4>
                                    </div>

                                </div>
                            </div>


                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between font-medium ">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">2</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">6400</h4>
                                    </div>

                                </div>
                            </div>

                            <div class="flex items-center justify-between ">
                                <div class="flex justify-center items-center gap-8">
                                    <h4 class="text-lg font-medium">Harry Potter. The Complete Collection: 7 Book Box
                                        Set
                                    </h4>
                                    <div class="flex flex-col gap-2 items-center justify-center">
                                        <div class="flex items-center justify-between font-medium ">
                                            <h4 class="text-lg font-medium">x</h4>
                                            <h4 class="text-xl font-bold">2</h4>
                                        </div>
                                        <h4 class="text-xl font-bold">6400</h4>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="flex flex-col gap-4">
                            <div class="flex justify-between">
                                <h4 class="text-lg font-medium">Total: </h4>
                                <h4 class="text-xl font-bold">9600 UAH</h4>
                            </div>

                            <div class="flex justify-center rounded-lg bg-neutral-300 transition-all duration-300 hover:opacity-80">
                                <button data-modal-hide="default-modal" type="button"
                                        class="font-medium text-lg p-4  ">
                                    Purchase
                                </button>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js">
</script>

<script>

    document.getElementById('likedItem').addEventListener('click', function () {
        this.src = this.src.includes('likedBlue.svg') ? 'likedFilled.svg' : 'likedBlue.svg';
    });

    document.getElementById('generate_item').addEventListener('click', function () {
        window.location.href = '/GiftMaker/items';
    });
</script>

</body>
</html>
