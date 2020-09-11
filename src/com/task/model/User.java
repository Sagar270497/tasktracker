package com.task.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="user10000")
public class User {
	
	@Id
	String id;
	
	@Column
	String contact_no;
	
	@Column
	String user_name,password,company, e_mail;
	
	int status;
	
	Date pass_Modify_Date;
	
	public Date getPass_Modify_Date() {
		return pass_Modify_Date;
	}

	public void setPass_Modify_Date(Date pass_Modify_Date) {
		this.pass_Modify_Date = pass_Modify_Date;
	}

	


	

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}


	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



}
