package com.task.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.PropertyValueException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.task.model.AllRoles;
import com.task.model.Fileupload;
import com.task.model.MoM;
import com.task.model.ReOpen_tasks;
import com.task.model.Remarks;
import com.task.model.Roles;
import com.task.model.Task_History;
import com.task.model.Tasks;
import com.task.model.User;
import com.task.service.TaskService;
import com.task.service.UserService;

@Controller
public class TaskController {

	@Autowired
	UserService userService;
	
	@Autowired
	TaskService taskService;
	
	ModelAndView mav = new ModelAndView();
	
    private static final String UPLOAD_DIRECTORY ="/files";
	private static final int THRESHOLD_SIZE     = 1024 * 1024 * 10;  // 10MB
	
	
	/*-----------------------Create Task------------------------------------*/
	@RequestMapping(value="/taskCreate")
	String createTask(@ModelAttribute Tasks t,HttpServletRequest req,Model m,User u,Task_History th)
	{ 
		  String url="";
		  HttpSession session = req.getSession(false);
		  String currentUserName = (String)session.getAttribute("currentUserName");
		  String currentUserid = (String)session.getAttribute("currentUserid");
		   if(currentUserName==null)
		    {
		    	url="index";
		    }
		    else
		    {
				try
				{
					Date currentDate = new Date();
		    	    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
					t.setCreateDate(date);
					t.setLastModifyDate(date);
				    t.setTask_status("New");
				    t.setAssignedBy(currentUserName+" ("+currentUserid+")");
				    t.setCreatedBy(currentUserName+" ("+currentUserid+")");
				    taskService.createTask(t);
				    List<User> userName = userService.showUser(currentUserName);
					m.addAttribute("user",currentUserName);
					m.addAttribute("userName", userName);
					th.setTask_id(t.getTaskId());
					th.setDescription(t.getDescription());
					th.setModifyBy(currentUserName+" ("+currentUserid+")");
					th.setModifyDate(currentDate);
					th.setUpdates("Task Created By :"+currentUserName+" ("+currentUserid+")");
				    taskService.saveTaskHistory(th);
				    m.addAttribute("msg1", "Task Created Successfully");
					url="CreateTask";	
				}
				catch (PropertyValueException ex)
				{
					url="redirect:/createTask";
				}
				catch(Exception ex)
				{
					m.addAttribute("ex",ex);
					url="exception";
				}
				
		    }
		return url;
	}
	@RequestMapping(value="/taskCreateDev")
	String createTaskDev(@ModelAttribute Tasks t,HttpServletRequest req,Model m,User u,Task_History th)
	{ 
		  String url="";
		  HttpSession session = req.getSession(false);
		  String currentUserName = (String)session.getAttribute("currentUserName");
		  String currentUserid = (String)session.getAttribute("currentUserid");
		   if(currentUserName==null)
		    {
		    	url="index";
		    }
		    else
		    {
				try
				{
					Date currentDate = new Date();
		    	    java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
					t.setCreateDate(date);
					t.setLastModifyDate(date);
					t.setUser_status("Accept");
				    t.setTask_status("Work in progress");
				    t.setAssignedBy(currentUserName+" ("+currentUserid+")");
				    t.setCreatedBy(currentUserName+" ("+currentUserid+")");
				    t.setAssignedTo(currentUserName+" ("+currentUserid+")");
				    t.setExpectDate(date);
				    t.setPriority("Very High");
				    taskService.createTask(t);
				    List<User> userName = userService.showUser(currentUserName);
					m.addAttribute("user",currentUserName);
					m.addAttribute("userName", userName);
					th.setTask_id(t.getTaskId());
					th.setDescription(t.getDescription());
					th.setModifyBy(currentUserName+" ("+currentUserid+")");
					th.setModifyDate(currentDate);
					th.setUpdates("Task Created By :"+currentUserName+" ("+currentUserid+")");
					taskService.saveTaskHistory(th);
					m.addAttribute("msg1", "Task Created Successfully");
					url="createTaskDev";
				}
				catch (PropertyValueException ex)
				{
					url="redirect:/createTaskDev";
				}
				catch(Exception ex)
				{
					m.addAttribute("ex",ex);
					url="exception";
				}
		    }
		return url;
	}
	
