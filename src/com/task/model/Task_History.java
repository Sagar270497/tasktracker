package com.task.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@SequenceGenerator(name="histseq", initialValue=1, allocationSize=1)
public class Task_History {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="histseq")
	int id;
	
	String modifyBy,updates;
	
	@Column(nullable=false,columnDefinition="varchar(1000)")
	String description;
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	int task_id;
	
	@Temporal(TemporalType.TIMESTAMP)
	Date modifyDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(String modifyBy) {
		this.modifyBy = modifyBy;
	}

	public String getUpdates() {
		return updates;
	}

	public void setUpdates(String updates) {
		this.updates = updates;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "Task_History [id=" + id + ", modifyBy=" + modifyBy + ", updates=" + updates + ", description="
				+ description + ", task_id=" + task_id + ", modifyDate=" + modifyDate + "]";
	}

	
	
	
	

}
