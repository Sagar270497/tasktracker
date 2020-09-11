package com.task.controllers;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.task.dao.UserDao;
import com.task.model.AllRoles;
import com.task.model.Roles;
import com.task.model.Tasks;
import com.task.model.User;
import com.task.service.TaskService;
import com.task.service.UserService;

@Controller
public class UserController {
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public String index()
	{
		return "index";
	}
	@Value("${admin.id}")
	private String default_id;
	
	@Value("${admin.password}")
	private String default_pass;
			/*------------------------------Login------------------------------*/
	        
			@RequestMapping(value="/login")
			ModelAndView login(@ModelAttribute User u,HttpServletRequest req,Roles r,BindingResult result)
			{
				try
				{
					int day = 0;
					LocalDate date = LocalDate.now();
					List daylist = userService.getExpiryDay();
					Iterator itrday = daylist.iterator();
					if(itrday.hasNext())
					{
						day = (int) itrday.next();
					}
					LocalDate expiryDate = date.plusDays(day);
				String ip = req.getRemoteAddr();
				HttpSession session = req.getSession(true);
			    String roles = "";
				List l1 = userService.login(u);
				Iterator<User> itr = l1.iterator();
				List<AllRoles> rol = userService.showRoles(u);
				List allRole = userService.showAllRoles(u);
				session.setAttribute("allRole", allRole);
				Iterator<AllRoles> itrrole = rol.iterator();	
			    while(itrrole.hasNext())
				{	
					AllRoles rl = itrrole.next();
					roles = rl.getRole();	
				}
			    List ipList = userService.getIpAddress(ip);
				Iterator ipItr = ipList.iterator();
			     if(ipItr.hasNext())
				 {
				if(u.getId().equals(default_id.trim()) && u.getPassword().equals(default_pass.trim()))
				{    
					roles = "Admin";
					session.setAttribute("roles", roles);
					String name = u.getId();
					session.setAttribute("currentUserName", name);
					mav.addObject("user",u.getId());
				    mav.setViewName("Welcome"); 
				}
				else if(itr.hasNext())
		        {     User ur = itr.next();
		             LocalDate lastModifyDate = ur.getPass_Modify_Date().toLocalDate();
		       
			              session.setAttribute("roles", roles);    
						  if(ur.getStatus() == 1 && roles.equals("Admin"))
						  {   
							  session.setAttribute("currentUserName", ur.getUser_name());
							  session.setAttribute("currentUserid", ur.getId());
							  mav.addObject("user",ur.getUser_name());
							  List <Tasks> taskList = taskService.assignedTask(ur.getId());
						      mav.addObject("taskList", taskList);
							      if(lastModifyDate.plusDays(day).compareTo(date)>0)
							      {
								     mav.setViewName("Welcome");
								     session.setAttribute("msg2", "");
							      }
							      else
							      {
							    	  mav.setViewName("ChangePassword");
							    	 session.setAttribute("msg2", "change");
							    	 mav.addObject("password", "Your Password is Expired... Please Change");
							      }
						   }
						  else if(ur.getStatus() == 1 )
						  {
							 String name = ur.getUser_name();
	                         String id   = ur.getId();
							 session.setAttribute("currentUserName", ur.getUser_name());
							 session.setAttribute("currentUserid", ur.getId());
							 mav.addObject("user",ur.getUser_name());
							 List <Tasks> taskList = taskService.assignedTask(id);
						     mav.addObject("taskList", taskList);
						     if(lastModifyDate.plusDays(day).compareTo(date)>0)
						      {
							     mav.setViewName("Welcome");
							     session.setAttribute("msg2", "");
						      }
						      else
						      {
						    	  mav.setViewName("ChangePassword");
						    	  session.setAttribute("msg2", "change");
						    	  mav.addObject("password", "Your Password is Expired... Please Change");
						      }
						  }
						  else
						  {
							  mav.setViewName("index");
							  mav.addObject("msg1", "You are not Enable");
						  }	
		        }
				else
				{
					mav.setViewName("index");
					mav.addObject("msg1", "Wrong password");
				}
				 }
			   else
			   {
				   mav.setViewName("index");
					mav.addObject("msg1", "Unauthorized to Access Please Contact your Administrator");
			   }
				}catch (Exception ex) {
					mav.addObject("ex",ex);
					mav.setViewName("exception");
				}
				return mav;		
			}	
		   /*---------------------Update Save------------------------*/	
			@RequestMapping("/updateSave")
			String updateSave(Model m,HttpServletRequest req,Tasks t,Roles r,BindingResult result)
			{   
				String roles[]=req.getParameterValues("names");
				HttpSession session = req.getSession(true);
				String currentUserName = (String)session.getAttribute("currentUserName");
				m.addAttribute("user", currentUserName);
				String user_id = (String)session.getAttribute("user_id");
				userService.removeRole(user_id);
				for(String role:roles)
				{
					r.setRole(role);
					r.setUser_id(user_id);
					userService.updateSave(r);
				}	
				return "redirect:/viewUsers";
			}	
			/*---------------------Url's-------------------------------*/	
			@RequestMapping("/home")
			ModelAndView home(HttpServletRequest req,User u)
			{
				HttpSession session = req.getSession(true);
				 session.setAttribute("MoM",null);
				String currentUserName = (String)session.getAttribute("currentUserName");
				String currentUserid = (String)session.getAttribute("currentUserid");		
				 List <Tasks> taskList = taskService.assignedTask(currentUserid);		 
				 session.setAttribute("name", currentUserName);
				 mav.addObject("user",currentUserName);
				 mav.addObject("taskList", taskList);
				 mav.setViewName("Welcome");
				return mav;
			}
			
