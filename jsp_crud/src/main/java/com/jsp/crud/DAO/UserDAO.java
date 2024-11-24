package com.jsp.crud.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.jsp.crud.Bean.User;


public class UserDAO {
	public static int SaveUser(User emp)
	{
		int status=0;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/user_dtl";
			Connection con=DriverManager.getConnection(url,"root","admin");
			PreparedStatement stmt=con.prepareStatement("insert into user_tbl(name,password,email,country)values(?,?,?,?)");
			stmt.setString(1, emp.getName());
			stmt.setString(2, emp.getPwd());
			stmt.setString(3, emp.getEmail());
			stmt.setString(4, emp.getCtry());
			status=stmt.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	public static List<User> getUser()
	{
		ArrayList<User> l1= new ArrayList<User>();
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/user_dtl";
			Connection con=DriverManager.getConnection(url,"root","admin");
			PreparedStatement stmt=con.prepareStatement("select*from user_tbl");
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				User e1=new User();
				e1.setId(rs.getInt(1));
				e1.setName(rs.getString(2));
				e1.setPwd(rs.getString(3));
				e1.setEmail(rs.getString(4));
				e1.setCtry(rs.getString(5));
				l1.add(e1);
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return l1;
	}
	public static User getbyid(int id){
	
		User user = null;
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/user_dtl";
			Connection con=DriverManager.getConnection(url,"root","admin");
			PreparedStatement stmt=con.prepareStatement("select*from user_tbl where id=?");
			stmt.setInt(1, id);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				user=new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setPwd(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setCtry(rs.getString(5));
				
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return user;
	}
	public static int updatebyid(User emp){
		
		int upd=0;
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/user_dtl";
			Connection con=DriverManager.getConnection(url,"root","admin");
			PreparedStatement stmt=con.prepareStatement("update user_tbl set name=?,password=?,email=?,country=? where id=?");
			stmt.setString(1, emp.getName());
			stmt.setString(2, emp.getPwd());
			stmt.setString(3, emp.getEmail());
			stmt.setString(4, emp.getCtry());
			stmt.setInt(5, emp.getId());
			
			upd=stmt.executeUpdate();
			
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return upd;
	}
public static int deletebyid(int id){
		
		int dlt=0;
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/user_dtl";
			Connection con=DriverManager.getConnection(url,"root","admin");
			PreparedStatement stmt=con.prepareStatement("delete from user_tbl where id=?");
			stmt.setInt(1,id);
			
			dlt=stmt.executeUpdate();
			
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return dlt;
	}


}