	/*-------------------------------------url's--------------------------------------------*/	
	
	@RequestMapping(value="/taskStatus/home")
	String adminHome(Model m,HttpServletRequest req)
	{
		 HttpSession session = req.getSession(false);
		 String currentUserName = (String)session.getAttribute("currentUserName");
		 m.addAttribute("user", currentUserName);
		 return "redirect:/home";
	}
	@RequestMapping(value="/momDesc/home")
	String home(Model m,HttpServletRequest req)
	{
		 HttpSession session = req.getSession(false);
		 String currentUserName = (String)session.getAttribute("currentUserName");
		 m.addAttribute("user", currentUserName);
		 return "redirect:/home";
	}
	@RequestMapping(value="/taskStatus/activeTask")
	String activetask(Model m,HttpServletRequest req)
	{   
		return "redirect:/activeTask";
	}
	@RequestMapping(value="/taskStatus")
	String recentUpdates(HttpServletRequest req,Model m)
	{
		m.addAttribute("taskId",req.getParameter("taskId"));
		return "redirect:/taskStatus/{taskId}";
	}
	
	@RequestMapping(value="/createMoM")
	String mom(HttpServletRequest req,Model m)
	{
		 HttpSession session = req.getSession(false);
		 String currentUserName = (String)session.getAttribute("currentUserName");
		 m.addAttribute("user", currentUserName);
		 m.addAttribute("userlist", taskService.showTcsDevelopers());
		 m.addAttribute("companiesName", taskService.showCompaniesName());
		 return "createMoM";
	}
	
