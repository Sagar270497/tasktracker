<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.task.model.Task_History"%>
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
<title>Recent Update List</title>
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
   
</head>
<body>

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
                   List list = (ArrayList)request.getAttribute("recentUpdateList");
                    if(!list.isEmpty())
                    {
                    %>
                     <!-- Create Table -->
                  <div class="container">
                   <center><h4><b>Recent Updated Tasks</b></h4></center>
                        <table class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th>Sr No.</th>
                                    <th>Task No.</th>
                                    <th>Modify Date And Time</th>
                                     <th>Description</th>
                                    <th>Modify By</th>
                                    <th>Updates</th>
                                  </tr>
                                </thead>
                                 <%
					                List<Task_History> remarklist=(ArrayList<Task_History>)request.getAttribute("recentUpdateList");
					                Iterator<Task_History> itr=remarklist.iterator();
					                int i=0;
					                while(itr.hasNext())
					                {    
					                	Task_History remarks=itr.next();
					                
					                	SimpleDateFormat format=new SimpleDateFormat("dd-MMM-yyyy','hh:mm:ss a");
					                	
					               %>
                                <tbody>
                                  <tr>
                                   <td><%= ++i %></td>
                                    <td><a href="taskStatus?taskId=<%=remarks.getTask_id() %>"><%=remarks.getTask_id() %></a></td>
                                    <td><%=format.format(remarks.getModifyDate()) %></td>
                                    <td>
			                         <textarea  cols="30" rows="2" readonly="readonly"><%=remarks.getDescription() %></textarea>
			                       </td>
                                    <td><%=remarks.getModifyBy() %></td>
                                    <td>
			                         <textarea  cols="30" rows="2" readonly="readonly"><%=remarks.getUpdates()%></textarea>
			                       </td>
                                  </tr>
                                </tbody>
                                <%}%>
                              </table>
                    </div>
                    <% 
                    }
                    else
                    {  %>
                      <center> <h3>Tasks Not Found</h3></center>
                   <%   }  %>
</body>
</html>