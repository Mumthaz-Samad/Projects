package com.hibernate.connect.DTO;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="m_table")
@Cacheable
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY)
public class StudentDTO implements Serializable {

	@Id
	@GenericGenerator(name="ref",strategy="com.hibernate.connect.DTO.Mygenerator")
	@GeneratedValue(generator="ref")
	@Column(name="student_id")
	private String id;
	@Column(name="student_name")
	private String name;
	@Column(name="student_address")
	private String address;
	@Column(name="student_age")
	private int age;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public StudentDTO() {
		System.out.println("StudentDTO object created");
	}

}