			@RequestMapping("/updateemp/home")
			String adminHome()
			{
				return "redirect:/home";
			}	
			@RequestMapping("/createTask")
			String createTask(Model m,User u,HttpServletRequest req)
			{
				String url="";
				try {
					
					  HttpSession session = req.getSession(false);
					  session.setAttribute("MoM",null);
					  String currentUserName = (String)session.getAttribute("currentUserName");	 
					  if(currentUserName==null)
					  {
					  	url="index";
				       }
					  else
					  {
						List<User> userName = userService.showUser(currentUserName);
						m.addAttribute("user",currentUserName);
						m.addAttribute("userName", userName);
						url="CreateTask";
				      }
				     }
				    catch (Exception ex) {
					m.addAttribute("ex",ex);
					url="exception";
				    }
				return url ;
			}	
			@RequestMapping("/createTaskDev")
			String createTaskDev(Model m,User u,HttpServletRequest req)
			{
				String url="";
				try {
					  HttpSession session = req.getSession(false);
					  String currentUserName = (String)session.getAttribute("currentUserName");	 
					  if(currentUserName==null)
					  {
					  	url="index";
				       }
					  else
					  {
						List<User> userName = userService.showUser(currentUserName);
						m.addAttribute("user",currentUserName);
						m.addAttribute("userName", userName);
						url="createTaskDev";
				      }
				    }
				    catch (Exception ex) {
					m.addAttribute("ex",ex);
					url="exception";
				    }
				return url ;
			}	
			@RequestMapping("/addUserRoles")
			String addUserRoles(Model m,User u,HttpServletRequest req)
			{
				HttpSession session = req.getSession(false);
				String currentUserName = (String)session.getAttribute("currentUserName");
				List<User> userlist = userService.showUserList();
				m.addAttribute("user", currentUserName);
				m.addAttribute("userlist", userlist);
				return "addUserRoles";
			}
			@RequestMapping("/viewAllTasks")
			String ViewAllTasks(Model m,User u,HttpServletRequest req)
			{
				HttpSession session = req.getSession(false);
				 session.setAttribute("MoM",null);
				String currentUserName = (String)session.getAttribute("currentUserName");
				List<User> userlist = userService.showUserList();
				m.addAttribute("user", currentUserName);
				m.addAttribute("userlist", userlist);
				return "ViewAllTasks";
			}
			
