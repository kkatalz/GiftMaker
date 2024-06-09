<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.ItemInCart" %>
<%@ page import="java.math.BigDecimal" %>
<head>
    <title>Basket</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<%--BASKET PAGE FINAL --%>
<div class="min-h-[100vh] pb-20 overflow-hidden">
    <%@include file="header.jsp" %>

    <div class="flex justify-center items-center flex-col">
        <img src="<%=request.getContextPath()%>/basket.svg" alt="liked-items" class="w-16">
        <h4 class="font-bold text-2xl">Basket</h4>
    </div>

    <!-- body -->
    <div class="flex gap-4 mx-12 mt-10">
        <div class="flex flex-col m-4 p-4 gap-y-10 max-h-[70vh] overflow-y-auto w-full">
            <%
                List<ItemInCart> itemsInCart = (List<ItemInCart>) session.getAttribute("itemsInCart");
                if (itemsInCart != null) {
                    for (ItemInCart itemInCart : itemsInCart) {
                        int quantity = itemInCart.getAmount();
                        String itemName = itemInCart.getItem().getName();
                        String itemImage = (itemInCart.getItem().getBase64Images() == null || itemInCart.getItem().getBase64Images().isEmpty()) ? request.getContextPath() + "/gift-picture.svg" : "data:image/png;base64, " + itemInCart.getItem().getBase64Images().get(0); // Assuming the Item entity has an image URL field
                        BigDecimal itemPrice = itemInCart.getItem().getPrice(); // Assuming the Item entity has a price field
                        double totalPrice = itemPrice.doubleValue() * quantity;
            %>
            <div class="grid grid-cols-4 items-center gap-4" data-item-id="<%=itemInCart.getItem().getId()%>">
                <img src="<%=itemImage%>" alt="<%=itemName%>" class="shadow-lg w-40 h-40 object-cover rounded-lg"/>

                <div class="flex flex-col gap-4 justify-between h-full">
                    <a href="<%=request.getContextPath()%>/itemDetails?id_item=<%=itemInCart.getItem().getId()%>">

                        <h4 class="text-lg font-medium line-clamp-3"><%=itemName%>
                        </h4>
                    </a>
                    <div class="flex flex-row gap-2">
                        <div class="decrease-quantity cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                            -
                        </div>
                        <h4 class="quantity flex justify-center items-center text-lg">
                            <%=quantity%>
                        </h4>
                        <div class="increase-quantity cursor-pointer flex justify-center items-center border-[#777777] border-2 rounded-md text-2xl text-black w-8 h-8">
                            +
                        </div>
                    </div>
                </div>
                <h4 class="item-total-price text-lg font-bold flex items-center justify-center"><%=totalPrice / quantity%>
                    UAH</h4>

                <div class="flex items-center justify-center">
                    <img src="<%=request.getContextPath()%>/bin.svg" alt="bin"
                         class="delete-item w-10 cursor-pointer flex items-center justify-center"/>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p>Your basket is empty.</p>
            <%
                }
            %>
        </div>

        <%--right info purchase panel --%>
        <div class="flex flex-col gap-16 bg-neutral-100 w-3/4 h-full m-4 p-4 rounded-lg max-h-[70vh] overflow-y-auto">
            <div class="flex flex-col gap-8">
                <%
                    if (itemsInCart != null) {
                        double grandTotal = 0;
                        for (ItemInCart itemInCart : itemsInCart) {
                            int quantity = itemInCart.getAmount();
                            BigDecimal itemPrice = itemInCart.getItem().getPrice();
                            double totalPrice = itemPrice.doubleValue() * quantity;
                            grandTotal += totalPrice;
                %>
                <div class="flex items-center justify-between "
                     data-summary-item-id="<%=itemInCart.getItem().getId()%>">
                    <div class="flex justify-between items-center gap-8 w-full">
                        <a href="<%=request.getContextPath()%>/itemDetails?id_item=<%=itemInCart.getItem().getId()%>">

                            <h4 class="text-lg font-medium"><%=itemInCart.getItem().getName()%>
                            </h4>
                        </a>
                        <div class="flex flex-col gap-2 items-center justify-between ">
                            <div class="flex items-center justify-between">
                                <h4 class="text-lg font-medium">x</h4>
                                <h4 class="quantity text-xl font-bold"><%=quantity%>
                                </h4>
                            </div>
                            <h4 class="item-total-price text-xl font-bold whitespace-nowrap"><%=totalPrice%> UAH</h4>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="flex flex-col gap-4">
                    <div class="flex justify-between">
                        <h4 class="text-lg font-medium">Total: </h4>
                        <h4 id="grand-total" class="text-xl font-bold"><%=grandTotal%> UAH</h4>
                    </div>

                    <div class="flex justify-center rounded-lg bg-neutral-300 transition-all duration-300 hover:opacity-80">
                        <button type="button" disabled class="font-medium text-lg p-4 disabled:opacity-50">Purchase
                        </button>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const updateQuantity = (itemId, delta) => {
                fetch('<%=request.getContextPath()%>/updateItemQuantity', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        itemId: itemId,
                        delta: delta
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            const itemRow = document.querySelector(`[data-item-id="${itemId}"]`);
                            const summaryRow = document.querySelector(`[data-summary-item-id="${itemId}"]`);
                            const quantityElement = itemRow.querySelector('.quantity');
                            const summaryQuantityElement = summaryRow.querySelector('.quantity');
                            const itemTotalPriceElement = itemRow.querySelector('.item-total-price');
                            const summaryItemTotalPriceElement = summaryRow.querySelector('.item-total-price');
                            const grandTotalElement = document.getElementById('grand-total');

                            quantityElement.textContent = data.newQuantity;
                            summaryQuantityElement.textContent = data.newQuantity;
                            itemTotalPriceElement.textContent = data.itemTotalPrice / data.newQuantity + ' UAH';
                            summaryItemTotalPriceElement.textContent = data.itemTotalPrice / data.newQuantity + ' UAH';
                            grandTotalElement.textContent = data.grandTotal + ' UAH';
                        } else {
                            alert('Failed to update quantity');
                        }
                    });
            };

            const deleteItem = (itemId) => {
                fetch('<%=request.getContextPath()%>/deleteItemFromCart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        idItem: itemId
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            const itemRow = document.querySelector(`[data-item-id="${itemId}"]`);
                            const summaryRow = document.querySelector(`[data-summary-item-id="${itemId}"]`);
                            const grandTotalElement = document.getElementById('grand-total');

                            itemRow.remove();
                            summaryRow.remove();
                            grandTotalElement.textContent = data.grandTotal + ' UAH';
                        } else {
                            alert('Failed to delete item');
                        }
                    });
            };

            document.querySelectorAll('.increase-quantity').forEach(button => {
                button.addEventListener('click', () => {
                    const itemId = button.closest('[data-item-id]').getAttribute('data-item-id');
                    updateQuantity(itemId, 1);
                });
            });

            document.querySelectorAll('.decrease-quantity').forEach(button => {
                button.addEventListener('click', () => {
                    const itemId = button.closest('[data-item-id]').getAttribute('data-item-id');
                    updateQuantity(itemId, -1);
                });
            });

            document.querySelectorAll('.delete-item').forEach(button => {
                button.addEventListener('click', () => {
                    const itemId = button.closest('[data-item-id]').getAttribute('data-item-id');
                    deleteItem(itemId);
                });
            });
        });
    </script>
</div>
