package com.task.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.task.dao.UserDao;
import com.task.model.AllRoles;
import com.task.model.Roles;
import com.task.model.Tasks;
import com.task.model.User;

@Service
public class UserService {
	
	@Autowired
	UserDao userdao;
	
	@Transactional
	public List<User> login(User u)
	{
		return userdao.login(u);
	}
	
	@Transactional
	public List getIpAddress(String ip)
	{
		return userdao.getIpAddress(ip);
	}
	@Transactional
	public List<AllRoles> showRoles(User u)
	{
		return userdao.showRoles(u);
	}
	
	@Transactional
	public List showAllRoles(User u)
	{
		return userdao.showAllRoles(u);
	}
	@Transactional
	public void usersave(User u)
	{
		userdao.usersave(u);
	}
	
	@Transactional
	public void updateSave(Roles r)
	{
		userdao.updateSave(r);
	}
	
	@Transactional
	public void removeRole(String user_id)
	{
		userdao.removeRole(user_id);
	}
	
	
	@Transactional
	public List showRoles()
	{
		return userdao.showRoles();
	}
	
	@Transactional
	public List<AllRoles> showRoles(String id)
	{
		return userdao.showRoles(id);
	}
	@Transactional
	public List<Roles> showRole(String id)
	{
		return userdao.showRole(id);
	}
	@Transactional
	public List<User> showUser(String name)
	{
	      return userdao.showUser(name);
	}
	
	@Transactional
	public List<User> showUserList()
	{
		 return userdao.showUserList();
	}
	
	@Transactional
	public List<Object> showUserList(String id)
	{
		return userdao.showUserList(id);
	}
	
	@Transactional
	public List<Object> showAdminList()
	{
		return userdao.showAdminList();
		
	}
	
	@Transactional
	public void updatePassword(String id ,String password)
	{
		 userdao.updatePassword(id, password);
	}
	
	@Transactional
	public List<User> show(String id)
	{
		return userdao.show(id);
	}
	@Transactional
	public List<Object> showUserByRole(String []roles)
	{
	    return 	userdao.showUserByRole(roles);
	}
	
	@Transactional
	public List getExpiryDay()
	{
		 return userdao.getExpiryDay();
	}

	@Transactional
	public void setPassword(String id) 
	{
		
		userdao.setPassword(id);
		
	}

	
	

}
