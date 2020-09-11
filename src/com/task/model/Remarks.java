package com.task.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="remark1000")
@SequenceGenerator(name="remarkseq", initialValue=4019, allocationSize=1)
public class Remarks {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="remarkseq")
	int id;
	
	
	@Column(name="task_id",nullable=false)
	int task_id;
	
	@Temporal(TemporalType.TIMESTAMP)
	Date remarkDate;
	

	@Column(columnDefinition="varchar(1000)")
	String  remark;
	
	String writtenby ;
	

	public String getWrittenby() {
		return writtenby;
	}

	public void setWrittenby(String writtenby) {
		this.writtenby = writtenby;
	}

   

	public Date getRemarkDate() {
		return remarkDate;
	}

	public void setRemarkDate(Date remarkDate) {
		this.remarkDate = remarkDate;
	}

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	
	
	

}
