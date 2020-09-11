package com.task.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class PasswordExpiryDays 
{
	@Id
	int id;
	
	int days;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}
	

}
