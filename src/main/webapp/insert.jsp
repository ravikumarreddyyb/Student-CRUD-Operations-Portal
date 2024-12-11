<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert Student Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            max-width: 600px;
            width: 100%;
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
            color: orangered;
        }

        table {
            width: 100%;
            color: royalblue;
        }

        td {
            padding: 10px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="number"],
        input[type="text"],
        input[type="email"] {
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
            background-color: #2980b9;
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

        table {
            margin-top: 20px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<%
    // JDBC connection setup
    String url = "jdbc:mysql://localhost:3306/jdbcclasses";
    String username = "root";
    String password = "7093805291";
    Connection connection = null;
    PreparedStatement stmt = null;
    ResultSet resultSet = null;

    // Checking if the form is submitted
    String id = request.getParameter("id");
    String name = request.getParameter("studentname");
    String mail = request.getParameter("email");
    String dept = request.getParameter("department");

    if (id != null && name != null && mail != null && dept != null) {
        try {
            // Establish the connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            String sql = "INSERT INTO students (`ID`, `StudentName`, `Email`, `Department`) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(id));
            stmt.setString(2, name);
            stmt.setString(3, mail);
            stmt.setString(4, dept);

            int result = stmt.executeUpdate();
           

            if (result > 0) {
            	request.setAttribute("msg", "Student details inserted Successfully");
            	 RequestDispatcher rd = request.getRequestDispatcher("readAll.jsp");
                 rd.forward(request, response);
            }

        } catch (Exception e) {
        	e.printStackTrace(); // Log the error for debugging
            request.setAttribute("msg", "Error occurred while Insert student details.");
            RequestDispatcher rd = request.getRequestDispatcher("readAll.jsp");
            rd.forward(request, response);
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

    <form action="" method="post">
        <fieldset>
            <legend>Student Details</legend>
            <table>
                <tr>
                    <td><label for="id">ID:</label></td>
                    <td><input type="number" name="id" id="id" required></td>
                </tr>
                <tr>
                    <td><label for="studentname">Student Name:</label></td>
                    <td><input type="text" name="studentname" id="studentname" required></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" name="email" id="email" required></td>
                </tr>
                <tr>
                    <td><label for="department">Department:</label></td>
                    <td><input type="text" name="department" id="department" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Submit">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>

    <a href="options.jsp" class="menu-link">Go to Menu</a>
    
</body>
</html>
