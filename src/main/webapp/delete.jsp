<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details Deletion</title>
<style>
    /* Your styles remain unchanged */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }
    form {
        max-width: 400px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    fieldset {
        border: 2px solid #3498db;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    legend {
        font-size: 24px;
        font-weight: bold;
        color: #3498db;
    }
    label {
        display: block;
        margin-bottom: 8px;
        color: #555;
    }
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #3498db;
        color: #fff;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: red;
    }
    .menu-link {
        display: block;
        text-align: center;
        margin: 20px auto;
        padding: 12px 20px;
        background-color: #3498db;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
        font-size: 16px;
        width: max-content;
    }
    .menu-link:hover {
        background-color: #2980b9;
    }
</style>
</head>
<body>
<%
String url = "jdbc:mysql://localhost:3306/jdbcclasses";
String dbUser = "root";
String dbPassword = "7093805291";
String sql = "DELETE FROM Students WHERE ID=?";
Connection connection = null;
PreparedStatement statement = null;

// Retrieve the ID from the request
String id = request.getParameter("id");

if (id != null && !id.isEmpty()) {
    try {
        int studentId = Integer.parseInt(id); // Convert id to integer
        
        // Load the driver and establish connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, dbUser, dbPassword);
        
        // Prepare the SQL query
        statement = connection.prepareStatement(sql);
        statement.setInt(1, studentId); // Bind the ID value
        
        // Execute the query
        int result = statement.executeUpdate();
        
        if (result > 0) {
            request.setAttribute("msg", "Student deleted Successfully");
        } else {
            request.setAttribute("msg", "Student deleted UnSuccessfully");
        }
        
        // Forward to readAll.jsp
        RequestDispatcher rd = request.getRequestDispatcher("readAll.jsp");
        rd.forward(request, response);
        
    } catch (Exception e) {
        e.printStackTrace(); // Log the error for debugging
        request.setAttribute("msg", "Error occurred while deleting student details.");
        RequestDispatcher rd = request.getRequestDispatcher("readAll.jsp");
        rd.forward(request, response);
    } finally {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>

<!-- HTML form for deleting a student -->
<form action="delete.jsp" method="post">
    <fieldset>
        <legend>Delete the Student Details</legend>
        <label for="id">Enter the Student ID:</label><br>
        <input type="number" id="id" name="id" required><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>

<a href="options.jsp" class="menu-link">Menu</a>

</body>
</html>
