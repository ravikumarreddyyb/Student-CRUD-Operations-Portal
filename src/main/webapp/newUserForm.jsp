<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New User Login</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form action="" method="post">
        <label for="username">Enter the UserName:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Enter New Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="Submit">
    </form>

    <%
        String url = "jdbc:mysql://localhost:3306/jdbcclasses";
        String dbUsername = "root";
        String dbPassword = "7093805291";

        String checkSql = "SELECT COUNT(*) FROM details WHERE Password = ?";
        String insertSql = "INSERT INTO details (`UserName`, `Password`) VALUES (?, ?)";

        String un = request.getParameter("username");
        String pw = request.getParameter("password");

        if (un != null && pw != null) {
            try (Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Check if the password already exists
                try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
                    checkStmt.setString(1, pw);
                    ResultSet rs = checkStmt.executeQuery();
                    if (rs.next() && rs.getInt(1) > 0) {
                        // Password already exists
                        
                        request.setAttribute("msg", "false");
                        
                    } else {
                        // Insert the new user
                        try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                            insertStmt.setString(1, un);
                            insertStmt.setString(2, pw);
                            int result = insertStmt.executeUpdate();

                            if (result > 0) {
                            	request.setAttribute("msg", "true");
                                
                            } else {
                                out.println("<h2>Insert Failed</h2>");
                            }
                            
                        }
                    }
                }
                
                RequestDispatcher rd = request.getRequestDispatcher("newUserPasswordCheck.jsp");
                rd.forward(request, response);
                
            } catch (Exception e) {
                out.println("<div>");
                out.println("<h2>An error occurred: " + e.getMessage() + "</h2>");
                out.println("</div>");
            }
        }
    %>
</body>
</html>
