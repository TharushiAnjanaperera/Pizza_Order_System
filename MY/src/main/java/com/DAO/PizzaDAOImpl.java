package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.entity.PizzaDetails;
import com.entity.orderDetails;
import com.uniquedeveloper.registration.databaseUtil;

public class PizzaDAOImpl implements PizzaDAO{
	
	private Connection conn;
	
	public PizzaDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	
	public boolean addPizza(PizzaDetails b) {
		
		boolean f= false;
		
		try {
			conn = databaseUtil.getConnection();
			String sql="insert into pizza_details(pizzaname, price, pizzacategory, status, photo, email)values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getPizzaname());
			ps.setString(2, b.getPrice());
			ps.setString(3, b.getPizzacategory());
			ps.setString(4, b.getStatus());
			ps.setString(5, b.getPhotoName());
			ps.setString(6, b.getEmail());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f= true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public List<PizzaDetails> getAllPizza() {
		
		List<PizzaDetails> list=new ArrayList<PizzaDetails>();
		PizzaDetails b=null;
		
		try {
			String sql="select * from pizza_details";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public PizzaDetails getPizzaById(int id) {
		
		PizzaDetails b=null;
		try {
			String sql="select * from pizza_details where pizzaId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}



	public boolean updateEditPizza(PizzaDetails b) {
	    boolean f = false;

	    try {
	        String sql = "UPDATE pizza_details SET pizzaname=?, price=?, status=? WHERE pizzaId=?";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        // Debug statements
	        System.out.println("Executing SQL: " + sql);
	        System.out.println("Parameters: pizzaname=" + b.getPizzaname() + ", price=" + b.getPrice() + ", status=" + b.getStatus() + ", pizzaId=" + b.getPizzaId());

	        ps.setString(1, b.getPizzaname());
	        ps.setString(2, b.getPrice());
	        ps.setString(3, b.getStatus());
	        ps.setInt(4, b.getPizzaId());

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        } else {
	            System.out.println("Update failed, no rows affected.");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return f;
	}


	public boolean deletePizza(int id) {
		boolean f=false;
		try {
			
			String sql= "delete from pizza_details where pizzaId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}



	public List<PizzaDetails> getNeapolitanPizza() {
		
		List<PizzaDetails> list=new ArrayList<>();
		PizzaDetails b=null;
		try {
	        String sql="select * from pizza_details where pizzacategory=? and status=? order by pizzaId DESC ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Neapolitan Pizza");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list.add(b);
				i++;
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list;
	
	}




	public List<PizzaDetails> getChicagoPizza() {
		List<PizzaDetails> list1=new ArrayList<>();
		PizzaDetails b=null;
		try {
	        String sql="select * from pizza_details where pizzacategory=? and status=? order by pizzaId DESC ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Chicago Pizza");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list1.add(b);
				i++;
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list1;
	
	}



	
	public List<PizzaDetails> getSicilianPizza() {
		List<PizzaDetails> list2=new ArrayList<>();
		PizzaDetails b=null;
		try {
	        String sql="select * from pizza_details where pizzacategory=? and status=? order by pizzaId DESC ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Sicilian Pizza");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list2.add(b);
				i++;
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list2;
	
	}



	
	public List<PizzaDetails> getAllNeapolitanPizza() {
		List<PizzaDetails> list=new ArrayList<>();
		PizzaDetails b=null;
		try {
	        String sql="select * from pizza_details where pizzacategory=? and status=? order by pizzaId DESC ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Neapolitan Pizza");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list.add(b);
				i++;
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list;
	
	}



	public List<PizzaDetails> getAllChicagoPizza() {
		List<PizzaDetails> list1=new ArrayList<>();
		PizzaDetails b=null;
		try {
	        String sql="select * from pizza_details where pizzacategory=? and status=? order by pizzaId DESC ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Chicago Pizza");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list1.add(b);
				i++;
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list1;
	
	}

	
	public List<PizzaDetails> getAllSicilianPizza() {
		List<PizzaDetails> list2=new ArrayList<>();
		PizzaDetails b=null;
		try {
	        String sql="select * from pizza_details where pizzacategory=? and status=? order by pizzaId DESC ";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, "Sicilian Pizza");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new PizzaDetails();
				b.setPizzaId(rs.getInt(1));
				b.setPizzaname(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setPizzacategory(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhotoName(rs.getString(6));
				b.setEmail(rs.getString(7));
				list2.add(b);
				i++;
			}
					
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				return list2;
	
	}
	
	
	public List<orderDetails> getAllorder() {
		
		List<orderDetails> list3=new ArrayList<>();
		orderDetails b=null;
		
		try {
			String sql="select * from order_details";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new orderDetails();
				b.setCid(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setEmail(rs.getString(3));
				b.setAddress(rs.getString(4));
				b.setPhonenumber(rs.getString(5));
				b.setPizzaname(rs.getString(6));
				b.setCategory(rs.getString(7));
				b.setPrice(rs.getString(8));
				b.setPaymentmethod(rs.getString(9));
				list3.add(b);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list3;
	}

}
		

	
		
	



