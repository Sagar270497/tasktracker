package com.task.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@SequenceGenerator(name="reOpenfile", initialValue=10, allocationSize=1)
public class ReOpen_tasks 
{
	@Id
	 @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="reOpenfile")
	int id ;
	
	int task_id,status;
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	String closedBy,reOpenedBy;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	Date closed_date,reOpendDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public String getClosedBy() {
		return closedBy;
	}

	public void setClosedBy(String closedBy) {
		this.closedBy = closedBy;
	}

	public String getReOpenedBy() {
		return reOpenedBy;
	}

	public void setReOpenedBy(String reOpenedBy) {
		this.reOpenedBy = reOpenedBy;
	}

	public Date getClosed_date() {
		return closed_date;
	}

	public void setClosed_date(Date closed_date) {
		this.closed_date = closed_date;
	}

	public Date getReOpendDate() {
		return reOpendDate;
	}

	public void setReOpendDate(Date reOpendDate) {
		this.reOpendDate = reOpendDate;
	}
	
}
