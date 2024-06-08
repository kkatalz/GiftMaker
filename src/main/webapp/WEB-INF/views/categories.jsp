<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Category" %>
<html>
<head>
    <title>Categories</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-blue-100 min-h-screen p-6 flex flex-col items-center justify-center">
<div class="w-full">

<%@include file="header.jsp" %>
</div>

<div class="w-full max-w-4xl bg-white shadow-md rounded-lg p-6 font-bold">
    <h2 class="text-2xl font-bold mb-4">Categories</h2>

    <!-- Form to add new category -->
    <form action="<%= request.getContextPath() %>/administrator/addCategory" method="post" class="mb-6 flex items-center space-x-4">
        <input type="text" name="categoryName" placeholder="New Category Name" required class="flex-grow p-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500">
        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Add Category</button>
    </form>

    <!-- Table for displaying categories -->
    <div class="overflow-x-auto">
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
            <tr class="bg-gray-200 text-left">
                <th class="py-2 px-4 border-b">ID</th>
                <th class="py-2 px-4 border-b">Name</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Category> categories = (List<Category>) session.getAttribute("categories");
                if (categories != null) {
                    for (Category category : categories) {
            %>
            <tr class="hover:bg-gray-100">
                <td class="py-2 px-4 border-b"><%= category.getId() %></td>
                <td class="py-2 px-4 border-b"><%= category.getName() %></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
