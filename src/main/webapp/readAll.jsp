<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Student Table</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
         .smsg{
            color: green;
        }
        .unmsg{
           color: red;
        }
        .error{
           color: gold
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        String url = "jdbc:mysql://localhost:3306/jdbcclasses";
        String dbUser = "root";
        String dbPassword = "7093805291";
        String query = "SELECT * FROM Students";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, dbUser, dbPassword);
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
    %>
    <div>
    <%
    String msg = (String)request.getAttribute("msg");
    String t="";
    String smsg="yllufsseccuS";
    String unmsg="yllufsseccuSnU";
    for(int i=msg.length()-1;i>=0;i--){
    	char c=msg.charAt(i);
    	if(c != ' '){
    		t=t+c;
    	}
    	else{
    		break;
    	}
    }
    
    if(t.equals(smsg)){
    %>	
        <center>
    	   <h2 class="smsg"><%= msg %></h2>
    	</center>
    <%	
    }
    else if(t.equals(unmsg)){
    %>
        <center>
          <h2 class="unmsg">ID not exist  <%= msg %></h2>	
        </center>
    <%
    }
    else{
    %>
        <center>
          <h2 class="error"><%= msg %></h2>
        </center>
    <%
    }
    %>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Department</th>
            </tr>
            <%
                while (resultSet.next()) {
                    int id = resultSet.getInt("ID");
                    String name = resultSet.getString("StudentName");
                    String email = resultSet.getString("Email");
                    String department = resultSet.getString("Department");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= department %></td>
            </tr>
            <% 
                }
            %>
        </table>
    </div>
    <div class="container">
        <form action="options.jsp" method="get">
            <button type="submit">Go to Options</button>
        </form>
    </div>
    <%
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <p style="color: red;">An error occurred: <%= e.getMessage() %></p>
    <%
        } finally {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }
    %>
</body>
</html>
