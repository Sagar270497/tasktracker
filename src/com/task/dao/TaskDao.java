package com.task.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.task.model.AllRoles;
import com.task.model.Fileupload;
import com.task.model.MoM;
import com.task.model.ReOpen_tasks;
import com.task.model.Remarks;
import com.task.model.Task_History;
import com.task.model.Tasks;

@Repository
public class TaskDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void createTask(Tasks t)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(t);
	}
	
	public void createRole(AllRoles roles)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(roles);
	}
	
	public List showTasks(String id)
	{   
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Tasks t where t.createdBy like concat('%',:id,'%')  ORDER BY t.taskId DESC");
		query.setParameter("id",id);
		return query.getResultList();
	}
	public List showActiveTasks()
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Tasks t where t.task_status!='Close'  ORDER BY t.taskId DESC");
		return query.getResultList();
	}
	
	public List assignedTask(String id)
	{  
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Tasks t where t.assignedTo like concat('%',:id,'%')  ORDER BY t.taskId DESC");
		query.setParameter("id",id);
		query.getResultList();
		return query.getResultList();
	}
	
	public List<Tasks> showTask(int taskId)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Tasks t where t.taskId=:taskId ");
		query.setParameter("taskId",taskId);
		return query.getResultList();
	}
	
	public void updateUserStatus(String userStatus, int id,Date date,String category)
	{
		System.out.println(category);
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("update Tasks t set t.user_status=:userStatus, t.lastModifyDate=:lastModifyDate, t.category=:category where t.taskId=:id");
		query.setParameter("userStatus",userStatus);
		query.setParameter("lastModifyDate",date);
		query.setParameter("category",category);
		query.setParameter("id",id);
		query.executeUpdate();	
	}
	
	public List filterTasks(String from,String to, String task_status,String priority,String assignedto,String assignedby,String createdby,String category)
	{
		
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = null;
		
	    if(task_status.equals("Re-open"))
		{
			query = currentSession.createQuery("from Tasks t where t.taskId in (select distinct(r.task_id) from ReOpen_tasks r where r.status = 20) ORDER BY t.taskId DESC");	
		}
	    else if(task_status.equals("Close"))
	    {
	    	query = currentSession.createQuery("from Tasks t where t.taskId in (select distinct(r.task_id) from ReOpen_tasks r where r.status = 10) ORDER BY t.taskId DESC");	
	    }
		else
		{
			if(!task_status.isEmpty())
			{
			if(task_status.equalsIgnoreCase("Pending (Need clarification)"))
			{
				task_status = "Pending";
			}
			
			query = currentSession.createQuery("from Tasks t where t.createdBy like concat('%',:createdby,'%') and t.task_status like concat('%',:task_status,'%') and t.assignedBy like concat('%',:assignedby,'%') and t.assignedTo like concat('%',:assignedto,'%') and t.priority like concat(:priority,'%') and t.category like concat(:category,'%') and createDate between to_date(:from,'YYYY-MM-DD') and to_date(:to,'YYYY-MM-DD') ORDER BY t.taskId DESC");
			query.setParameter("createdby",createdby);
			query.setParameter("task_status",task_status);
			query.setParameter("assignedby",assignedby);
			query.setParameter("assignedto",assignedto);
			query.setParameter("priority",priority);
			query.setParameter("category",category);
			query.setParameter("from",from);
			query.setParameter("to",to);
			}
			else if(assignedto.isEmpty())
			{
				query = currentSession.createQuery("from Tasks t where t.createdBy like concat('%',:createdby,'%') and t.assignedBy like concat('%',:assignedby,'%') and t.priority like concat(:priority,'%') and t.category like concat(:category,'%') and createDate between to_date(:from,'YYYY-MM-DD') and to_date(:to,'YYYY-MM-DD') ORDER BY t.taskId DESC");
				query.setParameter("createdby",createdby);
				query.setParameter("assignedby",assignedby);
				query.setParameter("priority",priority);
				query.setParameter("category",category);
				query.setParameter("from",from);
				query.setParameter("to",to);
			}
			else
			{
				query = currentSession.createQuery("from Tasks t where t.createdBy like concat('%',:createdby,'%') and t.assignedBy like concat('%',:assignedby,'%') and t.assignedTo like concat('%',:assignedto,'%') and t.priority like concat(:priority,'%') and t.category like concat(:category,'%') and createDate between to_date(:from,'YYYY-MM-DD') and to_date(:to,'YYYY-MM-DD') ORDER BY t.taskId DESC");
				query.setParameter("createdby",createdby);
				query.setParameter("assignedby",assignedby);
				query.setParameter("assignedto",assignedto);
				query.setParameter("priority",priority);
				query.setParameter("category",category);
				query.setParameter("from",from);
				query.setParameter("to",to);
			}
		}
		return query.getResultList();
	}
	public void updateTaskStatus(String taskStatus, int id, String assignedby, String assignedto)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("update Tasks t set t.task_status=:taskStatus , t.assignedTo=:assignedto, t.assignedBy=:assignedby where t.taskId=:id");
		query.setParameter("taskStatus",taskStatus);
		query.setParameter("assignedto",assignedto);
		query.setParameter("assignedby",assignedby);
		query.setParameter("id",id);
		query.executeUpdate();
	}
	public void updateTaskStatus(String taskStatus, int id)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("update Tasks t set t.task_status=:taskStatus where t.taskId=:id ");
		query.setParameter("taskStatus",taskStatus);
		query.setParameter("id",id);
		query.executeUpdate();
	}
	public void remarkSave(Remarks r)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(r);
	}
	public void saveClosetask(ReOpen_tasks rpt)
	{
		 Session currentSession=sessionFactory.getCurrentSession();
		 currentSession.save(rpt);
	}
	public void reOpenTaskUpdate(String reOpenedBy, int task_id,Date reOpendDate)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("update ReOpen_tasks rpt set rpt.status=20, rpt.reOpenedBy=:reOpenedBy, rpt.reOpendDate=:reOpendDate where rpt.status=10 AND rpt.task_id=:task_id");
		query.setParameter("reOpendDate",reOpendDate);
		query.setParameter("reOpenedBy",reOpenedBy);
		query.setParameter("task_id",task_id);
		query.executeUpdate();
		
	}
    public void saveFile(Fileupload filedata)
	{
		     Session currentSession=sessionFactory.getCurrentSession();
		     currentSession.save(filedata); 
    }
    public List<Object> showfiles(int id)
	{
	     Session currentSession=sessionFactory.getCurrentSession();
	    
	     org.hibernate.Query query = currentSession.createSQLQuery("select r.id , f.file_name from Remark1000 r inner join Fileupload f on r.id=f.remark_id where r.task_id=:task_id ORDER BY r.id DESC");
	     query.setParameter("task_id",id);
	     query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
	     return query.getResultList();	   
	}
    public List<Remarks> showRemarks(int id)
   	{
   	        Session currentSession=sessionFactory.getCurrentSession();  	  
    	    Query query = currentSession.createQuery("from Remarks r where r.task_id=:task_id  AND remark IS NOT NULL  ORDER BY r.id DESC");
        	query.setParameter("task_id",id);  	
   	        return query.getResultList();
   	}
     public List showfileName(int id)
     {    	
	   	Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Remarks r where r.id=:id ");
		query.setParameter("id",id);
	    return query.getResultList();
	  }
    public List getFileName(int num)
    {
    	Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Fileupload f where f.id=:id ");
		query.setParameter("id",num);	
	    return query.getResultList();
    }
    public List getFiledetail(int num)
    {
    	Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery(" from Fileupload f where f.remark_id=:id ");
		query.setParameter("id",num);
	    return query.getResultList();
    }
	public List showDescription(String description) {
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery(" from Tasks t where lower(t.taskId) like concat('%',:description,'%') OR lower(t.description) like concat('%',:description,'%') OR lower(t.taskId) in(select r.task_id from Remarks r where lower(r.remark) like concat('%',:description,'%'))");
		
		query.setParameter("description",description);
	    return query.getResultList();
	}
	public void saveTaskHistory(Task_History th) 
	{
		 Session currentSession=sessionFactory.getCurrentSession();
	     currentSession.save(th); 
	}
	public List showRecentUpdates() {
		Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Task_History order by modifyDate desc");
	   	query.setMaxResults(15);
	    return query.getResultList();
	}

	public List showRecentCreated() {
		Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Task_History where updates like '%Task Created By%' order by modifyDate desc");
	   	query.setMaxResults(15);
	    return query.getResultList();
	}

	public List showRecentClosed() {
		Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Task_History where updates like '%Task Status update to Close%' order by modifyDate desc");
	   	query.setMaxResults(15);
	    return query.getResultList();
	}
	
    public List showRecentComplete() 
    {
		Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Task_History where updates like '%Task Status update to Complete%' order by modifyDate desc");
	   	query.setMaxResults(15);
	    return query.getResultList();
	}
	
	public List closeTaskbyId(int id) {
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from ReOpen_tasks  where task_id=:id and status='20' ");
		query.setParameter("id",id);
	    return query.getResultList();
		
	}
	public void deleteClose(int reopen_id) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("delete from ReOpen_tasks  where id=:reopen_id");
		query.setParameter("reopen_id",reopen_id);
		query.executeUpdate();
	}


	public List showTaskDetail(int taskId)
	{
		Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Task_History where task_id=:id order by modifyDate desc");
	   	query.setParameter("id",taskId);
	    return query.getResultList();
	}
	public List showCompaniesName() 
	{
		Session currentSession=sessionFactory.getCurrentSession();
	   	Query query = currentSession.createQuery("from Companies_name");
	    return query.getResultList();
	}
	public List showTcsDevelopers()
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from User u where company=:company");
		query.setParameter("company","TCS");
	    return query.getResultList();
	}
	public void saveMom(MoM mom) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(mom);
	}

	public List showMom() 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from MoM order by momCreatedDate desc");
		query.setMaxResults(20);
		
	    return query.getResultList();
	}

	public List showMomById(int id) {
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from MoM m where m.id=:id");
		query.setParameter("id",id);
	    return query.getResultList();
	}

	public List showfilesByMoMId(int id) {
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Fileupload f where f.remark_id=:id");
		query.setParameter("id",id);
		
	    return query.getResultList();
	}

	public List filterMom(String from, String to, String spoc, String attendee, String stackHolder) 
	{     
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from MoM m where m.primaryScop like concat('%',:spoc,'%') and m.otherTcsAttendee like concat('%',:attendee,'%') and m.otherStackHolder like concat('%',:stackHolder,'%')  and momCreatedDate between to_date(:from,'YYYY-MM-DD') and to_date(:to,'YYYY-MM-DD') ORDER BY m.id DESC");
		query.setParameter("from",from);
		query.setParameter("to",to);
		query.setParameter("spoc",spoc);
		query.setParameter("attendee",attendee);
		query.setParameter("stackHolder",stackHolder);
		return query.getResultList();
	}

	public List searchMom(String lowerCase) 
	{
		Session currentSession=sessionFactory.getCurrentSession();
		System.out.println(lowerCase);
		Query query = currentSession.createQuery("from MoM m where lower(m.primaryScop) like concat('%',:description,'%') OR lower(m.otherTcsAttendee) like concat('%',:description,'%') OR lower(m.otherStackHolder) like concat('%',:description,'%') OR lower(m.stackHolderDetail) like concat('%',:description,'%') OR lower(m.momDetail) like concat('%',:description,'%') OR lower(m.requireAction) like concat('%',:description,'%') OR lower(m.momDesc) like concat('%',:description,'%')");
		query.setParameter("description",lowerCase);
	
	    return query.getResultList();
	}

}

