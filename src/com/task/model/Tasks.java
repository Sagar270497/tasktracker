package com.task.model;



import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tasks1000")
public class Tasks {
	
	@Id
    @GeneratedValue(strategy=GenerationType.TABLE)
	int taskId;
	
	@Column(nullable=false)
	Date expectDate;
	
	Date createDate, lastModifyDate;
	
	@Column(nullable=false)
	String  priority;
	
	@Column(nullable=false,columnDefinition="varchar(1000)")
	String description;
	
	String assignedBy,user_status, task_status, createdBy,assignedTo,category;

    

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	
	public Date getExpectDate() {
		return expectDate;
	}

	public void setExpectDate(Date expectDate) {
		this.expectDate = expectDate;
	}

	public String getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(String assignedBy) {
		this.assignedBy = assignedBy;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getTask_status() {
		return task_status;
	}

	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}

	@Override
	public String toString() {
		return "Tasks [taskId=" + taskId + ", expectDate=" + expectDate + ", createDate=" + createDate
				+ ", lastModifyDate=" + lastModifyDate + ", priority=" + priority + ", description=" + description
				+ ", assignedBy=" + assignedBy + ", user_status=" + user_status + ", task_status=" + task_status
				+ ", createdBy=" + createdBy + ", assignedTo=" + assignedTo + ", category=" + category + "]";
	}
	
	

}
