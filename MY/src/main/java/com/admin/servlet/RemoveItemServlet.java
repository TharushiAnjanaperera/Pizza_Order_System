package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.uniquedeveloper.registration.databaseUtil;

@WebServlet("/Remove")
public class RemoveItemServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("pid"));
			
			CartDAOImpl dao = new CartDAOImpl(databaseUtil.getConnection());
			boolean f=dao.RemoveItem(id);
			
			 HttpSession session = req.getSession();

		        if (f) {
		            session.setAttribute("succMsg", " delete success");
		            resp.sendRedirect("cart.jsp");
		        } else {
		            session.setAttribute("failedMsg", "unsuccess");
		            resp.sendRedirect("cart.jsp");
		        }
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
}
