<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%--MY PROFILE PAGE--%>
<div class="bg-blue-100 h-[100vh] ">

    <%@include file="header.jsp" %>


    <div class="flex justify-center mt-16 ">
        <form class="flex items-center flex-col text-center bg-white py-10 rounded-lg shadow w-[40vw]">
            <div class="flex justify-center items-center flex-col">
                <img src="<%=request.getContextPath()%>/myProfile.svg" alt="myProfile" class="w-16">
                <h4 class="font-bold text-2xl">My profile</h4>
            </div>


            <div class="text-lg flex flex-col gap-3 w-[60%] mt-6">
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">role: <%= user.getRole() %>
                </h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">name: <%= user.getName() %>
                </h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">surname: <%=user.getSurname()%>
                </h4>
                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">username: <%='@' + user.getUsername()%>
                </h4>

                <h4 class="p-3 rounded-lg bg-neutral-100 text-neutral-500 italic">birthday: <%=user.getDateOfBirth()!=null ? user.getDateOfBirth() : "not given" %>
                </h4>
            </div>
        </form>
    </div>

</div>
</body>
</html>
