package com.task.model;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
@Entity
@Table(name="fileupload")
@SequenceGenerator(name="fileseq", initialValue=3908, allocationSize=1)
public class Fileupload {
	
	    @Id
	    @Column(name="file_ID")
	    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="fileseq")
	    private int id;
	
	    @Column(name="file_NAME", nullable=false)
	    private String name;
	
	
		@Lob
	    @Column(name="file_data")
	    private byte[] data;
		
		@Column(name="remark_id",nullable=false)
		int remark_id;

		public int getRemark_id() {
			return remark_id;
		}

		public void setRemark_id(int remark_id) {
			this.remark_id = remark_id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public byte[] getData() {
			return data;
		}

		public void setData(byte[] data) {
			this.data = data;
		}

		@Override
		public String toString() {
			return "Fileupload [id=" + id + ", name=" + name + ", data=" + Arrays.toString(data) + ", remark_id="
					+ remark_id + "]";
		}

		
	 

		
	 
	  
}
