<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.security.cert.CertPathValidatorException.Reason"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="keywords" content="footer, contact, form, icons" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
  <script src="${pageContext.request.contextPath}/resources/bootstrap/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/file.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/font-awesome.min.css"/>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/style.css"/>
   
    <script type="text/javascript">
        function myFunction() {
        	  var input, filter, table, tr,td_1,td_2,td_3,td_4,td_5,td_6,td_7,td_8,td_9,td_10,td_11,td_12 ,i;
        	  input = document.getElementById("myInput");
        	  filter = input.value.toUpperCase();
        	  table = document.getElementById("myTable");
        	  tr = table.getElementsByTagName("tr");
        	  for (i = 0; i < tr.length; i++) {
        		td_1 = tr[i].getElementsByTagName("td")[1];
        	    td_2 = tr[i].getElementsByTagName("td")[2];
        	    td_3 = tr[i].getElementsByTagName("td")[3];
        	    td_4 = tr[i].getElementsByTagName("td")[4];
        	    td_5 = tr[i].getElementsByTagName("td")[5];
        	    td_6 = tr[i].getElementsByTagName("td")[6];
        	    td_7 = tr[i].getElementsByTagName("td")[7];
        	    td_8 = tr[i].getElementsByTagName("td")[8];
        	    td_9 = tr[i].getElementsByTagName("td")[9];
        	    td_10 = tr[i].getElementsByTagName("td")[10];
        	    td_11 = tr[i].getElementsByTagName("td")[11];
        	    td_12 = tr[i].getElementsByTagName("td")[12];
        	    if (td_1||td_2||td_3||td_4||td_5||td_6||td_7||td_8||td_9||td_10||td_11||td_12) {
        	      if ((td_1.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_2.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_3.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_4.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_5.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_6.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_7.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_8.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_9.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_10.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_11.innerHTML.toUpperCase().indexOf(filter) > -1)||(td_12.innerHTML.toUpperCase().indexOf(filter) > -1)) {
        	        tr[i].style.display = "";
        	      } else {
        	        tr[i].style.display = "none";
        	      }
        	    }       
        	  }
        	}
    </script>
   
   
   
</head>
<body >
                 <%
                 if(request.getSession(false).getAttribute("currentUserName") == null)
                 {
                	 response.sendRedirect("logout");
                 }
                 else
                 {
         %>         
         <%
                 if(request.getSession(false).getAttribute("roles").equals("Admin"))
                 {  
                	 %>
                	  <jsp:include page="Header.jsp"></jsp:include> 
                	  <% 
                 }else
                 {
                	 %>
                	  <jsp:include page="DeveloperHeader.jsp"></jsp:include> 
                	  <%
                 }
                 }
         %>
                    <%
                   List list = (ArrayList)request.getAttribute("filterList");
                    if(!list.isEmpty())
                    {
                    %>
                     <!-- Create Table -->
                  <div class="container" style="width: 98%;">
                   <center><h3><b>Tasks</b></h3></center>
                        <div class="input-group" >
	                        <span class="input-group-addon "style="color: white; background-color: orange;"><i class="glyphicon glyphicon-search" ></i></span>
					        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search Here..." title="Type here" class="form-control" style="width: 15%;"/>
					    </div>
                        <table class="table table-bordered" id="myTable">
                                <thead>
                                  <tr>
                                   <th>Sr No.</th>
                                    <th>Task No.</th>
                                    <th style="width: 90px;">Date</th>
                                    <th>Description</th>
                                    <th>Assigned To</th>
                                    <th>Assigned By</th>
                                    <th style="width: 100px;">Created By</th>
                                     <th style="width: 80px;">Category</th>
                                    <th>Priority</th>
                                    <th style="width: 90px;">Expected Date</th> 
                                     <th style="width: 90px;">Modify Date</th>     
                                    <th>Task Status</th>
                                     <th>User Status</th>
                                  </tr>
                                </thead>
                                <% int i=0; %>  
                                  <c:forEach var="task" items="${filterList}">
                                <tbody>
                                  <tr>
                                    <td><%= ++i %></td>
                                    <td><a href="taskStatus/${task.taskId}">${task.taskId}</a></td>
                                    <td>${task.createDate}</td>
                                    <td>
				                        <textarea  cols="20" rows="2" readonly="readonly">${task.description}</textarea>
				                     </td>
                                    <td>${task.assignedTo }</td>
                                    <td>${task.assignedBy }</td>
                                     <td>${task.createdBy}</td>
                                      <td>${task.category}</td>
                                    <td>${task.priority }</td>
                                    <td>${task.expectDate }</td>
                                     <td>${task.lastModifyDate }</td>
                                   <td>${task.task_status}</td>
                                   <td>${task.user_status}</td>
                                  </tr>
                                </tbody>
                                </c:forEach>
                              </table>
                    </div>
                    <% 
                    }
                    else
                    {  %>
                      <center> <h3>Tasks Not Found</h3></center>
                   <%   }
              
                  %>
</body>
</html>