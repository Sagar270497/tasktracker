package com.task.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name="roleSequence", initialValue=1, allocationSize=1)
public class AllRoles 
{
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="roleSequence")
	int id;
	
	String role;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "AllRoles [id=" + id + ", role=" + role + "]";
	}
      
	

}
