package com.hibernate.connect.Util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hibernate.connect.DAO.StudentDAO;
import com.hibernate.connect.DTO.StudentDTO;

public class Tester {

public static void main(String[] args) {
StudentDTO dto1=   new StudentDTO();
		
		StudentDAO dao=new StudentDAO();
		Configuration cfg= new Configuration();
		cfg.configure();
		cfg.addAnnotatedClass(StudentDTO.class);
		SessionFactory fact=cfg.buildSessionFactory();
		Session session=fact.openSession();
		Transaction tx=session.beginTransaction();
		StudentDTO fromdb= session.get(StudentDTO.class,"1");
		System.out.println(fromdb);
		StudentDTO fromdb1= session.get(StudentDTO.class,"1");
		System.out.println(fromdb1);
		tx.commit();
		session.close();
	}

}
