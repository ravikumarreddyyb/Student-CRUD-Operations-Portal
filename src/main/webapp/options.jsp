<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CRUD Options</title>
<style>
    body {
        font-family: Arial, sans-serif;
        font-size: 14px;
        text-align: center;
        background: linear-gradient(to right, #e0e0e0, #f4f4f4);
        margin: 0;
        padding: 0;
    }

    fieldset {
        margin: 40px auto;
        padding: 20px;
        border: none;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        max-width: 400px;
    }

    .options-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    .insert,
    .update,
    .delete {
        text-decoration: none;
        display: inline-block;
        padding: 15px 30px;
        margin: 10px;
        border: 2px solid transparent;
        color: #fff;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .insert:hover,
    .update:hover,
    .delete:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .insert {
        background-color: #28a745;
        border-color: #218838;
    }

    .update {
        background-color: #007bff;
        border-color: #0056b3;
    }

    .delete {
        background-color: #dc3545;
        border-color: #c82333;
    }

    .insert:focus,
    .update:focus,
    .delete:focus {
        outline: none;
        box-shadow: 0 0 0 4px rgba(0, 123, 255, 0.5);
    }

    .table-view {
        margin: 20px auto;
        text-align: center;
    }

    .table-view a {
        text-decoration: none;
        display: inline-block;
        padding: 12px 25px;
        margin: 15px;
        color: #fff;
        background-color: #17a2b8;
        border-radius: 6px;
        font-size: 15px;
        font-weight: bold;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .table-view a:hover {
        background-color: #138496;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        transform: translateY(-2px);
    }

    .table-view a:focus {
        outline: none;
        box-shadow: 0 0 0 4px rgba(23, 162, 184, 0.5);
    }
</style>

</head>

<body>
<h1>Welcome to CRUD Operations</h1>

    <fieldset>
        <div class="options-container">
            <a href="insert.jsp" class="insert">INSERT</a>
            <a href="update.jsp" class="update">UPDATE</a>
            <a href="delete.jsp" class="delete">DELETE</a>
        </div>
    </fieldset>
         <div class="table-view">
          <a href="goToTable.jsp">View Table</a>
        </div>
</body>

</html>