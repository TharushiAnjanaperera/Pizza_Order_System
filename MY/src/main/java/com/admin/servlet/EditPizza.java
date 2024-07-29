package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.DAO.PizzaDAOImpl;
import com.entity.PizzaDetails;
import com.uniquedeveloper.registration.databaseUtil;

/**
 * Servlet implementation class EditPizza
 */
@WebServlet("/editPizza")
public class EditPizza extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPizza() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   try {
	    	String idString = request.getParameter("id");
 
	        if (idString != null && !idString.isEmpty()) {
	            int id = Integer.parseInt(idString);

	        String pizzaname = request.getParameter("pname");
	        String price = request.getParameter("price");
	        String status = request.getParameter("status");

	        PizzaDetails b = new PizzaDetails();
	        b.setPizzaId(id);
	        b.setPizzaname(pizzaname);
	        b.setPrice(price);
	        b.setStatus(status);

	        PizzaDAOImpl dao = new PizzaDAOImpl(databaseUtil.getConnection());
	        boolean f = dao.updateEditPizza(b);

	        HttpSession session = request.getSession();

	        if (f) {
	            session.setAttribute("succMsg", "success");
	            response.sendRedirect("admin/all_pizza.jsp");
	        } else {
	            session.setAttribute("failedMsg", "unsuccess");
	            response.sendRedirect("admin/all_pizza.jsp");
	        }
	        } else {
	            // Handle case where idString is null or empty
	            HttpSession session = request.getSession();
	            session.setAttribute("failedMsg", "ID cannot be null or empty");
	            response.sendRedirect("all_pizza.jsp");
	        }

	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	        HttpSession session = request.getSession();
	        session.setAttribute("failedMsg", "Invalid ID format");
	        response.sendRedirect("all_pizza.jsp");
	    } catch (Exception e) {
	        e.printStackTrace();
	        HttpSession session = request.getSession();
	        session.setAttribute("failedMsg", "An error occurred");
	        response.sendRedirect("all_pizza.jsp");
	    }
	}
}