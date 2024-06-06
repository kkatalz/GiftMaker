<%@ page import="entity.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.LikedItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%--ITEM DETAILED--%>


<%@include file="header.jsp" %>

<%--    main body--%>
<%
    Item item = (Item) session.getAttribute("item");
    if (item != null) {
%>

<div class="flex justify-between items-center gap-10 mx-[12%] my-[2%]">

    <div class="flex gap-10">
        <%--    jeft bar with images--%>
            <div class="flex flex-col gap-3 max-h-[540px] overflow-y-auto pr-4">
                <% if (item != null && item.getBase64Images() != null && !item.getBase64Images().isEmpty()) {
                    List<String> base64Images = item.getBase64Images();
                    for (int i = 1; i < base64Images.size(); i++) { %>
                <img src="data:image/png;base64,<%=base64Images.get(i)%>" alt="item"
                     class="max-h-32 max-w-32 min-h-32 w-32 rounded-lg object-cover"/>
                <% }
                } else { %>
                <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image"
                     class="max-h-32 max-w-32 min-h-32 w-32 rounded-lg object-cover"/>
                <% } %>
            </div>


        <%--        main image--%>
        <div class="flex items-center justify-center rounded-lg w-[540px] relative">

            <img src="<%=request.getContextPath()%>/leftArrow.svg" alt="leftArrow"
                 class="w-10 cursor-pointer shadow absolute left-6"/>

            <% if (item != null && item.getBase64Images() != null && !item.getBase64Images().isEmpty()) { %>

            <img src="data:image/png;base64,<%=item.getBase64Images().get(0)%>" alt="item"
                 class="h-[540px] w-full rounded-lg"/>

            <% } else { %>
            <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="default image"
                 class="h-[540px] w-full rounded-lg"/>
            <% } %>


            <img src="<%=request.getContextPath()%>/rightArrow.svg" alt="rightArrow"
                 class="w-10 cursor-pointer shadow absolute right-6"/>


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
                <h4 class="text-2xl font-medium"><%=item.getName()%>
                </h4>
                <h4 class="text-2xl font-bold mt-6"><%=item.getPrice()%> UAH</h4>

                <p class="text-xl max-h-72 overflow-y-auto">
                    <%=item.getDescription()%>
                </p>


            </div>
        </div>


        <div class="flex justify-content items-center gap-5 ">
            <button id="open_modal"
                    class="w-48 bg-[#6AB7FF] rounded-lg transition duration-500 hover:opacity-70 flex items-center justify-between px-6 py-3 text-white text-3xl font-medium">
                Buy
                <img src="<%=request.getContextPath()%>/buyIcon.svg" alt="Buy Icon" class="w-8 h-8"/>
            </button>

            <img src="<%=request.getContextPath()%>/likedBlue.svg" alt="likedBlue" class="w-8 cursor-pointer"/>
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
    // document.getElementById('open_modal').addEventListener('click', function () {
    //     window.location.href = '/GiftMaker/basketModal';
    // });
</script>
</body>
</html>
