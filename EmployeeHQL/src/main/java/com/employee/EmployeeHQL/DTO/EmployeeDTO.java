package com.employee.EmployeeHQL.DTO;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
	
	@Entity
	@Table(name="employee_tbl")
	public class EmployeeDTO {
		@Id
		@GenericGenerator(name="ref",strategy="increment")
		@GeneratedValue(generator="ref")
		private long empno;
		private String ename;
		private int salary;
		private String job;
		private int deptno;
		public EmployeeDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public long getEmpno() {
			return empno;
		}
		public void setEmpno(long empno) {
			this.empno = empno;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public int getSalary() {
			return salary;
		}
		public void setSalary(int salary) {
			this.salary = salary;
		}
		public String getJob() {
			return job;
		}
		public void setJob(String job) {
			this.job = job;
		}
		public int getDeptno() {
			return deptno;
		}
		public void setDeptno(int deptno) {
			this.deptno = deptno;
		}
		@Override
		public String toString() {
			return "EmployeeDTO [empno=" + empno + ", ename=" + ename + ", salary=" + salary + ", job=" + job + ", deptno="
					+ deptno + "]";
		}
		
		
		

	}



