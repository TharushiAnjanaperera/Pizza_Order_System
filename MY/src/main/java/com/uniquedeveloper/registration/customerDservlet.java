package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customerDservlet")
public class customerDservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public customerDservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        String Pizzaname = request.getParameter("Pizzaname");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String paymentmethod = request.getParameter("paymentmethod");

        boolean isValid = true;
        StringBuilder errorMessage = new StringBuilder();

        if (name == null || name.isEmpty()) {
            isValid = false;
            errorMessage.append("Full Name is required.<br>");
        }
        if (email == null || email.isEmpty()) {
            isValid = false;
            errorMessage.append("Email is required.<br>");
        }
        if (phonenumber == null || phonenumber.isEmpty()) {
            isValid = false;
            errorMessage.append("Phone Number is required.<br>");
        }
        if (address == null || address.isEmpty()) {
            isValid = false;
            errorMessage.append("Address is required.<br>");
        }
        if (paymentmethod == null || paymentmethod.isEmpty()) {
            isValid = false;
            errorMessage.append("Payment Method is required.<br>");
        }

        if (isValid) {
            Connection connection = null;
            try {
                connection = databaseUtil.getConnection();
                String sql = "INSERT INTO order_details(name, email, phonenumber, address, pizzaname, price, category, paymentmethod) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, phonenumber);
                    statement.setString(4, address);
                    statement.setString(5, Pizzaname);
                    statement.setString(6, price);
                    statement.setString(7, category);
                    statement.setString(8, paymentmethod);
                    statement.executeUpdate();
                }
                response.sendRedirect("sucess.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } finally {
                databaseUtil.closeConnection(connection);
            }
        } else {
            request.setAttribute("errorMessage", errorMessage.toString());
            request.getRequestDispatcher("customerDetails.jsp").forward(request, response);
        }
    }
}
