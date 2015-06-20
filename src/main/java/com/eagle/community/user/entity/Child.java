package com.eagle.community.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="HBC_CHILD")
public class Child {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 20)
	private String id ;
	
	@Column(name="name",length=20)
	private String name;
	
	@Column(name="age",length=3)
	private int age;
	
	@Column(name="sex",length=2)
	private String sex;
	
	@Column(name="work_unit",length=70)
	private String workUnit;
	
	@Column(name="address",length=100)
	private String address;
	
	@Column(name="phone_num",length=14)
	private String phoneNum;

	
	public Child() {
		super();
	}


	public Child(String id, String name, int age, String sex, String workUnit,
			String address, String phoneNum) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.workUnit = workUnit;
		this.address = address;
		this.phoneNum = phoneNum;
	}



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


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getWorkUnit() {
		return workUnit;
	}


	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhoneNum() {
		return phoneNum;
	}


	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}


	@Override
	public String toString() {
		return "Child [id=" + id + ", name=" + name + ", age=" + age + ", sex="
				+ sex + ", workUnit=" + workUnit + ", address=" + address
				+ ", phoneNum=" + phoneNum + "]";
	}
	
	
	
	
}