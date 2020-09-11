<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>


    <%  Exception ex = (Exception)request.getAttribute("ex"); %>
   
  
  <% 
  if(ex!=null)
  {
	  out.println("<h2>Exception</h2>");
    out.println("<b>"+ex.toString()+"</b>");
  }
  %>
  <br> <br> <br>
 <center> <h3>${msg}</h3></center>
 <center> <h4>Go Back</h4></center>
</body>
</html>