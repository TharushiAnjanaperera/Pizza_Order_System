package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.PizzaDAOImpl;
import com.entity.PizzaDetails;
import com.uniquedeveloper.registration.databaseUtil;

@WebServlet("/Addpizza")
@MultipartConfig
public class PizzaAddServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String pizzaname = req.getParameter("pname");
			String price = req.getParameter("price");
			String pizzacategory = req.getParameter("category");
			String status = req.getParameter("status");
			Part part= req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			
			PizzaDetails b = new PizzaDetails(pizzaname, price, pizzacategory, status, fileName, "admin");
			
			PizzaDAOImpl dao = new PizzaDAOImpl(databaseUtil.getConnection());
			
			
			boolean f= dao.addPizza(b);
			
			HttpSession session = req.getSession();
			
			if(f) {

				String path=getServletContext().getRealPath("") + "image";
				File file= new File(path);
				part.write(path + File.separator + fileName);
			
			session.setAttribute("sucMsg", "succes");
			resp.sendRedirect("admin/all_pizza.jsp");
			
			}else {
				session.setAttribute("failesMsg", "Unsucces");
				resp.sendRedirect("admin/Add_pizza.jsp");
			}
		 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	}
