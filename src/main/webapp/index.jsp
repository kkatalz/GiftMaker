<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Gift Maker</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @media print {
            .hide-on-print {
                display: none;
            }
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">

<div class="container mx-auto p-4 text-center">
    <div>
        <h2 class="text-4xl font-bold text-gray-800 mb-6">Welcome to Gift Maker!</h2>
        <img src="<%=request.getContextPath()%>/gift-picture.svg" alt="greeting" class="mx-auto w-80 h-auto rounded shadow-lg mb-6">

        <!-- Add a login redirect button -->
        <div class="mt-6">
            <a class="text-[#6AB7FF] underline text-xl" href="login">Log In to explore Gifts</a>
        </div>
    </div>
</div>

</body>
</html>
