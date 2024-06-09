<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Error - 505</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<div class="text-center">
    <div class="flex flex-col items-center justify-center">
        <img src="https://via.placeholder.com/150" alt="505 Image" class="mb-4 rounded-full shadow-lg">
        <h1 class="text-6xl font-bold text-gray-800 mb-2">505</h1>
        <h2 class="text-2xl font-semibold text-gray-600 mb-4">Server Error</h2>
        <p class="text-gray-500 mb-6">Something went wrong on our end. Please try again later or contact support if the problem persists.</p>
        <a href="<%=request.getContextPath()%>/home" class="px-6 py-3 bg-blue-500 text-white rounded-lg shadow-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-opacity-50">
            Go to Homepage
        </a>
    </div>
</div>

</body>
</html>