			@RequestMapping("/filterMoM")
			String filterMoM(Model m,User u,HttpServletRequest req)
			{
				HttpSession session = req.getSession(false);
				session.setAttribute("MoM","momSearch");
				String currentUserName = (String)session.getAttribute("currentUserName");
				List<User> userlist = taskService.showTcsDevelopers();
				m.addAttribute("user", currentUserName);
				m.addAttribute("userlist", userlist);
				 m.addAttribute("companiesName", taskService.showCompaniesName());
				return "filterMoM";
			}
			/*---------------------------view User-----------------------*/
			@RequestMapping("/viewUsers")
			String viewUser(Model m,HttpServletRequest req,String msg)
			{    
				
				String msg1 = req.getParameter("msg");
				if(msg1!= null &&msg1.equalsIgnoreCase("Password Reset Successfully"))
				{
					m.addAttribute("msg1", msg1);
					
				}
				HttpSession session = req.getSession(false);
				String currentUserName = (String)session.getAttribute("currentUserName");	
				List roleslist = userService.showRoles();
				Map<Object, Object> map = new HashMap<Object, Object>();
				Map<Object, List<AllRoles>> rolemap = new HashMap<Object, List<AllRoles>>();
					List<User> userlist = userService.showUserList();
					Iterator<User> itr = userlist.iterator();
					while(itr.hasNext())
					{
						User ur = itr.next();
						map.put(ur.getUser_name(),ur.getId());
						List<AllRoles> rolelist = userService.showRoles(ur.getId());
						rolemap.put(ur.getUser_name(), rolelist);
					}
					Map<Object, Object> treeMap = new TreeMap<Object, Object>(map);
					m.addAttribute("roleslist",roleslist);
					m.addAttribute("map", treeMap);
					m.addAttribute("rolemap", rolemap);
				    m.addAttribute("user", currentUserName);
				return "viewUser";
			}
			@RequestMapping("/showRoles")
			String showRoles(Model m,HttpServletRequest req,Tasks t,Roles r,BindingResult result)
			{   
				String roles[]=req.getParameterValues("names");
				HttpSession session = req.getSession(true);
				List roleslist = userService.showRoles();
				String currentUserName = (String)session.getAttribute("currentUserName");
				m.addAttribute("user", currentUserName);
				m.addAttribute("roleslist",roleslist);
				Map<Object, Object> map = new HashMap<Object, Object>();
				Map<Object, List<AllRoles>> rolemap = new HashMap<Object, List<AllRoles>>();
				if(roles != null)
				{
				if(roles[0].equalsIgnoreCase("All"))
				{
					List<User> userlist = userService.showUserList();
					Iterator<User> itr = userlist.iterator();
					while(itr.hasNext())
					{
						User ur = itr.next();
						map.put(ur.getUser_name(),ur.getId());
						List<AllRoles> rolelist = userService.showRoles(ur.getId());
						 rolemap.put(ur.getUser_name(), rolelist);
					}
					Map<Object, Object> treeMap = new TreeMap<Object, Object>(map);
					m.addAttribute("map", treeMap);
					m.addAttribute("rolemap", rolemap);
				}
				else
				{
				List<Object> userlist = userService.showUserByRole(roles);
				for(Object o:userlist)
				{
					Map row = (Map) o;
					
					map.put(row.get("USER_NAME").toString(),row.get("ID").toString() );
                     List<AllRoles> rolelist1 = userService.showRoles(row.get("ID").toString());
                     rolemap.put(row.get("USER_NAME").toString(), rolelist1);
				}
				Map<Object, Object> treeMap = new TreeMap<Object, Object>(map);
				m.addAttribute("map", treeMap);
				m.addAttribute("rolemap", rolemap);
				}
				}
				return "viewUser";
			}	
			
