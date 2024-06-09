<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found - 404</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

<div class="text-center">
    <div class="flex flex-col items-center justify-center">
        <img src="<%=request.getContextPath()%>/notFound.svg" alt="404 Image" class="w-24">
        <h1 class="text-6xl font-bold text-gray-800 mb-2">404</h1>
        <h2 class="text-2xl font-semibold text-gray-600 mb-4">Oops! Page Not Found</h2>
        <p class="text-gray-500 mb-6">The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
        <a href="<%=request.getContextPath()%>/home" class="px-6 py-3 bg-blue-500 text-white rounded-lg shadow-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-opacity-50">
            Go to Homepage
        </a>
    </div>
</div>

</body>
</html>
