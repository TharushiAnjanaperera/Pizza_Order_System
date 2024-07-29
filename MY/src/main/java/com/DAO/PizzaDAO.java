package com.DAO;

import java.util.List;

import com.entity.PizzaDetails;
import com.entity.orderDetails;

public interface PizzaDAO {
	
	public boolean addPizza(PizzaDetails b);
	
	public List<PizzaDetails> getAllPizza();
	
	public PizzaDetails getPizzaById(int id);
	
	public boolean updateEditPizza(PizzaDetails b);
	
	public boolean deletePizza(int id);
	
	public List<PizzaDetails> getNeapolitanPizza();
	
	public List<PizzaDetails> getChicagoPizza();
	
	public List<PizzaDetails> getSicilianPizza();
	
	public List<PizzaDetails> getAllNeapolitanPizza();
	
	public List<PizzaDetails> getAllChicagoPizza();
	
	public List<PizzaDetails> getAllSicilianPizza();
	
	public List<orderDetails> getAllorder();
	
	


}