			/*----------------------Update user-----------------------------------*/
			
			@RequestMapping("/updateemp")
			String updateUser(Model m,HttpServletRequest req)
			{   String id = req.getParameter("id");
			
				String url="";
				try {	
				List roleslist = userService.showRoles();
				HttpSession session = req.getSession(false);
				String currentUserName = (String)session.getAttribute("currentUserName");	
		    	session = req.getSession(true);
				session.setAttribute("user_id", id);
				List<User> userDetail =  userService.show(id);
				List<AllRoles> roles = userService.showRoles(id);
				m.addAttribute("roles",roles);
				m.addAttribute("roleslist",roleslist);
				m.addAttribute("userDetail", userDetail);
				m.addAttribute("user", currentUserName);
				url="updateUser";
				}
				catch (Exception ex)
				{
					m.addAttribute("ex",ex);
					url="exception";
				}
				return url;
			}
			
			@RequestMapping("/resetPassword")
			String resetPassword(Model m,HttpServletRequest req)
			{   String url="";
				String id = req.getParameter("id");
				try
				{
					userService.setPassword(id);
					m.addAttribute("msg","Password Reset Successfully");
					url="redirect:/viewUsers";
				}
				catch(Exception ex)
				{
					m.addAttribute("ex",ex);
					url="exception";
				}
				
			     return url;
			}
			
			@RequestMapping("/developerViewAllTasks")
			ModelAndView devViewAllTasks()
			{	
				mav.setViewName("developerViewAllTasks");
				return mav;
			}
			
		   /*-------------------------Change Password-----------------------------*/
			@RequestMapping("/changePassword")
			String changePassword(HttpServletRequest req,Model m)
			{
				HttpSession session = req.getSession(false);
				 session.setAttribute("MoM",null);
				String currentUserName = (String)session.getAttribute("currentUserName");
				m.addAttribute("user", currentUserName);	
				return "ChangePassword";
			}
			
			@RequestMapping("/savePassword")
			String savePassword(HttpServletRequest req, Model m)
			{
				String url ="";
				try
				{
				String password = null;
				HttpSession session = req.getSession(false);
				String currentUserName = (String)session.getAttribute("currentUserName");
				String currentUserid = (String) session.getAttribute("currentUserid");		
				String currentPassword = req.getParameter("currentPassword");
				String newPassword = req.getParameter("newPassword");
				String confirm = req.getParameter("confirm");	
				List <Tasks> taskList = taskService.assignedTask(currentUserName);
				if(newPassword.equals(confirm))
				{
					List<User> userlist = userService.show(currentUserid);
					Iterator<User> itr = userlist.iterator();
					while(itr.hasNext())
					{
						User ur = itr.next();
						password = ur.getPassword();
					}
					if(password.equals(currentPassword))
					{
						userService.updatePassword(currentUserid, newPassword);
						session.setAttribute("msg2", "");
						m.addAttribute("msg","Password Changed Successfully");	
						m.addAttribute("taskList", taskList);
						url = "Welcome";
					}
					else
					{
						m.addAttribute("msg","Wrong password");					
						m.addAttribute("taskList", taskList);
						url = "ChangePassword";
					}
				  }
					else
					{
						m.addAttribute("msg","Password did not match");			
						m.addAttribute("taskList", taskList);
						url = "ChangePassword";
					}	
				
				m.addAttribute("user", currentUserName);	
				
			    }catch (Exception ex)
				{
				    m.addAttribute("ex",ex);
					url="exception";
			     }
				return url ;
			}
			
			
			 /*----------------------------------Logout----------------------------*/
			@RequestMapping("/logout")
			String logOut(HttpServletRequest req,Model m)
			{
				HttpSession session = req.getSession(false);
				session.removeAttribute("currentUserName");
				session.invalidate();
				return "index";
			}
}
