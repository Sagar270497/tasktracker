
<%@page import="com.task.model.Task_History"%>
<%@page import="com.task.model.Tasks"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.task.model.Remarks"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task Status</title>

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
	    
		 <style>
  
	    .customalign
	    {
	        text-align: right;
	    }
	    .containercustom 
	     {
	     width: 850px !important;
	     }
           
           
           .panel-heading .accordion-toggle:after {
				    /* symbol for "opening" panels */
				    font-family: 'Glyphicons Halflings';  /* essential for enabling glyphicon */
				    content: "\e114";    /* adjust as needed, taken from bootstrap.css */
				    float: right;        /* adjust as needed */
				    color: grey;         /* adjust as needed */
				}
				.panel-heading .accordion-toggle.collapsed:after {
				    /* symbol for "collapsed" panels */
				    content: "\e080";    /* adjust as needed, taken from bootstrap.css */
				}
		</style> 
		
            <script language="JavaScript">

					function function1() {
					    if (document.getElementById('id1').value == 'Accept') {
					        document.getElementById('o3').disabled = true;
					    } else {
					        document.getElementById('o3').disabled = false;
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
                 
                %> 
                
                 
		       <%  try
                   {
		    	%>
		
		       <%      
		          String status=""; 
		          String assignedto="";
		          String assigned="";
		          String taskStatus ="";
		          String user = (String)request.getSession(false).getAttribute("currentUserName");
		          String id = (String)request.getSession(false).getAttribute("currentUserid");
		           assigned = user+" ("+id+")";
		           
                List<Tasks> tasklist=(ArrayList<Tasks>)request.getAttribute("taskDetail");
                Iterator<Tasks> itr1=tasklist.iterator();
                while(itr1.hasNext())
                {
                	 Tasks tasks=itr1.next();
                	 status = tasks.getUser_status();
                	 assignedto = tasks.getAssignedTo();
                	 taskStatus = tasks.getTask_status();
                	 
                	
                }
             
              %>
		       
            
             
              <!-- navbar button -->
              <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                      <ul class="nav navbar-nav navbar-right">
                        <li ><a href="home" style="color: white;" ><span class="glyphicon glyphicon-home "></span>  Home </a></li>
                      </ul>
                      <ul class="nav navbar-nav navbar-right">
                        <li ><a style="color: white;" ><span class="glyphicon glyphicon-user "></span> ${user}</a></li>
                      </ul>
                       
                    </div>
                  </nav> 
                  <br><br>
           
            
           
            <!---------------------------Form-------------------->
                <div class="container style containercustom" >   
                <form:form class="well form-horizontal" method="post" action="/TaskTracker/taskStatusSave" enctype="multipart/form-data" id="contact_form">
                <fieldset>
                
                <c:forEach var="task" items="${taskDetail}">
               
                <!-- Form Name -->
                <legend><center><h3><b>Task Edit</b></h3></center></legend><br>

                <!-- Text Input-->
                
              
                
                <div class="form-group">
                  <label class="col-md-5 control-label">Task No. : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 
                 <input  name="taskId"  class="form-control"  type="text" value="${task.taskId }" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                 <!-- Text Input-->
                
                <div class="form-group">
                  <label class="col-md-5 control-label">Task Create Date : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="createDate"  class="form-control"  type="text" value="${task.createDate }" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-5 control-label">Task Modify Date : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="lastModifyDate"  class="form-control"  type="text" value="${task.lastModifyDate}" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-5 control-label">Assigned By : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="assignedBy"  class="form-control"  type="text" value="${task.assignedBy }" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-md-5 control-label">Assigned To : </label>  
                  <div class="col-md-6 inputGroupContainer">
                  <div class="input-group">
                 <input  name="assignedBy"  class="form-control"  type="text" value="${task.assignedTo }" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                 <div class="form-group">
                      <label class="col-md-5 control-label">Task description : </label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                      <textarea name="description"rows="1" cols="22" class="form-control"  readonly="readonly">${task.description }</textarea> 
                    </div>
                      </div>
                     </div>
             
                </c:forEach>
                
                <%
                  if(status == null   || !status.equalsIgnoreCase("Accept") )
                  {
                       if(assignedto!=null && assignedto.equalsIgnoreCase(assigned))
		              	  { 
                		  
                %>
                 <div class="form-group"> 
                      <label class="col-md-5 control-label">User Status : </label>
                        <div class="col-md-5 selectContainer">
                        <div class="input-group">
                        <select  name="user_status" id="id1" onclick="function1()" class="form-control selectpicker" >
                        <option value="">Select Task status</option>
                          <option value="Accept"  >Accept</option>
                          <option value="Need clarification" >Need clarification</option>
                        </select>
                      </div>
                    </div>
                 </div>
                    
                    <%
                    }    	      
                       }     
                    %>
                    
                    
                    <%
			           if(request.getSession(false).getAttribute("roles").equals("Admin"))
			             {  
			            	 %>   <div class="form-group"> 
			                      <label class="col-md-5 control-label">Task Status : </label>
			                        <div class="col-md-5 selectContainer">
			                        <div class="input-group">
			                        <select  name="task_status" id="id1" onclick="function1()"class="form-control selectpicker" >
			                        <option value="">Select Task status</option> 
			                        <%   if(taskStatus.equalsIgnoreCase("Close"))
			                               {
			                        	%>
			                           <option value="Re-open" >Re-open</option>
			                           <%} %>
			                           <option value="Close">Close</option>
			                           <option value="Complete">Complete</option>
			                        </select>
			                      </div>
			                    </div>
			                    </div>
			                    
			                    
			                    <!-- Text input-->
				                  <div class="form-group"> 
				                        <label class="col-md-5 control-label">Category</label>
				                          <div class="col-md-5 selectContainer">
				                          <div class="input-group">
				                          <select name="category" class="form-control selectpicker">
				                            <option value="">Select Task Category</option>
				                            <option>Change Request</option>
				                            <option>Bug fix</option>
				                            <option>Service Request</option>
				                            <option>Others</option>
				                          </select>
				                        </div>
				                      </div>
				                      </div>
			                    
                    
			                	<div class="form-group"> 
			                      <label class="col-md-5 control-label">Re-Assigned To :</label>
			                        <div class="col-md-5 selectContainer">
			                        <div class="input-group">
			                        <select  name="reAssigned" id="o3" class="form-control selectpicker" >
			                        <option value="">Select Developer</option>
			                        <c:forEach var="user" items="${userlist}"> 
			                         <option >${user.user_name} (${user.id})</option>
			                          </c:forEach>
			                        </select>
			                      </div>
			                    </div>
			                    </div> 
			                 <% 
			               } else if(assignedto.equalsIgnoreCase(assigned)) {
			                  %>
			                  <div class="form-group"> 
			                      <label class="col-md-5 control-label">Task Status : </label>
			                        <div class="col-md-5 selectContainer">
			                        <div class="input-group">
			                        <select  name="task_status" id="id1" onclick="function1()"class="form-control selectpicker" >
			                        <option value="">Select Task status</option> 
			                           <option value="Complete">Complete</option>
			                        </select>
			                      </div>
			                    </div>
			                    </div>
			                      
			                       <!-- Text input-->
				                  <div class="form-group"> 
				                        <label class="col-md-5 control-label">Category</label>
				                          <div class="col-md-5 selectContainer">
				                          <div class="input-group">
				                          <select name="category" class="form-control selectpicker">
				                            <option value="">Select Task Category</option>
				                            <option>Change Request</option>
				                            <option>Bug fix</option>
				                            <option>Service Request</option>
				                            <option>Others</option>
				                          </select>
				                        </div>
				                      </div>
				                      </div>
			                  
			                	   <div class="form-group"> 
			                      <label class="col-md-5 control-label">Re-Assigned To :</label>
			                        <div class="col-md-5 selectContainer">
			                        <div class="input-group">
			                        <select  name="reAssigned" id="o3" class="form-control selectpicker" >
			                        <option value="">Select Developer</option>
			                        <c:forEach var="user" items="${userlist}"> 
			                         <option >${user.key} (${user.value})</option>
			                          </c:forEach>
			                        </select>
			                      </div>
			                    </div>
			                    </div>
			                    
			               	  <% 
			               	  } 
                               %>
                    
                     <!-- Text input-->
                    
                     <div class="form-group">
                      <label class="col-md-5 control-label">Remark :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
                        <textarea name="remark" rows="4" cols="50" class="form-control" ></textarea>     
                    </div>
                      </div>
                    </div>
                   
                 
                 <!--   File Attechment  -->
                   <div class="form-group">
                      <label class="col-md-5 control-label">File :</label>  
                      <div class="col-md-6 inputGroupContainer">
                      <div class="input-group">
	                     <input name="file" id="fileToUpload" type="file" />
		                  <h6>Max Size 10 MB</h6>
                      </div>
                      </div>
                    </div>   
              
                    
                    
                     <!-- Button -->
                <div class="form-group">
                  <label class="col-md-5 control-label"></label>
                  <div class="col-md-6"><br>
                    <button type="submit" class="btn btn-success" >Update</button>
                  </div>
                </div>
                </fieldset>
                </form:form>
                </div>
                
                <!--------------------------file's Table----------------------------------->
                  
                <div class="panel-group" id="accordion">
                 <div class="container containercustom" >
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
				         Show Files
				        </a>
				      </h4>
				    </div>
				    <div id="collapseOne" class="panel-collapse collapse in">
               <table class="table table-bordered table-striped ">
                <thead>
                   <tr>
                         <th>Remark No.</th>    
                         <th>File</th> 
                   </tr>
                </thead> 
                   <c:forEach var="list" items="${data}">
                 <tbody>
                    <tr>
                        <td>
                            <c:out value="${list.key}"/> 
                        </td>
                       <td>
                        <a href="fileName/${list.key}" > <c:out value="${list.value}"/></a>
                       </td>
                   </tr>
                </tbody>
                </c:forEach>
               
                </table>
                </div>
				    </div>
				  </div>
				  
				   <!--   -----------------------table of remark-------------------------- -->  
				       
				  <div class="container " style="margin-top: 5px;">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				          Show Remarks
				        </a>
				      </h4>
				    </div>
				    <div id="collapseTwo" class="panel-collapse collapse">
               <table class="table table-bordered table-striped ">
                <thead>
                   <tr>
                         <th>Remark No.</th>
                         <th>Date and Time</th>
                         <th>Written By</th>
                         <th>Remark</th>
                   </tr>
                </thead> 
                <%
                List<Remarks> remarklist=(ArrayList<Remarks>)request.getAttribute("remarklist");
                Iterator<Remarks> itr=remarklist.iterator();
                while(itr.hasNext())
                {
                	Remarks remarks=itr.next();
                
                	SimpleDateFormat format=new SimpleDateFormat("dd-MMM-yyyy','hh:mm:ss a");
                	
               %>
                  
                 <tbody>
                 
                    <tr>
                        <td><%=remarks.getId() %></td>
                     
                       <td><%=format.format(remarks.getRemarkDate()) %></td>
                         <td><%=remarks.getWrittenby() %></td>
                       <td>
                         <textarea  cols="70" rows="5" readonly="readonly"><%=remarks.getRemark() %></textarea>
                       </td>
                   </tr>
                </tbody>
                  <%  }  %>
                <% } 
		             catch(Exception ex)
                     {  
         	          response.sendRedirect("activeTask");
	                  }
                 %>
                </table>
                </div>
			    </div>
			    </div>
			    <div class="container containercustom" style="margin-top: 5px;">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
				         Issue History
				        </a>
				      </h4>
				    </div>
				    <div id="collapseThree" class="panel-collapse collapse">
				     <table class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th>Sr No.</th>
                                    <th>Modify Date And Time</th>
                                    <th>Modify By</th>
                                    <th>Updates</th>
                                  </tr>
                                </thead>
                                 <%
					                List<Task_History> remarklist=(ArrayList<Task_History>)request.getAttribute("taskHistoryList");
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
                                    <td><%=format.format(remarks.getModifyDate()) %></td>
                                    <td><%=remarks.getModifyBy() %></td>
                                    <td>
			                         <textarea  cols="30" rows="1" readonly="readonly"><%=remarks.getUpdates()%></textarea>
			                       </td>
                                  </tr>
                                </tbody>
                                <%}%>
                              </table>
				    </div>
				  </div>
				   </div>
				</div>


</body>
</html>