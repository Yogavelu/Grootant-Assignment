<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "aem";
String userid = "root";
String password = "PasswordforMYSQL@123";
try 
{
	Class.forName(driver);
} 
catch(ClassNotFoundException e) 
{
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<title>View Employee Details</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<meta charset="ISO-8859-1">
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
#t01 {
  width: 100%;    
  background-color: #f1f1c1;
}
</style>
<script>
function next1()
{ 
	int tem=Integer.parseInt(tempid);
    tem++;
    String temp=Integer.toString(tem);
	document.getElementById("demo").innerHTML=temp;
}
</script>
</head>
<BODY>
        <% 
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);

            statement = connection.createStatement();

            String tempid = request.getParameter("entered_id");  

            ResultSet resultset = statement.executeQuery("select * from employee_details where id = '" + tempid + "'") ; 
            
            if(!resultset.next()) {
                out.println(" Sorry, could not find employee details, Please check employee ID. ");
            } 
            else {
        %>

        <TABLE BORDER="1" id="t01">
            <TR>
               <TH>NAME</TH>               
               <TH>EXPERIENCE</TH>
               <TH>ROLE</TH>
               <TH>AGE</TH>
               <TH>MOBILE NUMBER</TH>
               <TH>STATUS</TH>
           </TR>
           <TR>
               <TD> <%= resultset.getString("name") %> </TD>        
               <TD> <%= resultset.getInt("experience") %> </TD>
               <TD> <%= resultset.getString("role") %> </TD>
               <TD> <%= resultset.getInt("age") %> </TD>
               <TD> <%= resultset.getString("mobilenumber") %> </TD>
               <TD> <%= resultset.getString("status") %> </TD>
           </TR>
       </TABLE>
       <BR>
       <form method="post" action="ViewdetailsDatabase.jsp">    
                    
            <label>     
              <input id="demo"
                     type="text" 
                     class="input" 
                     name="entered_id"                        
                     placeholder="EmployeeID">        
              <div class="line-box">         
                <div class="line"></div>        
              </div>    
            </label>       
            <button type="submit" onclick="next1()">Get Details</button>  
          </form>      
       <% 
           } 
            connection.close();
       %>
    </BODY>
</html>