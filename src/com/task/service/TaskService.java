package com.task.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.task.dao.TaskDao;
import com.task.model.AllRoles;
import com.task.model.Fileupload;
import com.task.model.MoM;
import com.task.model.ReOpen_tasks;
import com.task.model.Remarks;
import com.task.model.Task_History;
import com.task.model.Tasks;

@Service
public class TaskService {
	
	@Autowired
	TaskDao taskDao;
	
	
	@Transactional
	public List assignedTask(String id)
	{
		return taskDao.assignedTask(id);
	}
	
	@Transactional
	public void createTask(Tasks t)
	{
		taskDao.createTask(t);
	}
	
	@Transactional
	public List showActiveTasks()
	{
		return taskDao.showActiveTasks();
		
	}
	
	
	@Transactional
	public void createRole(AllRoles roles)
	{
		 taskDao.createRole(roles);
		
	}
	
	@Transactional
	public List showTasks(String id)
	{
		return taskDao.showTasks(id);
	}
	
	@Transactional
	public List<Tasks> showTask(int id)
	{
		return taskDao.showTask(id);
	}
	
	@Transactional
	public void updateUserStatus( String userStatus, int id,Date date, String category)
	{
		taskDao.updateUserStatus(userStatus, id,date,category);
	}
	
	@Transactional
	public List filterTasks(String from,String to, String task_status,String priority,String assignedto,String assignedby,String createdby,String category)
	{
		return taskDao.filterTasks(from,to,task_status,priority,assignedto,assignedby,createdby,category);
		
	}
	
	@Transactional
	public void updateTaskStatus( String taskStatus, int id,String assignedby,String assignedto)
	{
		taskDao.updateTaskStatus(taskStatus, id,assignedby,assignedto);
	}
	
	@Transactional
	public void saveClosetask(ReOpen_tasks rpt)
	{
	       taskDao.saveClosetask(rpt);	
	}
	
	@Transactional
	public void reOpenTaskUpdate(String reOpenedBy, int task_id,Date reOpendDate)
	{
		taskDao.reOpenTaskUpdate(reOpenedBy, task_id, reOpendDate);
	}
	
	
	@Transactional
	public void updateTaskStatus( String taskStatus, int id)
	{
		taskDao.updateTaskStatus(taskStatus, id);
	}
	
	@Transactional
	public void remarkSave(Remarks r)
	{
	    taskDao.remarkSave(r);
	}
	

	@Transactional
	public void saveFile(Fileupload filedata)
    {
	     taskDao.saveFile(filedata);    
    }
	
    @Transactional
    public List showRemarks(int id)
	{
        return taskDao.showRemarks(id);
	}
    
    @Transactional
    public List showfileName(int id)
    {
    	return taskDao.showfileName(id);
    }
    
    @Transactional
    public List getFileName(int num)
    {
    	return taskDao.getFileName(num);
    }
    
    @Transactional
    public List<Object> showfiles(int id)
   	{	
    	return taskDao.showfiles(id);
   	}
    
    @Transactional
    public List getFiledetail(int num)
    {
    	return taskDao.getFiledetail(num);
    }
    
    @Transactional
	public List showDescription(String description) 
    {
    	return taskDao.showDescription(description);			
	}
    
    @Transactional
	public void saveTaskHistory(Task_History th) {
		taskDao.saveTaskHistory(th);
	}
    
    @Transactional
	public List showRecentUpdates() 
	{
		return taskDao.showRecentUpdates() ;
	}
    
    @Transactional
   	public List showRecentCreated() 
   	{
   		return taskDao.showRecentCreated() ;
   	}
    
    @Transactional
	public List showRecentClosed() {
		
		return taskDao.showRecentClosed() ;
	}
    
    @Transactional
	public List showRecentComplete() {
		
		return taskDao.showRecentComplete() ;
	}
    @Transactional
	public List closeTaskbyId(int id)
	{
		return taskDao.closeTaskbyId(id);
	}
    @Transactional
	public void deleteClose(int reopen_id) 
	{
		taskDao.deleteClose(reopen_id);
	}
    @Transactional
	public List showTaskDetail(int taskId) 
	{
		return taskDao.showTaskDetail(taskId);
	}
    @Transactional
    public List showCompaniesName() 
	{
    	return taskDao.showCompaniesName();
	}
   
    @Transactional
    public List showTcsDevelopers()
	{
    	return taskDao.showTcsDevelopers();
	}
   
    @Transactional
	public void saveMom(MoM mom) {
		taskDao.saveMom(mom);
		
	}
    @Transactional 
	public List showMom() {
		
		return taskDao.showMom();
	}

    @Transactional
	public List showMomById(int id) {
		
		return taskDao.showMomById(id);
	}
    @Transactional
	public List showfilesByMoMId(int id) {
		
		return taskDao.showfilesByMoMId(id);
	}
    
    @Transactional
	public List filterMom(String from, String to, String spoc, String attendee, String stackHolder) {
		return taskDao.filterMom(from,to,spoc,attendee,stackHolder);
	}
    
    @Transactional
	public List searchMom(String lowerCase)
	{
		return taskDao.searchMom(lowerCase);
	}
    
}
