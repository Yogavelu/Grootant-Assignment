<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
	<title>Change Password</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="ISO-8859-1" >
<link rel="stylesheet" href="Adddetailsstyle.css">

</head>

<body>
			
		<form method="post">
			<label>     
              <input 
                     type="password" 
                     class="input" 
                     name="Password"        
                     placeholder="Enter New Password" required>        
              <div class="line-box">         
                <div class="line"></div>        
              </div>    
            </label>
            <label>     
              <input 
                     type="password" 
                     class="input" 
                     name="RePassword"        
                     placeholder="Re - Enter Password" required>        
              <div class="line-box">         
                <div class="line"></div>        
              </div>    
            </label>
            <button type="submit" formaction="RedirectLogin.jsp">Change Password</button>
		</form>
</body>
</html>