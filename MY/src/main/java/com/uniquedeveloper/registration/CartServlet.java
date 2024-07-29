package com.uniquedeveloper.registration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.PizzaDAOImpl;
import com.entity.Cart;
import com.entity.PizzaDetails;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CartServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pidParam = request.getParameter("pid");
          

            if (pidParam == null) {
                throw new NumberFormatException("pid parameter is missing");
            }

            int pid = Integer.parseInt(pidParam);
       

            PizzaDAOImpl dao = new PizzaDAOImpl(databaseUtil.getConnection());
            PizzaDetails b = dao.getPizzaById(pid);

            if (b != null) {
                Cart c = new Cart();
                c.setpid(pid);
                c.setPizzaname(b.getPizzaname());
                

                try {
                    double price = Double.parseDouble(b.getPrice());
                    c.setPrice(price);
                    c.setTotalPrice(price);
                } catch (NumberFormatException e) {
                    throw new NumberFormatException("Invalid price format: " + b.getPrice());
                }

                CartDAOImpl dao2 = new CartDAOImpl(databaseUtil.getConnection());
                boolean f = dao2.addCart(c);
                
                HttpSession session=request.getSession();

                if (f) {
                	session.setAttribute("addcart", "Pizza Added to cart");
                	response.sendRedirect("cart.jsp");
                }else {
                	session.setAttribute("failed", "Pizza  no Added to cart");
                	response.sendRedirect("all_Neapolitan_Pizza.jsp");
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("Invalid number format: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
