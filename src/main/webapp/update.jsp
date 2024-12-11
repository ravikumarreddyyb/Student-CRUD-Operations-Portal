<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Student Details</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        form {
            border: 1px solid #ddd;
            padding: 20px;
            width: 300px;
            margin: 0 auto;
            border-radius: 20px;
            box-shadow: 5px 5px black;
            background-color: #fff;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
        .success-message, .error-message {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }
        .success-message {
            color: green;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/jdbcclasses";
    String dbUser = "root";
    String dbPassword = "7093805291";

    String sql = "UPDATE Students SET StudentName=?, Email=?, Department=? WHERE id=?";
    Connection connection = null;
    PreparedStatement statement = null;

    String id = request.getParameter("id");
    String studentname = request.getParameter("studentname");
    String email = request.getParameter("email");
    String department = request.getParameter("department");

    if (id != null && studentname != null && email != null && department != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, dbUser, dbPassword);
            statement = connection.prepareStatement(sql);

            statement.setString(1, studentname);
            statement.setString(2, email);
            statement.setString(3, department);
            statement.setInt(4, Integer.parseInt(id));

            int result = statement.executeUpdate();

            if (result > 0) {
            	request.setAttribute("msg", "Student Updated Successfully");
            }
            else{
            	request.setAttribute("msg", "Student Updated UnSuccessfully");
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("readAll.jsp");
        	rd.forward(request, response);
        	
        } catch (Exception e) {
        	e.printStackTrace(); // Log the error for debugging
            request.setAttribute("msg", "Error occurred while updating student details.");
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
<div>
    <form action="" method="post">
        <fieldset>
            <legend>Update Student Details</legend>
            <label for="id">ID:</label>
            <input type="number" name="id" required>
            <label for="studentname">Student Name:</label>
            <input type="text" name="studentname" required>
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            <label for="department">Department:</label>
            <input type="text" name="department" required>
            <input type="submit" value="Update">
        </fieldset>
    </form>
</div>
<a class="menu-link" href="options.jsp">Go to Menu</a>
</body>
</html>
