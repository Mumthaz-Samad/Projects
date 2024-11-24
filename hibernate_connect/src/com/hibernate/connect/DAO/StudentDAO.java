package com.hibernate.connect.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hibernate.connect.DTO.StudentDTO;

public class StudentDAO {
	public void saveStudent(StudentDTO dto)
	{
		Configuration cfg= new Configuration();
		cfg.configure();
		cfg.addAnnotatedClass(StudentDTO.class);
		SessionFactory factory=cfg.buildSessionFactory();
		Session session=factory.openSession();
		Transaction tx=  session.beginTransaction();
		session.save(dto);
		tx.commit();
		session.close();
	}

}
