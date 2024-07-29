package com.entity;

public class PizzaDetails {
	
	private int pizzaId;
	private String pizzaname;
	private String price;
	private String pizzacategory;
	private String status;
	private String photoName;
	private String email;
	public PizzaDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PizzaDetails(String pizzaname, String price, String pizzacategory, String status, String photoName,
			String email) {
		super();
		this.pizzaname = pizzaname;
		this.price = price;
		this.pizzacategory = pizzacategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	public int getPizzaId() {
		return pizzaId;
	}
	public void setPizzaId(int pizzaId) {
		this.pizzaId = pizzaId;
	}
	public String getPizzaname() {
		return pizzaname;
	}
	public void setPizzaname(String pizzaname) {
		this.pizzaname = pizzaname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPizzacategory() {
		return pizzacategory;
	}
	public void setPizzacategory(String pizzacategory) {
		this.pizzacategory = pizzacategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "PizzaDetails [pizzaId=" + pizzaId + ", pizzaname=" + pizzaname + ", price=" + price + ", pizzacategory="
				+ pizzacategory + ", status=" + status + ", photoName=" + photoName + ", email=" + email + "]";
	}
	
	

}
