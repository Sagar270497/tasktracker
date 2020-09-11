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
import com.task.model.Roles;
import com.task.model.User;

@Repository
public class UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List getIpAddress(String ip)
	{
		    Session currentSession=sessionFactory.getCurrentSession();
			Query query = currentSession.createQuery("from IpAllow where ipAddress=:ip");
			query.setParameter("ip",ip);
			return query.getResultList();
	}
	
	public List<User> login(User u)
	{
	    Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from User t where t.id=:id and t.password=:pass");
		query.setParameter("id",u.getId());
		query.setParameter("pass", u.getPassword());	
		return query.getResultList();
	}
	public List<AllRoles> showRoles(User u)
	{    Session currentSession=sessionFactory.getCurrentSession();
	     Query query = currentSession.createQuery("from AllRoles where id in (select role from Roles r where r.user_id=:id and r.role='9')");
	     query.setParameter("id",u.getId());
		return query.getResultList();
	}
	
	public List showAllRoles(User u)
	{
		 Session currentSession=sessionFactory.getCurrentSession();
	     Query query = currentSession.createQuery("select role from AllRoles where id in (select role from Roles r where r.user_id=:id)");
	     query.setParameter("id",u.getId());
		return query.getResultList();
	}
	public void usersave(User u)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.save(u);	
	}
	public List<User> showUser(String name)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from User u where u.user_name !=:name AND status=1 ORDER BY lower(user_name) ASC");
		query.setParameter("name",name);
		
		return query.getResultList();
	}
	public List<User> showUserList()
	{
		
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from User ORDER BY lower(user_name) ASC");
		
		return query.getResultList();
	}
	
	public List<Object> showUserList(String id)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		org.hibernate.Query query= currentSession.createSQLQuery("select user_name,id from user10000 where id in (select distinct(user_id) from user_roles where role='9' or user_id not in(select user_id from user_roles where role  in(select role from user_roles where user_id=:id)))");
		query.setParameter("id",id);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		
		return query.getResultList();
	}
	public List<Object> showAdminList()
	{
		Session currentSession=sessionFactory.getCurrentSession();
		org.hibernate.Query query= currentSession.createSQLQuery("select user_name,id from user10000 where id in (select distinct(user_id) from user_roles where role='9' )");
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);	
		return query.getResultList();
	}
	public List<AllRoles> showRoles(String id)
	{
		
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("select role from AllRoles where id in (select r.role from Roles r where r.user_id=:id)");
		query.setParameter("id",id);
		return query.getResultList();
	}
	
	public List<Roles> showRole(String id)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("select r.role from Roles r where r.user_id=:id AND r.role='9' ");
		query.setParameter("id",id);
		
		return query.getResultList();
	}
	
	public List<User> show(String id)
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from User ur where ur.id=:id");
		query.setParameter("id",id);	
		return query.getResultList();	
	}
	public void updateSave(Roles r)
	{
		Session currentSession=sessionFactory.getCurrentSession();	
		currentSession.save(r);
	}
	
	public List showRoles()
	{
		Session currentSession=sessionFactory.getCurrentSession();	
		Query query = currentSession.createQuery("from AllRoles ORDER BY role ASC ");
		return query.getResultList();
	}
	
	public void removeRole(String user_id)
	{	
		Session currentSession=sessionFactory.getCurrentSession();	
		Query query = currentSession.createQuery("delete from Roles rl where rl.user_id=:id");
		query.setParameter("id",user_id);
		query.executeUpdate();
	}
	public void updatePassword(String id ,String password)
	{
		Date date = new Date();
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("update User ur set ur.password=:password,ur.pass_Modify_Date=:date where ur.id=:id ");
		query.setParameter("password", password);
		query.setParameter("id",id);
		query.setParameter("date",date);
		query.executeUpdate();
	}
	public List<Object> showUserByRole(String []roles)
	{
		Session currentSession=sessionFactory.getCurrentSession();	
		int i=0;		
		String tq ="select user_name,id from user10000 u where id in (select distinct(user_id) from user_roles where role like '%' ) ";
		for(i=0; i<roles.length;i++)
		{
			tq=tq+"And id in (select distinct(user_id) from user_roles where role like '%"+roles[i]+"' )";
		}
		org.hibernate.Query query= currentSession.createSQLQuery(tq);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);	
		return query.getResultList();	 
	}
	
	public List getExpiryDay()
	{
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("select d.days from PasswordExpiryDays d");
		
		
		return query.getResultList();
	}

	public void setPassword(String id)
	{
		
		Session currentSession=sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("update User ur set ur.password=:password where ur.id=:id ");
		query.setParameter("password","12345");
		query.setParameter("id",id);
		query.executeUpdate();
	}

	
	
	
}
