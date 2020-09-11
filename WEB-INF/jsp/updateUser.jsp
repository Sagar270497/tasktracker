<%@page import="java.util.ArrayList"%>
<%@page import="com.task.model.Roles"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Update</title>
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
  
 
    
    
    .containercustom 
     {
     width: 850px !important;
     }
     
   
</style>


<style>
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

.dropdown a,
.dropdown a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
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
 
 
             <div class="container style containercustom" >
             <div class="row">
              <form  class="well form-horizontal" action="/TaskTracker/updateSave" method="post"  id="contact_form" >
                <fieldset >
               <c:forEach var="emp" items="${userDetail}">
                <!-- Form Name -->
                <legend><center><h2><b>Assign Roles</b></h2></center></legend><br>
                
                 <!-- Text input-->
                
                <div class="form-group">
                  <label class="col-md-4 control-label">Emp Id</label>  
                  <div class="col-md-4 inputGroupContainer">
                  <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                 <input  name="id" class="form-control"  type="text" value="${emp.id }" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                <!-- Text input-->
                
                <div class="form-group">
                  <label class="col-md-4 control-label">Name</label>  
                  <div class="col-md-4 inputGroupContainer">
                  <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  <input  name="user_name" placeholder="Full Name" class="form-control"  type="text" value="${emp.user_name }" readonly="readonly">
                    </div>
                  </div>
                </div>
                
                
                </c:forEach>
                
                
                 
                 <div class="form-group">
                  <label class="col-md-4 control-label">Roles</label>  
                  <div class="col-md-7 inputGroupContainer">
                  <div class="input-group">
                    <%
                    List<Roles> roles=(ArrayList<Roles>)request.getAttribute("roles");
                    %>
                 
                   
                    <h5><%=roles %></h5>
                    
                    </div>
                  </div>
                </div>
                 
                 
                 
                <div class="row">
                <div class="col-md-3 col-md-offset-4" >
           <dl class="dropdown form-group"> 
			    <dt>
				    <a href="#">
				      <span class="hida">Select</span>    
				      <p class="multiSel"></p>  
				    </a>
			    </dt>
			  
			   <dd>
			     <div class="mutliSelect">
			        <ul>
						<li>
							<c:forEach var="list" items="${roleslist}">
						     <input type="checkbox" name="names" value="${list.id }">${list.role } <br>
						   </c:forEach>
						</li>
			       </ul>
		        </div>   
			  </dd>
		   </dl></div>
		     <div class="col-md-4" >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-success" style="height: 45px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UPDATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
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
				//////////////////////
				$(".dropdown1 dt a").on('click', function() {
				  $(".dropdown1 dd ul").slideToggle('fast');
				});
			
			
				$(document).bind('click', function(e) {
				  var $clicked = $(e.target);
				  if (!$clicked.parents().hasClass("dropdown1")) $(".dropdown1 dd ul").hide();
				});

      </script>
     
                </fieldset>
                </form></div>
                       </div>
                     
 
              
</body>
</html>
