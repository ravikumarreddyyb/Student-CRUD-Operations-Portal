<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid Data</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-image: url('https://example.com/your-background-image.jpg'), linear-gradient(to bottom, #2980B9, #6DD5FA);
    background-size: cover;
    background-position: center;
}

.container {
    text-align: center;
    color: white; /* Adjust text color for better visibility on the background */
}

.error-message {
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for the error message */
    color: #333; /* Text color for the error message */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow for depth */
    max-width: 400px; /* Limit width for better readability */
    margin: 0 auto; /* Center horizontally */
}

.error-message p {
    margin: 0; /* Remove default margin for cleaner look */
}

.error-message p:first-child {
    font-size: 24px; /* Larger font size for main message */
    font-weight: bold; /* Bold text for emphasis */
    margin-bottom: 10px; /* Add space between main message and additional text */
}

</style>
</head>
<body>
<div class="container">
     <div class="error-message">
        <p>Oops!</p>
        <p>The information you provided is invalid.</p>
     </div>
    </div>
</body>
</html>