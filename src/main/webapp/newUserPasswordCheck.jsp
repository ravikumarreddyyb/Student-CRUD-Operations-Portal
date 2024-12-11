<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Status</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
    color: #333;
  }
  
  h1, h2 {
    text-align: center;
    color: #444;
    font-weight: bold;
    margin: 20px 0;
  }
  
  .form-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    flex-direction: column;
  }
  
  button {
    background-color: #5cb85c;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
  }
  
  button:hover {
    background-color: #4cae4c;
    transform: scale(1.1);
  }

  button:active {
    background-color: #45a049;
  }
  
  @media (max-width: 768px) {
    h1, h2 {
      font-size: 18px;
    }
    
    button {
      font-size: 14px;
      padding: 8px 16px;
    }
  }
</style>
</head>
<body>
<%
   String msg = (String)request.getAttribute("msg");

   if(msg == "true"){
%>
     <h2>Insert Successfully</h2>
  
     <div class="form-container">
       <form action="options.jsp" method='get'>
         <button type="submit">Go to Options</button>
       </form>
     </div>
   
<%	
   }else{
%>
	 <h1>Password already exists. Please choose a different one.</h1>
	 
	 <div class="form-container">
       <form action="newUserForm.jsp" method='get'>
        <button type='submit'>Try New Password</button>
       </form>
     </div> 
    
<%	
    }
%>

</body>
</html>