	@RequestMapping(value="/saveMoM",method=RequestMethod.POST)
	String saveMoM(@RequestParam CommonsMultipartFile file,MoM mom, Fileupload uploadFile, HttpServletRequest req,Model m) throws Exception
	{
		 HttpSession session = req.getSession(false);
		 String currentUserName = (String)session.getAttribute("currentUserName");
		 long timemili = ZonedDateTime.now().toInstant().toEpochMilli();
	    String momDesc = req.getParameter("momDesc");
		String spocNames[] = req.getParameterValues("spoc");
	    String attendeeNames[] = req.getParameterValues("attendee");
	    String companiesNames[] = req.getParameterValues("company");
		Date currentDate = new Date();
		String stackholders = req.getParameter("stackholders");
		String momDetails = req.getParameter("momDetails");
		String requireAction = req.getParameter("requireAction");
		m.addAttribute("userlist", taskService.showTcsDevelopers());
	    m.addAttribute("companiesName", taskService.showCompaniesName());
		
		String spoc = "";
		if(req.getParameterValues("spoc") != null)
		{
	    for(String name : spocNames)
		{
			spoc = spoc+name+",";
		}
		}
		String attendee = "";
		if(req.getParameterValues("attendee") != null)
		{
	    for(String name : attendeeNames)
		{
	    	attendee = attendee+name+",";
		}
		}
	    String companies = "";
	    if(req.getParameterValues("company")!= null)
	    {
		    for(String name : companiesNames)
			{
		    	companies = companies+name+",";
			}
	    }
	    mom.setMomCreatedDate(currentDate);
		mom.setMomDetail(momDetails);
		mom.setOtherStackHolder(companies);
		mom.setOtherTcsAttendee(attendee);
		mom.setPrimaryScop(spoc);
		mom.setRequireAction(requireAction);
		mom.setStackHolderDetail(stackholders);
		mom.setMomDesc(momDesc);
	    taskService.saveMom(mom);
	    if(!file.getOriginalFilename().isEmpty())
		{
		   DiskFileItemFactory factory = new DiskFileItemFactory();
		   factory.setSizeThreshold(THRESHOLD_SIZE);
		   factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		   ServletFileUpload upload = new ServletFileUpload(factory);
		   ServletContext context = session.getServletContext();
		   String uploadPath = context.getRealPath(UPLOAD_DIRECTORY);
		   byte[] bytes = file.getBytes();
		   String filename = file.getOriginalFilename().split("\\.")[0];
		   String extensen = file.getOriginalFilename().split("[.]")[1];
		   BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(uploadPath + File.separator + filename+timemili+"."+extensen)));
		   stream.write(bytes);
		   stream.flush();
		   stream.close();	
		   uploadFile.setName(filename+timemili+"."+extensen);
		   uploadFile.setData(bytes);
		   uploadFile.setRemark_id(mom.getId());
   	       taskService.saveFile(uploadFile);
		}
		 m.addAttribute("user", currentUserName);
		 m.addAttribute("msg1", "MoM Created Successfully");
		 return "createMoM";
	}
	
	@RequestMapping(value="/showMoM")
	String showMoM(HttpServletRequest req,Model m)
	{
	
		 HttpSession session = req.getSession(false);
		
		 String currentUserName = (String)session.getAttribute("currentUserName");
		 m.addAttribute("user", currentUserName);
		 List<MoM> momList = taskService.showMom();
		 m.addAttribute("momList",momList );
		 session.setAttribute("MoM","momSearch");
		return "showMoM";
	}
	
	@RequestMapping(value="/createRole")
	String createRole(@ModelAttribute AllRoles roles,HttpServletRequest req,Model m)
	{   
		String url="";
		try
		{
		  taskService.createRole(roles);
		  m.addAttribute("msg", "Role Add");
		  url="addUserRoles";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	
	/*-----------------------------------Active task-------------------------------*/
	@RequestMapping("/activeTask")
	String activeTask(Model m,HttpServletRequest req)
	{
		String url="";
		try
		{
		    HttpSession session = req.getSession(false);
		    session.setAttribute("MoM",null);
			String currentUserName = (String)session.getAttribute("currentUserName");
			List<Tasks> activelist = taskService.showActiveTasks();
			Iterator<Tasks> itr = activelist.iterator();
			while(itr.hasNext())
			{
				Tasks ts = itr.next();
			}
			m.addAttribute("activelist",activelist );
			m.addAttribute("user", currentUserName);
			url="ActiveTasks";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	/*------------------------------View Task-----------------------*/

	@RequestMapping("/viewTask")
	String viewTask(@ModelAttribute Tasks t,Model m,HttpServletRequest req)
	{
		String url ="";
		try
		{
		HttpSession session = req.getSession(false);	
		String currentUserName = (String)session.getAttribute("currentUserName");
		String currentUserid = (String)session.getAttribute("currentUserid");
		List<Tasks> taskList = taskService.showTasks(currentUserid);
		m.addAttribute("user", currentUserName);
		m.addAttribute("taskList", taskList);
		url="viewTask";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	
	@RequestMapping("/recentUpdates")
	String recentUpdates(Model m,HttpServletRequest req)
	{
		String url="";
		HttpSession session = req.getSession(false);
		 session.setAttribute("MoM",null);
		String currentUserName = (String)session.getAttribute("currentUserName");
		try
		{
			List recentUpdateList= taskService.showRecentUpdates();
			
			m.addAttribute("recentUpdateList", recentUpdateList);
			m.addAttribute("user", currentUserName);
			url="recentUpdateList";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	
	
	@RequestMapping("/recentClosed")
	String recentClosed(Model m,HttpServletRequest req)
	{
		String url="";
		HttpSession session = req.getSession(false);
		 session.setAttribute("MoM",null);
		String currentUserName = (String)session.getAttribute("currentUserName");
		try
		{
			List recentUpdateList= taskService.showRecentClosed();
			
			m.addAttribute("recentUpdateList", recentUpdateList);
			m.addAttribute("user", currentUserName);
			url="recentUpdateList";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	
	@RequestMapping("/recentCreated")
	String recentCreated(Model m,HttpServletRequest req)
	{
		String url="";
		HttpSession session = req.getSession(false);
		 session.setAttribute("MoM",null);
		String currentUserName = (String)session.getAttribute("currentUserName");
		try
		{
			List recentUpdateList= taskService.showRecentCreated();
			
			m.addAttribute("recentUpdateList", recentUpdateList);
			m.addAttribute("user", currentUserName);
			url="recentUpdateList";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	
	@RequestMapping("/recentComplete")
	String recentComplete(Model m,HttpServletRequest req)
	{
		String url="";
		HttpSession session = req.getSession(false);
		 session.setAttribute("MoM",null);
		String currentUserName = (String)session.getAttribute("currentUserName");
		try
		{
			List recentUpdateList= taskService.showRecentComplete();
			
			m.addAttribute("recentUpdateList", recentUpdateList);
			m.addAttribute("user", currentUserName);
			url="recentUpdateList";
		}
		catch(Exception ex)
		{
			m.addAttribute("ex",ex);
			url="exception";
		}
		return url;
	}
	@RequestMapping("/showTasksByDescription")
	String showtasksbyDescription(Model m,HttpServletRequest req)
	{
		String url;
		HttpSession session = req.getSession(false);
	    String currentUserName = (String)session.getAttribute("currentUserName"); 	
	    m.addAttribute("user", currentUserName);
	    if(session.getAttribute("MoM")==null)
	    {
		String description = req.getParameter("description");
		List<Tasks> descriptionList = taskService.showDescription(description.toLowerCase());
		m.addAttribute("filterList", descriptionList);
		url = "ShowFilterResult";
	    }
	    else
	    {
			m.addAttribute("momList", taskService.searchMom(req.getParameter("description").toLowerCase()));
	    	url="showMoM";
	    }
		return url;
	}
	@RequestMapping(value="/momDesc")
	String momDesc(Model m,HttpServletRequest req)
	{    
		HttpSession session = req.getSession(false);
	    String currentUserName = (String)session.getAttribute("currentUserName"); 	
	    int id = Integer.parseInt(req.getParameter("id"));
	    m.addAttribute("user", currentUserName);
		List momData = taskService.showMomById(id); 
		List file = taskService.showfilesByMoMId(id);
		
		m.addAttribute("momData", momData);
		m.addAttribute("file", file);
		return "momDesc";
	}
	/*---------------------------task status--------------------------------*/
	@RequestMapping("/taskStatus/{taskId}")
	String taskStatus(@PathVariable int taskId,Model m,HttpServletRequest req)
	{
		String url = "";
		HttpSession session = req.getSession(false);
		
		String currentUserName = (String)session.getAttribute("currentUserName");
		String currentUserid = (String)session.getAttribute("currentUserid");
        String assignedto="",assignedby="",createdby="",user="";
        if(currentUserName==null)
	    {
	    	url="redirect:/logout";
	    }
	    else
	    {
		   try
		   {
			m.addAttribute("user", currentUserName);
		    user = currentUserName+" ("+currentUserid+")";
			List<Tasks> taskDetail = taskService.showTask(taskId);	
			List<Remarks> remarklist = taskService.showRemarks(taskId);
			List<Object> filelist = taskService.showfiles(taskId);
			List taskHistoryList = taskService.showTaskDetail(taskId);
			
		    Iterator<Tasks> itr = taskDetail.iterator();
			   while(itr.hasNext())
			   {
				   Tasks tr = itr.next();
				   assignedto = tr.getAssignedTo();
				   assignedby = tr.getAssignedBy();
				   createdby = tr.getCreatedBy();
			   }
				if( !taskDetail.isEmpty())
				{
					Map<Object, Object> map = new HashMap<>();
					for(Object o:filelist)
					{
						Map row = (Map)o;
						map.put(row.get("ID"),row.get("FILE_NAME"));
					}
					String role = (String) session.getAttribute("roles");
					if(role.equals("Admin"))
					{
						List<User> userlist = userService.showUserList();
						m.addAttribute("userlist", userlist);
					}
					else if(assignedby.equals(user) && assignedto.equals(user) && createdby.equals(user))
					{
						List<Object> userlist = userService.showAdminList();
						Map<Object, Object> map2 = new HashMap<>();
						for(Object obj:userlist)
						{
							Map row = (Map)obj;	
							map2.put(row.get("USER_NAME"),row.get("ID"));				
						}
						m.addAttribute("userlist", map2);
					}
					else
					{
						List<Object> userlist = userService.showUserList(currentUserid);
						Map<Object, Object> map2 = new HashMap<>();
						for(Object obj:userlist)
						{
							Map row = (Map)obj;	
							map2.put(row.get("USER_NAME"),row.get("ID"));				
						}
						m.addAttribute("userlist", map2);
					}
					m.addAttribute("data",map);
					m.addAttribute("remarklist",remarklist);
					m.addAttribute("taskDetail", taskDetail);
					m.addAttribute("taskHistoryList", taskHistoryList);
					url="taskStatus";
				}
				else
				 {
				  m.addAttribute("msg", "Data Not Found");
				  url="exception";
				 }
			}
			catch(NullPointerException ex)
			{
				m.addAttribute("ex",ex);
				url="exception";
			}
			catch(Exception ex)
			{
				m.addAttribute("ex",ex);
				url="exception";
			}
	    }
		return url ;
	}
	/*-----------------------Admin Task Status Save---------------------------------*/
  
	@RequestMapping(value="/taskStatusSave",method=RequestMethod.POST)
	String taskStatusSave(@RequestParam CommonsMultipartFile file,Model m,HttpSession sess, Fileupload uploadFile, HttpServletRequest req, Remarks r, Tasks t,Task_History th) throws IOException
	{  		
			String url="";
			HttpSession session = req.getSession(false);
		    String currentUserName = (String)session.getAttribute("currentUserName");
		    if(currentUserName==null)
		    {
		    	url="redirect:/logout";
		    }
		    else
		    {
		     try
		    { 
		    ReOpen_tasks rpt = new ReOpen_tasks();
		    long timemili = ZonedDateTime.now().toInstant().toEpochMilli();
		    Date currentDate = new Date();
		    int id = Integer.parseInt(req.getParameter("taskId"));
		    String currentUserid = (String)session.getAttribute("currentUserid"); 
		    String assignedby = currentUserName+" ("+currentUserid+") ";
	    	String userStatus = req.getParameter("user_status");
		    String assignedto = req.getParameter("reAssigned");
		    String taskStatus = req.getParameter("task_status");
		    String remark = req.getParameter("remark");
		    String category = req.getParameter("category");
		    if(category==null || category.isEmpty())
		    {
		    	List<Tasks> list = taskService.showTask(id);
	        	Iterator<Tasks> itr = list.iterator();
	        	while(itr.hasNext())
	        	{
	        		Tasks tk = itr.next();
	        		category = tk.getCategory();
	        	}
		    }
		    th.setTask_id(id);
		    th.setModifyBy(assignedby);
		    th.setModifyDate(currentDate);
		    th.setDescription(req.getParameter("description"));
		    String updates="";
		    r.setRemarkDate(currentDate);
		    if(req.getParameter("remark") == null || req.getParameter("remark").isEmpty() && !file.getOriginalFilename().isEmpty() )
		    {
		    	remark = "Auto Generated : File uploaded";
		    }
		     if(userStatus!= null)
		       {	
		    	
			    if(userStatus.equalsIgnoreCase("Accept"))
			    {
			    	taskStatus = "Work in progress";
			    	taskService.updateTaskStatus(taskStatus,id);
			    	r.setRemark(remark);
			    	r.setTask_id(id);
			    	r.setWrittenby(currentUserName);  
			    }
			    else if(userStatus.equalsIgnoreCase("Need clarification"))
			    {
			        taskStatus = "Pending";	
			    	if(!assignedto.isEmpty())
			    	{
			    		taskService.updateTaskStatus(taskStatus, id, assignedby, assignedto);	
			    	}
			    	r.setRemark(remark);
			    	r.setWrittenby(currentUserName);
			    	r.setTask_id(id);
			    }
		        else
		        {
		        	String taskStatuscurrent = null;
		        List<Tasks> l1 = taskService.showTask(id);
		        Iterator<Tasks> itr = l1.iterator();
		        while(itr.hasNext())
		        {
		        	Tasks task = itr.next();
		        	userStatus = task.getUser_status();
		        	taskStatuscurrent = task.getTask_status();
		        }
		        if(!assignedto.isEmpty())
		    	{   
		        	taskService.updateTaskStatus(taskStatuscurrent, id, assignedby, assignedto);
		    	}
		    	r.setRemark(remark);
		    	r.setWrittenby(currentUserName);
		    	r.setTask_id(id);
		        }  
		      }
		    else
		    {  
		    	String currentTaskStatus ="";
		         if(taskStatus == null || taskStatus.isEmpty()) 
		         {
			        List<Tasks> l1 = taskService.showTask(id);
			        Iterator<Tasks> itr = l1.iterator();
			        while(itr.hasNext())
			        {  
			        	Tasks task = itr.next();
			        	userStatus = task.getUser_status();
			        	currentTaskStatus = task.getTask_status();
			        }
		         }
		        if(assignedto != null && !assignedto.isEmpty())
		    	{   
		        	List<Roles> rollist = userService.showRole(currentUserid);
		        	Iterator<Roles> itr = rollist.iterator();
		        	
		        	while(itr.hasNext())
		        	{
		        		itr.next();
			        	if(currentTaskStatus.equalsIgnoreCase("Complete") )
			        	{
			        		currentTaskStatus = "Work in progress";
			        	}
		        	}
		        	taskService.updateTaskStatus(currentTaskStatus, id, assignedby, assignedto);
		    	} 
		    	r.setRemark(remark);
		    	r.setWrittenby(currentUserName);
		    	r.setTask_id(id);
		    }
		     if(taskStatus != null && !taskStatus.isEmpty())
		     {   
		    	
		    	 if(taskStatus.equalsIgnoreCase("Complete"))
		           {
		    	    taskStatus = req.getParameter("task_status");
		    	    List<Tasks> list = taskService.showTask(id);
		        	Iterator<Tasks> itr = list.iterator();
		        	while(itr.hasNext())
		        	{
		        		Tasks tk = itr.next();
		        		assignedto = tk.getAssignedTo();
		        		assignedby = tk.getAssignedBy();
		        		userStatus = tk.getUser_status();
		        	}
			    	taskService.updateTaskStatus(taskStatus, id, assignedby, assignedto);
			        taskService.reOpenTaskUpdate(currentUserName, id, currentDate);
			    	r.setRemark(remark);
			    	r.setWrittenby(currentUserName);
			    	r.setTask_id(id);
		           }
		           else if(taskStatus.equalsIgnoreCase("Re-open"))
			       {  
		        	taskStatus = req.getParameter("task_status");
		        	List<Tasks> list = taskService.showTask(id);
		        	Iterator<Tasks> itr = list.iterator();
		        	while(itr.hasNext())
		        	{
		        		Tasks tk = itr.next();
		        		assignedto = tk.getAssignedTo();
		        		assignedby = tk.getAssignedBy();
		        	}
			    	taskService.updateTaskStatus(taskStatus, id, assignedby, assignedto);
			        taskService.reOpenTaskUpdate(currentUserName, id, currentDate);
			    	r.setRemark(remark);
			    	r.setWrittenby(currentUserName);
			    	r.setTask_id(id);
			       }
			       else if(taskStatus.equalsIgnoreCase("Close"))
			        { 
			    	   assignedto ="";
			    	    taskStatus = req.getParameter("task_status");
			    	    int reopen_id = 0;
				     
				    	List closetask = taskService.closeTaskbyId(id);
				    	Iterator itr = closetask.iterator();
				    	while(itr.hasNext())
				    	{
				    		ReOpen_tasks rp = (ReOpen_tasks) itr.next();
				    		reopen_id = rp.getId();
				    		
				    	}
				    	if(reopen_id!=0)
				    	{ 
				    		taskService.deleteClose(reopen_id);
				    		
				    	}
				    	
				    	rpt.setClosedBy(currentUserName);
			        	rpt.setClosed_date(currentDate);
			        	rpt.setStatus(10);
			        	rpt.setTask_id(id);
			        	
				    	taskService.updateTaskStatus(taskStatus, id, assignedby, assignedto);
				    	taskService.saveClosetask(rpt);
				    	r.setRemark(remark);
				    	r.setWrittenby(currentUserName);
				    	r.setTask_id(id);
			    	    
			      }     
		     }
		     if(!remark.isEmpty())
		     {
		      taskService.remarkSave(r);
		     }
		     if(req.getParameter("remark")!= null && !req.getParameter("remark").isEmpty())
			    {
			      updates ="Remark update No. "+r.getId() +",";
			    }
			    if(req.getParameter("task_status")!= null && !req.getParameter("task_status").isEmpty())
			    {
			      updates =updates+" Task Status update to "+req.getParameter("task_status")+",";
			    }
			    if(req.getParameter("reAssigned")!= null && !req.getParameter("reAssigned").isEmpty())
			    {
			    	
			      updates = updates+" Task ReAssigned to "+req.getParameter("reAssigned") +",";
			    }
			    if(req.getParameter("user_status")!= null && !req.getParameter("user_status").isEmpty())
			    {
			      updates = updates+" user_status is "+req.getParameter("user_status") +",";
			    }
			    if(req.getParameter("category")!= null && !req.getParameter("category").isEmpty())
			    {
			      updates = updates+" Category change to "+req.getParameter("category") +",";
			    }
			    if( !file.getOriginalFilename().isEmpty())
			    {
			    	updates = updates+" File upload Remark no."+r.getId();
			    }
			    if(!updates.isEmpty() && updates != null)
			    {
			    	th.setUpdates(updates);
				    taskService.saveTaskHistory(th);
			    }
			    
			if(!file.getOriginalFilename().isEmpty())
			{
			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setSizeThreshold(THRESHOLD_SIZE);
			   factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   ServletContext context = sess.getServletContext();
			   String uploadPath = context.getRealPath(UPLOAD_DIRECTORY);
			   byte[] bytes = file.getBytes();
			   String filename = file.getOriginalFilename().split("\\.")[0];
			   String extensen = file.getOriginalFilename().split("[.]")[1];
			   BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(uploadPath + File.separator + filename+timemili+"."+extensen)));
			   stream.write(bytes);
			   stream.flush();
			   stream.close();	
			   uploadFile.setName(filename+timemili+"."+extensen);
			   uploadFile.setData(bytes);
			   uploadFile.setRemark_id(r.getId());
	   	       taskService.saveFile(uploadFile);
			}
			taskService.updateUserStatus(userStatus,id,currentDate,category);
			m.addAttribute("taskId", id);
			url="redirect:/taskStatus/{taskId}";
	      }
	       catch(Exception ex)
		 	 {  	ex.printStackTrace();
			  	m.addAttribute("ex",ex);
				url="exception";
			 }
		    }
		return url;
	}
	
	
	//------------------------------------Filter-----------------------------------------
	  
	    @RequestMapping("/filterMomOperation")
	    public String filterMomOperation(HttpServletRequest request,Model m) throws ParseException
	    {
		 String url="";
		   try {
		   HttpSession session = request.getSession(false);
	       String currentUserName = (String)session.getAttribute("currentUserName"); 
	       m.addAttribute("user", currentUserName);
		   
	        String from = request.getParameter("from");
	    	String to = request.getParameter("to");
	    	String spoc = request.getParameter("spoc");
	    	String attendee = request.getParameter("attendee");
	    	String stackHolder = request.getParameter("stackHolder");
		   
		   m.addAttribute("momList",taskService.filterMom(from,to,spoc,attendee,stackHolder));
		    url="showMoM";
		   }
		   catch(Exception ex)
		   {
				m.addAttribute("ex",ex);
				url="exception";
		   }
			return url;
	    }
	
	    @RequestMapping("/filterTask")
	    public String filterTask(HttpServletRequest request,Model m) throws ParseException
	    {
	        HttpSession session = request.getSession(false);
	    	String currentUserName = (String)session.getAttribute("currentUserName"); 
	    	m.addAttribute("user", currentUserName);
	    	String from = request.getParameter("from");
	    	String to = request.getParameter("to");
	    	String task_status = request.getParameter("Task_status");
	    	String priority = request.getParameter("priority");
	    	String assingedto = request.getParameter("assignedTo");
	    	String assignedby = request.getParameter("assignedBy");
	    	String createdby = request.getParameter("createdBy");
	    	String category = request.getParameter("category");
	    	
	    	if(from.isEmpty()  || to.isEmpty())
	    	{
	    		LocalDate date = LocalDate.now();  
	    		to = date.toString();
	    		from = date.minusMonths(3).toString();
	    	}
	    	List<User> filterList = taskService.filterTasks(from,to,task_status,priority,assingedto,assignedby,createdby,category);
	    	m.addAttribute("filterList", filterList);
	    	return "ShowFilterResult";
	      }
	/*-------------------------Download file's-----------------------------*/
	    
	    @RequestMapping("/taskStatus/fileName/{key}")
		void adminDownloadFile(@PathVariable int key,HttpServletResponse response,HttpServletRequest request,HttpSession sess) throws MalformedURLException, IOException
		{	
			String filename = null;
			List <Fileupload> fname = taskService.getFiledetail(key);
			Iterator<Fileupload> itr = fname.iterator();
			while(itr.hasNext())
			{
				Fileupload fl = itr.next();
				filename = fl.getName();
			}
			try
			{
		    ServletContext context = request.getServletContext();
            String appPath = context.getRealPath("");
            String fullPath = appPath +"/files/"+filename;      
            File downloadFile = new File(fullPath);
            FileInputStream inputStream = new FileInputStream(downloadFile);
            String mimeType = context.getMimeType(fullPath);
            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
            response.setHeader(headerKey, headerValue);
            OutputStream outStream = response.getOutputStream();
            byte[] buffer = new byte[THRESHOLD_SIZE];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) 
            {
               outStream.write(buffer, 0, bytesRead);
            }
              inputStream.close();
              outStream.close();
			}
			catch(Exception ex)
			{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.print("<center><b>File Does Not Exist!!</b></center>");
			}
		}
	    
	    
	    @RequestMapping("/momDesc/fileName/{id}")
		void momFile(@PathVariable int id,HttpServletResponse response,HttpServletRequest request,HttpSession sess) throws MalformedURLException, IOException
		{	
	    	
			String filename = null;
			List <Fileupload> fname = taskService.getFiledetail(id);
			Iterator<Fileupload> itr = fname.iterator();
			while(itr.hasNext())
			{
				Fileupload fl = itr.next();
				filename = fl.getName();
				
			}
			try
			{
		    ServletContext context = request.getServletContext();
            String appPath = context.getRealPath("");
            String fullPath = appPath +"/files/"+filename;      
            File downloadFile = new File(fullPath);
            FileInputStream inputStream = new FileInputStream(downloadFile);
            String mimeType = context.getMimeType(fullPath);
            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
            response.setHeader(headerKey, headerValue);
            OutputStream outStream = response.getOutputStream();
            byte[] buffer = new byte[THRESHOLD_SIZE];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) 
            {
               outStream.write(buffer, 0, bytesRead);
            }
              inputStream.close();
              outStream.close();
			}
			catch(Exception ex)
			{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.print("<center><b>File Does Not Exist!!</b></center>");
			}
		}
}
