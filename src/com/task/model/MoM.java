package com.task.model;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Minites_Of_Meeting")
public class MoM {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Temporal(TemporalType.TIMESTAMP)
	Date momCreatedDate;
	java.sql.Date momDate;
	
	String primaryScop,otherTcsAttendee,otherStackHolder,stackHolderDetail,momDetail,requireAction,momDesc;

	public String getMomDesc() {
		return momDesc;
	}

	public void setMomDesc(String momDesc) {
		this.momDesc = momDesc;
	}

	public Date getMomCreatedDate() {
		return momCreatedDate;
	}

	public void setMomCreatedDate(Date momCreatedDate) {
		this.momCreatedDate = momCreatedDate;
	}

	public java.sql.Date getMomDate() {
		return momDate;
	}

	public void setMomDate(java.sql.Date momDate) {
		this.momDate = momDate;
	}

	public String getPrimaryScop() {
		return primaryScop;
	}

	public void setPrimaryScop(String primaryScop) {
		this.primaryScop = primaryScop;
	}

	public String getOtherTcsAttendee() {
		return otherTcsAttendee;
	}

	public void setOtherTcsAttendee(String otherTcsAttendee) {
		this.otherTcsAttendee = otherTcsAttendee;
	}

	public String getOtherStackHolder() {
		return otherStackHolder;
	}

	public void setOtherStackHolder(String otherStackHolder) {
		this.otherStackHolder = otherStackHolder;
	}

	public String getStackHolderDetail() {
		return stackHolderDetail;
	}

	public void setStackHolderDetail(String stackHolderDetail) {
		this.stackHolderDetail = stackHolderDetail;
	}

	public String getMomDetail() {
		return momDetail;
	}

	public void setMomDetail(String momDetail) {
		this.momDetail = momDetail;
	}

	public String getRequireAction() {
		return requireAction;
	}

	public void setRequireAction(String requireAction) {
		this.requireAction = requireAction;
	}

	@Override
	public String toString() {
		return "MoM [id=" + id + ", momCreatedDate=" + momCreatedDate + ", momDate=" + momDate + ", primaryScop="
				+ primaryScop + ", otherTcsAttendee=" + otherTcsAttendee + ", otherStackHolder=" + otherStackHolder
				+ ", stackHolderDetail=" + stackHolderDetail + ", momDetail=" + momDetail + ", requireAction="
				+ requireAction + "]";
	}
	
	
	
}
