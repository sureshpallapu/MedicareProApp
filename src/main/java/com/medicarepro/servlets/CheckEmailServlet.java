package com.medicarepro.servlets;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
//        try {
//            InitialContext ctx = new InitialContext();
//            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/medicare_pro"); // Replace 'YourDB' with your JNDI name
//        } catch (NamingException e) {
//            throw new ServletException("DB connection error", e);
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        response.setContentType("text/plain");

        if (email == null || email.trim().isEmpty()) {
            response.getWriter().write("invalid");
            return;
        }

        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT COUNT(*) FROM patients WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                response.getWriter().write("exists");
            } else {
                response.getWriter().write("available");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}

