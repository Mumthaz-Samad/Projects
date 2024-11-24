package com.employee.EmployeeHQL;

import com.employee.EmployeeHQL.DAO.EmployeeDAO;
import com.employee.EmployeeHQL.DTO.EmployeeDTO;

public class App {
    public static void main(String[] args) {
    	EmployeeDTO ed=new EmployeeDTO();
 		ed.setEname("Athul");
 		ed.setSalary(18000);
 		ed.setJob("assistant");
 		ed.setDeptno(30);
 		
 		//new EmployeeDAO().save(ed);
 		EmployeeDAO da=new EmployeeDAO();
 		//da.selectallbyletter("A");
 		//da.selectbysalary(8000, 110000);
 		//da.selectmaxminsalary();
 		da.updatesamesalaryto(5000);
    }
}
