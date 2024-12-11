<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            font-family: 'Arial', sans-serif;
        }

        form {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            width: 350px;
            animation: fadeIn 1s ease-out;
        }

        fieldset {
            border: none;
            padding: 20px;
            background: #f7f9fc;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        legend {
            font-size: 1.4em;
            color: #333;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            color: #333;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        td label {
            font-weight: bold;
            color: #555;
        }

        td input[type="text"],
        td input[type="password"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin: 6px 0;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        td input[type="text"]:focus,
        td input[type="password"]:focus {
            border-color: #007bff;
            background-color: #f0f8ff;
            outline: none;
        }

        td input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 14px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
            font-size: 1.1em;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        td input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        td input[type="submit"]:active {
            transform: scale(0.95);
        }

        td a {
            color: #007bff;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        td a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<%
    String url = "jdbc:mysql://localhost:3306/jdbcclasses";
    String dbUser = "root";
    String dbPassword = "7093805291";
    String sql = "SELECT UserName, Password FROM details WHERE UserName=? AND Password=?";
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet result = null;

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, dbUser, dbPassword);
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            result = statement.executeQuery();

            if (result.next()) {
                // If login is successful, forward to another page
                response.sendRedirect("options.jsp");
                return;
            } else {
            	response.sendRedirect("invalid.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (result != null) result.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

    <form action="" method="post">
        <fieldset>
            <legend>Login</legend>
            <table>
                <tr>
                    <td><label for="username">UserName:</label></td>
                    <td><input type="text" name="username" size="20" required></td>
                </tr>
                <tr>
                    <td><label for="password">Password:</label></td>
                    <td><input type="password" name="password" size="20" required></td>
                </tr>
                <tr>
                    <td colspan="2" class="center">
                        <a href="newUserForm.jsp">New User</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Login"></td>
                </tr>
            </table>
        </fieldset>
    </form>

</body>
</html>
