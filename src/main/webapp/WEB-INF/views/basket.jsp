<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Basket</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>


<%--BASKET PAGE FINAL --%>
<div class="max-h-[100vh] overflow-hidden">
    <%@include file="header.jsp" %>


    <div class="flex justify-center items-center flex-col">
        <img src="<%=request.getContextPath()%>/basket.svg" alt="liked-items" class="w-16">
        <h4 class="font-bold text-2xl">Basket</h4>
    </div>


    <!-- body -->
    <div class="flex gap-16 mx-12 justify-center align-items mt-10">
        <div class="flex flex-col m-4 p-4 gap-y-10 max-h-[70vh] overflow-y-scroll">

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

            <%--3rd item--%>
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
