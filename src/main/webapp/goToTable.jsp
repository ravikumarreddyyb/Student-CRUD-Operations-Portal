<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%request.setAttribute("msg", "Table");
 RequestDispatcher rd = request.getRequestDispatcher("readAll.jsp");
 rd.forward(request, response);
%>

</body>
</html>