<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.task.model.User"%>
<%@page import="com.task.service.UserService"%>
<%@page import="com.task.model.Roles"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User</title>
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
		  .Imgnavbar
		            {
		            background-color:cornflowerblue;
		            margin-top: 1%;
		            margin-bottom: 1%;
		            border-radius: 0%;
		            text-align: center;
		           
		            }
		     
		
		.b
		{
		position:relative;
		background-color:  white;
		  width: 200px;
		  height:10px;
		  border: 0;
		  padding: 10px 0;
		  margin: 5px 0;
		  text-align: center;
		  color: black;
		  font-weight: bold;
		  margin-top: 2%;
		  margin-left: 8%;
		}
		
		.dropdown dd {
		
		  position: relative;
		}
		 
		 .dropdown a
		 {
		
		  color: #fff;
		  text-decoration: none;
		  outline: none;
		  font-size: 14px;
		} 
		
		.dropdown dt a {
		  background-color: #4F6877;
		  display: block;
		  padding: 8px 20px 5px 10px;
		  min-height: 25px;
		  line-height: 24px;
		  overflow: hidden;
		  border: 0;
		  width: 272px;
		} 
		
		
		 .dropdown dd ul {
		  background-color:white;
		  border: 0;
		  color:black;
		  display: none;
		  left: 0px;
		  padding: 2px 15px 2px 5px;
		  position: absolute;
		  top: 2px;
		  width: 275px;
		  list-style: none;
		  height: 240px;
		  overflow: auto;
		}  
		
		</style> 
</head>
<body >
                   <%
                 if(request.getSession(false).getAttribute("currentUserName") == null)
                 {
                	 response.sendRedirect("logout");
                 }
                %>  
                
                <script type="text/javascript">
	                 var msg1 = "${msg1}";
				             if(msg1 != "")
				        	 {
				        	     alert(msg1);
				        	     msg1="";
				        	 }
	            </script>
      
        <jsp:include page="Header.jsp"></jsp:include>
                       
     <div class="container style containercustom" >
        <div class="row">           
         <form  class="well form-horizontal" action="/TaskTracker/showRoles" method="post"  id="contact_form" >
          <fieldset >              
           <div class="row">
             <div class="col-md-3 col-md-offset-4" >
               <dl class="dropdown form-group" > 
			    <dt>
				   <a href="#" >
				     <span class="hida" >Select User Roles</span>    
				     <p class="multiSel"></p>  
				   </a>
			    </dt>
			   <dd>
			     <div class="mutliSelect" >
			        <ul><li>
			        <input type="checkbox" name="names" value="All" >All Users<br>
		              <c:forEach var="list" items="${roleslist}">
						  <input type="checkbox" name="names" value="${list.id }">${list.role } <br>
						</c:forEach>
						</li>
			       </ul>
		        </div> 
		       
			  </dd>
		   </dl>
		  </div>
		     <div class="col-md-4" >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-success" style="height: 45px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Submit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
          </div>
        </fieldset>
       </form>
      </div>
     </div>  
     
   <script>
			$(".dropdown dt a").on('click', function() {
				  $(".dropdown dd ul").slideToggle('fast');
				});
			
				$(".dropdown dd ul li a").on('click', function() {
				  $(".dropdown dd ul").hide();
				});
			
				function getSelectedValue(id) {
				  return $("#" + id).find("dt a span.value").html();
				}
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
				});
			
				$('.mutliSelect input[type="checkbox"]').on('click', function() {
			
				  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
				    title = $(this).val() + ",";
			
				  if ($(this).is(':checked')) {
				    var html = '<span title="' + title + '">' + title + '</span>';
				    $('.multiSel').append(html);
				    $(".hida").hide();
				  } else {
				    $('span[title="' + title + '"]').remove();
				    var ret = $(".hida");
				    $('.dropdown dt a').append(ret);
			
				  }
				});
				
				$(".dropdown1 dt a").on('click', function() {
				  $(".dropdown1 dd ul").slideToggle('fast');
				});
			
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown1")) $(".dropdown1 dd ul").hide();
				});

      </script>
 
              <%
              Map<String,Object> mymap = (Map)request.getAttribute("map");
              if(mymap!=null )
               {
            	 if(!mymap.isEmpty())
            	 {
              %>
		             <div class="container">
                        <table class="table table-bordered">
                                <thead>
                                  <tr>
                                     <th>Sr No.</th>
                                    <th>Emp Id</th>
                                    <th>Full Name</th>
                                    <th>Roles</th>                                                     
                                    <th>Edit</th>  
                                    <th>Password</th>                                 
                                  </tr>
                                </thead>
                              <% int i=0;
                             for(Map.Entry<String,Object> entry:mymap.entrySet())
                             { 
                              %>
                                <tbody>
                                  <tr>
                                    <td><%= ++i %></td>
                                    <td><%=entry.getValue()%></td>
                                    <td><%=entry.getKey() %></td>
                                    <%
                                    Map<String,Object> mymap1 = (Map)request.getAttribute("rolemap");
                                    
                                    if(mymap1!=null)
                                    {
                                    	for(Map.Entry<String,Object>  entry1:mymap1.entrySet())
                                    	{
                                    		if(entry.getKey()==entry1.getKey())
                                    		{
                                    			%>
                                    			<td><%=entry1.getValue() %></td>
                                    			<%
                                    			break;
                                    		}
                                    		
                                    	}
                                    }
                                   
                                    %>
                                    <td><a href="updateemp?id=<%=entry.getValue() %>">Edit</a></td>
                                   <td><a href ="resetPassword?id=<%=entry.getValue() %>">Reset</a></td>
                                  </tr>
                                </tbody>
                            <%  } %>
                           </table>
		                </div>
		                  <% 
            	 }
            	 else
            	 {
                %>
                   <center> <h3>Data Not Found</h3></center>
                <%
            	 }
            	 }
            	 %>
</body>
</html>