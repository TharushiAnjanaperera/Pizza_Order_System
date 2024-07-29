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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        String phno = request.getParameter("phno");
        String password = request.getParameter("password");

        boolean isValid = true;
        StringBuilder errorMessage = new StringBuilder();

        if (fname == null || fname.isEmpty()) {
            isValid = false;
            errorMessage.append("fullname is required.<br>");
        }
        if (email == null || email.isEmpty()) {
            isValid = false;
            errorMessage.append("Email is required.<br>");
        }
        if (phno == null || phno.isEmpty()) {
            isValid = false;
            errorMessage.append("phno is required.<br>");
        }
        if (password == null || password.isEmpty()) {
            isValid = false;
            errorMessage.append("password is required.<br>");
        }

        if (isValid) {
            Connection connection = null;
            try {
                connection = databaseUtil.getConnection();
                String sql = "INSERT INTO user(name, email, phno, password) VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, fname);
                    statement.setString(2, email);
                    statement.setString(3, phno);
                    statement.setString(4, password);
                    
                    statement.executeUpdate();
                }
                response.sendRedirect("login.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } finally {
                databaseUtil.closeConnection(connection);
            }
        } else {
            request.setAttribute("errorMessage", errorMessage.toString());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
