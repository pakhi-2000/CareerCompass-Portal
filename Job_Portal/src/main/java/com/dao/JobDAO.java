package com.dao;

 import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class JobDAO {

	private Connection conn;
	
	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addJobs(Jobs jobs)
	{
		boolean f = false;
		
		try 
		{
		    String sql = "insert into jobs(title, description , category, status , location) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jobs.getTitle());
			ps.setString(2, jobs.getDescription());
			ps.setString(3, jobs.getCategory());
			ps.setString(4, jobs.getStatus());
			ps.setString(5, jobs.getLocation());
			
		
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f = true;
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Jobs> getAllJobs()
	{
		List<Jobs> getAllJobs = new ArrayList<Jobs>();
		try {
			String sql = "select * from jobs order by id desc";
			
 			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Jobs j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				getAllJobs.add(j);
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return getAllJobs;
	}
	
	
	public List<Jobs> getAllJobsforUser()
	{
		List<Jobs> getAllJobs = new ArrayList<Jobs>();
		try {
			String sql = "select * from jobs where status = ? order by id desc";
			
 			PreparedStatement ps = conn.prepareStatement(sql);
 			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Jobs j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				getAllJobs.add(j);
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return getAllJobs;
	}
	
	
	
	
	
	public Jobs getJobById(int id)
	{
		
		Jobs j = null;
		try {
			String sql = "select * from jobs where id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
			}	
		}
		catch(Exception e) {
		System.out.println(e.getMessage());
		}
		
		return j;
	}
	
	public boolean updateJobById(Jobs j)
	{
		
		try {
			String sql = "update jobs set title=?,description=?,category=?,location=?,status=?  WHERE id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getLocation());
			ps.setString(5, j.getStatus());
			ps.setInt(6, j.getId());
			int n = ps.executeUpdate();
			if(n == 1)
				return true;
		}
		catch(Exception e) {
		System.out.println(e.getMessage());
		}
		
		return false;
	}
	
	public boolean deleteJobById(int id)
	{
		
		try {
			String sql = "delete from jobs WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int n = ps.executeUpdate();
			if(n == 1)
				return true;
		}
		catch(Exception e) {
		System.out.println(e.getMessage());
		}
		
		return false;
	}
	
	public List<Jobs> getJobsORLocationAndCate(String category , String location)
	{
		List<Jobs> list = new ArrayList<Jobs>();
		
		try {
			String sql = "select * from jobs where category=? or location=? order by id DESC";
 			PreparedStatement ps = conn.prepareStatement(sql);
 			ps.setString(1, category);
 			ps.setString(2, location);
 			ResultSet rs = ps.executeQuery();
 			while(rs.next())
 			{
 				Jobs j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);
 			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
	}
	return list;
    }
	
	public List<Jobs> getJobsAndLocationAndCate(String category , String location)
	{
		List<Jobs> list = new ArrayList<Jobs>();
		
	try {
		String sql = "select * from jobs where category=? and location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, location);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Jobs j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);	
			}
	   }
	    catch(Exception e)
	      {
		System.out.println(e.getMessage());
            }
	return list;
	}
}
