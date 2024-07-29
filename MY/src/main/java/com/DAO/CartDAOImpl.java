package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;


public class CartDAOImpl implements CartDAO {

	
	private Connection conn;
	
	public CartDAOImpl(Connection conn) 
	{
		this.conn=conn;
	}
	
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sql= "insert into cart(pid,pizzaname,price,total_price)values(?, ?, ?, ?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getpid());
			ps.setString(2, c.getPizzaname());
			ps.setDouble(3, c.getPrice());
			ps.setDouble(4, c.getTotalPrice());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	public List<Cart> getAllCartPizza() {
	
		List<Cart> list=new ArrayList<>();
		Cart c=null;
		double totalprice=0.00;
		
		try {
			String sql="select * from cart";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				c=new Cart();
				c.setpid(rs.getInt("pid"));
				c.setPizzaname(rs.getString("Pizzaname"));
				c.setPrice(rs.getDouble("Price"));
				
				totalprice=totalprice+rs.getDouble("price");
				c.setTotalPrice(totalprice);
				
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public boolean RemoveItem(int id) {
		
			boolean f=false;
			try {
				
				String sql= "delete from cart where pid=?";
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


	}
	
	

	
	


