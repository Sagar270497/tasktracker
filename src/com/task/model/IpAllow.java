package com.task.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name="ipSeq", initialValue=1, allocationSize=1)
public class IpAllow 
{

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="ipSeq")
	int id;
	
	
	String ipAddress;

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getIpAddress() {
		return ipAddress;
	}


	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}


	@Override
	public String toString() {
		return "IpAllow [id=" + id + ", ipAddress=" + ipAddress + "]";
	}

	

}
