package com.task.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="user_roles")
@SequenceGenerator(name="roleseq", initialValue=3913 , allocationSize=1)
public class Roles {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="roleseq")
	int id;
	
	String role;
	
	String user_id;

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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Roles [id=" + id + ", role=" + role + ", user_id=" + user_id + "]";
	}

	
	

}
