package com.employee.EmployeeHQL.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.employee.EmployeeHQL.DTO.EmployeeDTO;

	public class EmployeeDAO 
	{
		public void save(EmployeeDTO dto)
		{
			Configuration cfg= new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(EmployeeDTO.class);
			SessionFactory fact=cfg.buildSessionFactory();
			Session session=fact.openSession();
			Transaction tx=session.beginTransaction();
			try {
			session.save(dto);
			tx.commit();
			}
			catch(Exception e)
			{
				
			}
			finally
			{
				session.close();
			}
	    }
		public void selectallbyletter(String letter)
		{
			List<EmployeeDTO> l1=null;
			Configuration cfg= new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(EmployeeDTO.class);
			SessionFactory fact=cfg.buildSessionFactory();
			Session session=fact.openSession();
			Transaction tx=session.beginTransaction();
			try {
			Query qry=  session.createQuery(" from EmployeeDTO d where d.ename like:letter");
			qry.setParameter("letter",letter+"%");
			l1=qry.list();
			System.out.println(l1);
			tx.commit();
			}
			catch(Exception e)
			{
				
			}
			finally
			{
				session.close();
			}
			
			
		}
		public void selectbysalary(int startsalary,int endsalary)
		{
			List<EmployeeDTO> l1=null;
			Configuration cfg= new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(EmployeeDTO.class);
			SessionFactory fact=cfg.buildSessionFactory();
			Session session=fact.openSession();
			Transaction tx=session.beginTransaction();
			try {
			Query qry=  session.createQuery(" from EmployeeDTO d where d.salary between:startsalary and: endsalary");
			qry.setParameter("startsalary",startsalary);
			qry.setParameter("endsalary",endsalary);
			l1=qry.list();
			System.out.println(l1);
			tx.commit();
			}
			catch(Exception e)
			{
				
			}
			finally
			{
				session.close();
			}
			
			
		}
		public void selectmaxminsalary()
		{
			
			Configuration cfg= new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(EmployeeDTO.class);
			SessionFactory fact=cfg.buildSessionFactory();
			Session session=fact.openSession();
			Transaction tx=session.beginTransaction();
			try {
			Query secondmaxqry=  session.createQuery(" select max(d.salary) from EmployeeDTO d where d.salary<(select max(d.salary)from EmployeeDTO d)");
			Object secondmaxsalary=secondmaxqry.uniqueResult();
			
			Query secondminqry=  session.createQuery(" select min(d.salary) from EmployeeDTO d where d.salary>(select min(d.salary)from EmployeeDTO d)");
			Object secondminsalary=secondminqry.uniqueResult();
			System.out.println("Second minimum salary is "+secondminsalary+" Second maximum salary is "+secondmaxsalary);
			
			tx.commit();
			}
			catch(Exception e)
			{
				
			}
			finally
			{
				session.close();
			}
			
			
		}
		public void updatesamesalaryto(int updatedsalary)
		{
			List<EmployeeDTO> samesalary=null;
			Configuration cfg= new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(EmployeeDTO.class);
			SessionFactory fact=cfg.buildSessionFactory();
			Session session=fact.openSession();
			Transaction tx=session.beginTransaction();
			try {
			Query salaryqry=  session.createQuery(" select d.salary from EmployeeDTO d group by d.salary having count(d.salary)>1");
			samesalary=salaryqry.list();
			if(!samesalary.isEmpty())
			{
				Query updateqry=session.createQuery("update EmployeeDTO d set d.salary='"+updatedsalary+"' where d.salary in (:salaries)" );
				updateqry.setParameterList("salaries", samesalary);
				int rowsaffect= updateqry.executeUpdate();
				System.out.println(rowsaffect);
			}
			else
			{
			
			System.out.println("no employees with same salary");
			}
			tx.commit();
			}
			catch(Exception e)
			{
				
			}
			finally
			{
				session.close();
			}
			
			
		}
		


	


}
